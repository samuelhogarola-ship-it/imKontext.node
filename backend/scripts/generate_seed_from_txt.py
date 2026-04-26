from __future__ import annotations

import os
import re
import sys
import unicodedata
from pathlib import Path


DEFAULT_ACCESS_STATUS = "premium"
LEVEL_ORDER = ["A2", "B1", "B2", "C1"]
BLOCK_RE = re.compile(r"^===== (t(\d+)_(a2|b1|b2|c1)\.xhtml) =====$", re.MULTILINE)
LEVEL_VOCAB_TARGETS = {"A2": 15, "B1": 15, "B2": 15, "C1": 20}
LEVEL_TYPE_TARGETS = {
    "A2": {"noun": 9, "verb": 4, "adjective": 2},
    "B1": {"noun": 8, "verb": 4, "adjective": 3},
    "B2": {"noun": 8, "verb": 4, "adjective": 3},
    "C1": {"noun": 10, "verb": 5, "adjective": 5},
}
ARTICLE_MAP = {"der": "der", "die": "die", "das": "das", "eine": "die"}
FEMININE_SUFFIXES = ("e", "ei", "heit", "keit", "schaft", "tät", "tion", "ik", "ur", "anz", "enz")
NEUTER_SUFFIXES = ("chen", "lein", "ment", "um")
SKIP_WORDS = {
    "april",
    "mai",
    "januar",
    "februar",
    "maerz",
    "märz",
    "juni",
    "juli",
    "august",
    "september",
    "oktober",
    "november",
    "dezember",
    "montag",
    "dienstag",
    "mittwoch",
    "donnerstag",
    "freitag",
    "samstag",
    "sonntag",
    "deutschland",
    "frankfurt",
    "walldorf",
    "san",
    "francisco",
    "europa",
    "iran",
    "usa",
    "asien",
    "basf",
    "sap",
    "siemens",
    "rheinmetall",
    "anthropic",
    "claude",
}
VERB_STOPWORDS = {
    "haben",
    "machen",
    "kommen",
    "gehen",
    "sein",
    "werden",
    "bleiben",
    "gelten",
    "liegen",
    "zeigen",
    "geben",
    "wollen",
    "sollen",
    "koennen",
    "können",
    "muessen",
    "müssen",
    "lassen",
    "grossen",
    "großen",
    "zweiten",
    "weiteren",
}
ADJECTIVE_STOPWORDS = {
    "alle",
    "auch",
    "noch",
    "mehr",
    "sehr",
    "viel",
    "wenig",
    "weiter",
    "genau",
    "nicht",
    "nur",
    "weiterhin",
    "wieder",
    "aber",
    "per",
    "damit",
    "anderen",
    "solche",
    "welche",
    "diesem",
    "dieser",
    "dieses",
    "allen",
    "vielen",
    "hohen",
    "starken",
    "schwachen",
}
def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: python3 scripts/generate_seed_from_txt.py <input.txt> [output.sql]", file=sys.stderr)
        raise SystemExit(1)

    input_path = Path(sys.argv[1]).expanduser().resolve()
    output_path = (
        Path(sys.argv[2]).expanduser().resolve()
        if len(sys.argv) > 2
        else input_path.with_name("seed.sql")
    )

    raw = input_path.read_text(encoding="utf-8")
    entries = parse_txt(raw)
    themes = build_themes(entries)
    sql = build_sql(themes, input_path)
    output_path.write_text(sql, encoding="utf-8")
    print(f"Seed SQL generated: {output_path}")


def parse_txt(raw: str) -> list[dict]:
    normalized = raw.replace("\r\n", "\n")
    matches = list(BLOCK_RE.finditer(normalized))

    if not matches:
        raise ValueError("No text blocks found. Expected lines like ===== t1_a2.xhtml =====")

    entries = []
    for index, match in enumerate(matches):
        block_name = match.group(1)
        theme_number = int(match.group(2))
        level = match.group(3).upper()
        start = match.end()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(normalized)
        body = normalized[start:end].strip()
        entries.append(parse_block(block_name, theme_number, level, body))

    return entries


