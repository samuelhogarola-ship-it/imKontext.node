# Language Routes and Fox Landing Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add shareable target-language routes and a more immersive fox-led landing with separate sign-in and start actions.

**Architecture:** Keep the existing vanilla SPA and its independent `uiLang`/`targetLang` state. Resolve a language prefix before the current client router renders, preserve that prefix through text, exercise and dashboard routes, and keep the existing server catch-all. Reuse the existing panoramic fox/logo asset through a focused crop instead of adding a new image dependency.

**Tech Stack:** Express static fallback, vanilla JavaScript, HTML/CSS, Node built-in tests, Playwright E2E/visual tests.

**Spec:** `docs/superpowers/specs/2026-10-29-language-routes-fox-landing-design.md`

## Global Constraints

- The language route changes only `targetLang`; the UI language remains Spanish by default and respects the existing UI preference.
- Canonical slugs are ASCII: `/english`, `/suomi`, `/espanol`, `/deutsch`, `/italiano`, `/portugues`; visible aliases such as `/English` and `/Español` are accepted.
- Existing routes (`/`, `/textos`, `/textos/:slug`, `/dashboard`) must continue to work.
- Do not modify translation/catalog data, SQL, Supabase records, or add A1 in this feature.
- The landing CTA copy is infinitive and split into `Iniciar sesión` and `Empezar ahora`.

## Review Focus

- A language route must not overwrite a previously selected UI language — test route initialization with `uiLang=es` and target `en`.
- A route alias with accents/case must resolve without 404 — test `/Español` and `/Suomi`.
- Back/forward navigation must preserve the target-language prefix — test landing → texts → back.
- Login must use the existing AuthCore flow rather than a duplicate auth implementation — test the landing login action forwards to `#auth-header-btn`.
- The fox crop must remain legible on mobile and desktop — update only the affected visual baselines and run the full visual suite.

### Task 1: Route-language resolver

**Files:**
- Modify: `imKontext/app.js` (route helpers and init/popstate handling)
- Test: `tests/language-routes.test.mjs`
- Modify: `package.json` (include the new unit test)

**Interfaces:**
- Produces `LANGUAGE_ROUTE_MAP`, `resolveLanguageRoute(pathname)`, `languagePathPrefix()`, and `withLanguagePath(pathname)` for the router and navigation helpers.
- `resolveLanguageRoute` returns `{ targetLang, canonicalPath, isAlias }` or `null`.

- [ ] **Step 1: Write the failing tests** for canonical slugs, aliases, invalid paths, and preserving `targetLang` separately from `uiLang`.
- [ ] **Step 2: Run `node --test tests/language-routes.test.mjs` and verify it fails** because the resolver is not present.
- [ ] **Step 3: Implement the resolver and route initialization** in `app.js`; initialize `targetLang` from the route before landing metadata/rendering and canonicalize aliases with `history.replaceState`.
- [ ] **Step 4: Update navigation helpers** so `/textos`, `/textos/:slug`, and `/dashboard` retain the active language prefix while root behavior remains backward-compatible.
- [ ] **Step 5: Run the focused test and commit** with `feat: add target language routes`.

### Task 2: Language-world selector and landing actions

**Files:**
- Modify: `imKontext/index.html` (landing selector and CTA markup)
- Modify: `imKontext/app.js` (selector/action handlers)
- Modify: `imKontext/i18n.js` (landing action/selector labels where needed)
- Modify: `imKontext/styles.css` (compact CTA and selector layout)
- Test: `tests/landing-language-actions.test.mjs`

**Interfaces:**
- Consumes `resolveLanguageRoute`, `withLanguagePath`, `setTargetLang`, `getUILang`, and the existing `auth-header-btn`.
- Produces a six-language landing selector whose links point at canonical target-language routes and two buttons: `#btn-login` and `#btn-entrar`.

- [ ] **Step 1: Write failing tests** asserting six target links, separate infinitive CTA labels, login forwarding to `auth-header-btn`, and start navigation to the prefixed text route.
- [ ] **Step 2: Run the focused test and verify it fails.**
- [ ] **Step 3: Replace the single CTA markup** with compact `Iniciar sesión` and `Empezar ahora` buttons; wire login to the existing AuthCore header action and start to the current text selection flow.
- [ ] **Step 4: Add the language-world selector** using native names and canonical routes; selecting a language updates `targetLang` and navigates without changing `uiLang`.
- [ ] **Step 5: Run the focused unit test and commit** with `feat: add language world landing actions`.

### Task 3: Fox-led visual hierarchy

**Files:**
- Modify: `imKontext/index.html` (fox/brand composition)
- Modify: `imKontext/styles.css` (desktop/mobile crop, sizing, CTA spacing)
- Modify: `tests/catalog-layout.test.mjs` or `tests/landing-language-actions.test.mjs` (structural assertions)
- Update: `e2e/visual.spec.js-snapshots/home-desktop-chromium.png`
- Update: `e2e/visual.spec.js-snapshots/home-mobile-chromium.png`

**Interfaces:**
- Keeps `/landing.logo2.webp` and `/landing.logo2.png` as the source asset.
- Produces a responsive fox-first block with readable imKontext branding and compact actions at desktop and mobile widths.

- [ ] **Step 1: Add a failing structural assertion** for the fox-first wrapper, separate brand label, and two CTA buttons.
- [ ] **Step 2: Implement the crop/layout** with `object-fit`/positioning or an equivalent CSS wrapper, preserving accessible alt text and avoiding a new image asset.
- [ ] **Step 3: Run focused structural tests and the landing visual tests; update only the two affected baselines.**
- [ ] **Step 4: Commit** with `style: make fox the landing focal point`.

### Task 4: Full verification and PR

**Files:**
- Modify: `package.json` only if test scripts need wiring
- No production data or hosting files

- [ ] **Step 1: Run `npm run test:unit`.**
- [ ] **Step 2: Run `npx playwright test --workers=1` and confirm all tests pass.**
- [ ] **Step 3: Run `git diff --check` and inspect the full diff for route-prefix, auth, and translation-data regressions.**
- [ ] **Step 4: Push `feature/language-routes-fox-landing` and open a draft PR against `main`.**
- [ ] **Step 5: Report the PR URL and verification results; do not merge or deploy until the user requests it.**

