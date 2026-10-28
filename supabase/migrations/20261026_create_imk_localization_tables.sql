-- Create imKontext localization tables for multilingual content
-- These tables store translations for texts, versions, and vocabulary meanings

CREATE TABLE IF NOT EXISTS imk_text_localizations (
  text_id bigint NOT NULL REFERENCES texts(id) ON DELETE CASCADE,
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  title text,
  slug text,
  is_published boolean DEFAULT true,
  PRIMARY KEY (text_id, language)
);

CREATE TABLE IF NOT EXISTS imk_version_localizations (
  text_version_id bigint NOT NULL REFERENCES text_versions(id) ON DELETE CASCADE,
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  content text,
  is_published boolean DEFAULT true,
  PRIMARY KEY (text_version_id, language)
);

CREATE TABLE IF NOT EXISTS imk_meaning_localizations (
  meaning_id bigint NOT NULL REFERENCES vocabulary_meanings(id) ON DELETE CASCADE,
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  term text,
  example text,
  article text,
  word_type text,
  PRIMARY KEY (meaning_id, language)
);

-- Enable RLS on new tables
ALTER TABLE imk_text_localizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE imk_version_localizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE imk_meaning_localizations ENABLE ROW LEVEL SECURITY;

-- Read policies (anon + authenticated)
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'imk_text_localizations' AND policyname = 'anon_read_text_loc') THEN
    CREATE POLICY anon_read_text_loc ON imk_text_localizations FOR SELECT USING (true);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'imk_version_localizations' AND policyname = 'anon_read_version_loc') THEN
    CREATE POLICY anon_read_version_loc ON imk_version_localizations FOR SELECT USING (true);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'imk_meaning_localizations' AND policyname = 'anon_read_meaning_loc') THEN
    CREATE POLICY anon_read_meaning_loc ON imk_meaning_localizations FOR SELECT USING (true);
  END IF;
END $$;
