# FASE 1 — Consolidacion Supabase VokabelWorld

## Objetivo

Convertir el proyecto Supabase de `imKontext`/`InContext` en el proyecto principal de VokabelWorld sin tocar frontend, rutas, login, dashboard ni paneles.

Esta fase cubre solo:

- inventario
- backups
- comparativa de esquemas
- propuesta tecnica de consolidacion
- SQL seguro de preflight/migracion/validacion
- checklist de cutover y rollback

## Restricciones

- No modificar React, Vite, Next, componentes UI, layouts, rutas, navegacion, login, dashboard, hub de usuario ni panel admin.
- No romper las rutas publicas actuales de `imKontext`.
- No crear un modelo paralelo de dashboard.
- No exponer `SUPABASE_SERVICE_ROLE_KEY` al frontend.
- Antes de crear cualquier tabla nueva, comprobar si el mismo concepto ya existe en `imKontext`.
- Si el concepto ya existe en `imKontext`, reutilizar o extender; no crear duplicados funcionales.

## Proyecto destino

- Proyecto Supabase principal: `imKontext` / `InContext`
- `app_id` previstos: `imkontext`, `vokabellab`, `rivaz`

## Entregables de esta fase

1. Inventario comparativo de:
   - `imKontext`
   - `VokabelLab`
   - `Rivaz`
2. Backups verificados de los tres proyectos.
3. Matriz origen -> destino por tabla y concepto.
4. Lista de colisiones, duplicados y estructuras reutilizables.
5. SQL de:
   - preflight
   - validacion de esquema
   - propuesta segura de tablas candidatas
   - validacion final antes de cambiar `.env`
6. Checklist de cutover y rollback.

## Estado de acceso actual

- `supabase` CLI disponible localmente: `2.90.0`
- `VokabelLab.node` encontrado en `/Users/sam/Desktop/webs/LAB-WORLD/VokabelLab.node`
- `VokabelLab.node` tiene proyecto enlazado en Supabase: `ahxjrugfcoheduwqpoxf`
- `supabase login` completado correctamente en esta sesion
- `supabase projects list` ya confirma:
  - `imKontext`: `fvhxbbhxucwawypfzikf`
  - `VokabelLab`: `ahxjrugfcoheduwqpoxf`
- `Rivaz` todavia no aparece como repo local identificable en este workspace

## Orden de trabajo

1. Generar backups de los tres proyectos.
2. Verificar que los backups contienen esquema, datos, RLS, functions/RPC, buckets y env documentadas.
3. Guardar los backups fuera de Supabase.
4. Completar inventarios por proyecto.
5. Rellenar la matriz de comparacion.
6. Confirmar que las tablas canonicas de contenido de `imKontext` siguen siendo destino:
   - `texts`
   - `text_versions`
   - `text_version_vocabulary`
   - `vocabulario`
7. Revisar si los conceptos candidatos ya existen en `imKontext` antes de proponer nuevas tablas:
   - `app_catalog`
   - `user_profiles`
   - `user_app_access`
   - `user_stats_snapshots`
   - `admin_roles`
   - `admin_audit_log`
8. Preparar SQL final de consolidacion.
9. Ejecutar validacion previa al cutover.
10. Cambiar variables de entorno solo cuando la validacion sea satisfactoria.

## Ventana de mantenimiento

Se acepta una interrupcion temporal de servicio durante la migracion.

Durante la ventana:

- las apps pueden mostrar mantenimiento
- pueden existir lecturas parciales
- no se haran cambios permanentes de UI en esta fase

## Rollback

Si la migracion falla:

1. restaurar variables de entorno originales
2. redeploy de las aplicaciones
3. volver a usar los proyectos Supabase originales

Reglas del rollback:

- no debe requerir restaurar datos
- no debe requerir reconstruir infraestructura
- los proyectos originales se mantienen sin modificaciones durante varios dias tras el cutover

## Estado actual visible desde este repo

En `imKontext.node` hoy se observan como tablas consumidas:

- `texts`
- `text_versions`
- `text_version_vocabulary`
- `vocabulario`

Y como piezas ya preparadas para futuros snapshots en `core`:

- contrato `user_meta` en `stats-core`
- compatibilidad prevista con `user_stats_snapshots`

Los repos de `VokabelLab` y `Rivaz` no estan en este workspace, asi que sus inventarios deben completarse al abrir/exportar esos proyectos.

Actualizacion:

- `VokabelLab.node` ya esta localizado y su inventario puede seguir completandose desde:
  - `supabase/migrations/20260526120000_labworld_secure_platform.sql`
  - `supabase/seed.sql`
  - `server.js`
- `Rivaz` sigue pendiente de localizacion o export remoto.

## Estado actual de backups

Estado global de FASE 1 backups: **NOT COMPLETE**

Backups creados en:

- `/Users/sam/.codex/worktrees/4c0d/imKontext.node/backups`

Resultado a fecha `2026-05-30`:

- `imkontext_schema_20260530.sql`: OK
- `imkontext_data_20260530.sql`: incompleto o vacio util; solo contiene `SET session_replication_role = replica;`
- `vokabellab_schema_20260530.sql`: fallo
- `vokabellab_data_20260530.sql`: incompleto o vacio util; solo contiene `SET session_replication_role = replica;`

Verificacion manual ya hecha:

- `imKontext` schema contiene `CREATE TABLE` para:
  - `texts`
  - `text_versions`
  - `text_version_vocabulary`
  - `vocabulario`

Conclusiones:

- el acceso autenticado al CLI esta confirmado
- el backup de esquema de `imKontext` ya existe y no esta vacio
- todavia NO se puede considerar cerrada la fase de backups porque faltan:
  - backup de esquema valido de `VokabelLab`
  - backup de datos validos de `imKontext`
  - backup de datos validos de `VokabelLab`

Condiciones exactas para cambiar este estado a COMPLETE:

- `imKontext` schema dump valido
- `imKontext` data dump con `INSERT INTO`
- `VokabelLab` schema dump con `CREATE TABLE`
- `VokabelLab` data dump con `INSERT INTO`
