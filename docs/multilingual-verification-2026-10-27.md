# ImKontext: verificación DE / EN / ES — 27 de octubre de 2026

## Resultado y límites

Esta sesión prioriza comprobación y documentación. Hay correcciones locales verificadas y un paquete revisable; no se han subido cambios nuevos, fusionado PRs, ejecutado SQL remoto, cambiado dominios ni desplegado la app.

- Pruebas Node: **33/33**.
- Flujos funcionales de navegador: **38/38**, incluidos los cinco idiomas nuevos hasta el resumen de resultados.
- Matriz real **9/9**: interfaz DE/EN/ES × aprendizaje DE/EN/ES, con traducciones de vocabulario distintas del idioma aprendido.
- Esas nueve combinaciones usan la app original `server.js`, configurada contra una base PostgreSQL local desechable y el contenido de la instantánea revisada. No usan respuestas de catálogo simuladas por Playwright.
- Se comparan contenido completo y términos con el JSON del idioma solicitado, además de comprobar lectura, práctica, resumen, canonical y persistencia. Un control negativo con HTTP 200 y contenido español bajo una solicitud inglesa se rechaza correctamente.
- Suite de capturas en macOS: **4 pasan y 5 no coinciden**. No es una suite visual verde. Las referencias no se han sustituido; el detalle aparece más abajo.

La matriz de UI prueba **B1 y flashcards**, no cada pantalla, noticia y combinación de nivel/modo. La validación estructural y del servicio de contenido sí ensaya las 116 versiones de cada idioma añadido. Esto no certifica editorialmente cada traducción.

## Fuente, ramas, PR y estado público

| Elemento | Estado comprobado |
| --- | --- |
| Repositorio activo | `samuelhogarola-ship-it/imKontext.node`; no el repositorio archivado `imKontext` |
| Rama local | `codex/multilang-publication-review` |
| Base remota y PR 80 | `ed1aad87e44bf0964d3df32c5cec3624bb85243a`; PR 80 abierta en borrador, dirigida a `feature/add-learning-languages` |
| PR 79 | Abierta en borrador; `4255692`, dirigida a `feature/i18n-multilang`; contiene ES/EN/FI/IT/PT como idiomas de aprendizaje |
| PR 78 | **Cerrada sin fusionar** desde el 26 de octubre. Su código de interfaz está incluido en la rama de trabajo; su cierre no equivale a integración en main |
| `main` | `4fbd333b24dfbb74521003eff869b060eb97a6ec` |
| PR 77 de autenticación | Separada; no integrada por esta sesión |
| Dominio público | `https://imkontext.vokabellab.com/`, Hostinger Node 22 / Express / `server.js` |
| Commit público, reconsultado hoy | `042c8147f416dfab379e255f4ea35629bba9ac5f`, despliegue completado el 15 de octubre |
| Autodespliegue público | Sigue la rama `codex/umami-production-20261015`, no `main` |

El commit local exacto y el estado respecto de la rama remota se guardan en `estado-local.json` del paquete de evidencias. La revisión del 27 de octubre es local; **la PR remota no contiene todavía estas correcciones**. No debe presentarse ese código como público ni como validado por Actions.

El esquema y los imports siguen siendo los revisados el 26 de octubre. Los ocho archivos SQL conservan todos sus checksums. La comparación con Supabase real se hizo el 26; la matriz de hoy usa aquella instantánea local, no una nueva lectura de datos productivos.

## Qué significa cada dimensión de idioma

