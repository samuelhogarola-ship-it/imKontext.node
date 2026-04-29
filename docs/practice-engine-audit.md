# Practice Engine Audit — Documento definitivo

## Objetivo

Comparar la lógica de ejercicios de:

1. **VokabelLab**
2. **imKontext**
3. **Der Die Das** como objetivo futuro

El objetivo no es fusionar código todavía, sino definir una base clara para extraer un núcleo común reutilizable.

---

# 1. Resumen ejecutivo

Las dos apps ya comparten una estructura conceptual parecida:

- cola de palabras
- palabra activa
- validación de respuesta
- puntuación
- racha
- avance
- feedback
- persistencia parcial

Pero difieren en:

- modelo de datos
- flujo previo a la práctica
- UI
- persistencia
- complejidad de modos
- dependencia de Supabase

Por tanto, la estrategia correcta es:

1. documentar
2. extraer helpers puros
3. crear core común
4. adaptar primero VokabelLab
5. adaptar después imKontext
6. reutilizar para Der Die Das

---

# 2. Estado actual por app

## VokabelLab

### Archivos principales

- `index.html`
- `app.js`
- `practice.js`
- `styles.css`

### `app.js`

Responsabilidades:

- home
- navegación
- carga de vocabulario
- filtros simples/avanzados
- resumen de catálogo
- stats persistentes en home

Funciones relevantes:

- `buildHome()`
- `readPracticeStats()`
- `goScreen()`
- `buildSimple()`
- `buildAdvanced()`
- `startAdvanced()`

### `practice.js`

Responsabilidades:

- motor de práctica
- sesión
- modos de ejercicio
- scoring
- racha
- stats persistentes
- reset de score

Funciones relevantes:

- `startSession()`
- `restartSession()`
- `resetScore()`
- `updateStats()`
- `updatePracticeStats()`

#### Modo Write

- `renderWrite()`
- `checkWrite()`
- `nextWrite()`

#### Modo Flashcards

- `renderCard()`
- `flipCard()`
- `markCard()`

#### Modo Test

- `renderMC()`
- `selectMC()`
- `nextMC()`

#### Lista

- `buildWordTable()`

### Modelo de datos

```js
{
  de,
  es,
  thema,
  type
}
```

### localStorage

```txt
vokabel-summary
vokabel-practice-stats
```

`vokabel-practice-stats` guarda:

```js
{
  practiced,
  correct,
  wrong,
  bestStreak,
  currentStreak
}
```

---

## imKontext

### Archivos principales

- `index.html`
- `app.js`
- `practice.js`
- `styles.css`
- `server.js`

### `app.js`

Responsabilidades:

- API frontend
- navegación
- selección de textos
- lectura previa
- niveles
- modo de práctica
- slider de palabras
- progreso por texto/nivel

Funciones relevantes:

- `apiFetch()`
- `showScreen()`
- `goToTextos()`
- `selectText()`
- `refreshSelectedTextVersion()`
- `loadActivityScreen()`
- `updateSliderMax()`
- `updateProgressPanel()`
- `checkSavedProgress()`

### Endpoints backend

```txt
/api/texts
/api/text-version
/api/text-version-vocabulary
/api/vocabulario
```

### `practice.js`

Responsabilidades:

- inicio de práctica
- cola de vocabulario
- motor de ejercicios
- feedback
- resultado
- avance

Funciones relevantes:

- `startPractice()`
- `buildExercise()`
- `getModo()`
- `buildTest()`
- `buildFlashcard()`
- `buildOrdenar()`
- `checkOrdenar()`
- `buildArticulo()`
- `buildLueckentext()`
- `checkLuecken()`
- `markAnswer()`
- `recordScore()`
- `autoNext()`
- `nextWord()`
- `getRandomWrong()`
- `shuffle()`
- `showResultado()`

### Modos

- test
- flashcards
- ordenar
- artículo
- lückentext

### Modelo de datos

```js
{
  german,
  spanish,
  article,
  word_type,
  example_sentence_de
}
```

### localStorage

```txt
progress_${textId}_${level}
queue_${textId}_${level}
```

---

## Der Die Das

Todavía no debe adaptarse, pero es el destino natural del futuro núcleo de flashcards.

### Modelo probable