def parse_block(block_name: str, theme_number: int, level: str, body: str) -> dict:
    lines = [line.strip() for line in body.split("\n") if line.strip()]
    vocab_index = next((i for i, line in enumerate(lines) if line == f"[{level}]"), -1)
    if vocab_index == -1:
        vocab_index = next((i for i, line in enumerate(lines) if is_vocabulary_header_line(line)), -1)
        text_lines = lines if vocab_index == -1 else lines[:vocab_index]
        vocab_lines = [] if vocab_index == -1 else lines[vocab_index:]
    else:
        text_lines = lines[:vocab_index]
        vocab_lines = lines[vocab_index + 1 :]

    source_index = next((i for i, line in enumerate(text_lines) if line.startswith("Quelle: ")), -1)
    title = text_lines[0] if text_lines else block_name
    article_title = extract_article_title(text_lines, source_index, title)
    content = extract_content(text_lines, source_index, article_title, title)
    source = text_lines[source_index].removeprefix("Quelle: ").strip() if source_index != -1 else None
    vocabulary = parse_vocabulary(vocab_lines, level, block_name, content)

    return {
        "block_name": block_name,
        "theme_number": theme_number,
        "level": level,
        "title": title,
        "article_title": article_title,
        "content": content,
        "source": source,
        "vocabulary": vocabulary,
    }


def extract_article_title(lines: list[str], source_index: int, fallback: str) -> str:
    del source_index

    for line in lines:
        if line:
            return line

    return fallback


def extract_content(lines: list[str], source_index: int, article_title: str, fallback_title: str) -> str:
    del fallback_title
    end = len(lines) if source_index == -1 else source_index
    content_start = find_content_start_index(lines[:end], article_title)
    content_lines = []

    for line in lines[content_start:end]:
        if not line or is_metadata_line(line):
            continue
        content_lines.append(line)

    return "\n\n".join(content_lines).strip()


def find_content_start_index(lines: list[str], article_title: str) -> int:
    dateline_index = next((index for index, line in enumerate(lines) if is_dateline(line)), -1)

    if dateline_index != -1:
        index = dateline_index + 1

        while index < len(lines) and (
            not lines[index]
            or is_metadata_line(lines[index])
            or lines[index] == article_title
        ):
            index += 1

        return index

    title_seen = False

    for index, line in enumerate(lines):
        if not line or is_metadata_line(line):
            continue

        if not title_seen:
            title_seen = True
            continue

        if line == article_title:
            continue

        return index

    return len(lines)


def is_metadata_line(line: str) -> bool:
    return (
        line == "im Kontext"
        or line.startswith("Niveau ")
        or line.startswith("Thema: ")
        or line.startswith("im Kontext ist ein Produkt")
        or is_dateline(line)
    )


def is_dateline(line: str) -> bool:
    return bool(
        re.match(
            r"^[^,]+,\s+.+\s+—\s+.+$",
            line,
        )
    )


def is_vocabulary_header_line(line: str) -> bool:
    normalized = [part.strip().casefold() for part in line.split("|")]
    if len(normalized) < 4:
        return False
    return normalized[:4] == ["german", "spanish", "type", "article"]