| Dimensión | Qué se ha comprobado | Qué no se debe inferir |
| --- | --- | --- |
| Interfaz | `html[lang]`, controles, textos del catálogo y métricas del dashboard; UI DE/EN/ES; claves nuevas también traducidas a FI/IT/PT | No implica que páginas legales, cookies, metadatos y todos los aria-label estén totalmente traducidos |
| Idioma aprendido | Selector y ruta explícita; alemán mantiene `/textos`, otros idiomas usan `/en/textos` y `/es/textos` | Cambiar solo la interfaz no traduce el contenido aprendido |
| Traducciones de apoyo | Se comprueba el término visible de apoyo frente a su JSON/registro alemán; pares DE↔EN, DE↔ES y EN↔ES aparecen en la matriz | El idioma de apoyo no se deduce solo del idioma de la interfaz |
| Contenido | Texto completo frente a la versión alemana original o al JSON EN/ES correcto; misma identidad de versión | Un HTTP 200 o un texto diferente del alemán no bastan para validar el idioma |
| Rutas compartibles | Detalle con `?nivel=B1`, canonical igual a la URL de detalle y aprendizaje explícito al recargar | Una ruta servida como HTML no demuestra que su catálogo multidioma esté publicado |
| Persistencia | Interfaz, aprendizaje y apoyo tras recargar; progreso practicado; claves y colas de otros idiomas **del mismo texto** intactas | No se ha probado sincronización entre dispositivos, cuentas ni almacenamiento de servidor |

El catálogo alemán mantiene sus 29 fuentes. Los catálogos EN/ES muestran 25 textos con vocabulario completo. Los cuatro textos sin vínculos originales están traducidos, pero quedan ocultos en los catálogos nuevos. No se ha borrado contenido alemán para igualar los recuentos.

## Matriz ejecutada con contenido real local

| Interfaz | Aprende | Traducciones de apoyo | Textos de catálogo | Texto y términos de la fuente correcta | Recarga y progreso aislado |
| --- | --- | --- | --- | --- | --- |
| DE | DE | ES | 29 | OK · B1 | OK |
| DE | EN | DE | 25 | OK · B1 | OK |
| DE | ES | DE | 25 | OK · B1 | OK |
| EN | DE | EN | 29 | OK · B1 | OK |
| EN | EN | ES | 25 | OK · B1 | OK |
| EN | ES | EN | 25 | OK · B1 | OK |
| ES | DE | ES | 29 | OK · B1 | OK |
| ES | EN | ES | 25 | OK · B1 | OK |
| ES | ES | EN | 25 | OK · B1 | OK |

Cada fila tiene evidencia JSON y una captura de resultado. Se verifica que la palabra del resumen sea la misma que se practicó y que coincida con el término del idioma solicitado, conservando los campos alemanes originales. El contenido EN/ES se compara con `data/localizations/en.json` o `es.json`; el alemán se compara con `german-versions.json`.

La monitorización del navegador confirma que este no llama a Supabase remoto, pero no puede observar por sí sola las peticiones servidor→base de datos. La procedencia local se establece con los comandos de arranque explícitos siguientes, `SUPABASE_URL` local y el adaptador REST de lectura de PGlite. No se atribuye esa observación al navegador.

## Correcciones objetivas realizadas hoy

1. **Dashboard:** se reutilizaban las claves de “Correctas”, “Elige un texto” y “Seguimiento” para métricas diferentes. Se añaden las traducciones correctas de palabras practicadas, textos activos y progreso global. Las cifras y claves de progreso no cambian. Seis pruebas de UI reproducen el fallo y verifican los textos corregidos; la captura del dashboard vuelve a pasar sin cambiar su referencia.
2. **Catálogo:** el aviso premium, destacado, paginación y controles dinámicos conservaban frases españolas con UI inglesa/alemana. Se traducen las cadenas de esos controles y se vuelven a renderizar catálogo/dashboard al cambiar la interfaz. Siete pruebas comprueban las seis UI y el cambio inmediato.
3. **Resumen de práctica:** en el navegador integrado una flashcard inglesa terminaba mostrando `günstig` en el resumen. El helper compartido recibe ahora el mismo acceso a la palabra objetivo que el ejercicio. El valor alemán original y los callers antiguos se conservan; el texto sigue escapándose. Tres pruebas Node y los cinco recorridos traducidos comprueban el resumen, no solo el frente de la flashcard.
4. **Fixture visual:** la palabra y las opciones dependían de la aleatoriedad del ejercicio. Solo las dos capturas de feedback usan ahora una fixture estable (`das Klima`) y opciones fijas. No se modifica la aleatoriedad productiva.
5. **CI, preparado localmente:** el workflow aceptaba solo PRs dirigidas a `main`, por lo que omitía PR 79/80. Se elimina esa limitación, se dejan de ignorar cambios de SQL y se fijan Ubuntu 24.04 y Node 22. Este cambio **todavía no se ha subido ni ejecutado en GitHub**.

