# Seed Generator

Generate a `seed.sql` file from a structured TXT file that contains:

- `===== t1_a2.xhtml =====` style headers
- the article text
- inline vocabulary blocks like `[A2]`
- vocabulary rows in this format:

```txt
german | spanish | word_type | article | infinitive | past_simple | past_participle
```

Extended semi-assisted vocabulary row formats:

```txt
german | spanish | word_type | article | infinitive | past_simple | past_participle | example_sentence_de | example_sentence_es | example_sentence_de_generated
```

Also supported:

```txt
german | spanish | word_type | article | infinitive | past_simple | past_participle | example_sentence_de
german | spanish | word_type | article | infinitive | past_simple | past_participle | example_sentence_de | example_sentence_de_generated
```

Notes:

- `example_sentence_de` should be a real sentence from the source text
- `example_sentence_es` should come from your TXT when you want to store it
- `example_sentence_de_generated` is optional and should now come from your TXT if you want to store it
- if you keep the 7-column format, the generator will try to fill `example_sentence_de` automatically when possible
- the generator does not translate `example_sentence_es` automatically

Example:

```bash
cd /Users/sam/Documents/imKontext/backend
python3 scripts/generate_seed_from_txt.py ../imKontext_4Themen_4Niveaus.txt
```

Optional custom output path:

```bash
python3 scripts/generate_seed_from_txt.py ../imKontext_4Themen_4Niveaus.txt ./seed.sql
```

EPUB to TXT:

```bash
cd /Users/sam/Documents/imKontext/backend
python3 scripts/epub_to_txt.py input.epub output.txt
```

Watch folder automation:

Folder structure used:

```txt
backend/
  convertir/
  anadir_a_supabase/
  procesados/
  scripts/
```

Run:

```bash
cd /Users/sam/Documents/imKontext/backend
python3 scripts/watch_convert_folder.py
```

What it does:

- detects new `.epub` files inside `backend/convertir`
- converts each EPUB into TXT with `epub_to_txt.py`
- generates `nombre.seed.sql` with `generate_seed_from_txt.py`
- writes both files into `backend/anadir_a_supabase`
- moves the original EPUB into `backend/procesados`
- keeps running and polling for more files

Recommended semi-assisted flow:

1. Drop the EPUB into `backend/convertir`
2. Let the watcher produce the clean TXT in `backend/anadir_a_supabase`
3. Curate or enrich vocabulary per block and level
4. Fill `example_sentence_de` and optionally `example_sentence_de_generated`
5. Fill `example_sentence_es` manually when you want to store the Spanish sentence
6. Run the seed generator once the TXT is reviewed

Extract German vocabulary sentences for translation:

```bash
cd /Users/sam/Documents/imKontext/backend
python3 scripts/extract_german_vocab_sentences.py
```

Default behavior:

- reads all `.txt` and `.epub` files inside `backend/anadir_a_supabase/traducir al español`
- writes `backend/anadir_a_supabase/traducir al español/frases_aleman.txt`
- output format:

```txt
block_id | level | german | original | frase en aleman
block_id | level | german | generated | frase en aleman
```

Apply Spanish translations and regenerate seeds automatically:

```bash
cd /Users/sam/Documents/imKontext/backend
python3 scripts/apply_spanish_translations.py
```

Default behavior:

- reads `backend/anadir_a_supabase/traducir al español/frases_traducidas.txt`
- updates matching TXT files in the same folder
- regenerates `.seed.sql` automatically for each updated TXT
- expected translation format:

```txt
block_id | level | german | original | frase en espanol
block_id | level | german | generated | frase en espanol
```

Note:

- only `original` is reinserted into `example_sentence_es`, because the current TXT/database format has a single Spanish example column

Official output convention:

- Keep the reviewed TXT in `backend/anadir_a_supabase/`
- Generate one seed per source file in the same folder:

```txt
backend/anadir_a_supabase/nombre.txt
backend/anadir_a_supabase/nombre.seed.sql
```

- Avoid using a shared root-level `backend/seed.sql` as the final source of truth
