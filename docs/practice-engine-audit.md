# Practice Engine Audit
**Vokabel Lab vs imKontext — análisis comparativo para extracción futura**

---

## 1. Inventario de funciones

| Función / responsabilidad | Vokabel Lab (`practice.js`) | imKontext (`practice.js`) | Equivalentes |
|---|---|---|---|
| Iniciar sesión | `startSession(themas, types, title, sub)` | `startPractice()` | Sí, propósito idéntico |
| Reiniciar sesión | `restartSession(mode)` | `btn-reiniciar.onclick` (inline en `showResultado`) | Sí |
| Shuffle | `shuffle(arr)` — Fisher-Yates in-place | `shuffle(arr)` — sort-random | Sí, lógica equivalente |
| Normalizar respuesta | `normalize(s)` — fold acentos, minúsculas | No existe | Sólo VL |
| Construir ejercicio | `renderWrite()` / `renderCard()` / `renderMC()` | `buildExercise()` → switch por modo | Parcial |
| Modo escritura / lückentext | `renderWrite()` + `checkWrite()` | `buildLueckentext()` + `checkLuecken()` | Parecidos |
| Modo tarjetas | `renderCard()` + `flipCard()` + `markCard()` | `buildFlashcard()` | Parecidos |
| Modo test MC | `renderMC()` + `selectMC()` + `nextMC()` | `buildTest()` + `markAnswer()` + `autoNext()` | Parecidos |
| Modo artículo | No existe | `buildArticulo()` | Sólo imK |
| Modo ordenar frase | No existe | `buildOrdenar()` + `checkOrdenar()` | Sólo imK |
| Avanzar a siguiente | `nextWrite()` / `nextMC()` / `markCard()` | `nextWord()` | Sí |
| Retroceder | No existe | `btn-atras` → `currentIdx--` | Sólo imK |
| Selección de modo activo | `switchTab(tab)` — tabs independientes | `getModo(idx)` — rotación + override | Diferente |
| Estadísticas en tiempo real | `updateStats()` — sidebar siempre visible | Solo en pantalla resultado (`showResultado`) | Diferente |
| Pantalla resultado | No existe (sidebar reemplaza) | `showResultado()` | Sólo imK |
| Distractores MC | `otherEs` desde `words` global | `getRandomWrong(word, 3)` desde `currentVocab` | Equivalentes |
| Desactivar opciones | `opts.forEach(b => b.disabled = true)` (inline) | `disableOptions()` | Equivalentes |
| Registrar puntuación | `s.seen++; s.hits++; s.racha++` inline | `recordScore(correct, word)` | Equivalentes |
| Auto-avance con countdown | No existe | `autoNext()` — setInterval 3 s | Sólo imK |
| Guardar progreso en LS | No (solo summary global) | `progress_${textId}_${level}` | Diferente |
| Guardar cola pendiente | No | `queue_${textId}_${level}` | Sólo imK |
| Tabla de palabras | `buildWordTable()` — tab "list" | No existe | Sólo VL |

---

## 2. Modelo de datos por palabra

| Campo semántico | Vokabel Lab | imKontext |
|---|---|---|
| Palabra alemana | `w.de` | `w.german` |
| Traducción española | `w.es` | `w.spanish` |
| Tipo gramatical | `w.type` | `w.word_type` |
| Agrupación temática | `w.thema` (número 1-29) | Ninguno (el texto ES el contexto) |
| Artículo | No existe | `w.article` (`der`/`die`/`das`) |
| Frase de ejemplo | No existe | `w.example_sentence_de` |
| ID | `w.id` (implícito) | `w.id` |
| Nivel lingüístico | No existe | `selectedLevel` (A2/B1/B2/C1) — en texto, no en palabra |

---

## 3. Estado de sesión

| Variable | Vokabel Lab | imKontext |
|---|---|---|
| Lista de palabras activas | `session[]` (global) | `queue[]` (global) |
| Índice actual | `modeState[mode].idx` | `currentIdx` |
| Puntuación | `modeState[mode].{ hits, seen, racha }` — por modo | `score.{ correct, wrong }` — global |
| Modo activo | `activeMode` (`write`/`cards`/`mc`) | `selectedModo` (puede ser null = rotación) |
| Vocabulario completo | `words[]` — toda la BD cargada | `currentVocab[]` — solo las del texto activo |
| Flip tarjeta | `isFlipped` | Inline con `fc.classList.toggle('flipped')` |
| Temas seleccionados | `savedThemas`, `selThemas` | N/A |

---

## 4. Modos de ejercicio comparados

