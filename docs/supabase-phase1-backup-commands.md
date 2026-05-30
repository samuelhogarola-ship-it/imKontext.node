# Comandos de backup — FASE 1

## Requisitos

- `supabase` CLI instalado
- `SUPABASE_ACCESS_TOKEN` configurado o `supabase login` hecho
- `pg_dump` disponible
- DB URL directa obtenida desde Supabase Database settings

## Objetivo

Generar para cada proyecto:

- esquema SQL
- datos
- roles/policies revisables desde esquema
- referencia de buckets
- variables de entorno documentadas fuera del dump

## Estado requerido

La FASE 1 de backups sigue en estado **NOT COMPLETE** hasta que se cumplan estas cuatro condiciones:

- `imKontext` schema dump valido
- `imKontext` data dump con `INSERT INTO`
- `VokabelLab` schema dump con `CREATE TABLE`
- `VokabelLab` data dump con `INSERT INTO`

Mientras eso no ocurra:

- no proceder a migracion
- no modificar esquema
- no tocar frontend
- no cambiar variables de entorno

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

- schema dump via `supabase db dump` bloqueado por dependencia de Docker
- schema dump directo intentado via script derivado de `--dry-run`, pero todavia no valido
- data dump generado, pero el archivo resultante no contiene `INSERT INTO` utiles por ahora
- estado actual: **NOT COMPLETE**

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
- schema dump real generado correctamente en:
  - `/Users/sam/.codex/worktrees/4c0d/imKontext.node/backups/imkontext_schema_20260530.sql`
- data dump generado, pero sin `INSERT INTO` utiles por ahora
- estado actual: **NOT COMPLETE**

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
