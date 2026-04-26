from __future__ import annotations

import subprocess
import sys
from pathlib import Path


DEFAULT_SOURCE_DIR = Path("/Users/sam/Documents/imKontext/backend/anadir_a_supabase/traducir al español")
DEFAULT_GERMAN_DIR = DEFAULT_SOURCE_DIR / "frases alemán"
DEFAULT_TRANSLATIONS_DIR = DEFAULT_GERMAN_DIR / "traducidas"
DEFAULT_OUTPUT_DIR = Path("/Users/sam/Documents/imKontext/backend/anadir_a_supabase")
EXCLUDED_FILENAMES = {"frases_aleman.txt", "frases_traducidas.txt"}


def main() -> None:
    if len(sys.argv) == 1:
        translation_files = discover_translation_files(DEFAULT_TRANSLATIONS_DIR)
        source_dir = DEFAULT_SOURCE_DIR
        output_dir = DEFAULT_OUTPUT_DIR
    elif len(sys.argv) in {2, 3}:
        translation_input = Path(sys.argv[1]).expanduser().resolve()
        if not translation_input.exists():
            print(f"Error: translation input not found: {translation_input}", file=sys.stderr)
            raise SystemExit(1)
        if translation_input.is_dir():
            translation_files = discover_translation_files(translation_input)
        else:
            translation_files = [translation_input]
        source_dir = DEFAULT_SOURCE_DIR
        output_dir = (
            Path(sys.argv[2]).expanduser().resolve()
            if len(sys.argv) == 3
            else DEFAULT_OUTPUT_DIR
        )
    else:
        print(
            "Usage: python3 scripts/apply_spanish_translations.py [frases_traducidas.txt|traducidas_dir] [output_dir]",
            file=sys.stderr,
        )
        raise SystemExit(1)

    translations = load_translations(translation_files)
    if not translations:
        print("Error: no valid translations found", file=sys.stderr)
        raise SystemExit(1)

    txt_files = sorted(
        path for path in source_dir.iterdir()
        if path.is_file()
        and path.suffix.lower() == ".txt"
        and path.name not in EXCLUDED_FILENAMES
    )

    updated_files = 0
    regenerated_seeds = 0

    for txt_file in txt_files:
        rendered_text = apply_translations_to_txt(txt_file, translations)
        if rendered_text is None:
            continue

        output_txt = output_dir / txt_file.name
        output_txt.parent.mkdir(parents=True, exist_ok=True)
        output_txt.write_text(rendered_text, encoding="utf-8")
        updated_files += 1
        seed_path = output_dir / f"{txt_file.stem}.seed.sql"
        subprocess.run(
            [
                sys.executable,
                str(Path(__file__).resolve().parent / "generate_seed_from_txt.py"),
                str(output_txt),
                str(seed_path),
            ],
            check=True,
        )
        regenerated_seeds += 1

    print(f"Translation files used: {len(translation_files)}")
    print(f"TXT updated: {updated_files}")
    print(f"Seeds regenerated: {regenerated_seeds}")


def discover_translation_files(directory: Path) -> list[Path]:
    if not directory.exists():
        print(f"Error: translations directory not found: {directory}", file=sys.stderr)
        raise SystemExit(1)

    files = sorted(
        path
        for path in directory.iterdir()
        if path.is_file()
        and path.suffix.lower() == ".txt"
        and (
            path.parent == DEFAULT_TRANSLATIONS_DIR
            or path.name not in EXCLUDED_FILENAMES
        )
    )
    if not files:
        print(f"Error: no translation .txt files found in {directory}", file=sys.stderr)
        raise SystemExit(1)
    return files