| Modo | Vokabel Lab | imKontext | Diferencias clave |
|---|---|---|---|
| Escritura libre | `write` — escribe la traducción al español | `lueckentext` — escribe la palabra alemana en un hueco | Dirección inversa; VL usa `normalize`, imK compara exact lowercase |
| Tarjeta volteada | `cards` — flip manual, luego ✓/✗ | `flashcards` — flip manual, luego ✓/✗ | Estructuralmente idénticos; campos diferentes |
| Test opción múltiple | `mc` — 4 opciones (1 correcta + 3 de `words`) | `test` — 4 opciones (1 correcta + 3 de `currentVocab`) | Misma mecánica; pool de distractores distinto |
| Artículo | No existe | `articulo` — der/die/das | Solo imK |
| Ordenar frase | No existe | `ordenar` — tokens arrastrables | Solo imK |

---

## 5. Scoring

| Aspecto | Vokabel Lab | imKontext |
|---|---|---|
| Granularidad | Por modo (`write.hits`, `cards.hits`, `mc.hits`) | Global (`score.correct`, `score.wrong`) |
| Racha | Sí, `racha` por modo | No |
| % en tiempo real | Sí, sidebar siempre visible | Solo en pantalla resultado |
| Persistencia en LS | No (se pierde al recargar) | Sí, `progress_${textId}_${level}.done` acumula |
| Pantalla final | No (sidebar es el resultado) | Sí, `showResultado()` con porcentaje |

---

## 6. localStorage

| Clave | Vokabel Lab | imKontext |
|---|---|---|
| Resumen global | `vokabel-summary` → `{ totalWords, totalThemas, totalTypes, lastUpdated }` | No |
| Progreso por texto+nivel | No | `progress_${textId}_${level}` → `{ total, done }` |
| Cola guardada | No | `queue_${textId}_${level}` → array de palabras pendientes |

---

## 7. Navegación entre pantallas

| Aspecto | Vokabel Lab | imKontext |
|---|---|---|
| Sistema | `goScreen(id)` — toggle de display en 4 screens | `showScreen(name)` — toggle en 6 screens |
| Flujo | Home → Simple (temas) → Practice  ó  Home → Advanced (filtros) → Practice | Landing → Textos → Contenido → Actividad → Ejercicio → Resultado |
| Dentro del ejercicio | Tabs (`write`/`cards`/`mc`/`list`) — cambio libre | Secuencial (`currentIdx++`), sin tabs |
| Retroceder en ejercicio | No | Sí (`btn-atras`) |
| Auto-avance | No | Sí, countdown de 3 s en `test` y `articulo` |

---

## 8. Dependencias globales de cada `practice.js`

### Vokabel Lab `practice.js` lee de `app.js`:
| Variable / función | Tipo |
|---|---|
| `words` | Array — toda la BD |
| `session` | Array — palabras de la sesión (escribe y lee) |
| `modeState` | Objeto — estado por modo (escribe y lee) |
| `activeMode` | String |
| `isFlipped` | Boolean |
| `savedThemas`, `savedTypes` | Sets |
| `goScreen()` | Función de navegación |

### imKontext `practice.js` lee de `app.js`:
| Variable / función | Tipo |
|---|---|
| `selectedText` | Objeto — texto activo |
| `selectedLevel` | String |
| `selectedTextVersion` | Objeto |
| `numPalabras` | Number — tamaño de sesión |
| `currentVocab` | Array (escribe y lee) |
| `queue` | Array (escribe y lee) |
| `currentIdx` | Number (escribe y lee) |
| `score` | Objeto (escribe y lee) |
| `selectedModo` | String |
| `slider` | Referencia DOM |
| `$()` | Helper de `getElementById` |
| `apiFetch()` | Función de red |
| `showScreen()` | Función de navegación |
| `goToTextos()` | Función de navegación |
| `refreshSelectedTextVersion()` | Función de API |

---

## 9. Qué puede ser común (candidatos a `practice-core.js`)

| Candidato | Confianza | Notas |
|---|---|---|
| `shuffle(arr)` | Alta | VL usa Fisher-Yates (mejor); imK usa sort-random (sesgo). Unificar con FY. |
| `getRandomWrong(word, n, pool)` | Alta | Misma lógica; solo cambia el nombre del campo ID y el nombre del pool. |
| `recordScore(correct)` | Alta | VL la hace inline; imK tiene función dedicada. Fácil de extraer. |
| `disableOptions(container)` | Alta | Idéntica en propósito; trivial de parametrizar. |
| `normalize(s)` | Media | Solo VL la usa, pero imK debería adoptarla para `lueckentext`. |
| Estado de sesión base | Media | `{ queue/session, idx, score/hits }` — los campos cambian pero la estructura es la misma. |
| `autoNext(onDone, ms)` | Media | Solo imK; VL podría adoptarlo o no. |
| Estructura de `buildExercise` | Baja | El switch de modos es diferente (tabs vs secuencial); el patrón es similar pero el contrato no. |
| Navegación next/prev | Baja | VL no tiene prev; los contratos de avance son distintos. Requiere adapter. |

---

## 10. Qué debe seguir adaptado por app