def parse_vocabulary(lines: list[str], expected_level: str, block_name: str, content: str) -> list[dict]:
    if not lines:
        return auto_generate_vocabulary(expected_level, content)

    vocabulary = []

    for line in lines:
        parts = [part.strip() for part in line.split("|")]
        if not parts or parts[0].casefold() == "german":
            continue
        if len(parts) not in {7, 8, 9, 10}:
            raise ValueError(
                f'Invalid vocabulary line in {block_name}: "{line}". Expected 7, 8, 9 or 10 pipe-separated fields.'
            )

        if len(parts) == 7:
            (
                german,
                spanish,
                word_type,
                article,
                infinitive,
                past_simple,
                past_participle,
            ) = parts
            example_sentence_de = find_example_sentence(content, german)
            example_sentence_es = None
            example_sentence_de_generated = None
        elif len(parts) == 8:
            german, spanish, word_type, article, verb_forms, example_sentence_de, example_sentence_es, example_sentence_de_generated = parts
            infinitive, past_simple, past_participle = parse_compact_verb_forms(
                german,
                word_type,
                verb_forms,
            )
        elif len(parts) == 9:
            (
                german,
                spanish,
                word_type,
                article,
                infinitive,
                past_simple,
                past_participle,
                example_sentence_de,
                example_sentence_de_generated,
            ) = parts
            example_sentence_es = None
        else:
            german, spanish, word_type, article = parts[:4]
            if is_compact_verb_row(parts, word_type, german):
                infinitive = german
                past_simple = parts[4] or None
                past_participle = parts[5] or None
                example_sentence_de = parts[6]
                example_sentence_es = parts[7]
                example_sentence_de_generated = parts[9]
            else:
                (
                    _german,
                    _spanish,
                    _word_type,
                    _article,
                    infinitive,
                    past_simple,
                    past_participle,
                    example_sentence_de,
                    example_sentence_es,
                    example_sentence_de_generated,
                ) = parts
                german, spanish, word_type, article = _german, _spanish, _word_type, _article
        example_sentence_de = sanitize_example_sentence(content, example_sentence_de)
        example_sentence_de_generated = sanitize_example_sentence(content, example_sentence_de_generated)
        if example_sentence_es and example_sentence_es == example_sentence_de:
            example_sentence_es = None
        vocabulary.append(
            {
                "german": german,
                "spanish": spanish,
                "word_type": word_type,
                "article": article or None,
                "infinitive": infinitive or None,
                "past_simple": past_simple or None,
                "past_participle": past_participle or None,
                "example_sentence_de": example_sentence_de or None,
                "example_sentence_es": example_sentence_es or None,
                "example_sentence_de_generated": example_sentence_de_generated or None,
                "level": expected_level,
            }
        )

    return vocabulary


def parse_compact_verb_forms(german: str, word_type: str, value: str) -> tuple[str | None, str | None, str | None]:
    if word_type != "verb":
        return None, None, None

    normalized = value.strip()
    if not normalized:
        return german, None, None

    for separator in (";", ",", " / "):
        if separator in normalized:
            parts = [part.strip() for part in normalized.split(separator)]
            break
    else:
        parts = [normalized]

    if len(parts) == 3:
        return parts[0] or german, parts[1] or None, parts[2] or None
    if len(parts) == 2:
        return german, parts[0] or None, parts[1] or None
    return german, None, None


def is_compact_verb_row(parts: list[str], word_type: str, german: str) -> bool:
    if len(parts) != 10 or word_type != "verb":
        return False
    return parts[4].casefold() != german.casefold()


def auto_generate_vocabulary(level: str, content: str) -> list[dict]:
    target_total = LEVEL_VOCAB_TARGETS.get(level, 15)
    target_types = LEVEL_TYPE_TARGETS.get(level, {"noun": 8, "verb": 4, "adjective": 3})

    noun_candidates = extract_noun_candidates(content, level)
    verb_candidates = extract_verb_candidates(content, level)
    adjective_candidates = extract_adjective_candidates(content, level)

    selected: list[dict] = []
    used_german: set[str] = set()

    for word_type, candidates in (
        ("noun", noun_candidates),
        ("verb", verb_candidates),
        ("adjective", adjective_candidates),
    ):
        take = target_types.get(word_type, 0)
        for item in candidates:
            german_key = item["german"].casefold()
            if german_key in used_german:
                continue
            selected.append(item)
            used_german.add(german_key)
            if count_type(selected, word_type) >= take:
                break

    remaining_candidates = noun_candidates + verb_candidates + adjective_candidates
    for item in remaining_candidates:
        if len(selected) >= target_total:
            break
        german_key = item["german"].casefold()
        if german_key in used_german:
            continue
        selected.append(item)
        used_german.add(german_key)

    return selected[:target_total]