```js
{
  article,
  noun,
  plural,
  translation
}
```

### Potencial reutilizable

- flashcards
- marcar sabido/no sabido
- artículo correcto
- racha
- repetición
- stats persistentes

---

# 3. Tabla comparativa de funciones

| Área | VokabelLab | imKontext | Decisión |
|---|---|---|---|
| Bootstrap | `Lab.config`, `goScreen`, `loadWords` | `showScreen`, `goToTextos`, `selectText` | App-specific |
| Inicio sesión | `startSession(themas, types, title, sub)` | `startPractice()` | Adapter |
| Cola | `session = shuffle(words.filter(...))` | `queue = shuffled.slice(0, n)` | Core común |
| Modo activo | `switchTab(tab)` | `getModo(idx)` | Adapter + core ligero |
| Shuffle | Fisher-Yates | sort random | Core común |
| Distractores | inline en `renderMC()` | `getRandomWrong()` | Core común |
| Validación texto | `normalize()` + `checkWrite()` | `checkLuecken()` | Core común con adapter |
| Flashcard | `renderCard()`, `flipCard()`, `markCard()` | `buildFlashcard()`, `recordScore()` | Flashcard-core |
| Multiple choice | `selectMC()` | `markAnswer()` | Core común + adapter DOM |
| Ordenar | no existe | `buildOrdenar()` | imKontext-specific |
| Artículo | no existe | `buildArticulo()` | imKontext / DerDieDas |
| Resultado | estados por modo | `showResultado()` | Adapter |
| Stats persistentes | global | por texto/nivel | No unificar aún |

---

# 4. Comparativa de modelos de datos

| Campo lógico | VokabelLab | imKontext | Der Die Das |
|---|---|---|---|
| palabra alemana | `de` | `german` | `noun` |
| traducción | `es` | `spanish` | `translation` |
| artículo | no base | `article` | `article` |
| tipo | `type` | `word_type` | categoría propia |
| tema | `thema` | `selectedText/topic` | unidad o grupo |
| ejemplo | no base | `example_sentence_de` | opcional |
| plural | no base | opcional | `plural` |

Conclusión:

El core no debe depender de nombres concretos.
Debe recibir datos normalizados desde un adapter.

---

# 5. Qué puede ser común

## `shared/practice-core.js`

Debe contener:

- `createSession()`
- `getCurrentItem()`
- `nextItem()`
- `previousItem()`
- `isComplete()`
- `recordAnswer()`
- `resetScore()`
- `getProgressPercent()`
- `shuffle()`
- `normalizeAnswer()`
- `isExactMatch()`
- `matchesAnyAcceptedAnswer()`
- `getRandomDistractors()`

No debe contener:

- DOM
- Supabase
- rutas
- estilos
- botones
- pantallas
- localStorage directo

---

## `shared/flashcard-core.js`

Debe contener:

- estado flip
- `flip()`
- `markKnown()`
- `markUnknown()`
- avance automático
- racha
- preparación para repetición futura

Debe servir para:

- VokabelLab
- imKontext
- Der Die Das

---

# 6. Qué debe seguir específico

## VokabelLab

- filtros por Thema
- filtros por tipo
- tabs Write/Cards/Test/List
- sidebar de sesión
- stats globales en home
- localStorage `vokabel-practice-stats`

## imKontext

- Supabase
- texto semanal/free/premium
- lectura previa
- niveles A2/B1/B2/C1
- slider de palabras
- ordenar frases
- lückentext contextual
- progreso por texto/nivel

## Der Die Das

- colores der/die/das
- artículo como centro del ejercicio
- plural
- género
- mecánica específica de artículos

---

# 7. Arquitectura propuesta

```txt
shared/
├── practice-core.js
├── flashcard-core.js
└── answer-utils.js

vokabellab/
└── practice-adapter.js

imkontext/
└── practice-adapter.js

derdiedas/
└── flashcard-adapter.js
```

---

# 8. Contrato futuro del adapter

Cada app debe transformar sus datos al formato interno:

```js
{
  id,
  prompt,
  answer,
  alternatives,
  article,
  type,
  group,
  example,
  difficulty,
  raw
}
```

---

# 9. Riesgos

## Alto riesgo