def load_translations(
    paths: list[Path],
) -> dict[tuple[str | None, str, str, str, str], str]:
    translations: dict[tuple[str | None, str, str, str, str], str] = {}

    for path in paths:
        for raw_line in path.read_text(encoding="utf-8").splitlines():
            line = raw_line.strip()
            if not line:
                continue

            parts = [part.strip() for part in line.split("|")]
            if len(parts) == 6:
                sentence_key, block_id, level, german, source_kind, translated_sentence = parts
                if source_kind not in {"original", "generated"} or not translated_sentence:
                    continue
                parsed = parse_sentence_key(sentence_key)
                if parsed is not None:
                    translations[parsed] = translated_sentence
                    continue
                translations[(None, block_id, level.upper(), german.casefold(), source_kind)] = translated_sentence
                continue

            if len(parts) == 5:
                block_id, level, german, source_kind, translated_sentence = parts
                if source_kind not in {"original", "generated"} or not translated_sentence:
                    continue
                translations[(None, block_id, level.upper(), german.casefold(), source_kind)] = translated_sentence

    return translations


def apply_translations_to_txt(
    txt_file: Path,
    translations: dict[tuple[str | None, str, str, str, str], str],
) -> str | None:
    lines = txt_file.read_text(encoding="utf-8").splitlines()
    updated_lines: list[str] = []
    current_block_id: str | None = None
    current_level: str | None = None
    file_key = txt_file.stem.casefold()
    changed = False

    for line in lines:
        stripped = line.strip()
        block_meta = parse_block_header(stripped)
        if block_meta is not None:
            current_block_id, current_level = block_meta
            updated_lines.append(line)
            continue

        if current_block_id and current_level and "|" in line:
            new_line, was_changed = update_vocab_line(
                line,
                file_key,
                current_block_id,
                current_level,
                translations,
            )
            updated_lines.append(new_line)
            changed = changed or was_changed
            continue

        updated_lines.append(line)

    if not changed:
        return None

    return "\n".join(updated_lines) + "\n"


def parse_block_header(line: str) -> tuple[str, str] | None:
    if not line.startswith("=====") or not line.endswith("====="):
        return None

    content = line.strip("=").strip()
    lower = content.lower()
    for level in ("a2", "b1", "b2", "c1"):
        suffix = f"_{level}.xhtml"
        if lower.endswith(suffix):
            return content[: -len(suffix)], level.upper()
    return None


def update_vocab_line(
    line: str,
    file_key: str,
    block_id: str,
    level: str,
    translations: dict[tuple[str | None, str, str, str, str], str],
) -> tuple[str, bool]:
    parts = [part.strip() for part in line.split("|")]
    if len(parts) not in {8, 9, 10}:
        return line, False

    german = parts[0]
    key_original = (file_key, block_id, level, german.casefold(), "original")
    key_original_legacy = (None, block_id, level, german.casefold(), "original")

    # Compact current format:
    # german | spanish | type | article | verb_forms | example_sentence_de | example_sentence_es | example_sentence_de_generated
    if len(parts) == 8:
        translated = translations.get(key_original) or translations.get(key_original_legacy)
        if not translated:
            return " | ".join(parts), False
        if parts[6] == translated:
            return " | ".join(parts), False
        parts[6] = translated
        return " | ".join(parts), True

    # Legacy format without example_sentence_es.
    if len(parts) == 9:
        translated = translations.get(key_original) or translations.get(key_original_legacy)
        if not translated:
            return " | ".join(parts), False
        parts = parts[:8] + [translated, parts[8]]
        return " | ".join(parts), True

    # Legacy format with example_sentence_es already present.
    translated = translations.get(key_original) or translations.get(key_original_legacy)
    if not translated:
        return " | ".join(parts), False
    if parts[8] == translated:
        return " | ".join(parts), False
    parts[8] = translated
    return " | ".join(parts), True


def parse_sentence_key(value: str) -> tuple[str | None, str, str, str, str] | None:
    parts = [part.strip() for part in value.split("::")]
    if len(parts) == 5:
        file_key, block_id, level, german_key, source_kind = parts
    elif len(parts) == 4:
        file_key = None
        block_id, level, german_key, source_kind = parts
    else:
        return None
    if source_kind not in {"original", "generated"}:
        return None
    normalized_file_key = file_key.casefold() if file_key else None
    return normalized_file_key, block_id, level.upper(), german_key, source_kind


if __name__ == "__main__":
    main()
