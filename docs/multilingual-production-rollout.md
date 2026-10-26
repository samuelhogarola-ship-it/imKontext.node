# Multilingual rollout on the current Node website

The live website is `https://imkontext.vokabellab.com/` on Hostinger, not the archived Vercel app. Read-only verification on 2026-10-26 identified Node 22, Express, `server.js`, repository `samuelhogarola-ship-it/imKontext.node`, deployed commit `042c8147f416dfab379e255f4ea35629bba9ac5f`. Auto-deployment currently follows `codex/umami-production-20261015`; merging main does not publish this website.

## Reviewed release

This release is stacked on #79 (`4255692`) and contains its functional #78 UI base (`eda8509`). The later #78 commit only rewrites the German seed and is not required for localization. Neither German seed may be executed in this rollout.

Production's Umami compatibility fix is preserved here, with regression coverage for cached pages, consent callbacks and repeated script loads. The orphan sign-in markup from #78 is removed: #77 owns the working authentication integration and remains separate. This release retains anonymous learning and existing premium behavior; it makes no authentication or entitlement changes.

The release also resolves the runtime audit findings in body-parser (1.20.9), proxy-addr (2.0.8) and qs (6.16.1). The explicit qs override is necessary because Express 4.22.1 otherwise constrains its parser to vulnerable `~6.14.0`. Keep the override until Express permits a patched version. Fresh npm installation/audit reports zero vulnerabilities; the dependency tree and API query parsing were independently checked. No Express major-version upgrade is included.

## Before any production write

1. Review the complete app delta against the deployed commit, including the multilingual PRs, and record the exact approved release SHA.
2. Verify Hostinger still points to this domain and repository and that the production SHA/settings above have not changed. Preserve all current environment variables; do not replace masked values.
3. Re-fetch the public source rows from Supabase project `fvhxbbhxucwawypfzikf`, compare to the reviewed snapshot and rerun the disposable database rehearsal. The 2026-10-26 comparison matched 29 texts, 116 versions, 1,407 vocabulary links, 3,896 meanings and 1,807 legacy vocabulary rows.
4. Verify the SQL bundle checksums. Save a current recoverable database backup through the existing project backup procedure. Run `00_before.sql` and retain its counts/hashes. Approval must cover the exact additive SQL and this website's deployment.

## Ordered production procedure

1. Execute only `01_schema.sql`, then `02_import_es.sql` through `06_import_pt.sql`, on the verified Supabase project. Each import is transactional, guarded against source drift and repeatable; it never overwrites existing localizations. Stop on any guard failure and review the new source. Do not run the legacy German seed or unrelated schema-consolidation scripts.
2. Run `07_after.sql`. Original counts/hashes must exactly match `00_before.sql`. Each locale should contain 29 titles, 116 versions and 1,261 meanings. Four translated source texts lack source vocabulary and correctly remain absent from new catalogs.
3. Deploy the exact approved app SHA to `imkontext.vokabellab.com`, using Node 22 / Express / `server.js`, no build command, with the current environment retained. A branch used for Git deployment must resolve to that SHA immediately before deployment. Do not change DNS, domains, plans or the unrelated Vercel project.
4. Inspect Hostinger deployment completion and verify its source commit. Do not claim success from a queued response or HTML status 200.
5. Verify `/api/learning-languages` returns JSON with available locales and `/api/texts?lang=en&native=es` and `/api/texts?lang=es&native=de` return localized titles and levels. Open a returned text/version and verify localized content, vocabulary, examples, appropriate exercise types and isolated progress.
6. Check `/en/`, `/en/textos`, `/es/`, `/es/textos` and the corresponding shared detail URLs with `?nivel=B1`. Check FI/IT/PT similarly. Interface language and learning language remain independent; the user can choose both in the existing language menu.
7. Verify default German `/textos`, a known shared German URL and default API responses retain their previous behavior. Verify actual browser requests load only one Umami tracker and never Google Analytics, including `/legal` and `/metodologia`.

## Rollback

If localized data or app verification fails, stop rollout. Already committed imports are additive and can remain. Redeploy the recorded previous production commit `042c8147f416dfab379e255f4ea35629bba9ac5f` with its existing settings/environment. Confirm deployment completion and German learning. Do not drop localization tables or restore/overwrite German data. Leave auto-deployment on the previous branch unless an explicit switch is included in the approved publication.

## Current status

Prepared and independently reviewed in draft PR #80, stacked on #79. Fresh validation: 30 Node tests and 25 functional browser flows pass; all five real local database flows and EN/ES mobile views pass. The visual suite retains its six pre-existing failing cases (three other cases pass). Of the six, three screenshots match archived base hashes exactly; the mobile landing changes by one pixel after removing the unused auth header, and two feedback screens differ in shuffled vocabulary choices with identical dimensions/layout. Baselines were not replaced. These snapshot differences are documented rather than represented as a green visual suite.

No production database writes, Hostinger deployments, auto-deployment changes, merges or DNS changes have been performed by this review.
