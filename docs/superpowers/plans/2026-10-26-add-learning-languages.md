# Add Learning Languages Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: superpowers:executing-plans. Execute continuously; the user approved the additive design and said “sigue”.

**Goal:** Add ES/EN/FI/IT/PT learning content and exercises while preserving all existing German records and default behavior.
**Architecture:** Add localization records linked to existing text/version/meaning IDs. Register localized API branches ahead of the unchanged German handlers. Reuse i18n and the practice engine, with language-specific grammar and progress namespaces.
**Tech Stack:** PostgreSQL/Supabase, Node/Express, existing browser JS; Node tests, existing Playwright suite, database rehearsal.
**Spec:** `../specs/2026-10-26-add-learning-languages.md` (approved).

## Global Constraints
- Never update/delete existing German rows, IDs, contents, constraints, policies, or vocabulary links.
- Preserve `/textos/:slug?nivel=...`, default API payloads and old German progress keys.
- Only new locales `es,en,fi,it,pt`; German remains default. No silent German fallback for missing translations.
- Keep `sql/seed-50-texts.sql` byte-identical. No RLS changes on existing tables.
- Work in this isolated clone, on `feature/add-learning-languages`, separate from Claude's checkout.

## Review Focus
- Missing translations and same native/target language cannot produce blank or self-translated exercises.
- Finnish Unicode and lack of articles must not use German article/word-boundary rules.
- Race conditions while switching languages cannot display an earlier language's response.
- A shared link must resolve its language independently of localStorage; German links remain German.
- Reruns and source changes cannot overwrite German data or duplicate localizations.

## Task 1: Data contract and migration
**Create:** `backend/sql/011_add_content_localizations.sql`, `scripts/build-language-import.mjs`, `tests/localization-data.test.mjs`.
**Interfaces:** localized text `{text_id,language,title,slug,topic}`; version `{text_version_id,language,content}`; meaning `{meaning_id,language,term,example,article,word_type,plural_form,infinitive,past_simple,past_participle}`.
- [x] Write failing tests for invalid locales, missing source IDs, duplicates, original preservation and deterministic/idempotent import.
- [x] Implement three new tables `imk_text_localizations`, `imk_version_localizations`, `imk_meaning_localizations`; RLS only on new tables mirrors parent visibility.
- [x] Import only new records, through an atomic script with source IDs and explicit locale checks. Verify tests and SQL against real PostgreSQL-compatible execution.

## Task 2: Localized API
**Create:** `server/localized-routes.js`, `tests/localized-api.test.mjs`. **Modify:** `server.js` (registration only).
**Interface:** optional `lang` on existing API paths; absent/`de` calls existing handlers; invalid locale → 400. Localized catalog includes only complete available versions with vocabulary; empty locale → empty catalog.
- [x] Test default German bypass, ES/EN/FI/IT/PT payload mapping, missing content, unsupported language, upstream failure and text/version identity validation.
- [x] Register localized branches and availability endpoint without changing German handler bodies. Reuse existing core vocabulary and overlay new translations by canonical meaning IDs.
- [x] Verify Node tests.

## Task 3: Learning selector, navigation, progress and exercises
**Modify:** `imKontext/i18n.js`, `imKontext/index.html`, `imKontext/app.js`, `imKontext/practice.js`, `imKontext/shared/practice-core.js`, minimal selector styles.
**Test:** `tests/language-state.test.mjs`, `e2e/languages.spec.js`, existing e2e fixtures/helpers only where necessary.
- [x] Write failing tests for old German keys/URLs, isolated non-German progress, direct multilingual links, empty language, rapid switching, Unicode and non-German article options.
- [x] Add target/native selectors, language-aware API URLs and routing, reset only transient session state on switches, filter dashboard/reset to current language.
- [x] Offer article mode only when supported by the target metadata; use target-aware vocabulary highlighting and blanks.
- [x] Run Node tests and full existing browser regression suite; preserve German flow.

## Task 4: Content and end-to-end integration
**Create:** reviewed locale JSON files under `data/localizations/`, build output under projectless `outputs/`.
- [x] Export existing source texts/versions/core vocabulary read-only and record checksums.
- [x] Translate existing title/content/linked vocabulary into five new languages; preserve CEFR level and facts. Reuse existing Spanish word translations. Validate every source ID and ensure no German text is relabelled as a translation.
- [x] Rehearse migration/import and rerun against a disposable database; assert original German fixture rows unchanged and localized catalog usable.
- [x] Verify real UI → API → localized content → vocabulary → exercise → isolated progress for all five locales.
- [ ] Fresh whole-branch review completed and findings fixed; commit and create/attach dedicated PR pending.
- [ ] Migration/import and evidence prepared; final production rollout approval pending. No production writes or publish.

## Verification notes

- Node:28/28 pass. Functional browser flows:24/24 pass, including final SEO regression.
- Full suite retains6 existing visual snapshot failures; each actual screenshot is byte-identical to archived base eda8509 with the optional auth callback stub. No snapshots or German styles changed.
- Five locale imports rehearse twice against actual read-only source exports, preserving every original row hash; actual browser→API→local DB→practice→progress passes for all five.
- Source vocabulary exists for25/29 texts and100/116 versions; all29/116 are translated, incomplete source texts remain hidden in new catalogs.
- Reviewed original seed checksum remains8776bd4355a4981944b3d0a5db0b1aa90c2da3bac9ecac87af1d80ba1a3b963d. Claude's independent seed rewrite is parked, not executed.
