# FASE 1 — Diseño Final de Consolidación Supabase

**Fecha:** 2026-05-31  
**Proyecto destino:** `imKontext` (Supabase principal de VokabelWorld)  
**Fuente de verdad:** dumps reales del 2026-05-30

---

## 1. Inventario real (dumps remotos)

### imKontext — tablas existentes

| Tabla | Descripción |
|---|---|
| `texts` | Textos de lectura con nivel, categoría, slug, access_status |
| `text_versions` | Versiones por nivel CEFR (A2/B1/B2/C1) del mismo texto |
| `text_version_vocabulary` | Junction: qué palabras aparecen en qué versión de texto |
| `vocabulario` | Diccionario rico: german, spanish, article, word_type, examples, conjugaciones |

Functions: `check_single_free()` — garantiza máx. 1 texto free por INSERT/UPDATE  
RLS: `vocabulario` — SELECT público (anon)

### VokabelLab — tablas existentes

| Tabla | Descripción |
|---|---|
| `profiles` | Perfil de usuario (linked a auth.users) |
| `themas` | Categorías temáticas del vocabulario de práctica |
| `vocabulario` | Vocabulario de práctica: de, es, artikel, thema_id, type, is_active |
| `study_sessions` | Sesiones de estudio con modo, stats agregadas |
| `session_answers` | Respuestas individuales por sesión |
| `user_progress` | Progreso SRS por usuario × palabra |

Functions: `handle_new_user()` (trigger en auth.users → INSERT profiles), `set_updated_at()` (trigger genérico)  
RLS: completo en todas las tablas

---

## 2. Análisis de conflicto — tabla `vocabulario`

Ambas BD tienen `vocabulario` pero con propósitos distintos:

| Campo | imKontext | VokabelLab |
|---|---|---|
| ID palabra | `german` | `de` |
| Traducción | `spanish` | `es` |
| Artículo | `article` | `artikel` |
| Tipo | `word_type` | `type` |
| Nivel CEFR | `level` | — |
| Forma plural | `plural_form` | — |
| Infinitivo | `infinitive` | — |
| Pasado simple | `past_simple` | — |
| Participio | `past_participle` | — |
| Frases ejemplo | `example_sentence_de/es` | — |
| Generado AI | `example_sentence_de_generated` | — |
| Normalizado | `german_norm` | — |
| Thema FK | — | `thema` + `thema_id` |
| Estado activo | — | `is_active` |
| Fuente | — | `source` |
| Timestamps | — | `created_at`, `updated_at` |

**Conclusión:** imKontext.vocabulario es el superset de contenido. VokabelLab.vocabulario añade
`thema_id`, `is_active`, `source`, y timestamps. No hay datos contradictorios, son
complementarios.

---

## 3. Decisiones tabla por tabla

### 3.1 imKontext → MANTENER SIN CAMBIOS (tablas de contenido)

| Tabla | Acción |
|---|---|
| `texts` | **REUTILIZAR** — no tocar |
| `text_versions` | **REUTILIZAR** — no tocar |
| `text_version_vocabulary` | **REUTILIZAR** — no tocar |

### 3.2 imKontext.vocabulario → EXTENDER

Añadir las columnas que tiene VokabelLab y que faltan:

```sql
thema_id     INTEGER REFERENCES themas(id)
is_active    BOOLEAN NOT NULL DEFAULT true
source       TEXT DEFAULT 'manual_import'
created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
```

La columna legacy `thema` (integer bare, sin FK) de VokabelLab **no se migra** — existe
`thema_id` con FK real. Los datos de VokabelLab.vocabulario se migrarán a esta tabla unificada
con deduplicación por `(german/de, spanish/es)`.

### 3.3 VokabelLab → MIGRAR A IMKONTEXT (tablas de práctica + usuarios)

| Tabla VokabelLab | Acción | Destino imKontext |
|---|---|---|
| `profiles` | **MIGRAR** — no existe en imKontext | Nueva tabla `profiles` |
| `themas` | **MIGRAR** — nueva en imKontext | Nueva tabla `themas` |
| `study_sessions` | **MIGRAR** — no existe | Nueva tabla `study_sessions` |
| `session_answers` | **MIGRAR** — no existe | Nueva tabla `session_answers` |
| `user_progress` | **MIGRAR** — no existe | Nueva tabla `user_progress` |
| `vocabulario` (datos) | **MERGE** — deduplicar contra imKontext | Hacia `vocabulario` unificada |

