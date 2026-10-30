# Reversible Test Direction Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let an imKontext learner reverse the Test exercise between target-language → interface-language and interface-language → target-language with one obvious, persistent direction button.

**Architecture:** Keep the existing Test builder and multilingual accessors. Add one session-level direction state, default it to reverse for every newly started text/level exercise, store the direction used in each answered question, and render a single flag/name/arrow button from `LANG_NAMES`, `getTargetLang()`, and `getUILang()`.

**Tech Stack:** Vanilla JavaScript, HTML/CSS, existing imKontext i18n helpers, Node.js built-in tests, Playwright.

**Spec:** User request from 2026-10-29/30: the Test must support both directions for every configured target/interface-language pair; a new topic starts with the interface-language prompt and target-language answers; the selected direction remains fixed until the learner explicitly presses the direction button, including when repeating the exercise.

## Global Constraints

- Change only imKontext; do not modify Vokabel Lab or der die das.
- Apply the direction control only to the `test` mode and its existing fallbacks; do not change flashcards, ordering, articles, or cloze behavior.
- A new `startPractice()` session defaults to reverse; result-screen repeat and error review preserve the current direction.
- Never alternate direction automatically between questions.
- Use the existing multilingual vocabulary accessors and `LANG_NAMES`; do not hard-code German, Spanish, English, or Finnish.
- Do not modify translation data, Supabase, routing, hosting, or production.
- Implement on a dedicated feature branch and open a PR; do not merge or deploy without a separate request.

## Review Focus

- Navigating back to an already answered Test question must restore the prompt, options, selected answer, and correction in the direction originally used — covered by the Test direction Playwright flow.
- Changing the direction on an unanswered question must rebuild that question without incrementing score or progress — covered by the Test direction Playwright flow.
- Repeating from the result screen must keep the learner's last explicit direction, while starting a genuinely new text/level session resets to reverse — covered by the session persistence Playwright flow.
- Target and interface languages may be any supported pair; labels, flags, prompts, and answers must follow the current pair without hard-coded language names — covered with Spanish/German and English/German browser cases plus source-contract assertions.
- If target and interface language are identical, the direction control must be hidden or disabled and the Test must remain answerable without blank/duplicate direction labels — covered by a same-language browser case.

---

### Task 1: Direction-aware Test state and answer generation

**Files:**
- Modify: `imKontext/practice.js` (session state, Test prompt/options, answered-question restoration)
- Test: `tests/test-direction-toggle.test.mjs`
- Modify: `package.json` (register the focused unit/contract test in `test:unit`)

**Interfaces:**
- Consumes: `getTargetWord(word)`, `getNativeWord(word)`, `getTargetWordCol()`, `getNativeWordCol()`, `getTargetLang()`, `getUILang()`, `getRandomWrong(word, pool, 3)`.
- Produces: `testDirection` (`'forward' | 'reverse'`), `getTestDirectionData(word, direction)`, `getTestDirectionForQuestion(index)`, and `setTestDirection(direction)`.
- `getTestDirectionData` returns `{ direction, prompt, answer, answerColumn, promptLang, answerLang }`; forward means target prompt/native answer and reverse means native prompt/target answer.

- [ ] **Step 1: Write the failing focused test** asserting the new direction state defaults to `'reverse'`, `startPractice()` resets a new session to reverse, result repeat does not reset it, `buildQuestionState()` stores `testDirection`, and `buildTest()` maps prompt/answer/option columns through the dynamic accessors in both directions.
- [ ] **Step 2: Run `node --test tests/test-direction-toggle.test.mjs` and verify it fails** because the direction state and helpers do not exist.
- [ ] **Step 3: Implement the direction model in `practice.js`** with the exact interfaces above; use an answered question's stored direction when rebuilding it, otherwise use the session direction.
- [ ] **Step 4: Make `buildTest(word)` direction-aware** by mapping distractors through `answerColumn`, filtering empty/duplicate values, and recording `testDirection` plus direction-correct feedback/reveal data in the question state.
- [ ] **Step 5: Run the focused test and `npm run test:unit`; expect all tests to pass.**
- [ ] **Step 6: Commit** with `feat: add reversible test direction state`.

### Task 2: Visible multilingual direction button

**Files:**
- Modify: `imKontext/index.html` (one Test direction button near `#tipo-badge`)
- Modify: `imKontext/styles.css` (responsive, obvious two-state control)
- Modify: `imKontext/i18n.js` (localized accessible action/status copy)
- Modify: `imKontext/practice.js` (render/toggle/disable behavior)
- Test: `tests/test-direction-toggle.test.mjs`

**Interfaces:**
- Consumes: Task 1's `testDirection`, `getTestDirectionForQuestion(index)`, `setTestDirection(direction)`, plus `LANG_NAMES`, `getTargetLang()`, and `getUILang()`.
- Produces: `renderTestDirectionToggle(direction, answered)` and the `#test-direction-toggle` control displaying `flag + language name → flag + language name`.

- [ ] **Step 1: Extend the failing focused test** to assert one button with `id="test-direction-toggle"`, dynamic `LANG_NAMES` labels/flags, localized `aria-label`/title copy, and styles for desktop/mobile focus and disabled states.
- [ ] **Step 2: Run the focused test and verify the new UI assertions fail.**
- [ ] **Step 3: Add the button and localized copy**; hide it outside Test questions and when `getTargetLang() === getUILang()`.
- [ ] **Step 4: Implement `renderTestDirectionToggle(direction, answered)`** so pressing an unanswered question reverses the session direction and rebuilds only the current question; disable it once that question is answered and restore its stored direction when navigating back.
- [ ] **Step 5: Run the focused test and `npm run test:unit`; expect all tests to pass.**
- [ ] **Step 6: Commit** with `feat: add multilingual test direction control`.

### Task 3: Browser verification and PR handoff

**Files:**
- Modify: `e2e/practice.spec.js` (direction, restoration, repeat, new-session, and same-language flows)
- Modify: `e2e/visual.spec.js` (Test direction control visual coverage)
- Update: only Test exercise visual snapshots affected by the new control

**Interfaces:**
- Consumes: `#test-direction-toggle`, existing mocked multilingual vocabulary, `#pregunta-texto`, `.opcion`, result repeat, previous/next navigation.
- Produces: browser evidence that direction behavior is stable across session navigation and supported language pairs.

- [ ] **Step 1: Add failing Playwright cases** that select only Test mode and prove the default question is native/interface language with target-language options, one click reverses it, the selection persists across later questions and result repeat, an answered question restores its original direction, a new text/level session resets to reverse, Spanish/German and English/German labels use the correct flags/names, and a same-language pair stays usable without an active toggle.
- [ ] **Step 2: Run the focused Playwright cases with `npx playwright test e2e/practice.spec.js --workers=1`; verify the new cases fail before any test-only adjustment.**
- [ ] **Step 3: Fix only defects exposed by those cases** in the files owned by Tasks 1–2; do not broaden the feature to other exercise modes.
- [ ] **Step 4: Run `npm run test:unit`, `npx playwright test --workers=1`, and `git diff --check`; expect all checks to pass.**
- [ ] **Step 5: Review the diff** for hard-coded languages, translation-data changes, routing changes, and accidental changes outside imKontext.
- [ ] **Step 6: Push the implementation branch and open a PR against `main`; report the PR and verification results without merging or deploying.**
