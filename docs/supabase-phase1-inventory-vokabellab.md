# Inventario Supabase — VokabelLab

## Identificacion

- Proyecto Supabase: VokabelLab
- URL: pendiente de documentar sin exponer secretos; proyecto enlazado localmente
- Entorno: app Node + Supabase CLI versionado
- Responsable: pendiente de completar
- Fecha: 2026-05-30

## Variables de entorno usadas

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- Otras: `APP_BASE_URL`, `ADMIN_APP_BASE_URL`, `PORT`, `NODE_ENV`

## Consumidores conocidos

- frontend publico: `app.js` consume `/api/resumen` y `/api/vocabulario`
- backend: [server.js](</Users/sam/Desktop/webs/LAB-WORLD/VokabelLab.node/server.js>)
- auth: usa Supabase Auth y trigger `handle_auth_user_created()`
- tareas internas: `supabase/migrations/*`, `supabase/seed.sql`, `tests/security/supabase-rls.integration.mjs`

## Tablas

| Tabla | Uso | Consumidor | Destino previsto | Observaciones |
| --- | --- | --- | --- | --- |
| `vocabulario` | catalogo de palabras de la app publica | `server.js` | probablemente reutilizar `imKontext` | la app publica hace `select` sobre `id,de,es,artikel,type,thema,thema_id` y `is_active` |
| `profiles` | perfil de usuario | auth + backend | comparar con candidato `user_profiles` | posible reutilizacion/renombrado conceptual |
| `apps_catalog` | catalogo de apps | backend + seed + RLS | comparar con candidato `app_catalog` | ya existe con shape real distinto al candidato inicial |
| `user_app_access` | acceso por app | RLS + backend | comparar con candidato `user_app_access` | ya existe en VokabelLab |
| `user_stats_snapshots` | snapshot remoto de stats | RLS + backend | comparar con candidato `user_stats_snapshots` | en VokabelLab es por `user_id` solo, sin `app_id` |
| `platform_roles` | roles de plataforma | RLS + auth | comparar con candidato `admin_roles` | nombre y shape distintos |

## Claves, indices y relaciones

- PK:
  - `profiles(id)`
  - `apps_catalog(id)`
  - `user_app_access(user_id, app_id)`
  - `user_stats_snapshots(user_id)`
  - `platform_roles(user_id, role, scope)`
- UNIQUE:
  - `apps_catalog.slug`
- FK:
  - `profiles.id -> auth.users.id`
  - `user_app_access.user_id -> profiles.id`
  - `user_app_access.app_id -> apps_catalog.id`
  - `user_stats_snapshots.user_id -> profiles.id`
  - `platform_roles.user_id -> profiles.id`
  - `platform_roles.granted_by -> profiles.id`
- indices:
  - `idx_user_app_access_user_id`
  - `idx_user_app_access_app_id`
  - `idx_platform_roles_user_scope`
  - `idx_apps_catalog_sort_order`

## RLS / Policies

- tablas con RLS:
  - `profiles`
  - `apps_catalog`
  - `user_app_access`
  - `user_stats_snapshots`
  - `platform_roles`
- policies por tabla:
  - `profiles_select_self`
  - `apps_catalog_select_public`
  - `user_app_access_select_self`
  - `user_stats_snapshots_select_self`
  - `user_stats_snapshots_insert_self`
  - `user_stats_snapshots_update_self`
- tablas publicas sin RLS:
  - `vocabulario` parece consumida publicamente, pero su RLS real queda pendiente de export remoto

## Views / Functions / RPC / Triggers

- views: no detectadas en la migracion principal inspeccionada
- functions / RPC:
  - `set_current_timestamp_updated_at()`
  - `handle_auth_user_created()`
  - `is_platform_admin()`
  - `update_my_profile(text, text)`
  - `get_my_platform_roles()`
- triggers:
  - `set_profiles_updated_at`
  - `set_apps_catalog_updated_at`
  - `set_user_app_access_updated_at`
  - `set_user_stats_snapshots_updated_at`
  - `on_auth_user_created`

## Buckets / Storage

- buckets: pendientes de export remoto
- uso por app: no visible en la migracion inspeccionada
- archivos criticos: pendiente

## Auth y acceso

- usa Supabase Auth: si
- tablas de perfil: `profiles`
- tablas de acceso/plan: `apps_catalog`, `user_app_access`, `platform_roles`
- tablas de progreso/stats: `user_stats_snapshots`

## Seeds / SQL existentes

- scripts:
  - `supabase/seed.sql`
  - `supabase/bootstrap-first-admin.sql.example`
- migraciones:
  - `20260425155036_fill_thema_vocabulario.sql`
  - `20260425155342_fill_thema_vocabulario.sql`
  - `20260426123000_import_vocabulario.sql`
  - `20260526120000_labworld_secure_platform.sql`
- datos manuales:
  - seed de `apps_catalog` con `vokabel-lab`, `der-die-das`, `imkontext`

## Mapeo preliminar a imKontext

- tablas que pueden reutilizar tablas canonicas de `imKontext`:
  - `vocabulario`
- tablas que requieren extension de `imKontext`:
  - posible absorcion de `apps_catalog`
  - posible absorcion de `profiles`
  - posible absorcion de `user_app_access`
  - posible absorcion de `user_stats_snapshots`
  - posible absorcion de `platform_roles`
- conceptos que parecen ausentes en `imKontext`:
  - catalogo de apps
  - perfiles de usuario
  - acceso por app
  - roles de plataforma
  - snapshots remotos de stats

## Riesgos

- dependencia de `service_role`: si, para backend/admin
- shape de respuestas que deba conservarse:
  - `/api/vocabulario` depende de `id,de,es,artikel,type,thema,thema_id`
  - existe filtro por `is_active`
- colisiones de IDs:
  - `apps_catalog.id` actual usa `vokabel-lab`, `der-die-das`, `imkontext`, no coincide con el naming previsto `vokabellab`
  - `user_stats_snapshots` actual no separa por `app_id`