- mezclar persistencia global y por texto
- convertir a módulos ES6 ahora
- intentar un renderer universal
- tocar Supabase durante el refactor
- mover demasiado código de golpe
- romper scripts clásicos cargados con `script src`

## Bajo riesgo

- extraer `shuffle`
- extraer `normalize`
- extraer scoring puro
- extraer cálculo de porcentaje
- crear adapter sin cambiar comportamiento

---

# 10. Orden recomendado de PRs

## PR 1 — Documento

Crear este informe en:

```txt
docs/practice-engine-audit.md
```

No tocar código funcional.

## PR 2 — Helpers puros

Crear:

```txt
shared/answer-utils.js
shared/practice-core.js
```

Mover solo:

- shuffle
- normalize
- porcentaje
- scoring puro
- distractores

No cambiar comportamiento.

## PR 3 — Flashcard core

Crear:

```txt
shared/flashcard-core.js
```

Usarlo primero en VokabelLab.

## PR 4 — VokabelLab adapter

Adaptar VokabelLab al core común.

## PR 5 — Der Die Das adapter

Aplicar el `flashcard-core` a Der Die Das.

## PR 6 — imKontext adapter

Adaptar imKontext después.

---

# 11. Instrucción para Claude

```txt
Create docs/practice-engine-audit.md using this document.

Do not change app behavior.
Do not refactor runtime code yet.
Do not touch Supabase.
Do not touch CSS.
Do not convert scripts to ES modules.
Do not merge the engines yet.

This PR must be documentation only.

After this PR, we will create a second PR to extract pure helpers into shared/practice-core.js and shared/answer-utils.js.
```

---

# 12. Conclusión

El motor compartido sí tiene sentido, pero no debe hacerse de golpe.

La mejor ruta es:

1. documento único
2. helpers puros
3. flashcard-core
4. adaptar Der Die Das
5. adaptar VokabelLab
6. adaptar imKontext

El mayor beneficio inmediato está en:

```txt
shared/flashcard-core.js
```

porque servirá para las tres apps con menos riesgo que intentar fusionar todo el practice engine desde el principio.


---

# 13. Patrón común obligatorio (data → core → UI)

Este patrón debe aplicarse a las 3 apps.

```txt
Data layer
→ normalization layer
→ shared practice core
→ app UI layer
```

## A. Data layer (app-specific)

Aquí vive todo lo específico de cada producto.

### VokabelLab
- carga vocabulario simple
- filtros por Thema
- filtros por tipo

### imKontext
- Supabase
- textos
- text_versions
- text_version_vocabulary
- example_sentence_de
- lectura previa
- niveles

### Der Die Das
- artículos
- plural
- género
- sets específicos

**Regla:**
El core nunca debe hacer fetch directo.

Especialmente:

```txt
shared core ❌ Supabase
shared core ❌ API routes
shared core ❌ SQL logic
```

---

## B. Normalization layer (adapter obligatorio)

Cada app debe transformar su modelo al mismo contrato:

```js
{
  id,
  prompt,
  answer,
  alternatives,
  article,
  type,
  group,
  example,
  difficulty,
  raw
}
```

Ejemplo:

### VokabelLab

```js
{
  prompt: de,
  answer: es,
  type: type,
  group: thema
}
```

### imKontext

```js
{
  prompt: german,
  answer: spanish,
  article: article,
  type: word_type,
  group: textId,
  example: example_sentence_de
}
```

---

## C. Shared practice core

Debe encargarse únicamente de:

- session lifecycle
- queue
- shuffle
- scoring
- streak
- next/previous
- validation
- distractors
- progress %

---

## D. UI layer (app-specific)

Cada app mantiene:

- pantallas
- estilos
- navegación
- botones
- UX específica

---

# 14. Patrón común de distractores

Esto sí debe ser universal.

Orden de prioridad:

1. mismo tipo de palabra
2. mismo tema/texto
3. dificultad similar
4. misma categoría semántica si existe
5. evitar duplicados
6. evitar respuestas absurdas
7. fallback global

```txt
Haus → casa

Buenos:
piso
edificio
habitación

Malos:
correr
ayer
rápido
```

## Regla

El core genera distractores.

El adapter solo entrega metadata:
- type
- group
- difficulty
- semantic tags (si existen)
