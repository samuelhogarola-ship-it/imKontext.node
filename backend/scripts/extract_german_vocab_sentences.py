from __future__ import annotations

import re
import sys
import zipfile
from pathlib import Path

from epub_to_txt import extract_epub_blocks


BLOCK_HEADER_RE = re.compile(r"^===== ([^=]+) =====$", re.MULTILINE)
BLOCK_NAME_RE = re.compile(r"(?P<slug>[^_\s]+)_(?P<level>a2|b1|b2|c1)\.(?:xhtml|html|txt)$", re.IGNORECASE)
DEFAULT_INPUT_DIR = Path("/Users/sam/Documents/imKontext/backend/anadir_a_supabase/traducir al español")
DEFAULT_OUTPUT_DIR = DEFAULT_INPUT_DIR / "frases alemán"
DEFAULT_OUTPUT_NAME = "frases_aleman.txt"


def main() -> None:
    if len(sys.argv) == 1:
        input_dir = DEFAULT_INPUT_DIR
        if not input_dir.exists():
            print(f"Error: default input directory not found: {input_dir}", file=sys.stderr)
            raise SystemExit(1)

        input_files = sorted(
            path
            for path in input_dir.iterdir()
            if path.is_file()
            and path.suffix.lower() in {".txt", ".epub"}
            and path.name != DEFAULT_OUTPUT_NAME
        )
        if not input_files:
            print(f"Error: no .txt or .epub files found in {input_dir}", file=sys.stderr)
            raise SystemExit(1)

        output_path = DEFAULT_OUTPUT_DIR / DEFAULT_OUTPUT_NAME
    elif len(sys.argv) in {2, 3}:
        input_path = Path(sys.argv[1]).expanduser().resolve()
        if not input_path.exists():
            print(f"Error: input file not found: {input_path}", file=sys.stderr)
            raise SystemExit(1)

        if input_path.is_dir():
            input_files = sorted(
                path
                for path in input_path.iterdir()
                if path.is_file()
                and path.suffix.lower() in {".txt", ".epub"}
                and path.name != DEFAULT_OUTPUT_NAME
            )
            if not input_files:
                print(f"Error: no .txt or .epub files found in {input_path}", file=sys.stderr)
                raise SystemExit(1)
            output_path = (
                Path(sys.argv[2]).expanduser().resolve()
                if len(sys.argv) == 3
                else input_path / "frases alemán" / DEFAULT_OUTPUT_NAME
            )
        else:
            input_files = [input_path]
            output_path = (
                Path(sys.argv[2]).expanduser().resolve()
                if len(sys.argv) == 3
                else Path.cwd() / DEFAULT_OUTPUT_NAME
            )
    else:
        print(
            "Usage: python3 scripts/extract_german_vocab_sentences.py [input.[txt|epub|dir]] [output.txt]",
            file=sys.stderr,
        )
        raise SystemExit(1)

    output_lines: list[str] = []
    processed_files = 0

    for input_file in input_files:
        try:
            blocks, file_count = load_blocks(input_file)
            output_lines.extend(extract_sentences(blocks, input_file))
            processed_files += file_count
        except (OSError, ValueError, zipfile.BadZipFile) as exc:
            print(f"Warning: skipped {input_file.name}: {exc}", file=sys.stderr)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    if output_lines:
        rendered_lines = [
            "sentence_key | block_id | level | german | source_kind | sentence",
            *output_lines,
        ]
    else:
        rendered_lines = []

    output_path.write_text(
        "\n".join(rendered_lines).rstrip() + ("\n" if rendered_lines else ""),
        encoding="utf-8",
    )

    print(f"Output generated: {output_path}")
    print(f"Total phrases extracted: {len(output_lines)}")
    print(f"Files processed: {processed_files}")


