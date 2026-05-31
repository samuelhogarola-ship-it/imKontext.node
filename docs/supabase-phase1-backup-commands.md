# Comandos de backup — FASE 1

## Requisitos

- `supabase` CLI instalado
- `SUPABASE_ACCESS_TOKEN` configurado o `supabase login` hecho
- `pg_dump` disponible
- DB URL directa obtenida desde Supabase Database settings

## Hallazgo operativo actual

Se localizaron URLs de pooler enlazadas localmente en:

- `/private/tmp/imkontext-supabase-link/supabase/.temp/pooler-url`
- `/Users/sam/Desktop/webs/LAB-WORLD/VokabelLab.node/supabase/.temp/pooler-url`

Esas URLs permiten confirmar host y puerto, pero no bastan para `pg_dump` si no incluyen password efectivo.

Intento real ejecutado:

- `pg_dump` contra `imKontext` usando la `pooler-url` local

Error exacto obtenido:

```txt
Password:
pg_dump: error: connection to server at "aws-1-eu-central-1.pooler.supabase.com" (18.196.8.182), port 5432 failed: fe_sendauth: no password supplied
```

Conclusión operativa:

- la metadata local enlazada ayuda a identificar el pooler correcto
- pero sigue haciendo falta la connection string completa con password desde Supabase Database settings
- mientras no exista esa password, la fase de backups sigue en **NOT COMPLETE**

## Objetivo

Generar para cada proyecto:

- esquema SQL
- datos
- roles/policies revisables desde esquema
- referencia de buckets
- variables de entorno documentadas fuera del dump

## Estado requerido

El bloque principal de backups para consolidacion `imKontext` + `VokabelLab` queda **COMPLETE** cuando se cumplen estas cuatro condiciones:

- `imKontext` schema dump valido
- `imKontext` data dump con `INSERT INTO`
- `VokabelLab` schema dump con `CREATE TABLE`
- `VokabelLab` data dump con `INSERT INTO`

Mientras eso no ocurra:

- no proceder a migracion
- no modificar esquema
- no tocar frontend
- no cambiar variables de entorno

Estado actual a `2026-05-30`:

- `imKontext` schema dump valido: **OK**
- `imKontext` data dump con `INSERT INTO`: **OK**
- `VokabelLab` schema dump con `CREATE TABLE`: **OK**
- `VokabelLab` data dump con `INSERT INTO`: **OK**

Nota:

- `Rivaz` sigue pendiente de identificacion / acceso y no entra todavia en este cierre parcial
- por tanto, el sub-bloque `imKontext + VokabelLab` esta **COMPLETE**
- el objetivo global de backups de los tres proyectos sigue **PENDIENTE** hasta resolver `Rivaz`

## VokabelLab

Proyecto enlazado detectado:

- ref: `ahxjrugfcoheduwqpoxf`

Usar DB URL directa desde Supabase Database settings:

```bash
mkdir -p backups

export VOKABELLAB_DB_URL='postgresql://USER:PASSWORD@HOST:5432/postgres'

pg_dump "$VOKABELLAB_DB_URL" \
  --schema-only \
  --quote-all-identifier \
  > backups/vokabellab_schema_$(date +%Y%m%d).sql

pg_dump "$VOKABELLAB_DB_URL" \
  --data-only \
  --column-inserts \
  --rows-per-insert=100000 \
  > backups/vokabellab_data_$(date +%Y%m%d).sql
```

Guardar aparte:

- `.env.example`
- lista real de variables en uso
- salida de `storage.buckets`
- salida de `pg_policies`

Estado actual:

- `pooler-url` local encontrada en `supabase/.temp/pooler-url`
- dump schema valido generado en:
  - `backups/vokabellab_schema_20260530_oneshot.sql`
- dump data valido generado en:
  - `backups/vokabellab_data_20260530_oneshot.sql`
- verificacion `CREATE TABLE`: **OK**
- verificacion `INSERT INTO`: **OK**
- estado actual: **COMPLETE** para `VokabelLab`

## imKontext

Ref confirmado:

- `fvhxbbhxucwawypfzikf`

Usar DB URL directa desde Supabase Database settings:

```bash
mkdir -p backups

export IMKONTEXT_DB_URL='postgresql://USER:PASSWORD@HOST:5432/postgres'

pg_dump "$IMKONTEXT_DB_URL" \
  --schema-only \
  --quote-all-identifier \
  > backups/imkontext_schema_$(date +%Y%m%d).sql

pg_dump "$IMKONTEXT_DB_URL" \
  --data-only \
  --column-inserts \
  --rows-per-insert=100000 \
  > backups/imkontext_data_$(date +%Y%m%d).sql
```

Estado actual:

- se creo un enlace temporal en `/private/tmp/imkontext-supabase-link`
- `pooler-url` local encontrada en `/private/tmp/imkontext-supabase-link/supabase/.temp/pooler-url`
- dump schema valido generado en:
  - `backups/imkontext_schema_20260530_oneshot.sql`
- dump data valido generado en:
  - `backups/imkontext_data_20260530_oneshot.sql`
- verificacion `CREATE TABLE`: **OK**
- verificacion `INSERT INTO`: **OK**
- estado actual: **COMPLETE** para `imKontext`

## Rivaz

Cuando se identifique el repo o proyecto:

```bash
mkdir -p backups

export RIVAZ_DB_URL='postgresql://USER:PASSWORD@HOST:5432/postgres'

pg_dump "$RIVAZ_DB_URL" \
  --schema-only \
  --quote-all-identifier \
  > backups/rivaz_schema_$(date +%Y%m%d).sql

pg_dump "$RIVAZ_DB_URL" \
  --data-only \
  --column-inserts \
  --rows-per-insert=100000 \
  > backups/rivaz_data_$(date +%Y%m%d).sql
```

## Verificacion minima de cada backup

```bash
test -s backups/imkontext_schema_$(date +%Y%m%d).sql
test -s backups/imkontext_data_$(date +%Y%m%d).sql
test -s backups/vokabellab_schema_$(date +%Y%m%d).sql
test -s backups/vokabellab_data_$(date +%Y%m%d).sql
```

Verificacion explicita de schema:

```bash
grep -i "create table" backups/imkontext_schema_*.sql | head
grep -i "create table" backups/vokabellab_schema_*.sql | head
```

Verificacion explicita de datos:

```bash
grep -i "insert into" backups/imkontext_data_*.sql | head
grep -i "insert into" backups/vokabellab_data_*.sql | head
```

Verificacion de tamano y lineas:

```bash
ls -lh backups/
wc -l backups/*.sql
```

Si:

- falta `CREATE TABLE` en schema, o
- falta `INSERT INTO` en data,

el backup no debe marcarse como valido.

## Guardado fuera de Supabase

Copiar despues a:

- almacenamiento local seguro
- repositorio privado si procede

No guardar secretos reales en dumps ni en markdown de repo compartido.
No commitear archivos de backup al repo.
