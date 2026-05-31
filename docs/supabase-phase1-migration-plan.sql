-- ============================================================
-- FASE 1 — Plan SQL de Migración: imKontext ← VokabelLab
-- Fecha: 2026-05-31
-- ESTADO: BORRADOR — NO EJECUTAR sin validación previa
-- ============================================================
-- Orden: DDL primero, datos al final.
-- Todas las sentencias son idempotentes (IF NOT EXISTS / DO $$).
-- ============================================================


-- ─────────────────────────────────────────────────────────────
-- PASO 1: Crear tabla themas (sin dependencias externas)
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS "public"."themas" (
    "id"   integer NOT NULL,
    "name" text    NOT NULL,
    CONSTRAINT "themas_pkey" PRIMARY KEY ("id")
);


-- ─────────────────────────────────────────────────────────────
-- PASO 2: Extender vocabulario con columnas de VokabelLab
-- Todas son nullable o tienen DEFAULT → operación no-breaking.
-- ─────────────────────────────────────────────────────────────
ALTER TABLE "public"."vocabulario"
    ADD COLUMN IF NOT EXISTS "thema_id"   integer
        REFERENCES "public"."themas"("id") ON DELETE SET NULL,
    ADD COLUMN IF NOT EXISTS "is_active"  boolean  NOT NULL DEFAULT true,
    ADD COLUMN IF NOT EXISTS "source"     text     DEFAULT 'manual_import',
    ADD COLUMN IF NOT EXISTS "created_at" timestamptz NOT NULL DEFAULT now(),
    ADD COLUMN IF NOT EXISTS "updated_at" timestamptz NOT NULL DEFAULT now();


-- ─────────────────────────────────────────────────────────────
-- PASO 3: Crear tabla profiles
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS "public"."profiles" (
    "id"                   uuid        NOT NULL,
    "email"                text,
    "display_name"         text,
    "avatar_url"           text,
    "preferred_lang"       text        DEFAULT 'es',
    "level_label"          text,
    "onboarding_completed" boolean     NOT NULL DEFAULT false,
    "created_at"           timestamptz NOT NULL DEFAULT now(),
    "updated_at"           timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id")
        REFERENCES auth.users("id") ON DELETE CASCADE
);


-- ─────────────────────────────────────────────────────────────
-- PASO 4: Crear tabla study_sessions
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS "public"."study_sessions" (
    "id"              uuid        NOT NULL DEFAULT gen_random_uuid(),
    "user_id"         uuid        NOT NULL REFERENCES auth.users("id") ON DELETE CASCADE,
    "mode"            text        NOT NULL,
    "started_at"      timestamptz NOT NULL DEFAULT now(),
    "finished_at"     timestamptz,
    "total_words"     integer     NOT NULL DEFAULT 0,
    "correct_answers" integer     NOT NULL DEFAULT 0,
    "wrong_answers"   integer     NOT NULL DEFAULT 0,
    "selected_themas" integer[]   NOT NULL DEFAULT '{}',
    "selected_types"  text[]      NOT NULL DEFAULT '{}',
    "notes"           jsonb       NOT NULL DEFAULT '{}',
    CONSTRAINT "study_sessions_pkey"              PRIMARY KEY ("id"),
    CONSTRAINT "study_sessions_mode_check"        CHECK ("mode" = ANY (ARRAY['write','cards','mc','mixed'])),
    CONSTRAINT "study_sessions_total_words_check" CHECK ("total_words" >= 0),
    CONSTRAINT "study_sessions_correct_check"     CHECK ("correct_answers" >= 0),
    CONSTRAINT "study_sessions_wrong_check"       CHECK ("wrong_answers" >= 0)
);


-- ─────────────────────────────────────────────────────────────
-- PASO 5: Crear tabla session_answers
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS "public"."session_answers" (
    "id"             uuid        NOT NULL DEFAULT gen_random_uuid(),
    "session_id"     uuid        NOT NULL REFERENCES "public"."study_sessions"("id") ON DELETE CASCADE,
    "user_id"        uuid        NOT NULL REFERENCES auth.users("id") ON DELETE CASCADE,
    "vocabulario_id" bigint      NOT NULL REFERENCES "public"."vocabulario"("id") ON DELETE CASCADE,
    "mode"           text        NOT NULL,
    "is_correct"     boolean     NOT NULL,
    "user_answer"    text,
    "correct_answer" text,
    "answered_at"    timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT "session_answers_pkey"      PRIMARY KEY ("id"),
    CONSTRAINT "session_answers_mode_check" CHECK ("mode" = ANY (ARRAY['write','cards','mc']))
);