def extract_noun_candidates(content: str, level: str) -> list[dict]:
    candidates = []
    seen: set[str] = set()

    for sentence in split_sentences(content):
        for match in re.finditer(
            r"\b(der|die|das|eine)\s+(?:[A-Za-zÄÖÜäöüß-]+\s+){0,3}([A-ZÄÖÜ][A-Za-zÄÖÜäöüß-]{2,})\b",
            sentence,
        ):
            article = normalize_article(match.group(1).lower(), match.group(2))
            noun = match.group(2)
            if not article or should_skip_word(noun):
                continue

            german = f"{article} {noun}"
            if german.casefold() in seen:
                continue

            seen.add(german.casefold())
            candidates.append(
                {
                    "german": german,
                    "spanish": "",
                    "word_type": "noun",
                    "article": article,
                    "infinitive": None,
                    "past_simple": None,
                    "past_participle": None,
                    "example_sentence_de": sentence if german in sentence else None,
                    "example_sentence_es": None,
                    "example_sentence_de_generated": None,
                    "level": level,
                }
            )

    return candidates


def extract_verb_candidates(content: str, level: str) -> list[dict]:
    candidates = []
    seen: set[str] = set()

    for sentence in split_sentences(content):
        for verb in find_infinitives_in_sentence(sentence):
            if verb.casefold() in VERB_STOPWORDS or should_skip_word(verb):
                continue
            if verb.casefold() in seen:
                continue

            seen.add(verb.casefold())
            candidates.append(
                {
                    "german": verb,
                    "spanish": "",
                    "word_type": "verb",
                    "article": None,
                    "infinitive": verb,
                    "past_simple": None,
                    "past_participle": None,
                    "example_sentence_de": sentence if verb in sentence else None,
                    "example_sentence_es": None,
                    "example_sentence_de_generated": None,
                    "level": level,
                }
            )

    return candidates


def extract_adjective_candidates(content: str, level: str) -> list[dict]:
    candidates = []
    seen: set[str] = set()

    for sentence in split_sentences(content):
        for match in re.finditer(
            r"\b(?:ist|sind|war|waren|bleibt|bleiben|wird|werden|gilt|gelten)\s+(?:sehr\s+|noch\s+|nicht\s+|weiterhin\s+|relativ\s+|besonders\s+|zunehmend\s+|auch\s+|immer\s+){0,3}([a-zäöüß-]{3,})\b",
            sentence,
        ):
            adjective = match.group(1)
            if (
                adjective.casefold() in ADJECTIVE_STOPWORDS
                or len(adjective) < 4
                or should_skip_word(adjective)
            ):
                continue
            if adjective.casefold() in seen:
                continue

            seen.add(adjective.casefold())
            candidates.append(
                {
                    "german": adjective,
                    "spanish": "",
                    "word_type": "adjective",
                    "article": None,
                    "infinitive": None,
                    "past_simple": None,
                    "past_participle": None,
                    "example_sentence_de": sentence if adjective in sentence else None,
                    "example_sentence_es": None,
                    "example_sentence_de_generated": None,
                    "level": level,
                }
            )

    return candidates


def should_skip_word(word: str) -> bool:
    normalized = word.strip(".,:;!?()[]{}\"'").casefold()
    if not normalized:
        return True
    if any(char.isdigit() for char in normalized):
        return True
    if normalized in SKIP_WORDS:
        return True
    return False


