-- Migration 003: create text_version_meanings
--
-- Adds a junction table that links text_versions to vocabulary_meanings (core).
-- This is the key bridge that allows imKontext to read vocabulary from the
-- unified core instead of the legacy vocabulario table.
--
-- Population: derived from text_version_vocabulary → vocabulario.primary_meaning_id.
-- All 1,407 rows in text_version_vocabulary have a populated primary_meaning_id,
-- so this migration is lossless.

CREATE TABLE IF NOT EXISTS text_version_meanings (
  text_version_id bigint NOT NULL,
  meaning_id      bigint NOT NULL,
  created_at      timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (text_version_id, meaning_id)
);

-- Populate from existing legacy bridge
INSERT INTO text_version_meanings (text_version_id, meaning_id, created_at)
SELECT
  tvv.text_version_id,
  v.primary_meaning_id,
  NOW()
FROM text_version_vocabulary tvv
JOIN vocabulario v ON v.id = tvv.vocabulario_id
WHERE v.primary_meaning_id IS NOT NULL
ON CONFLICT DO NOTHING;

-- Verification
-- SELECT COUNT(*) FROM text_version_meanings;
-- Expected: 1407
