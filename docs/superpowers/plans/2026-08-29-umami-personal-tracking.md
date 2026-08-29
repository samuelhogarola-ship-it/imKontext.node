# imKontext Personal Umami Tracking Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Measure every active imKontext page in the personal Umami instance without cookies.

**Architecture:** The five HTML entries under `imKontext/` load one local bootstrap directly. The bootstrap fetches a same-origin JSON configuration and injects the personal Umami tracker only when the fixed host and public website ID validate.

**Tech Stack:** Static frontend served by Express, browser JavaScript, JSON, Node.js built-in test runner.

**Spec:** https://github.com/samuelhogarola-ship-it/webfuengirola/blob/main/docs/superpowers/specs/2026-08-29-umami-all-panels-design.md

## Global Constraints

- Use only `https://analytics.187.124.55.36.sslip.io`.
- Umami remains independent from GA consent and stores no cookies.
- Missing or malformed configuration fails closed.
- Cover all five active HTML entries without changing routing, API, paywall, or UI.
- Keep the change in a dedicated feature branch and PR.

---

### Task 1: Direct static-entry Umami coverage

**Files:**
- Create: `imKontext/shared/umami-analytics.js`
- Create: `imKontext/umami-config.json`
- Create: `e2e/umami-analytics.test.mjs`
- Modify: all five `imKontext/*.html` files

**Interfaces:**
- Consumes: `GET /umami-config.json` with `{ hostUrl: string, websiteId: string }`.
- Produces: `window.ImKontextUmami.init()` and one tracker script.

- [x] **Step 1: Write the failing test**

```js
assert.equal(htmlFiles.length, 5);
assert.deepEqual(htmlWithoutBootstrap, []);
assert.equal(tracker.src, "https://analytics.187.124.55.36.sslip.io/script.js");
```

- [x] **Step 2: Run test to verify it fails**

Run: `node --test e2e/umami-analytics.test.mjs`

Expected: FAIL because the bootstrap and HTML references do not exist.

- [x] **Step 3: Implement the bootstrap and insert it once per HTML entry**

```js
const tracker = document.createElement("script");
tracker.defer = true;
tracker.dataset.hostUrl = PERSONAL_HOST;
tracker.dataset.websiteId = websiteId;
tracker.src = `${PERSONAL_HOST}/script.js`;
document.head.appendChild(tracker);
```

Insert `<script defer src="/shared/umami-analytics.js"></script>` immediately before `</head>` in each active HTML file.

- [x] **Step 4: Run verification**

Run: `node --test e2e/umami-analytics.test.mjs`

Run: `node --check imKontext/shared/umami-analytics.js`

Expected: both checks PASS.

- [x] **Step 5: Commit**

```bash
git add imKontext e2e/umami-analytics.test.mjs docs/superpowers/plans/2026-08-29-umami-personal-tracking.md
git commit -m "feat: add personal Umami tracking"
```
