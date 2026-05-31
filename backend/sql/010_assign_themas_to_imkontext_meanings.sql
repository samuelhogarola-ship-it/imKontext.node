-- Migration 006: assign themas to imKontext meanings
--
-- Inserts rows into vocabulary_meaning_topics for the 1,449 meanings
-- that belong to imKontext, derived from the categoria of their source text.
--
-- Mapping:
--   deporte       → 4  (Hobbys & Freizeit)
--   politica      → 29 (Politik & Wahlen)
--   movilidad     → 15 (Reisen & Mobilität)
--   cultura       → 7  (Stadt & Kultur)
--   sociedad      → 3  (Familie & Alltag)
--   educacion     → 11 (Studium & Alltag)
--   economia      → 12 (Bank & Geld)
--   trabajo       → 17 (Bewerbung & Arbeit)
--   medioambiente → 1  (Zeit & Natur)
--   internacional → 19 (Reise & Politik)
--   salud         → 13 (Gesundheit)
--   ciencia       → 11 (Studium & Alltag)
--   tecnologia    → 22 (Post & Kommunikation)
--
-- A meaning that appears in texts of multiple categories receives
-- multiple thema assignments (correct — same word, different contexts).
-- The 59 meanings with no text link are skipped (no category to derive from).

INSERT INTO vocabulary_meaning_topics (meaning_id, thema_id, created_at)
SELECT DISTINCT
  tvm.meaning_id,
  CASE t.categoria
    WHEN 'deporte'       THEN 4
    WHEN 'politica'      THEN 29
    WHEN 'movilidad'     THEN 15
    WHEN 'cultura'       THEN 7
    WHEN 'sociedad'      THEN 3
    WHEN 'educacion'     THEN 11
    WHEN 'economia'      THEN 12
    WHEN 'trabajo'       THEN 17
    WHEN 'medioambiente' THEN 1
    WHEN 'internacional' THEN 19
    WHEN 'salud'         THEN 13
    WHEN 'ciencia'       THEN 11
    WHEN 'tecnologia'    THEN 22
  END AS thema_id,
  NOW()
FROM text_version_meanings tvm
JOIN text_versions tv  ON tv.id  = tvm.text_version_id
JOIN texts t           ON t.id   = tv.text_id
JOIN app_vocabulary_meanings avm
  ON avm.meaning_id = tvm.meaning_id AND avm.app_key = 'imkontext'
WHERE t.categoria IS NOT NULL
ON CONFLICT DO NOTHING;

-- Verification
-- SELECT COUNT(*) FROM vocabulary_meaning_topics;
-- Expected: > 1325 (previous VokabelLab total)
--
-- SELECT COUNT(DISTINCT meaning_id) FROM vocabulary_meaning_topics
-- WHERE meaning_id IN (SELECT meaning_id FROM app_vocabulary_meanings WHERE app_key = 'imkontext');
-- Expected: ~1390 (meanings with text link)
