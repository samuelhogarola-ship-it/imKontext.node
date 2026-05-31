-- ============================================================
-- FASE 1 — Validacion previa al cambio de variables de entorno
-- Este script no modifica datos.
-- ============================================================

-- 1. Confirmar tablas canonicas de contenido
select table_name
from information_schema.tables
where table_schema = 'public'
  and table_name in (
    'texts',
    'text_versions',
    'text_version_vocabulary',
    'vocabulario'
  )
order by table_name;

-- 2. Confirmar tablas candidatas ya aprobadas o existentes
select table_name
from information_schema.tables
where table_schema = 'public'
  and table_name in (
    'app_catalog',
    'user_profiles',
    'user_app_access',
    'user_stats_snapshots',
    'admin_roles',
    'admin_audit_log'
  )
order by table_name;

-- 3. Confirmar app_id previstos
create temp table if not exists phase1_app_catalog_probe (
  id text,
  slug text,
  name text,
  status text,
  visibility text,
  sort_order integer
) on commit drop;

truncate table phase1_app_catalog_probe;

do $$
begin
  if to_regclass('public.app_catalog') is not null then
    execute '
      insert into phase1_app_catalog_probe (id, slug, name, status, visibility, sort_order)
      select id, slug, name, status, visibility, sort_order
      from public.app_catalog
    ';
  end if;
end
$$;

select *
from phase1_app_catalog_probe
order by sort_order, id;

-- 4. Confirmar RLS en tablas sensibles
select
  n.nspname as schemaname,
  c.relname as tablename,
  c.relrowsecurity as rowsecurity,
  c.relforcerowsecurity as force_rowsecurity
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where c.relkind = 'r'
  and n.nspname = 'public'
  and c.relname in (
    'user_profiles',
    'user_app_access',
    'user_stats_snapshots',
    'admin_roles',
    'admin_audit_log'
  )
order by c.relname;

-- 5. Policies por tabla sensible
select schemaname, tablename, policyname, cmd
from pg_policies
where schemaname = 'public'
  and tablename in (
    'user_profiles',
    'user_app_access',
    'user_stats_snapshots',
    'admin_roles',
    'admin_audit_log'
  )
order by tablename, policyname;

-- 6. Verificar que imKontext puede seguir leyendo contenido
select count(*) as texts_count from public.texts;
select count(*) as text_versions_count from public.text_versions;
select count(*) as text_version_vocabulary_count from public.text_version_vocabulary;
select count(*) as vocabulario_count from public.vocabulario;

-- 7. Muestras de shape esperado para imKontext
select id, title, slug, topic, categoria, access_status, published_at
from public.texts
order by published_at desc nulls last, id desc
limit 5;

select id, text_id, level
from public.text_versions
order by id desc
limit 10;

select text_version_id
from public.text_version_vocabulary
limit 10;

select id, german, spanish, article, word_type
from public.vocabulario
limit 10;

-- 8. Huecos detectables antes del cutover
select 'missing_app_catalog' as check_name
where not exists (
  select 1
  from information_schema.tables
  where table_schema = 'public'
    and table_name = 'app_catalog'
);

select 'missing_candidate_tables' as check_name, table_name
from (
  values
    ('user_profiles'),
    ('user_app_access'),
    ('user_stats_snapshots'),
    ('admin_roles'),
    ('admin_audit_log')
) as expected(table_name)
where not exists (
  select 1
  from information_schema.tables t
  where t.table_schema = 'public'
    and t.table_name = expected.table_name
);