## Clasificación de las seis diferencias iniciales

| Captura | Diagnóstico concreto | Resultado actual |
| --- | --- | --- |
| Dashboard | Fallo real de claves de traducción: “Elige un texto” no describe el número de textos activos | **Corregido; referencia original pasa** |
| Feedback correcto | Fixture inestable: cambiaban palabra/opciones. Tras fijarlas quedan 3.022 píxeles de diferencia de renderizado tipográfico en macOS, con mismo contenido y dimensiones | Fixture corregida; **captura macOS pendiente** de contraste en Linux |
| Feedback incorrecto | Mismo problema de fixture; después quedan 3.357 píxeles de diferencia de renderizado, con misma palabra, opciones, corrección y dimensiones | Fixture corregida; **captura macOS pendiente** de contraste en Linux |
| Home móvil | La referencia de 390×814 es anterior al selector de idioma; actual 390×815. La cabecera contiene el selector y conserva el flujo móvil | Cambio esperado de la cabecera existente; **referencia pendiente de revisión**, no rediseño nuevo |
| Tarjeta destacada | La referencia conserva el badge azul anterior; el CSS ya existente `b1a895a` usa badges neutros. Ese CSS no se ha cambiado hoy | Referencia de estilo desactualizada; **pendiente de revisión**, sin restaurar un diseño antiguo |
| Footer legal | Diferencia preexistente de 1.758 píxeles en renderizado de texto. La captura ya coincidía con el hash de la base archivada, y no se cambia su texto ni CSS en esta revisión | **Pendiente de contraste en Linux**, no se atribuye a traducciones nuevas |

No se han elevado tolerancias, excluido casos ni regenerado imágenes para obtener una suite verde. Cinco fallos de comparación siguen siendo una limitación explícita de la validación visual. Las capturas de macOS no sustituyen el entorno Linux de las referencias.

## CI y revisiones remotas

- PR 80: sin ejecuciones de Actions en el SHA remoto `ed1aad8`. El estado “success” de CodeRabbit significa **“Review skipped: draft pull request”**, no revisión automática aprobada.
- PR 79: también sin Actions al estar apilada sobre una rama distinta de `main`.
- El último CI de PR 78 falló con `onAuthChange is not defined`; no era solo un problema de capturas. La guarda que ya contiene PR 79 evita esa excepción. Los flujos locales actuales no registran errores de página.
- La revisión técnica independiente de hoy repitió las 33 pruebas Node sin bloqueos de compatibilidad. Señaló un hueco del verificador: comparar EN/ES solo con el alemán permitiría intercambiarlos. Se corrigió con comparación exacta contra cada JSON y un control negativo que demuestra el rechazo de contenido en el idioma incorrecto.
- El mismo repaso señaló que el control de aislamiento debía usar el texto practicado. Ahora se verifican sus claves de progreso y cola en los otros idiomas, además de la persistencia tras recargar.

## Reproducción local

Desde la raíz del clon aislado, con las dependencias instaladas por `npm ci`. Los comandos usan únicamente la instantánea pública de contenido incluida en el paquete; no necesitan una clave real de Supabase.

Terminal A — base desechable, dos ensayos de import y origen REST de lectura:

