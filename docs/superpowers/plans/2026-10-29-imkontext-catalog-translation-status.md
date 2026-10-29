# ImKontext Catalog and Translation Status Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the existing English content visible and usable, isolate untranslated content for Claude, and improve the ImKontext landing, catalog, reading, exercise, navigation, and footer interfaces without publishing incomplete translations.

**Architecture:** Keep translation data read-only and additive: the client renders English rows only when the API provides them, while a generated internal report lists missing text/version/meaning/example fields. Refine the existing vanilla JS/CSS screens in focused changes; no database writes or production edits are part of this plan.

**Tech Stack:** Node.js, Express, vanilla JavaScript, CSS, Supabase REST reads, Node test runner, Playwright.

**Spec:** User-approved conversation requirements: show completed English translations; keep incomplete items as an internal pending-translation draft; improve catalog layout/categories; improve immersive reading and exercise stability; enlarge the fox/“Aprende idiomas” landing treatment; replace Dashboard with useful Panel/Menu navigation; retain methodology/contact/legal in a normal footer.

## Global Constraints

- Do not translate or invent missing content in this work; pending items remain isolated for Claude.
- Do not execute SQL, modify Supabase data, access Hostinger directly, or deploy manually.
- Do not merge PR #83 or expose incomplete translations publicly.
- All changes go through a feature branch, commit, push, and draft PR first.
- Existing English rows must remain unchanged; no destructive replacement or deletion.

## Review Focus

- A text with partial English rows must render only verified fields and show a pending state in the internal report — covered by the translation inventory tests.
- A catalog with many texts must not let the featured card hide the list — covered by catalog layout E2E.
- “Todas” and the visible category chips must preserve the full list and filtering — covered by catalog filter E2E.
- Answer feedback must not push “Siguiente” below the viewport — covered by exercise layout E2E at desktop and mobile widths.
- Missing auth callback helpers must not stop app startup — covered by the existing UI regression test.

### Task 1: Inventory completed and pending English content

**Files:**
- Create: `scripts/build-translation-status.mjs`
- Create: `docs/translation-status-2026-10-29.md`
- Test: `tests/translation-status.test.mjs`

**Interfaces:**
- Consumes: read-only exported source JSON under the local publication evidence directory.
- Produces: a deterministic Markdown report containing per-text, per-version, and per-meaning English status; no SQL.

- [ ] **Step 1: Write the failing inventory test** asserting the report separates complete English rows from missing `example`/translation fields and never emits SQL statements.
- [ ] **Step 2: Run `node --test tests/translation-status.test.mjs` and verify the expected failure.**
- [ ] **Step 3: Implement the inventory script** with stable ordering, explicit counts, IDs, and a “pending for Claude” section.
- [ ] **Step 4: Run the test and regenerate `docs/translation-status-2026-10-29.md`.**
- [ ] **Step 5: Commit** `docs: record English translation readiness`.

### Task 2: Render verified English content without publishing pending rows

**Files:**
- Modify: `server.js`
- Modify: `imKontext/app.js`
- Modify: `imKontext/practice.js`
- Test: `tests/translation-availability.test.mjs`
- Test: `e2e/languages.spec.js`

**Interfaces:**
- Consumes: the existing core vocabulary endpoint and localization fields.
- Produces: English UI/content selection that falls back only where the existing verified source permits it; incomplete rows are not treated as verified English.

- [ ] **Step 1: Write failing tests** for complete English rendering and incomplete-example exclusion.
- [ ] **Step 2: Run the focused tests and verify failure on the current branch.**
- [ ] **Step 3: Implement the smallest read-only availability guard and client rendering changes.**
- [ ] **Step 4: Run focused tests and the existing unit suite.**
- [ ] **Step 5: Commit** `fix: expose verified English content only`.

### Task 3: Compact catalog and category navigation

**Files:**
- Modify: `imKontext/index.html`
- Modify: `imKontext/app.js`
- Modify: `imKontext/styles.css`
- Test: `e2e/catalog-language.spec.js`

**Interfaces:**
- Consumes: existing `renderTextGrid`, category data, and localized UI strings.
- Produces: compact featured/list layout, 2–3 visible category chips, a working “Todas” selector, and no nonfunctional search control.

- [ ] **Step 1: Add failing desktop/mobile catalog E2E assertions** for visible list content and category selection.
- [ ] **Step 2: Run the focused E2E and verify the current layout fails the assertions.**
- [ ] **Step 3: Implement the compact grid, category selector, spacing, and search removal.**
- [ ] **Step 4: Run catalog E2E and visual snapshots without changing thresholds.**
- [ ] **Step 5: Commit** `fix: compact text catalog navigation`.

### Task 4: Immersive reading and stable exercise layout

**Files:**
- Modify: `imKontext/practice.js`
- Modify: `imKontext/styles.css`
- Modify: `imKontext/index.html`
- Test: `e2e/practice.spec.js`
- Test: `e2e/visual.spec.js`

**Interfaces:**
- Consumes: existing exercise state, feedback, and next-question handlers.
- Produces: fixed/stable exercise controls, feedback that does not displace “Siguiente”, and reading mode with the article and tapped word visually centered.

- [ ] **Step 1: Add failing mobile/desktop assertions** for control visibility after an answer and reading-mode layout.
- [ ] **Step 2: Run focused E2E and verify failure.**
- [ ] **Step 3: Implement the layout using reserved control space and stable scrolling.**
- [ ] **Step 4: Run focused E2E and visual tests.**
- [ ] **Step 5: Commit** `fix: stabilize reading and exercise controls`.

### Task 5: Landing, panel navigation, footer, and session controls

**Files:**
- Modify: `imKontext/index.html`
- Modify: `imKontext/app.js`
- Modify: `imKontext/styles.css`
- Test: `tests/navigation-labels.test.mjs`
- Test: `e2e/smoke.spec.js`

**Interfaces:**
- Consumes: existing dashboard/progress route and AuthCore sign-out capability.
- Produces: “Panel”/“Menú” navigation, visible restart/sign-out action when authenticated, enlarged fox/“Aprende idiomas” landing hierarchy, and a conventional footer with methodology/contact/legal.

- [ ] **Step 1: Write failing navigation and footer tests** for labels, links, and authenticated sign-out affordance.
- [ ] **Step 2: Run focused tests and verify failure.**
- [ ] **Step 3: Implement the navigation/footer/landing hierarchy without replacing the existing image asset.**
- [ ] **Step 4: Run navigation E2E, unit tests, and visual tests.**
- [ ] **Step 5: Commit** `feat: improve ImKontext navigation and landing`.

### Task 6: Final verification and draft PR

**Files:**
- Modify: `package.json` only if test commands need registration.
- Create: PR description and verification summary.

- [ ] **Step 1: Run `npm run test:unit`, full Playwright E2E, and `git diff --check`.**
- [ ] **Step 2: Review the diff for forbidden SQL/data/Hostinger changes.**
- [ ] **Step 3: Push the feature branch and open a draft PR.**
- [ ] **Step 4: Attach the PR and report the exact pending-translation document path.**