def normalize_article(article: str, noun: str) -> str | None:
    if article in {"die", "das", "eine"}:
        return ARTICLE_MAP.get(article)

    noun_lower = noun.casefold()
    if noun_lower.endswith(FEMININE_SUFFIXES):
        return "die"
    if noun_lower.endswith(NEUTER_SUFFIXES):
        return "das"
    return ARTICLE_MAP.get(article)


def find_infinitives_in_sentence(sentence: str) -> list[str]:
    infinitives = []
    patterns = [
        r"\bzu\s+([a-zäöüß][a-zäöüß-]{2,}(?:en|eln|ern))\b",
        r"\b(?:will|wollen|soll|sollen|kann|können|muss|müssen|möchte|möchten|plant|planen|droht|drohen|beginnt|beginnen|strebt|streben|lässt|lassen|hilft|helfen|braucht|brauchen)\s+([a-zäöüß][a-zäöüß-]{2,}(?:en|eln|ern))\b",
    ]

    for pattern in patterns:
        for match in re.finditer(pattern, sentence):
            infinitives.append(match.group(1))

    if infinitives:
        return infinitives

    return []


def count_type(items: list[dict], word_type: str) -> int:
    return sum(1 for item in items if item["word_type"] == word_type)


def build_themes(entries: list[dict]) -> list[dict]:
    theme_map: dict[int, dict] = {}

    for entry in entries:
        theme = theme_map.get(entry["theme_number"])
        if theme is None:
            theme = {
                "theme_number": entry["theme_number"],
                "title": entry["article_title"],
                "slug": None,
                "topic": None,
                "access_status": DEFAULT_ACCESS_STATUS,
                "versions": {},
                "vocabulary_occurrences": [],
            }
            theme_map[entry["theme_number"]] = theme

        theme["versions"][entry["level"]] = entry["content"]
        for item in entry["vocabulary"]:
            theme["vocabulary_occurrences"].append(
                {
                    **item,
                    "text_level": entry["level"],
                }
            )

    themes = [theme_map[key] for key in sorted(theme_map)]
    assign_unique_slugs(themes)
    vocabulary_catalog, vocabulary_links = build_vocabulary_data(themes)
    for theme in themes:
        theme["vocabulary_occurrences"] = []
    for theme in themes:
        theme["vocabulary_links"] = [
            link for link in vocabulary_links if link["theme_slug"] == theme["slug"]
        ]
    for theme in themes:
        theme["vocabulary_catalog"] = vocabulary_catalog
    return themes


def assign_unique_slugs(themes: list[dict]) -> None:
    used_slugs: set[str] = set()

    for theme in themes:
        base_slug = slugify(theme["title"]) or f'text-{theme["theme_number"]}'
        slug = base_slug
        suffix = 2

        while slug in used_slugs:
            slug = f"{base_slug}-{suffix}"
            suffix += 1

        theme["slug"] = slug
        used_slugs.add(slug)


