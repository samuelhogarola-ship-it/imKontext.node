# Core Léxico VokabelWorld — Arquitectura y Guía de Uso

**Estado:** Implementado en imKontext (`fvhxbbhxucwawypfzikf`) — 2026-05-31  
**Modelo anterior:** `public.vocabulario` como tabla monolítica  
**Modelo nuevo:** Core léxico normalizado en 6 tablas nuevas, con `vocabulario` como capa de compatibilidad

---

## 1. Motivación

La tabla `public.vocabulario` mezclaba en una sola entidad:
- La palabra alemana (lemma lingüístico)
- Su traducción al español (acepción)
- Ejemplos y conjugaciones
- Clasificación temática
- Metadatos de aplicación

Esto bloqueaba compartir el vocabulario entre apps distintas sin duplicar datos. El nuevo modelo separa estas responsabilidades.

---

## 2. Modelo de datos

```
vocabulary_lemmas              — Palabra alemana como entidad lingüística
    │
    ├── vocabulary_meanings    — Acepción/traducción concreta
    │       │
    │       └── vocabulary_meaning_topics  — Relación meaning ↔ thema
    │
    └── app_vocabulary_lemmas  — App ↔ lemma (der-die-das consume aquí)

apps                           — Registro de aplicaciones consumidoras
    │
    └── app_vocabulary_meanings — App ↔ meaning (imKontext, VokabelLab)
```

### vocabulary_lemmas

Representa la **palabra alemana** como unidad lingüística, independiente de cualquier traducción.

| Campo | Descripción |
|---|---|
| `id` | PK bigint IDENTITY |
| `german` | Forma canónica (p.ej. `"der Tag"`) |
| `normalized_german` | `lower(trim(german))` — clave de búsqueda |
| `article` | `der / die / das` — NULL para verbos/adj |
| `word_type` | `noun / verb / adjective / phrase` |
| `plural` | Forma plural |
| `conjugation` | jsonb: `{infinitive, past_simple, past_participle}` |
| `is_active` | Soft-delete |

**Constraint único:** `UNIQUE NULLS NOT DISTINCT (normalized_german, word_type, article)`  
Permite homógrafos: `der Band`, `die Band`, `das Band` son tres lemmas distintos.

### vocabulary_meanings

Representa una **acepción concreta** de un lemma. Un lemma puede tener varias:

```
schaffen
  → meaning 1: "crear / lograr"      (imkontext)
  → meaning 2: "crear algo; conseguir algo"  (vokabellab)
```

| Campo | Descripción |
|---|---|
| `id` | PK bigint IDENTITY |
| `lemma_id` | FK → vocabulary_lemmas |
| `spanish` | Traducción |
| `normalized_spanish` | `lower(trim(spanish))` — clave de dedup |
| `example` | Ejemplo DE preferido |
| `level` | A2 / B1 / B2 / C1 |
| `source` | `imkontext / vokabellab / manual_import` |
| `legacy_vocabulario_id` | FK → vocabulario.id (trazabilidad) |
| `is_active` | Soft-delete |

**Constraint único:** `UNIQUE (lemma_id, normalized_spanish)`

### vocabulary_meaning_topics

Relaciona acepciones con temas. Un mismo lemma puede tener temas distintos según la acepción:  
`Bank` → economía (cuando es banco financiero) vs. mobiliario (cuando es banco de jardín).

### apps

| key | name |
|---|---|
| `imkontext` | imKontext |
| `vokabellab` | VokabelLab |
| `der-die-das` | der-die-das |

### app_vocabulary_meanings

Liga qué acepciones consume cada app. Permite que imKontext y VokabelLab compartan el mismo lemma pero consuman acepciones distintas.

### app_vocabulary_lemmas

Liga qué lemmas consume cada app. `der-die-das` consume lemmas directamente (solo necesita `german`, `article`, `plural`) sin necesitar traducciones.

---

## 3. Cómo consume cada app

### imKontext

