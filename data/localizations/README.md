# Additive learning content

Five independent learning locales: Spanish (`es`), English (`en`), Finnish (`fi`), Italian (`it`), Brazilian Portuguese (`pt`). Each JSON contains 29 localized titles, 116 CEFR versions (A2/B1/B2/C1), and 1,261 canonical linked meanings. IDs refer to existing source records; slugs are retained inside each language URL namespace.

German source data is not updated. The old `sql/seed-50-texts.sql` is not part of this migration. Apply `backend/sql/011_add_content_localizations.sql` and generated locale imports separately from any German seed.

The source currently has vocabulary links for 25 texts / 100 versions. The remaining four texts are translated but hidden in the new catalogs until source vocabulary exists. Catalog readiness requires complete target terms and examples.

Translations were generated from the existing German text, preserving source facts and CEFR versions, then checked for complete IDs, wrong-language leakage, grammar metadata, and representative meaning/content accuracy. Existing canonical English terms and Spanish meanings were retained. Only new localization records correct source Spanish examples containing German and seven source examples truncated at abbreviations/numbers. Meanings122,555,1115 have Spanish sentences in the source German field; their reviewed Spanish examples carry an explicit `example_source_language: es` note. Exhaustive comparison of all1,261 Spanish example pairs corrected88 inherited source examples only in this new layer. Nullable morphology is intentional: no German plural or verb forms are reused for other languages. Finnish and English have no article exercise. New-language matching recognizes glossary alternatives; gap-fill-only practice includes words with an attested form in the example and reports clearly when none are available. German matching is unchanged.

Build SQL from the matching read-only source snapshot:

```sh
node scripts/build-language-import.mjs source/translation-source.json imports data/localizations/{es,en,fi,it,pt}.json
```

The importer validates complete source-ID coverage, target language, nonempty content, article metadata and source guards. It guards original text/version content, canonical meanings/examples/translations, lemma identity, German term/type/article and the vocabulary link set. It writes only `imk_*_localizations`, inside a transaction, using `ON CONFLICT DO NOTHING`; reviewed translations are never overwritten. If a source text/version/meaning changed, the import aborts and must be regenerated after review.

Rehearse with read-only exports named `german-texts.json`, `german-versions.json`, `german-meanings.json`, `german-vocabulario.json`, `german-vocabulary.json`, `translation-source.json`:

```sh
node scripts/rehearse-language-import.mjs source report.json data/localizations/{es,en,fi,it,pt}.json
```

This uses a disposable PostgreSQL engine in memory, imports twice, compares hashes of every original row, checks anon visibility and runs the actual localized service against all versions. Optional `IMK_REHEARSAL_PORT` serves the additive API for local browser testing only; it does not provide the legacy German handlers.

Deploy after review: migration → five imports → app branch. Until new tables/content exist, default German routes keep their existing handlers and the five new selectors remain unavailable. To roll back application behavior, redeploy the previous app revision; leave the additive localization tables in place. No German rollback or destructive SQL is needed.