def load_blocks(input_path: Path) -> tuple[list[tuple[str, str]], int]:
    suffix = input_path.suffix.lower()

    if suffix == ".epub":
        # Reuse the EPUB reader so spine order and XHTML cleanup stay consistent.
        blocks = extract_epub_blocks(input_path)
        return blocks, len(blocks)

    if suffix == ".txt":
        text = input_path.read_text(encoding="utf-8")
        blocks = split_txt_blocks(text)
        if not blocks:
            fallback_name = input_path.name
            return [(fallback_name, text)], 1
        return blocks, 1

    raise ValueError("input file must be .txt or .epub")


def split_txt_blocks(text: str) -> list[tuple[str, str]]:
    matches = list(BLOCK_HEADER_RE.finditer(text))
    blocks: list[tuple[str, str]] = []

    for index, match in enumerate(matches):
        block_name = match.group(1).strip()
        start = match.end()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        block_text = text[start:end].strip()
        blocks.append((block_name, block_text))

    return blocks


def extract_sentences(blocks: list[tuple[str, str]], input_path: Path) -> list[str]:
    output_lines: list[str] = []
    file_key = build_file_key(input_path)

    for block_name, block_text in blocks:
        # Each block name like t1_a2.xhtml gives us a stable block id.
        # We also include the source file key so identical t1/t2/t3 block names from
        # different TXT bundles can no longer collide during reinsertion.
        metadata = parse_block_metadata(block_name, input_path)
        if metadata is None:
            continue

        block_id, level = metadata
        for raw_line in block_text.splitlines():
            line = raw_line.strip()
            if not line or "|" not in line:
                continue

            extracted = extract_row_sentences(line)
            if extracted is None:
                continue

            german, example_sentence_de, example_sentence_de_generated = extracted
            if example_sentence_de:
                sentence_key = build_sentence_key(file_key, block_id, level, german, "original")
                output_lines.append(
                    f"{sentence_key} | {block_id} | {level} | {german} | original | {example_sentence_de}"
                )
            if example_sentence_de_generated:
                sentence_key = build_sentence_key(file_key, block_id, level, german, "generated")
                output_lines.append(
                    f"{sentence_key} | {block_id} | {level} | {german} | generated | {example_sentence_de_generated}"
                )

    return output_lines


def parse_block_metadata(block_name: str, input_path: Path) -> tuple[str, str] | None:
    candidates = [block_name.strip()]

    if input_path.suffix.lower() == ".txt":
        candidates.append(input_path.name)
        candidates.append(input_path.stem)

    for candidate in candidates:
        match = BLOCK_NAME_RE.search(candidate)
        if match:
            return match.group("slug"), match.group("level").upper()

    return None


def extract_row_sentences(line: str) -> tuple[str, str | None, str | None] | None:
    parts = [part.strip() for part in line.split("|")]

    # Current compact format:
    # german | spanish | type | article | verb_forms | example_sentence_de | example_sentence_es | example_sentence_de_generated
    if len(parts) == 8:
        german = parts[0]
        example_sentence_de = clean_value(parts[5])
        example_sentence_de_generated = clean_value(parts[7])
        return german, example_sentence_de, example_sentence_de_generated

    # Legacy semi-assisted format without example_sentence_es.
    if len(parts) == 10:
        german = parts[0]
        example_sentence_de = clean_value(parts[7])
        example_sentence_de_generated = clean_value(parts[9])
        return german, example_sentence_de, example_sentence_de_generated

    # Legacy format with example_sentence_de and example_sentence_de_generated only.
    if len(parts) == 9:
        german = parts[0]
        example_sentence_de = clean_value(parts[7])
        example_sentence_de_generated = clean_value(parts[8])
        return german, example_sentence_de, example_sentence_de_generated

    return None


def clean_value(value: str) -> str | None:
    normalized = re.sub(r"\s+", " ", value).strip()
    return normalized or None


def build_file_key(input_path: Path) -> str:
    return input_path.stem.casefold()


def build_sentence_key(
    file_key: str,
    block_id: str,
    level: str,
    german: str,
    source_kind: str,
) -> str:
    return f"{file_key}::{block_id}::{level}::{german.casefold()}::{source_kind}"


if __name__ == "__main__":
    main()
