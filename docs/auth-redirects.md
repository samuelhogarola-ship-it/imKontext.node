# ImKontext authentication redirects

ImKontext accepts authentication returns only on its own production hosts or on local development hosts. The frontend rejects execution from any copied or unexpected origin, including Samuel Coach.

The shared Supabase Auth project must include these exact entries under **Authentication → URL Configuration → Redirect URLs** before this branch is deployed:

- `https://www.imkontext.vokabellab.com/**`
- `https://imkontext.vokabellab.com/**` only while the apex subdomain is served
- `http://localhost:3000/**` for local development
- `http://127.0.0.1:3000/**` for local development

Do not set Samuel Coach as an ImKontext callback. The Supabase **Site URL** may remain the platform fallback, but every ImKontext environment must have its own callback explicitly allowlisted; otherwise Supabase can fall back to the Site URL instead of the requested destination.

Deployment gate:

1. Confirm the production ImKontext URL is in the Supabase redirect allowlist.
2. Open a private browser window on ImKontext.
3. Start Google authentication.
4. Confirm the provider returns to the same ImKontext origin and `/dashboard`.
5. Repeat for magic-link access.
6. Confirm a crafted Samuel Coach or protocol-relative return is rejected.

The app intentionally removes provider query parameters and URL fragments from the remembered post-auth destination so authorization codes and access tokens cannot be replayed in a later redirect.