| Aspecto | Razón |
|---|---|
| Nombres de campos (`de`/`es` vs `german`/`spanish`) | Vienen del schema de Supabase; cambiarlos requiere migración de BD o mapeo |
| Fetch de vocabulario | VL carga toda la BD en memoria; imK carga solo el vocabulario del texto activo con 3 endpoints distintos |
| Modos exclusivos de imKontext (`articulo`, `ordenar`) | No aplican en VL (no hay artículos ni frases de ejemplo en ese schema) |
| Modo `write` de VL | No aplica directamente en imK (imK usa `lueckentext` con la frase de contexto) |
| Sistema de niveles (A2/B1/B2/C1) | Solo imK; VL usa thema numérico |
| Premium/free y textos semanales | Solo imK |
| Sidebar de stats en tiempo real | Solo VL |
| Pantalla resultado (`showResultado`) | Solo imK |
| Tabs dentro de la sesión | Solo VL |
| Carga lazy de `practice.js` | VL lo inyecta dinámicamente; imK lo carga estáticamente |
| Estilos y DOM IDs | Completamente distintos en ambas apps |

---

## 11. Riesgos de la extracción

| Riesgo | Severidad | Mitigación |
|---|---|---|
| Romper la carga lazy de VL si se cambia el contrato del namespace `Lab` | Alta | No tocar `Lab.modules.practiceLoaded` durante la extracción |
| Diferencia sutil en `shuffle` (sort-random tiene sesgo en arrays grandes) | Media | Reemplazar ambas por Fisher-Yates en el core; verificar que el orden de aparición no cambie UX |
| `normalize` ausente en imK puede causar falsos negativos en `lueckentext` (p.ej. "müde" vs "mude") | Media | Añadir `normalize` a imK en un PR separado antes de compartir la función |
| Estado global mutable compartido entre modos en VL | Media | El core no debe mutar estado directamente; usar callbacks o retornar nuevos estados |
| IDs de DOM distintos (VL: `w-input`, imK: `input-traduccion`) | Alta | El core no puede manipular DOM; el adapter es dueño del DOM |
| ES modules vs scripts globales | Alta | No convertir a módulos por ahora; mantener patrón de globals hasta decidir bundler |
| `autoNext` con `setInterval` puede dispararse después de navegar fuera | Media | Guardar referencia al interval y limpiarlo en cada `buildExercise` |

---

## 12. Propuesta de arquitectura futura

```
shared/
  practice-core.js          ← motor sin DOM, sin campos específicos
    shuffle(arr)             ← Fisher-Yates
    getRandomWrong(word, n, pool, idField)
    normalize(s)             ← fold de acentos
    createSession(words, n)  ← shuffle + slice
    recordScore(state, correct)
    createSessionState()     ← { queue, idx, score }

vokabellab/
  practice-adapter.js       ← reemplaza practice.js actual
    mapea w.de → campo "alemán"
    mapea w.es → campo "español"
    mantiene modeState, tabs, sidebar
    llama a core.shuffle, core.recordScore, etc.

imkontext/
  practice-adapter.js       ← reemplaza practice.js actual
    mapea w.german, w.spanish, w.article, etc.
    mantiene queue, currentIdx, score, autoNext
    conecta con selectedText/selectedLevel/Supabase
    llama a core.shuffle, core.recordScore, etc.
```

El core **no toca el DOM**. Cada adapter es dueño total de su DOM y sus IDs.

---

## 13. Orden recomendado de PRs

| # | PR | Contenido | Riesgo | Tamaño |
|---|---|---|---|---|
| 1 | Este PR | `docs/practice-engine-audit.md` | Ninguno | XS |
| 2 | Unificar `shuffle` en imKontext | Reemplazar sort-random por Fisher-Yates en `imKontext/practice.js` | Muy bajo | XS |
| 3 | Añadir `normalize` a imKontext | Incorporar fold de acentos en `checkLuecken` | Bajo | XS |
| 4 | Crear `shared/practice-core.js` | Solo `shuffle`, `normalize`, `getRandomWrong`, `recordScore`, `createSession` — sin DOM | Bajo | S |
| 5 | Conectar imKontext al core | Reemplazar las funciones equivalentes en `imKontext/practice.js` por llamadas al core | Medio | S |
| 6 | Conectar Vokabel Lab al core | Idem para `VokabelLab.node/practice.js` | Medio | S |
| 7 | (Futuro) Adapters con DOM desacoplado | Refactor mayor; solo cuando ambas apps estén estables | Alto | L |

---

## 14. Qué NO tocar aún

- Schema de Supabase (ninguna tabla, ningún campo)
- DOM IDs y estructura HTML de ninguna de las dos apps
- Estilos / CSS
- Rutas de servidor (`/api/*`)
- Sistema de autenticación / premium
- Carga lazy de `practice.js` en Vokabel Lab (`ensurePracticeRuntime`)
- `Lab` namespace en Vokabel Lab
- Lógica de textos, niveles y lectura en imKontext
- `localStorage` keys existentes (cambiarlas rompe el progreso guardado de usuarios)
