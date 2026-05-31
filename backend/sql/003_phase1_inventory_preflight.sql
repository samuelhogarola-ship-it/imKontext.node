-- ============================================================
-- FASE 1 — Preflight de inventario para Supabase unificado
-- Proyecto destino previsto: imKontext / InContext
-- Este script no modifica datos.
-- ============================================================

-- 1. Tablas visibles por schema
select table_schema, table_name
from information_schema.tables
where table_schema not in ('pg_catalog', 'information_schema')
order by table_schema, table_name;

-- 2. Columnas
select table_schema, table_name, column_name, data_type, is_nullable, column_default
from information_schema.columns
where table_schema not in ('pg_catalog', 'information_schema')
order by table_schema, table_name, ordinal_position;

-- 3. Primary keys / unique constraints
select
  tc.table_schema,
  tc.table_name,
  tc.constraint_name,
  tc.constraint_type,
  string_agg(kcu.column_name, ', ' order by kcu.ordinal_position) as columns
from information_schema.table_constraints tc
left join information_schema.key_column_usage kcu
  on tc.constraint_schema = kcu.constraint_schema
 and tc.constraint_name = kcu.constraint_name
 and tc.table_name = kcu.table_name
where tc.table_schema not in ('pg_catalog', 'information_schema')
  and tc.constraint_type in ('PRIMARY KEY', 'UNIQUE')
group by tc.table_schema, tc.table_name, tc.constraint_name, tc.constraint_type
order by tc.table_schema, tc.table_name, tc.constraint_type, tc.constraint_name;

-- 4. Foreign keys
select
  tc.table_schema,
  tc.table_name,
  tc.constraint_name,
  kcu.column_name,
  ccu.table_schema as foreign_table_schema,
  ccu.table_name as foreign_table_name,
  ccu.column_name as foreign_column_name
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu
  on tc.constraint_schema = kcu.constraint_schema
 and tc.constraint_name = kcu.constraint_name
join information_schema.constraint_column_usage ccu
  on tc.constraint_schema = ccu.constraint_schema
 and tc.constraint_name = ccu.constraint_name
where tc.constraint_type = 'FOREIGN KEY'
  and tc.table_schema not in ('pg_catalog', 'information_schema')
order by tc.table_schema, tc.table_name, tc.constraint_name, kcu.ordinal_position;

-- 5. Indices
select schemaname, tablename, indexname, indexdef
from pg_indexes
where schemaname not in ('pg_catalog', 'information_schema')
order by schemaname, tablename, indexname;

-- 6. Views
select table_schema, table_name, view_definition
from information_schema.views
where table_schema not in ('pg_catalog', 'information_schema')
order by table_schema, table_name;

-- 7. Functions / RPC
select
  n.nspname as schema_name,
  p.proname as function_name,
  pg_get_function_identity_arguments(p.oid) as args,
  pg_get_function_result(p.oid) as returns
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname not in ('pg_catalog', 'information_schema')
order by n.nspname, p.proname;

-- 8. Triggers
select event_object_schema, event_object_table, trigger_name, action_timing, event_manipulation
from information_schema.triggers
where trigger_schema not in ('pg_catalog', 'information_schema')
order by event_object_schema, event_object_table, trigger_name;

-- 9. Policies RLS
select schemaname, tablename, policyname, permissive, roles, cmd, qual, with_check
from pg_policies
order by schemaname, tablename, policyname;

-- 10. Tablas con RLS activado
select
  n.nspname as schemaname,
  c.relname as tablename,
  c.relrowsecurity as rowsecurity,
  c.relforcerowsecurity as force_rowsecurity
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where c.relkind = 'r'
  and n.nspname not in ('pg_catalog', 'information_schema')
order by n.nspname, c.relname;

-- 11. Buckets de storage
select *
from storage.buckets
order by id;

-- 12. Comprobacion especifica para conceptos candidatos
select table_schema, table_name
from information_schema.tables
where table_name in (
  'app_catalog',
  'user_profiles',
  'user_app_access',
  'user_stats_snapshots',
  'admin_roles',
  'admin_audit_log'
)
order by table_schema, table_name;

-- 13. Comprobacion especifica para tablas canonicas de contenido
select table_schema, table_name
from information_schema.tables
where table_name in (
  'texts',
  'text_versions',
  'text_version_vocabulary',
  'vocabulario'
)
order by table_schema, table_name;