```sql
-- Vocabulary para mostrar en textos de lectura
SELECT
  l.german,
  l.article,
  l.word_type,
  m.spanish,
  m.example,
  m.level
FROM app_vocabulary_meanings avm
JOIN vocabulary_meanings m  ON m.id       = avm.meaning_id
JOIN vocabulary_lemmas   l  ON l.id       = m.lemma_id
WHERE avm.app_key  = 'imkontext'
  AND l.is_active  = true
  AND m.is_active  = true;
```

O vía trazabilidad legacy (query idéntica al modelo anterior):
```sql
SELECT * FROM vocabulario WHERE is_active = true;
-- vocabulario.lemma_id y vocabulario.primary_meaning_id ya están poblados
```

### VokabelLab

```sql
-- Vocabulario de práctica agrupado por thema
SELECT
  l.german,
  l.article,
  m.spanish,
  t.id AS thema_id,
  th.name AS thema_name
FROM app_vocabulary_meanings avm
JOIN vocabulary_meanings m         ON m.id        = avm.meaning_id
JOIN vocabulary_lemmas   l         ON l.id        = m.lemma_id
LEFT JOIN vocabulary_meaning_topics t  ON t.meaning_id = m.id
LEFT JOIN themas             th    ON th.id        = t.thema_id
WHERE avm.app_key = 'vokabellab'
  AND l.is_active = true
  AND m.is_active = true;
```

### der-die-das

```sql
-- Solo lemmas con artículo, sin necesitar traducción
SELECT
  l.german,
  l.article,
  l.plural
FROM app_vocabulary_lemmas avl
JOIN vocabulary_lemmas l ON l.id = avl.lemma_id
WHERE avl.app_key = 'der-die-das'
  AND l.is_active  = true;
-- 812 lemmas disponibles al día de la implementación
```

---

## 4. Capa de compatibilidad — public.vocabulario

`public.vocabulario` **no se ha modificado destructivamente**. Sigue siendo la fuente de verdad para el código existente de imKontext.

Se añadieron dos columnas opcionales de trazabilidad (no-breaking):

| Columna nueva | Descripción |
|---|---|
| `lemma_id` | FK → vocabulary_lemmas.id (backfill completado: 1.449/1.449) |
| `primary_meaning_id` | FK → vocabulary_meanings.id (backfill completado) |

`UNIQUE (german)` **permanece intacto**. Ninguna query existente se rompe.

---

## 5. Estado post-migración (2026-05-31)

| Tabla | Filas |
|---|---|
| `vocabulario` | 1.449 (sin cambios) |
| `vocabulary_lemmas` | 2.659 |
| `vocabulary_meanings` | 2.727 |
| `vocabulary_meaning_topics` | 0 ⚠️ pendiente (ver abajo) |
| `apps` | 3 |
| `app_vocabulary_meanings (imkontext)` | 1.449 |
| `app_vocabulary_meanings (vokabellab)` | 1.325 |
| `app_vocabulary_lemmas (der-die-das)` | 812 |
| Lemmas con múltiples acepciones | 66 |

---

## 6. Pendientes

### ⚠️ vocabulary_meaning_topics — segundo paso necesario

Los `thema_id` en VokabelLab viven en la columna legacy `thema` (integer), no en `thema_id` (FK). El staging extrajo `thema_id` que era NULL en todas las filas. Para poblar la relación meaning ↔ thema:

```sql
-- Requiere acceder a VokabelLab origen y cruzar por (de, es) → meaning_id
-- Paso manual: exportar (de, es, thema) de VokabelLab y hacer INSERT INTO
-- vocabulary_meaning_topics (meaning_id, thema_id) con JOIN por (german, spanish)
```

Este paso no tiene urgencia funcional — VokabelLab puede seguir usando `vocabulario.thema_id` mientras tanto.

### Refactorización de código de apps

El código de imKontext y VokabelLab sigue apuntando a `public.vocabulario`. La migración al nuevo core léxico (queries hacia `vocabulary_lemmas` / `vocabulary_meanings`) es trabajo de frontend/backend, fuera del alcance de FASE 1.

### Añadir futuras apps

Para registrar una nueva app (p.ej. `konjugation-trainer`):
```sql
INSERT INTO apps (key, name, description) VALUES ('konjugation-trainer', '...', '...');
-- Luego poblar app_vocabulary_lemmas o app_vocabulary_meanings según lo que consuma
```
