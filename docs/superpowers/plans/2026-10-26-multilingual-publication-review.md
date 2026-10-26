# Multilingual publication review

**Goal:** Prepare the existing multilingual release for review and publication on the verified Hostinger Node website, preserving production fixes and German source data.
**Authority:** Existing approved additive-language spec and plan, plus the user's request to advance translations, the current landing and English/Spanish URLs. No new visual design.
**Isolation:** Dedicated local clone; branch `codex/multilang-publication-review` starts at PR #79 commit `4255692`. Other checkouts are untouched.

## Tasks

- [x] Identify production: Hostinger `imkontext.vokabellab.com`, Node 22 / Express / `server.js`, deployed commit `042c814` from `codex/umami-production-20261015`.
- [x] Compare PR dependencies: #79 includes functional UI from #78; the only newer #78 commit rewrites the German seed. Authentication #77 is separate and not required by the learning routes.
- [x] Rehearse schema plus all five imports twice, verify original hashes and catalog service; compare the source exports to live Supabase read-only.
- [x] Reproduce analytics regression with the production regression tests; preserve the exact deployed compatibility loader and singleton guard. Before: two tests fail. After: both pass.
- [x] Remove the orphan sign-in controls imported by #78 without authentication scripts. Prove the unavailable action is hidden, while the language menu works; leave functional auth integration to #77.
- [x] Verify complete real local DB → API → landing → reading → practice → progress flows, desktop/mobile and existing regression suite.
- [x] Prepare exact SQL files, checksums, preflight/postflight validation, independent review, draft PR #80 and publication/rollback instructions.
- [x] Resolve late runtime audit findings in body-parser/proxy-addr/qs; audit now reports zero, 30 Node tests and 25 browser flows pass again, and dependency-only independent review finds no blocker.
- [ ] Obtain final production approval, then execute only additive SQL and publish the reviewed Node release; verify actual localized content and German compatibility live.

## Rulings

- Preserve the deployed Umami fix explicitly: it is absent from main and the multilingual branches; deploying those branches as-is would restore Google Analytics. Cost if omitted: regression in production tracking behavior.
- Do not merge the newer seed rewrite or run either German seed. Localization uses guarded additive imports only. Cost if wrong: the unrelated new German seed remains pending.
- Keep the current landing layout and target-language menu. Its title/SEO already adapt to `/en/` and `/es/`; verify them rather than introducing another design.
- Keep authentication separate. The partial header markup currently exposes a button with no handler; remove that unavailable action in this release. Cost: sign-in awaits the separately reviewed #77.
- Production is not main and auto-deploy tracks a different branch. A GitHub merge by itself cannot prove publication; preserve current environment variables and use the exact reviewed commit for the explicit Hostinger deployment.
- Pin the patched qs version through an npm override because Express constrains its dependency to a vulnerable minor branch. Cost: retain this explicit override until an Express update admits the patched parser; no major framework upgrade is needed.
