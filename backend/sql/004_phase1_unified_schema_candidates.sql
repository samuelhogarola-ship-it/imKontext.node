-- ============================================================
-- FASE 1 — Tablas candidatas para Supabase unificado
-- IMPORTANTE:
-- - No ejecutar este archivo a ciegas.
-- - Validar primero el inventario real de imKontext, VokabelLab y Rivaz.
-- - Antes de crear cualquier tabla nueva, comprobar si el concepto ya existe
--   en imKontext y puede reutilizarse o extenderse.
-- - Hallazgo ya confirmado:
--   VokabelLab usa actualmente `profiles`, `apps_catalog`, `user_app_access`,
--   `user_stats_snapshots` y `platform_roles`.
--   Por tanto, estos nombres candidatos NO estan aprobados automaticamente.
-- ============================================================

-- ------------------------------------------------------------
-- Candidatas previstas, pendientes de validacion:
-- - app_catalog
-- - user_profiles
-- - user_app_access
-- - user_stats_snapshots
-- - admin_roles
-- - admin_audit_log
-- ------------------------------------------------------------

-- 0. Guardrail: abortar si ya existe cualquiera de las tablas candidatas.
do $$
declare
  existing_tables text[];
begin
  select array_agg(table_name order by table_name)
  into existing_tables
  from information_schema.tables
  where table_schema = 'public'
    and table_name in (
      'app_catalog',
      'user_profiles',
      'user_app_access',
      'user_stats_snapshots',
      'admin_roles',
      'admin_audit_log'
    );

  if existing_tables is not null then
    raise exception
      'Abortado: ya existen tablas candidatas en public: %. Reutiliza o extiende primero lo existente.',
      array_to_string(existing_tables, ', ');
  end if;
end
$$;

-- 1. app_catalog
create table if not exists public.app_catalog (
  id text primary key,
  slug text not null unique,
  name text not null,
  description text,
  status text not null default 'active',
  visibility text not null default 'public',
  sort_order integer not null default 0,
  launch_url text,
  icon_key text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (id in ('imkontext', 'vokabellab', 'rivaz')),
  check (visibility in ('public', 'private', 'hidden'))
);

create index if not exists app_catalog_status_idx on public.app_catalog (status);
create index if not exists app_catalog_visibility_idx on public.app_catalog (visibility);

-- 2. user_profiles
create table if not exists public.user_profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  email text,
  display_name text,
  avatar_url text,
  account_type text not null default 'free',
  plan_code text not null default 'free',
  entitlements jsonb not null default '{}'::jsonb,
  feature_flags jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- 3. user_app_access
create table if not exists public.user_app_access (
  user_id uuid not null references auth.users (id) on delete cascade,
  app_id text not null references public.app_catalog (id) on delete cascade,
  role text not null default 'user',
  access_state text not null default 'active',
  granted_at timestamptz not null default now(),
  entitlements jsonb not null default '{}'::jsonb,
  feature_flags jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (user_id, app_id),
  check (access_state in ('active', 'restricted', 'blocked', 'suspended'))
);

create index if not exists user_app_access_app_idx on public.user_app_access (app_id);

-- 4. user_stats_snapshots
create table if not exists public.user_stats_snapshots (
  user_id uuid not null references auth.users (id) on delete cascade,
  app_id text not null references public.app_catalog (id) on delete cascade,
  snapshot jsonb not null,
  schema_version integer not null default 1,
  updated_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  primary key (user_id, app_id)
);

create index if not exists user_stats_snapshots_updated_idx
  on public.user_stats_snapshots (updated_at desc);

-- 5. admin_roles
create table if not exists public.admin_roles (
  user_id uuid not null references auth.users (id) on delete cascade,
  role text not null,
  scope text not null default 'global',
  created_at timestamptz not null default now(),
  primary key (user_id, role, scope)
);

-- 6. admin_audit_log
create table if not exists public.admin_audit_log (
  id bigserial primary key,
  actor_user_id uuid references auth.users (id) on delete set null,
  action text not null,
  target_type text not null,
  target_id text,
  app_id text references public.app_catalog (id) on delete set null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists admin_audit_log_actor_idx on public.admin_audit_log (actor_user_id);
create index if not exists admin_audit_log_app_idx on public.admin_audit_log (app_id);
create index if not exists admin_audit_log_created_idx on public.admin_audit_log (created_at desc);

-- 7. Seed minimo de apps
insert into public.app_catalog (id, slug, name, status, visibility, sort_order)
values
  ('imkontext', 'imkontext', 'imKontext', 'active', 'public', 10),
  ('vokabellab', 'vokabellab', 'VokabelLab', 'active', 'public', 20),
  ('rivaz', 'rivaz', 'Rivaz', 'active', 'private', 30)
on conflict (id) do update set
  slug = excluded.slug,
  name = excluded.name,
  status = excluded.status,
  visibility = excluded.visibility,
  sort_order = excluded.sort_order,
  updated_at = now();

-- 8. RLS base
alter table public.user_profiles enable row level security;
alter table public.user_app_access enable row level security;
alter table public.user_stats_snapshots enable row level security;
alter table public.admin_roles enable row level security;
alter table public.admin_audit_log enable row level security;

-- 9. Policies base de usuario
create policy user_profiles_select_own
on public.user_profiles
for select
to authenticated
using (auth.uid() = id);

create policy user_profiles_update_own
on public.user_profiles
for update
to authenticated
using (auth.uid() = id)
with check (auth.uid() = id);

create policy user_app_access_select_own
on public.user_app_access
for select
to authenticated
using (auth.uid() = user_id);

create policy user_stats_snapshots_select_own
on public.user_stats_snapshots
for select
to authenticated
using (auth.uid() = user_id);

create policy user_stats_snapshots_insert_own
on public.user_stats_snapshots
for insert
to authenticated
with check (auth.uid() = user_id);

create policy user_stats_snapshots_update_own
on public.user_stats_snapshots
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- 10. Policies admin minimas
create policy admin_roles_select_admin_only
on public.admin_roles
for select
to authenticated
using (
  exists (
    select 1
    from public.admin_roles ar
    where ar.user_id = auth.uid()
      and ar.scope = 'global'
  )
);

create policy admin_audit_log_select_admin_only
on public.admin_audit_log
for select
to authenticated
using (
  exists (
    select 1
    from public.admin_roles ar
    where ar.user_id = auth.uid()
      and ar.scope = 'global'
  )
);

-- Nota:
-- Si este archivo se adopta finalmente, convendra convertir las policies
-- en create policy condicional via scripts separados, porque Postgres no
-- soporta "if not exists" en create policy.
