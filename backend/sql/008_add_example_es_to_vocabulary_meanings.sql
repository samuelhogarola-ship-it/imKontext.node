-- Migration 004: add example_es to vocabulary_meanings
--
-- vocabulary_meanings.example stores the German example sentence (example_sentence_de).
-- imKontext also needs the Spanish translation of the example for display.
-- This migration adds example_es and populates it from vocabulario.example_sentence_es
-- via the legacy_vocabulario_id bridge.
--
-- Coverage: all 1,449 imKontext meanings have example_sentence_es in vocabulario.
-- The 1,278 VokabelLab-only meanings have no ES example (expected: NULL).

ALTER TABLE vocabulary_meanings
  ADD COLUMN IF NOT EXISTS example_es text;

UPDATE vocabulary_meanings vm
SET example_es = v.example_sentence_es
FROM vocabulario v
WHERE vm.legacy_vocabulario_id = v.id
  AND v.example_sentence_es IS NOT NULL
  AND vm.example_es IS NULL;

-- Verification
-- SELECT COUNT(*) FROM vocabulary_meanings WHERE example_es IS NOT NULL;
-- Expected: 1449
