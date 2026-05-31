# Inventario Supabase — Rivaz

## Identificacion

- Proyecto Supabase: pendiente de localizar
- URL: pendiente
- Entorno: pendiente
- Responsable: pendiente
- Fecha: 2026-05-30

## Variables de entorno usadas

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- Otras:

## Consumidores conocidos

- frontend publico: pendiente
- backend: pendiente
- auth: pendiente
- tareas internas: pendiente

## Tablas

| Tabla | Uso | Consumidor | Destino previsto | Observaciones |
| --- | --- | --- | --- | --- |

## Claves, indices y relaciones

- PK:
- UNIQUE:
- FK:
- indices:

## RLS / Policies

- tablas con RLS:
- policies por tabla:
- tablas publicas sin RLS:

## Views / Functions / RPC / Triggers

- views:
- functions / RPC:
- triggers:

## Buckets / Storage

- buckets:
- uso por app:
- archivos criticos:

## Auth y acceso

- usa Supabase Auth:
- tablas de perfil:
- tablas de acceso/plan:
- tablas de progreso/stats:

## Seeds / SQL existentes

- scripts:
- migraciones:
- datos manuales:

## Mapeo preliminar a imKontext

- tablas que pueden reutilizar tablas canonicas de `imKontext`:
- tablas que requieren extension de `imKontext`:
- conceptos que parecen ausentes en `imKontext`:

## Riesgos

- dependencia de `service_role`: desconocida
- shape de respuestas que deba conservarse: desconocido
- colisiones de IDs: desconocidas

## Bloqueo actual

- no se ha encontrado un repo local identificable con nombre `Rivaz`
- `gh repo list samuelhogarola-ship-it --limit 200` no muestra un repo `Rivaz` ni un nombre evidentemente equivalente
- `supabase projects list` en esta sesion solo muestra dos proyectos accesibles:
  - `imKontext` (`fvhxbbhxucwawypfzikf`)
  - `VokabelLab` (`ahxjrugfcoheduwqpoxf`)
- en `VokabelLab.node` si aparece evidencia de otras apps (`der-die-das`) en migraciones locales, pero no de `Rivaz`
- conclusion actual: no hay evidencia disponible desde este workspace ni desde el acceso Supabase actual de que `Rivaz` sea un tercer proyecto remoto separado
- siguiente paso: confirmar con producto/owner si `Rivaz` es:
  - un alias interno de `VokabelLab`
  - un proyecto Supabase externo no compartido en esta org
  - un repo/app aun no localizado