def build_vocabulary_data(themes: list[dict]) -> tuple[list[dict], list[dict]]:
    vocabulary_by_german: dict[str, dict] = {}
    links: list[dict] = []

    for theme in themes:
        seen_in_theme_level: set[tuple[str, str]] = set()

        for item in theme["vocabulary_occurrences"]:
            german_key = item["german"].strip().casefold()
            existing = vocabulary_by_german.get(german_key)

            if existing is None:
                example_sentence_de = item["example_sentence_de"] or None
                example_sentence_es = item.get("example_sentence_es") or None
                vocabulary_by_german[german_key] = {
                    "german": item["german"],
                    "spanish": item["spanish"],
                    "word_type": item["word_type"],
                    "article": item["article"],
                    "infinitive": item["infinitive"],
                    "past_simple": item["past_simple"],
                    "past_participle": item["past_participle"],
                    "example_sentence_de": example_sentence_de,
                    "example_sentence_es": example_sentence_es,
                    "example_sentence_de_generated": item.get("example_sentence_de_generated") or None,
                    "level": item["level"],
                }
            if existing is None:
                pass
            elif not existing.get("example_sentence_de") and item["example_sentence_de"]:
                existing["example_sentence_de"] = item["example_sentence_de"]
            if existing is not None and not existing.get("example_sentence_es"):
                existing["example_sentence_es"] = item.get("example_sentence_es") or None
            if existing is not None and (
                not existing.get("example_sentence_de_generated")
                and item.get("example_sentence_de_generated")
            ):
                existing["example_sentence_de_generated"] = item["example_sentence_de_generated"]

            link_key = (item["text_level"], german_key)
            if link_key in seen_in_theme_level:
                continue

            seen_in_theme_level.add(link_key)
            links.append(
                {
                    "theme_slug": theme["slug"],
                    "level": item["text_level"],
                    "german": item["german"],
                }
            )

    vocabulary_catalog = list(vocabulary_by_german.values())
    vocabulary_catalog.sort(key=lambda item: item["german"].casefold())
    return vocabulary_catalog, links


def slugify(value: str) -> str:
    replacements = {
        "ß": "ss",
        "ä": "ae",
        "ö": "oe",
        "ü": "ue",
        "Ä": "ae",
        "Ö": "oe",
        "Ü": "ue",
    }

    for source, target in replacements.items():
        value = value.replace(source, target)

    value = unicodedata.normalize("NFD", value)
    value = "".join(char for char in value if unicodedata.category(char) != "Mn")
    value = value.lower()
    value = re.sub(r"[^a-z0-9]+", "-", value)
    value = re.sub(r"^-+|-+$", "", value)
    value = re.sub(r"-{2,}", "-", value)
    return value


