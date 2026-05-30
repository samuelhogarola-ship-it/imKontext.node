# Inventario Supabase — imKontext

## Identificacion

- Proyecto Supabase: imKontext / InContext
- URL: se inyecta por `SUPABASE_URL`
- Entorno: Node server + backend auxiliar
- Responsable: pendiente de completar
- Fecha: 2026-05-30

## Variables de entorno usadas

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `SUPABASE_ANON`
- Otras: `PORT`

## Consumidores conocidos

- frontend publico: no habla directo con Supabase en la app activa; consume `/api/*`
- servidor Node: [server.js](/Users/sam/.codex/worktrees/4c0d/imKontext.node/server.js)
- backend auxiliar: [backend/server.js](/Users/sam/.codex/worktrees/4c0d/imKontext.node/backend/server.js)
- scripts SQL: `backend/sql/*.sql`, `backend/*.sql`
- tareas manuales: SQL editor de Supabase segun [backend/README.md](/Users/sam/.codex/worktrees/4c0d/imKontext.node/backend/README.md)

## Tablas

| Tabla | Uso | Canonica | Consumidor | Observaciones |
| --- | --- | --- | --- | --- |
| `texts` | contenido | si | `server.js` | |
| `text_versions` | contenido por nivel | si | `server.js` | |
| `text_version_vocabulary` | relacion texto-vocabulario | si | `server.js` | |
| `vocabulario` | vocabulario global | si | `server.js`, `backend/server.js` | |

Anadir aqui el resto de tablas reales del proyecto.

Hallazgos ya visibles desde este repo:

- `texts` se consulta para listados y SEO/share URLs
- `text_versions` se consulta por `text_id + level`
- `text_version_vocabulary` enlaza versiones y vocabulario
- `vocabulario` lo consumen tanto la API principal como el backend auxiliar
- `texts` ya tiene `categoria` como extension planificada
- `vocabulario` ya contempla `example_sentence_de_generated` como extension planificada

## Claves, indices y relaciones

- PK:
- UNIQUE:
- FK:
- indices:

## RLS / Policies

- tablas con RLS: no visible desde este repo
- policies por tabla: pendiente de export real
- tablas publicas sin RLS: la app asume lectura publica via `anon` para contenido

## Views / Functions / RPC / Triggers

- views: no visibles desde este repo
- functions / RPC: no visibles desde este repo
- triggers: no visibles desde este repo

## Buckets / Storage

- buckets: no visibles desde este repo
- uso por app: no visible
- archivos criticos: no visible

## Seeds / SQL existentes

- [backend/sql/001_add_example_sentence_de_generated.sql](/Users/sam/.codex/worktrees/4c0d/imKontext.node/backend/sql/001_add_example_sentence_de_generated.sql)
- [backend/sql/002_add_texts_categoria.sql](/Users/sam/.codex/worktrees/4c0d/imKontext.node/backend/sql/002_add_texts_categoria.sql)
- [backend/deutsch-aktuell-mulltonnenrennen.sql](/Users/sam/.codex/worktrees/4c0d/imKontext.node/backend/deutsch-aktuell-mulltonnenrennen.sql)

## Conceptos ya presentes que podrian reutilizarse

- perfiles de usuario: no detectados desde este repo
- acceso por app: no detectado
- snapshots: no detectado en este repo; `core` ya define contrato compatible
- roles internos: no detectados
- auditoria: no detectada

## Riesgos

- lecturas con `anon`: la app publica depende de acceso de lectura a contenido y vocabulario
- dependencias no documentadas: RLS, views, functions, buckets y triggers reales del proyecto
- posibles colisiones: si `VokabelLab` trae `profiles`, `apps_catalog`, `platform_roles` o snapshots equivalentes