### 3.4 Funciones y triggers VokabelLab → MIGRAR A IMKONTEXT

| Objeto | Acción |
|---|---|
| `handle_new_user()` | **MIGRAR** — trigger en auth.users, necesario para profiles |
| `set_updated_at()` | **MIGRAR** — genérico, apply a profiles + vocabulario + user_progress |

### 3.5 RLS VokabelLab → MIGRAR A IMKONTEXT

Todas las policies de VokabelLab se migran tal cual a imKontext, reemplazando la policy
simplificada actual de `vocabulario` por la versión más granular de VokabelLab.

---

## 4. Schema final unificado en imKontext

```text
texts                     (sin cambios)
text_versions             (sin cambios)
text_version_vocabulary   (sin cambios)
vocabulario               (EXTENDIDA con thema_id, is_active, source, timestamps)
themas                    (NUEVA — de VokabelLab)
profiles                  (NUEVA — de VokabelLab)
study_sessions            (NUEVA — de VokabelLab)
session_answers           (NUEVA — de VokabelLab)
user_progress             (NUEVA — de VokabelLab)
```

---

## 5. Orden seguro de migración

```text
1. CREATE TABLE themas              -- sin dependencias externas
2. ALTER TABLE vocabulario          -- añadir columnas (no-breaking: nullable o con default)
3. CREATE TABLE profiles            -- depende de auth.users (UUID)
4. CREATE TABLE study_sessions      -- depende de auth.users
5. CREATE TABLE session_answers     -- depende de study_sessions + vocabulario
6. CREATE TABLE user_progress       -- depende de auth.users + vocabulario
7. CREATE FUNCTION set_updated_at   -- no depende de tablas
8. CREATE FUNCTION handle_new_user  -- no depende de tablas públicas
9. CREATE TRIGGER on profiles       -- depende de profiles + set_updated_at
10. CREATE TRIGGER on vocabulario   -- depende de vocabulario + set_updated_at
11. CREATE TRIGGER on user_progress -- depende de user_progress + set_updated_at
12. CREATE TRIGGER on auth.users    -- depende de handle_new_user
13. RLS ENABLE + CREATE POLICY      -- depende de todas las tablas
14. INSERT data: themas             -- sin dependencias
15. INSERT data: vocabulario merge  -- con deduplicación (UPSERT o staging)
```

---

## 6. Checklist de validación previa al cutover

### Pre-migración (ejecutar antes de aplicar cualquier SQL)

- [ ] Backup fresco `imkontext_schema_<fecha>.sql` verificado con `CREATE TABLE` presente
- [ ] Backup fresco `imkontext_data_<fecha>.sql` verificado con `INSERT INTO` presente
- [ ] Confirmar que `imKontext` no tiene tablas `profiles`, `themas`, `study_sessions`, `session_answers`, `user_progress` (fresh check)
- [ ] Confirmar que ninguna app apunta ya a imKontext con queries que esperen el schema VokabelLab

### Post-migración (ejecutar después de aplicar el SQL)

- [ ] `\dt` o `SELECT tablename FROM pg_tables WHERE schemaname='public'` lista las 9 tablas esperadas
- [ ] `SELECT COUNT(*) FROM themas` > 0
- [ ] `SELECT COUNT(*) FROM vocabulario` ≥ count previo (no se perdieron filas)
- [ ] `SELECT column_name FROM information_schema.columns WHERE table_name='vocabulario'` incluye `thema_id`, `is_active`, `source`, `created_at`, `updated_at`
- [ ] RLS habilitado en `profiles`, `study_sessions`, `session_answers`, `user_progress`, `vocabulario`
- [ ] Trigger `handle_new_user` visible en `pg_trigger`
- [ ] Insertar usuario de prueba en `auth.users` → verificar que se crea fila en `profiles`
- [ ] Query de práctica funciona: `SELECT v.* FROM vocabulario v JOIN themas t ON t.id = v.thema_id LIMIT 5`
- [ ] No hay orphan FK: `vocabulario.thema_id` IS NULL o apunta a `themas.id` válido

### Rollback disponible si falla

- Revertir DDL: `DROP TABLE` de las tablas nuevas + `ALTER TABLE vocabulario DROP COLUMN` para las columnas añadidas
- Los datos originales de `texts`, `text_versions`, `text_version_vocabulary` no se tocan → rollback es seguro
