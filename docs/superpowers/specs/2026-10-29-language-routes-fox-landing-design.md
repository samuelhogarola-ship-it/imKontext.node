# Diseño: rutas de idioma y landing protagonista

## Intención

Hacer que imKontext comunique el idioma que se aprende desde la propia URL y desde una portada más inmersiva, tomando como referencia el selector “Vokabel World” de Vokabel Lab. La interfaz y el idioma objetivo deben seguir siendo independientes: una persona puede abrir `/English`, mantener la interfaz en español y aprender inglés.

## Alcance

- Añadir rutas de idioma para los objetivos actuales: inglés, finés, alemán, español, italiano y portugués.
- Aceptar las formas visibles que usa el usuario (`/English`, `/Suomi`, `/Español`, `/Deutsch`, `/Italiano`, `/Português`) y normalizarlas a slugs web seguros (`/english`, `/suomi`, `/espanol`, `/deutsch`, `/italiano`, `/portugues`).
- Al entrar en una ruta de idioma, fijar solo `targetLang`; no cambiar `uiLang`, que seguirá siendo español por defecto y respetará la preferencia guardada.
- Presentar en la portada un selector de laboratorios/idiomas con el mismo concepto de Vokabel Lab.
- Dar protagonismo visual al zorro reutilizando el asset existente, recortando la composición panorámica para que el personaje sea el foco y dejando el nombre de la aplicación separado del personaje.
- Sustituir el CTA único por dos botones compactos en infinitivo: `Iniciar sesión` y `Empezar ahora`.
- Mantener las rutas existentes (`/`, `/textos`, `/textos/:slug`, `/dashboard`) y sus enlaces compartibles.

## No alcance

- No publica ni modifica traducciones, vocabulario ni datos de Supabase.
- No incorpora A1 en esta iteración; los niveles actuales siguen siendo A2, B1, B2 y C1.
- No cambia automáticamente el idioma de la interfaz al cambiar el idioma aprendido.

## Enfoques considerados

1. **Rutas de idioma (elegido).** `/english` y sus alias visibles seleccionan el idioma objetivo y son enlaces compartibles. Encaja con la arquitectura actual, que ya separa `uiLang` y `targetLang`, y con Vokabel Lab.
2. **Parámetro de consulta.** `/?learn=english` requiere menos rutas, pero es menos claro para navegación, campañas y enlaces del “mundo” de idiomas.
3. **Páginas estáticas duplicadas.** Una página HTML por idioma haría visible el SEO, pero duplicaría la lógica de la aplicación y permitiría que las rutas se desincronicen.

## Decisiones de interacción

- `/` conserva el comportamiento actual y usa alemán como objetivo inicial cuando no hay preferencia guardada.
- Una ruta de idioma válida aplica el objetivo antes de renderizar la landing y conserva la ruta al navegar a textos y ejercicios.
- El selector de la portada muestra el nombre nativo del idioma y un enlace/acción clara para entrar al laboratorio.
- `Iniciar sesión` abre el flujo de autenticación existente; `Empezar ahora` entra en la selección de textos sin exigir autenticación.
- Los aliases con mayúsculas y diacríticos se aceptan, pero se redirigen a slugs ASCII canónicos para evitar URLs duplicadas.
- La selección manual de idioma de interfaz permanece en la barra superior; la selección de idioma aprendido queda en la portada y en la configuración existente.

## Criterios de aceptación

1. `GET /English` carga la landing con `targetLang = en` y `uiLang = es` si no había otra preferencia guardada.
2. `GET /Suomi` carga finés; `/Español` carga español; los aliases se resuelven sin 404.
3. Cambiar el selector de interfaz a alemán no cambia el idioma objetivo de una ruta `/english`.
4. El selector de idiomas de la landing ofrece los seis objetivos soportados y mantiene la ruta seleccionada al pulsar “Empezar”.
5. El zorro ocupa un bloque visual principal en escritorio y móvil, sin perder el nombre de imKontext ni romper las pruebas visuales.
6. Las rutas existentes y los ejercicios actuales siguen funcionando.