-- ─────────────────────────────────────────────────────────────
-- PASO 6: Crear tabla user_progress
-- ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS "public"."user_progress" (
    "id"             uuid        NOT NULL DEFAULT gen_random_uuid(),
    "user_id"        uuid        NOT NULL REFERENCES auth.users("id") ON DELETE CASCADE,
    "vocabulario_id" bigint      NOT NULL REFERENCES "public"."vocabulario"("id") ON DELETE CASCADE,
    "status"         text        NOT NULL DEFAULT 'new',
    "correct_count"  integer     NOT NULL DEFAULT 0,
    "wrong_count"    integer     NOT NULL DEFAULT 0,
    "streak"         integer     NOT NULL DEFAULT 0,
    "last_mode"      text,
    "last_seen_at"   timestamptz,
    "next_review_at" timestamptz,
    "mastered_at"    timestamptz,
    "created_at"     timestamptz NOT NULL DEFAULT now(),
    "updated_at"     timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT "user_progress_pkey"          PRIMARY KEY ("id"),
    CONSTRAINT "user_progress_unique"        UNIQUE ("user_id", "vocabulario_id"),
    CONSTRAINT "user_progress_status_check"  CHECK ("status" = ANY (ARRAY['new','learning','review','mastered'])),
    CONSTRAINT "user_progress_mode_check"    CHECK ("last_mode" = ANY (ARRAY['write','cards','mc'])),
    CONSTRAINT "user_progress_correct_check" CHECK ("correct_count" >= 0),
    CONSTRAINT "user_progress_wrong_check"   CHECK ("wrong_count" >= 0),
    CONSTRAINT "user_progress_streak_check"  CHECK ("streak" >= 0)
);


-- ─────────────────────────────────────────────────────────────
-- PASO 7: Función set_updated_at (genérica)
-- ─────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION "public"."set_updated_at"()
RETURNS trigger LANGUAGE plpgsql AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


-- ─────────────────────────────────────────────────────────────
-- PASO 8: Función handle_new_user
-- ─────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION "public"."handle_new_user"()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
    INSERT INTO public.profiles (id, email)
    VALUES (NEW.id, NEW.email)
    ON CONFLICT (id) DO NOTHING;
    RETURN NEW;
END;
$$;


-- ─────────────────────────────────────────────────────────────
-- PASO 9: Triggers updated_at
-- ─────────────────────────────────────────────────────────────
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'set_profiles_updated_at'
    ) THEN
        CREATE TRIGGER "set_profiles_updated_at"
            BEFORE UPDATE ON "public"."profiles"
            FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'set_vocabulario_updated_at'
    ) THEN
        CREATE TRIGGER "set_vocabulario_updated_at"
            BEFORE UPDATE ON "public"."vocabulario"
            FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'set_user_progress_updated_at'
    ) THEN
        CREATE TRIGGER "set_user_progress_updated_at"
            BEFORE UPDATE ON "public"."user_progress"
            FOR EACH ROW EXECUTE FUNCTION "public"."set_updated_at"();
    END IF;
END $$;


-- ─────────────────────────────────────────────────────────────
-- PASO 10: Trigger handle_new_user en auth.users
-- ─────────────────────────────────────────────────────────────
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_trigger WHERE tgname = 'on_auth_user_created'
    ) THEN
        CREATE TRIGGER "on_auth_user_created"
            AFTER INSERT ON auth.users
            FOR EACH ROW EXECUTE FUNCTION "public"."handle_new_user"();
    END IF;
END $$;


-- ─────────────────────────────────────────────────────────────
-- PASO 11: RLS — habilitar y crear políticas
-- ─────────────────────────────────────────────────────────────

-- profiles
ALTER TABLE "public"."profiles" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can view own profile"   ON "public"."profiles";
DROP POLICY IF EXISTS "Users can insert own profile" ON "public"."profiles";
DROP POLICY IF EXISTS "Users can update own profile" ON "public"."profiles";
CREATE POLICY "Users can view own profile"
    ON "public"."profiles" FOR SELECT
    USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile"
    ON "public"."profiles" FOR INSERT
    WITH CHECK (auth.uid() = id);
CREATE POLICY "Users can update own profile"
    ON "public"."profiles" FOR UPDATE
    USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- themas (solo lectura pública)
ALTER TABLE "public"."themas" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public can read themas" ON "public"."themas";
CREATE POLICY "Public can read themas"
    ON "public"."themas" FOR SELECT
    USING (true);

-- vocabulario — reemplazar policy simplificada por versión granular de VokabelLab
DROP POLICY IF EXISTS "public read vocabulario"          ON "public"."vocabulario";
DROP POLICY IF EXISTS "Admins can manage vocabulario"    ON "public"."vocabulario";
DROP POLICY IF EXISTS "Public can read active vocabulario" ON "public"."vocabulario";
CREATE POLICY "Public can read active vocabulario"
    ON "public"."vocabulario" FOR SELECT
    USING (is_active = true);
