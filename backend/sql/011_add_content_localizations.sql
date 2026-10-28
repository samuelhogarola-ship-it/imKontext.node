-- Additive localization layer. Existing German tables/rows/policies are never changed.
BEGIN;

CREATE TABLE IF NOT EXISTS public.imk_text_localizations (
  text_id bigint NOT NULL REFERENCES public.texts(id),
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  title text NOT NULL CHECK (btrim(title) <> ''),
  slug text NOT NULL CHECK (btrim(slug) <> ''),
  topic text,
  is_published boolean NOT NULL DEFAULT true,
  PRIMARY KEY (text_id, language),
  UNIQUE (language, slug)
);
CREATE TABLE IF NOT EXISTS public.imk_version_localizations (
  text_version_id bigint NOT NULL REFERENCES public.text_versions(id),
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  content text NOT NULL CHECK (btrim(content) <> ''),
  is_published boolean NOT NULL DEFAULT true,
  PRIMARY KEY (text_version_id, language)
);
CREATE TABLE IF NOT EXISTS public.imk_meaning_localizations (
  meaning_id bigint NOT NULL REFERENCES public.vocabulary_meanings(id),
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  term text NOT NULL CHECK (btrim(term) <> ''),
  example text NOT NULL CHECK (btrim(example) <> ''),
  article text,
  word_type text,
  plural_form text,
  infinitive text,
  past_simple text,
  past_participle text,
  PRIMARY KEY (meaning_id, language),
  CHECK (language <> 'fi' OR article IS NULL)
);

-- Production may already have the smaller localization shape from 2026-10-26.
-- Nullable columns extend that shape without rewriting existing translations.
ALTER TABLE public.imk_text_localizations ADD COLUMN IF NOT EXISTS topic text;
ALTER TABLE public.imk_meaning_localizations
  ADD COLUMN IF NOT EXISTS plural_form text,
  ADD COLUMN IF NOT EXISTS infinitive text,
  ADD COLUMN IF NOT EXISTS past_simple text,
  ADD COLUMN IF NOT EXISTS past_participle text;

ALTER TABLE public.imk_text_localizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.imk_version_localizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.imk_meaning_localizations ENABLE ROW LEVEL SECURITY;
DO $policies$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='imk_text_localizations' AND policyname='imk_read_parent_text') THEN
    CREATE POLICY imk_read_parent_text ON public.imk_text_localizations FOR SELECT TO anon,authenticated
      USING (is_published AND EXISTS (SELECT 1 FROM public.texts t WHERE t.id=text_id));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='imk_version_localizations' AND policyname='imk_read_parent_version') THEN
    CREATE POLICY imk_read_parent_version ON public.imk_version_localizations FOR SELECT TO anon,authenticated
      USING (is_published AND EXISTS (SELECT 1 FROM public.text_versions v JOIN public.texts t ON t.id=v.text_id WHERE v.id=text_version_id));
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='imk_meaning_localizations' AND policyname='imk_read_parent_meaning') THEN
    CREATE POLICY imk_read_parent_meaning ON public.imk_meaning_localizations FOR SELECT TO anon,authenticated
      USING (EXISTS (SELECT 1 FROM public.text_version_meanings m JOIN public.text_versions v ON v.id=m.text_version_id JOIN public.texts t ON t.id=v.text_id WHERE m.meaning_id=imk_meaning_localizations.meaning_id));
  END IF;
END
$policies$;
GRANT SELECT ON public.imk_text_localizations,public.imk_version_localizations,public.imk_meaning_localizations TO anon,authenticated;
COMMIT;