def build_sql(themes: list[dict], input_path: Path) -> str:
    lines: list[str] = []
    all_vocabulary = themes[0]["vocabulary_catalog"] if themes else []
    vocabulary_links = []
    lines.extend(
        [
            "-- ============================================================",
            "-- Seed generated from structured TXT",
            f"-- Source: {input_path}",
            "-- Tables: texts, text_versions, vocabulario, text_version_vocabulary",
            "-- ============================================================",
            "",
        ]
    )

    for theme in themes:
        lines.extend(
            [
                f'-- Theme {theme["theme_number"]}: {theme["title"]}',
                "insert into texts (",
                "  title,",
                "  topic,",
                "  access_status,",
                "  published_at,",
                "  slug",
                ")",
                "values (",
                f'  {sql_string(theme["title"])},',
                "  null,",
                f'  {sql_string(theme["access_status"])},',
                "  now(),",
                f'  {sql_string(theme["slug"])}',
                ")",
                "on conflict (slug) do update set",
                "  title = excluded.title,",
                "  topic = excluded.topic,",
                "  access_status = excluded.access_status,",
                "  published_at = excluded.published_at;",
                "",
                "insert into text_versions (text_id, level, content)",
                "values",
            ]
        )

        version_rows = []
        for level in LEVEL_ORDER:
            if level not in theme["versions"]:
                continue
            content = theme["versions"][level]
            version_rows.append(
                "\n".join(
                    [
                        "(",
                        f'  (select id from texts where slug = {sql_string(theme["slug"])}),',
                        f"  {sql_string(level)},",
                        f"  {sql_string(content)}",
                        ")",
                    ]
                )
            )

        lines.append(",\n".join(version_rows))
        lines.extend(
            [
                "on conflict (text_id, level) do update set",
                "  content = excluded.content;",
                "",
            ]
        )
        vocabulary_links.extend(theme.get("vocabulary_links", []))

    if all_vocabulary:
        lines.extend(
            [
                "-- Global deduplicated vocabulary",
                "insert into vocabulario (",
                "  german,",
                "  word_type,",
                "  spanish,",
                "  example_sentence_de,",
                "  level,",
                "  article,",
                "  plural_form,",
                "  infinitive,",
                "  example_sentence_es,",
                "  example_sentence_de_generated,",
                "  past_simple,",
                "  past_participle",
                ")",
                "select *",
                "from (",
                "  values",
            ]
        )

        vocab_rows = []
        for item in all_vocabulary:
            vocab_rows.append(
                "\n".join(
                    [
                        "  (",
                        f'    {sql_string(item["german"])},',
                        f'    {sql_string(item["word_type"])},',
                        f'    {sql_string(item["spanish"])},',
                        f'    {sql_nullable(item["example_sentence_de"])},',
                        f'    {sql_string(item["level"])},',
                        f'    {sql_nullable(item["article"])},',
                        "    null,",
                        f'    {sql_nullable(item["infinitive"])},',
                        f'    {sql_nullable(item.get("example_sentence_es"))},',
                        f'    {sql_nullable(item.get("example_sentence_de_generated"))},',
                        f'    {sql_nullable(item["past_simple"])},',
                        f'    {sql_nullable(item["past_participle"])}',
                        "  )",
                    ]
                )
            )

        lines.append(",\n".join(vocab_rows))
        lines.extend(
            [
                ") as v(",
                "  german,",
                "  word_type,",
                "  spanish,",
                "  example_sentence_de,",
                "  level,",
                "  article,",
                "  plural_form,",
                "  infinitive,",
                "  example_sentence_es,",
                "  example_sentence_de_generated,",
                "  past_simple,",
                "  past_participle",
                ")",
                "where not exists (",
                "  select 1",
                "  from vocabulario existing",
                "  where lower(existing.german) = lower(v.german)",
                ");",
                "",
            ]
        )

    if vocabulary_links:
        lines.extend(
            [
                "-- Vocabulary links per text version",
                "insert into text_version_vocabulary (",
                "  text_version_id,",
                "  vocabulario_id",
                ")",
                "select distinct",
                "  tv.id,",
                "  v.id",
                "from (",
                "  values",
            ]
        )

        link_rows = []
        for link in vocabulary_links:
            link_rows.append(
                "\n".join(
                    [
                        "  (",
                        f'    {sql_string(link["theme_slug"])},',
                        f'    {sql_string(link["level"])},',
                        f'    {sql_string(link["german"])}',
                        "  )",
                    ]
                )
            )

        lines.append(",\n".join(link_rows))
        lines.extend(
            [
                ") as m(",
                "  slug,",
                "  level,",
                "  german",
                ")",
                "join texts t on t.slug = m.slug",
                "join text_versions tv on tv.text_id = t.id and tv.level = m.level",
                "join vocabulario v on lower(v.german) = lower(m.german)",
                "where not exists (",
                "  select 1",
                "  from text_version_vocabulary existing",
                "  where existing.text_version_id = tv.id",
                "    and existing.vocabulario_id = v.id",
                ");",
                "",
            ]
        )

    return "\n".join(lines) + "\n"


def find_example_sentence(content: str, german: str) -> str | None:
    for sentence in split_sentences(content):
        if german in sentence:
            return sentence.strip()
    return None


def sanitize_example_sentence(content: str, sentence: str | None) -> str | None:
    if not sentence:
        return None

    normalized = re.sub(r"\s+", " ", sentence).strip()
    if not normalized:
        return None

    content_sentences = split_sentences(content)
    for candidate in content_sentences:
        if candidate and candidate in normalized:
            return candidate.strip()

    return normalized


def split_sentences(content: str) -> list[str]:
    normalized = re.sub(r"\s+", " ", content).strip()
    if not normalized:
        return []
    return [sentence.strip() for sentence in re.split(r"(?<=[.!?])\s+", normalized) if sentence.strip()]


def sql_string(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def sql_nullable(value: str | None) -> str:
    return "null" if value in (None, "") else sql_string(value)


if __name__ == "__main__":
    main()
