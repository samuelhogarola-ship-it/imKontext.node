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

## 2026-10-27 local verification checkpoint

- User priority is documentation and verification before uploading. No new pushes, merges, remote SQL or deployments.
- Remote PR #78 closed unmerged; PR #80 still at ed1aad8, no Actions checks, CodeRabbit skipped its draft. The old #78 CI exception was `onAuthChange is not defined`; #79 already guards it.
- Corrected semantic dashboard translation keys and untranslated dynamic catalog controls; catalog/dashboard refresh on UI-language switches.
- Integrated-browser practice found the result summary still rendered German. A backward-compatible optional target-word accessor now renders the practiced language and preserves original fields/HTML escaping.
- RED→GREEN evidence: wrong dashboard labels in six UI languages; English catalog/switch; English result summary and Node result tests. Final Node 33/33 and functional browser 38/38 pass.
- Stable visual fixture restores the intended Climate word/options without changing product randomization. Dashboard visual now passes; five other macOS comparisons remain explicitly unresolved. No snapshots changed.
- Nine real local UI×learning combinations DE/EN/ES pass with native explanations, exact locale JSON content/term checks, canonical URLs and reload persistence; sibling progress/queues use the actual practiced text ID. Local HTTP 200 wrong-language negative control is rejected.
- Independent review found no product compatibility blocker and required strengthening the verifier's locale comparison; fixed and proved with the negative control. Database provenance is documented through exact launch configuration, not incorrectly inferred from browser request observation.
- Ruling: preserve the existing neutral badge/mobile header instead of restoring outdated reference styling; cost is a pending Linux visual signoff before publication.
- Ruling: leave CI changes local, including stacked-PR coverage and Node22/Ubuntu24.04 pinning; cost is that remote CI remains unverified until uploading is explicitly agreed.
- Full evidence, known localization gaps, source/PR identities and reproduction steps: `docs/multilingual-verification-2026-10-27.md` and the projectless outputs verification bundle.
