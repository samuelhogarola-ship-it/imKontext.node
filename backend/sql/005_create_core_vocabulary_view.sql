-- Migration 005: FK constraints on text_version_meanings + core vocabulary view
--
-- Adds proper FK constraints so PostgREST can resolve embedded resources,
-- then creates a view that exposes the exact same column contract as the
-- legacy endpoint (text_version_vocabulary → vocabulario), reading instead
-- from the unified core (text_version_meanings → vocabulary_meanings → vocabulary_lemmas).
--
-- This view is consumed by /api/text-version-vocabulary-core and allows
-- imKontext to switch data sources with zero frontend changes.

ALTER TABLE text_version_meanings
  ADD CONSTRAINT text_version_meanings_text_version_id_fkey
    FOREIGN KEY (text_version_id) REFERENCES text_versions(id),
  ADD CONSTRAINT text_version_meanings_meaning_id_fkey
    FOREIGN KEY (meaning_id) REFERENCES vocabulary_meanings(id);

CREATE OR REPLACE VIEW text_version_vocabulary_core AS
SELECT
  tvm.text_version_id,
  vm.id,
  vl.german,
  vm.spanish,
  vl.article,
  vl.word_type,
  NULL::text                                    AS plural_form,
  (vl.conjugation->>'infinitive')::text         AS infinitive,
  (vl.conjugation->>'past_simple')::text        AS past_simple,
  (vl.conjugation->>'past_participle')::text    AS past_participle,
  vm.example                                    AS example_sentence_de,
  vm.example_es                                 AS example_sentence_es,
  vm.level
FROM text_version_meanings tvm
JOIN vocabulary_meanings vm ON vm.id = tvm.meaning_id
JOIN vocabulary_lemmas   vl ON vl.id = vm.lemma_id;

-- Verification
-- SELECT COUNT(*) FROM text_version_vocabulary_core;
-- Expected: 1407
