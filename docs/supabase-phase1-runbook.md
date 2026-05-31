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
- `gh repo list samuelhogarola-ship-it --limit 200` tampoco muestra un repo `Rivaz`

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
- con la evidencia actual, `Rivaz` debe tratarse como bloqueo por identidad no confirmada, no como tercer proyecto ya demostrado

## Estado actual de backups

Estado del bloque principal `imKontext + VokabelLab`: **COMPLETE**

Estado global de FASE 1 backups de los tres proyectos: **NOT COMPLETE**

Backups creados en:

- `/Users/sam/.codex/worktrees/4c0d/imKontext.node/backups`

Resultado a fecha `2026-05-30`:

- `imkontext_schema_20260530_oneshot.sql`: OK
- `imkontext_data_20260530_oneshot.sql`: OK
- `vokabellab_schema_20260530_oneshot.sql`: OK
- `vokabellab_data_20260530_oneshot.sql`: OK
- `Rivaz`: pendiente

Hallazgo adicional confirmado:

- existe `pooler-url` local para `imKontext` en:
  - `/private/tmp/imkontext-supabase-link/supabase/.temp/pooler-url`
- existe `pooler-url` local para `VokabelLab` en:
  - `/Users/sam/Desktop/webs/LAB-WORLD/VokabelLab.node/supabase/.temp/pooler-url`
- el uso directo de `pooler-url` sin password no basta para `pg_dump`
- la via que si funciona es:
  - `supabase db dump --linked --dry-run`
  - extraer `PGHOST`, `PGUSER`, `PGPASSWORD`, `PGDATABASE`
  - ejecutar `pg_dump` inmediatamente en el mismo shell (`oneshot`)

Verificacion manual ya hecha:

- `imKontext` schema contiene `CREATE TABLE` para:
  - `texts`
  - `text_versions`
  - `text_version_vocabulary`
  - `vocabulario`

Verificacion manual adicional ya hecha:

- `imKontext` data contiene `INSERT INTO` para:
  - `texts`
  - `text_versions`
  - `vocabulario`
  - `text_version_vocabulary`
- `VokabelLab` schema contiene `CREATE TABLE` para:
  - `profiles`
  - `session_answers`
  - `study_sessions`
  - `themas`
  - `user_progress`
  - `vocabulario`
- `VokabelLab` data contiene `INSERT INTO` para:
  - `themas`
  - `vocabulario`

Conclusiones:

- el acceso autenticado al CLI esta confirmado
- los backups validos de `imKontext` y `VokabelLab` ya existen
- la metadata local enlazada mas `supabase db dump --dry-run` permite resolver credenciales temporales suficientes para `pg_dump`
- el bloqueo principal restante no es `imKontext` ni `VokabelLab`
- el cierre global sigue pendiente por `Rivaz`

Condiciones exactas ya cumplidas para el bloque `imKontext + VokabelLab`:

- `imKontext` schema dump valido
- `imKontext` data dump con `INSERT INTO`
- `VokabelLab` schema dump con `CREATE TABLE`
- `VokabelLab` data dump con `INSERT INTO`

Condicion restante para cerrar backups globales de FASE 1:

- identificar y respaldar `Rivaz`

Evidencia acumulada a fecha `2026-05-31`:

- busqueda local acotada solo encuentra nuestros propios documentos de inventario de `Rivaz`
- la org accesible por `supabase projects list` expone solo `imKontext` y `VokabelLab`
- la cuenta accesible por `gh repo list samuelhogarola-ship-it --limit 200` no expone un repo `Rivaz`
- por tanto, hoy no hay evidencia operativa suficiente para afirmar que `Rivaz` existe como proyecto Supabase separado dentro del acceso disponible
