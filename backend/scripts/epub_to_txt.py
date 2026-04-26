from __future__ import annotations

import html
import re
import sys
import zipfile
from html.parser import HTMLParser
from pathlib import PurePosixPath, Path
from xml.etree import ElementTree as ET


CONTAINER_PATH = "META-INF/container.xml"
CONTAINER_NAMESPACES = [
    {"c": "urn:oasis:names:tc:opendocument:xmlns:container"},
    {"c": "urn:oasis:schemas:container"},
]
OPF_NS = {"opf": "http://www.idpf.org/2007/opf"}


class TextExtractor(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=False)
        self.parts: list[str] = []
        self.skip_depth = 0
        self.block_tags = {
            "address",
            "article",
            "aside",
            "blockquote",
            "br",
            "div",
            "dl",
            "dt",
            "dd",
            "fieldset",
            "figcaption",
            "figure",
            "footer",
            "form",
            "h1",
            "h2",
            "h3",
            "h4",
            "h5",
            "h6",
            "header",
            "hr",
            "li",
            "main",
            "nav",
            "ol",
            "p",
            "pre",
            "section",
            "table",
            "tr",
            "td",
            "th",
            "thead",
            "tbody",
            "tfoot",
            "ul",
        }

    def handle_starttag(self, tag: str, attrs) -> None:
        lowered = tag.lower()
        if lowered in {"script", "style"}:
            self.skip_depth += 1
            return
        if self.skip_depth == 0 and lowered in self.block_tags:
            self.parts.append("\n")

    def handle_endtag(self, tag: str) -> None:
        lowered = tag.lower()
        if lowered in {"script", "style"}:
            if self.skip_depth > 0:
                self.skip_depth -= 1
            return
        if self.skip_depth == 0 and lowered in self.block_tags:
            self.parts.append("\n")

    def handle_data(self, data: str) -> None:
        if self.skip_depth == 0:
            self.parts.append(data)

    def handle_entityref(self, name: str) -> None:
        if self.skip_depth == 0:
            self.parts.append(f"&{name};")

    def handle_charref(self, name: str) -> None:
        if self.skip_depth == 0:
            self.parts.append(f"&#{name};")

    def get_text(self) -> str:
        text = "".join(self.parts)
        text = html.unescape(text)
        text = text.replace("\r", "")
        text = re.sub(r"[ \t\f\v]+", " ", text)
        text = re.sub(r" *\n *", "\n", text)
        text = re.sub(r"\n{3,}", "\n\n", text)
        return text.strip()


def main() -> None:
    if len(sys.argv) != 3:
        print("Usage: python3 scripts/epub_to_txt.py input.epub output.txt", file=sys.stderr)
        raise SystemExit(1)

    input_path = Path(sys.argv[1]).expanduser().resolve()
    output_path = Path(sys.argv[2]).expanduser().resolve()

    if not input_path.exists():
        print(f"Error: input file not found: {input_path}", file=sys.stderr)
        raise SystemExit(1)

    if input_path.suffix.lower() != ".epub":
        print(f"Error: input file must be an .epub: {input_path}", file=sys.stderr)
        raise SystemExit(1)

    try:
        blocks = extract_epub_blocks(input_path)
    except (OSError, zipfile.BadZipFile, ET.ParseError, ValueError) as exc:
        print(f"Error: {exc}", file=sys.stderr)
        raise SystemExit(1)

    if not blocks:
        print("Error: no readable XHTML/HTML content found in EPUB spine", file=sys.stderr)
        raise SystemExit(1)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(render_blocks(blocks), encoding="utf-8")
    print(f"TXT generated: {output_path}")


def extract_epub_blocks(input_path: Path) -> list[tuple[str, str]]:
    with zipfile.ZipFile(input_path) as archive:
        opf_path = find_opf_path(archive)
        spine_items = read_spine_items(archive, opf_path)
        blocks: list[tuple[str, str]] = []

        for archive_path in spine_items:
            content = archive.read(archive_path).decode("utf-8")
            text = clean_html(content)
            filename = PurePosixPath(archive_path).name
            blocks.append((filename, text))

        return blocks


def find_opf_path(archive: zipfile.ZipFile) -> str:
    try:
        container_xml = archive.read(CONTAINER_PATH)
    except KeyError as exc:
        raise ValueError(f"missing {CONTAINER_PATH} in EPUB") from exc

    root = ET.fromstring(container_xml)
    rootfile = None
    for namespace in CONTAINER_NAMESPACES:
        rootfile = root.find(".//c:rootfile", namespace)
        if rootfile is not None:
            break

    if rootfile is None:
        raise ValueError("container.xml does not define a rootfile")

    full_path = rootfile.attrib.get("full-path")
    if not full_path:
        raise ValueError("rootfile full-path missing in container.xml")

    return full_path


def read_spine_items(archive: zipfile.ZipFile, opf_path: str) -> list[str]:
    try:
        opf_xml = archive.read(opf_path)
    except KeyError as exc:
        raise ValueError(f"missing OPF package file: {opf_path}") from exc

    root = ET.fromstring(opf_xml)
    manifest = root.find("opf:manifest", OPF_NS)
    spine = root.find("opf:spine", OPF_NS)

    if manifest is None or spine is None:
        raise ValueError("OPF file is missing manifest or spine")

    manifest_by_id: dict[str, tuple[str, str]] = {}
    opf_dir = PurePosixPath(opf_path).parent

    for item in manifest.findall("opf:item", OPF_NS):
        item_id = item.attrib.get("id")
        href = item.attrib.get("href")
        media_type = item.attrib.get("media-type", "")
        if item_id and href:
            archive_path = str((opf_dir / href).as_posix())
            manifest_by_id[item_id] = (archive_path, media_type)

    spine_items: list[str] = []
    for itemref in spine.findall("opf:itemref", OPF_NS):
        idref = itemref.attrib.get("idref")
        if not idref or idref not in manifest_by_id:
            continue

        archive_path, media_type = manifest_by_id[idref]
        if media_type in {"application/xhtml+xml", "text/html"}:
            spine_items.append(archive_path)

    return spine_items


def clean_html(content: str) -> str:
    parser = TextExtractor()
    parser.feed(content)
    parser.close()
    return parser.get_text()


def render_blocks(blocks: list[tuple[str, str]]) -> str:
    rendered = []
    for filename, text in blocks:
        rendered.append(f"===== {filename} =====\n{text}".rstrip())
    return "\n\n".join(rendered) + "\n"


if __name__ == "__main__":
    main()