```sh
IMK_REHEARSAL_PORT=3121 IMK_REHEARSAL_REST=1 \
node scripts/rehearse-language-import.mjs \
  ../../outputs/publicacion-multilingue/source \
  ../../outputs/ensayo-matriz-2026-10-27.json \
  data/localizations/{es,en,fi,it,pt}.json
```

Terminal B — app original configurada explícitamente contra ese origen local:

```sh
PORT=3119 SUPABASE_URL=http://127.0.0.1:3121 \
SUPABASE_ANON_KEY=local-readonly-fixture node server.js
```

Terminal C — matriz de UI y persistencia:

```sh
node scripts/verify-three-language-matrix.mjs \
  http://127.0.0.1:3119 \
  ../../outputs/publicacion-multilingue/source \
  ../../outputs/verificacion-2026-10-27
```

Pruebas adicionales, con el puerto 3100 libre:

```sh
npm run test:unit
npx playwright test --grep-invert 'visual regression'
npx playwright test e2e/visual.spec.js
```

La última orden conserva cinco fallos de comparación en este Mac. No ejecutar `--update-snapshots` para ocultarlos. El control negativo local se puede repetir con `node ../../work/negative-matrix-language.mjs`, manteniendo A/B activos: intercambia solo la respuesta de lectura EN por contenido ES, sin cambiar la base. El verificador debe fallar y su control debe informar `wrongLanguageDetected: true`.

Las pruebas unitarias de DB y el script de ensayo escriben solo en memoria local. **Nunca ejecutar el seed alemán antiguo ni `sql/seed-50-texts.sql` como parte de estas comprobaciones.** Su SHA-256 sigue siendo `8776bd4355a4981944b3d0a5db0b1aa90c2da3bac9ecac87af1d80ba1a3b963d`.

## Faltantes antes de considerar publicación

1. Revisar esta documentación y las correcciones locales. No están todavía en la PR remota; no se ha pedido permiso de despliegue en esta sesión.
2. Cuando se acuerde subir la revisión, ejecutar CI Linux sobre su SHA exacto y resolver o aprobar explícitamente las cinco diferencias visuales restantes. Actualmente no hay una prueba remota verde de esta revisión.
3. Decidir la vía de integración porque PR 78 está cerrada sin fusionar. No fusionar automáticamente PRs apiladas ni tratar la revisión local como integración en `main`.
4. Hay cobertura de las funciones principales, pero la UI no está íntegramente localizada: quedan textos estáticos de cookies/páginas legales/metodología, algunos aria-label y cadenas como `Nivel` en el título de detalle y `Abril 2026` en la edición. Se documentan como faltantes, no como contenido aprendido incorrecto.
5. Extender, si se requiere para la aprobación editorial, la revisión humana de traducciones y la matriz visual a los otros niveles/modos y a móvil. La revisión de fuentes y la estructura de datos no sustituyen ese trabajo.
6. Para cualquier futura producción: nueva comprobación de fuente y destino, copia recuperable y aprobación específica del SQL aditivo/despliegue. El orden sigue siendo `00_before` → esquema → cinco imports → `07_after`, comparando las huellas originales. No se ha ejecutado ese orden en remoto.

## SQL exacto y reversión

Los archivos `00_before.sql`, `01_schema.sql`, `02_import_es.sql`, `03_import_en.sql`, `04_import_fi.sql`, `05_import_it.sql`, `06_import_pt.sql` y `07_after.sql` son byte a byte los del paquete revisado anterior. Los imports son aditivos, transaccionales y protegidos frente a cambios de fuente; nunca sustituyen traducciones ya existentes. El ensayo compara las cinco tablas originales pobladas y conserva sus hashes.

La reversión pública documentada permanece en `042c8147f416dfab379e255f4ea35629bba9ac5f`, con el entorno y configuración existentes de Hostinger. Dejar las tablas de traducciones; no borrar, resembrar ni restaurar datos alemanes. Este es un procedimiento preparado, no una operación ejecutada.

Vokabel Lab, Android y sus repositorios no se han modificado. La revisión se limita a ImKontext.