CREATE POLICY "Admins can manage vocabulario"
    ON "public"."vocabulario"
    USING (auth.role() = 'service_role')
    WITH CHECK (auth.role() = 'service_role');

-- study_sessions
ALTER TABLE "public"."study_sessions" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users manage own sessions" ON "public"."study_sessions";
CREATE POLICY "Users manage own sessions"
    ON "public"."study_sessions"
    USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- session_answers
ALTER TABLE "public"."session_answers" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users manage own answers" ON "public"."session_answers";
CREATE POLICY "Users manage own answers"
    ON "public"."session_answers"
    USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- user_progress
ALTER TABLE "public"."user_progress" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users manage own progress" ON "public"."user_progress";
CREATE POLICY "Users manage own progress"
    ON "public"."user_progress"
    USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);


-- ─────────────────────────────────────────────────────────────
-- PASO 12: Datos — themas (INSERT desde VokabelLab dump)
-- Adaptar con los valores reales del dump vokabellab_data_20260530_oneshot.sql
-- ─────────────────────────────────────────────────────────────
INSERT INTO public.themas (id, name) VALUES
    (1,  'Zeit & Natur'),
    (2,  'Essen & Einkaufen'),
    (3,  'Familie & Alltag'),
    (4,  'Hobbys & Freizeit'),
    (5,  'Wohnen'),
    (6,  'Kleidung & Haushalt'),
    (7,  'Stadt & Kultur'),
    (8,  'Im Restaurant'),
    (9,  'Feste & Traditionen'),
    (10, 'Wohnung & Umzug'),
    (11, 'Studium & Alltag'),
    (12, 'Bank & Geld'),
    (13, 'Gesundheit'),
    (14, 'Wetter & Mode'),
    (15, 'Reisen & Mobilität'),
    (16, 'Ausbildung & Beruf'),
    (17, 'Bewerbung & Arbeit'),
    (18, 'Urlaub'),
    (19, 'Reise & Politik'),
    (20, 'Unfall & Notfall'),
    (21, 'Kunst & Aussehen'),
    (22, 'Post & Kommunikation'),
    (23, 'Hochschule & Kunst'),
    (24, 'Landleben & Ehrenamt'),
    (25, 'Umgangsformen'),
    (26, 'Arbeitsvertrag'),
    (27, 'Geschichte'),
    (28, 'Migration'),
    (29, 'Politik & Wahlen')
ON CONFLICT (id) DO NOTHING;


-- ─────────────────────────────────────────────────────────────
-- PASO 13: Datos — vocabulario (MERGE con deduplicación)
-- ─────────────────────────────────────────────────────────────
-- Estrategia:
--   1. Los registros de VokabelLab se insertan como nuevas filas si (german, spanish) no existe.
--   2. Si ya existe en imKontext, se actualiza solo thema_id, is_active, source.
--   3. NO sobreescribir datos ricos (examples, conjugaciones) con NULLs de VokabelLab.
--
-- PLACEHOLDER: ejecutar esto como bloque DO $$ ... $$ después de confirmar mapping de IDs.
--
-- Ejemplo de lógica (adaptar con datos reales):
-- INSERT INTO public.vocabulario (german, spanish, article, word_type, thema_id, is_active, source)
-- SELECT
--     vl.de          AS german,
--     vl.es          AS spanish,
--     vl.artikel     AS article,
--     vl.type        AS word_type,
--     vl.thema_id,
--     vl.is_active,
--     vl.source
-- FROM <staging_vokabellab_vocabulario> vl
-- ON CONFLICT (german, spanish)
--     DO UPDATE SET
--         thema_id  = EXCLUDED.thema_id,
--         is_active = EXCLUDED.is_active,
--         source    = COALESCE(vocabulario.source, EXCLUDED.source);
--
-- NOTA: para ON CONFLICT funcionar se necesita un UNIQUE INDEX en (german, spanish).
-- Añadir ANTES del merge:
CREATE UNIQUE INDEX IF NOT EXISTS vocabulario_german_spanish_idx
    ON public.vocabulario (german, spanish);


-- ─────────────────────────────────────────────────────────────
-- PASO 14: Datos — profiles y user_progress (si hay usuarios reales)
-- ─────────────────────────────────────────────────────────────
-- NOTA: Si VokabelLab no tiene usuarios de producción reales con datos de progreso,
-- este paso puede omitirse en FASE 1. Los nuevos usuarios se crean vía trigger.
-- Si hay datos reales, copiar de vokabellab_data_20260530_oneshot.sql y adaptar.
