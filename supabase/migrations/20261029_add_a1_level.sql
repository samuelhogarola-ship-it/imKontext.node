-- Allow A1 level in text_versions
ALTER TABLE text_versions DROP CONSTRAINT level_check;
ALTER TABLE text_versions ADD CONSTRAINT level_check
  CHECK (level = ANY (ARRAY['A1','A2','B1','B2','C1']));
