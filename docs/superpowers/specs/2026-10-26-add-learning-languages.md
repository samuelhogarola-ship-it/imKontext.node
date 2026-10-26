# Ampliación de idiomas de imKontext conservando alemán

## Objetivo y alcance

Ampliar la aplicación para aprender español, inglés, finlandés, italiano y portugués. Conservar el contenido y el funcionamiento existentes para aprender alemán. Partir del catálogo publicado actual y añadir sus traducciones, vocabulario y actividades por idioma.

El objetivo anterior de ejecutar `sql/seed-50-texts.sql` queda apartado: es un seed alemán incompatible con el esquema actual. Ese archivo se conserva intacto y no forma parte de esta ampliación.

## Estado comprobado

- Rama de Claude: `feature/i18n-multilang`; HEAD observado: `eda8509`.
- Interfaz traducida a ES/EN/DE/FI/IT/PT en `imKontext/i18n.js`.
- Existen funciones para elegir idioma de aprendizaje, pero la interfaz solo ofrece selección de idioma de la app y las peticiones de contenido no filtran por idioma.
- Catálogo alemán observado: 29 textos, 116 versiones, 1.807 filas en `vocabulario` y 1.407 enlaces en `text_version_meanings`.
- Niveles admitidos en `text_versions`: A2, B1, B2 y C1.
- Los enlaces de vocabulario apuntan a `vocabulary_meanings`, no al ID de `vocabulario`.
- La vista `text_version_vocabulary_core` ya expone campos ES/EN/FI/IT/PT. Entre sus 1.261 significados distintos enlazados, los 1.261 tienen traducción española; EN/FI/IT/PT están vacíos. Hay que reutilizar las traducciones existentes, sin duplicarlas ni sobrescribirlas.
- El inventario no muestra tablas de traducciones de títulos o versiones de `texts`. `samuel_texts` tiene otro contrato e identidad y no se modificará para alojar este catálogo.

## Conservación obligatoria

1. No actualizar, borrar, renombrar ni reemplazar textos, versiones, vocabulario o enlaces alemanes existentes. No cambiar sus niveles, IDs, traducciones almacenadas ni contenido.
2. No cambiar las restricciones, RLS ni permisos de las tablas existentes.
3. Mantener el contrato actual de las tres API cuando no se solicite otro idioma: `/api/texts`, `/api/text-version` y `/api/text-version-vocabulary-core`.
4. Mantener las URLs alemanas `/textos/:slug?nivel=...`, los identificadores de progreso y el comportamiento de los ejercicios alemanes.
5. Mantener el seed original intacto. No atribuir a RLS un error de integridad ni desactivar protecciones para cargar datos.
6. Trabajar de forma aislada del checkout que utiliza Claude. No desplegar cambios sin una versión revisable y comprobada.

## Enfoques considerados

- **Reutilizar las columnas y filas alemanas para almacenar otros idiomas.** Mezcla significados y contenido, exige alterar contratos actuales y contradice la conservación solicitada. Se descarta.
- **Crear una copia completa de la aplicación y su base por idioma.** Aísla datos, pero duplica mantenimiento, progreso y ejercicios. No se recomienda.
- **Añadir traducciones vinculadas al catálogo actual.** Permite compartir identidad de textos y significados, limitar las escrituras a datos nuevos y mantener alemán como ruta de compatibilidad. Es la propuesta recomendada.

## Diseño propuesto

### Datos

Crear tablas de traducciones para títulos/metadatos de texto y contenido por versión. Para vocabulario, reutilizar las traducciones existentes que expone el core; añadir únicamente las traducciones ausentes y los datos gramaticales por idioma que el modelo actual no puede representar, mediante registros vinculados al significado canónico. Cada registro nuevo tendrá un código de idioma no alemán (`es`, `en`, `fi`, `it`, `pt`) y referencia a la identidad existente del texto, versión o significado. Las claves únicas por fuente e idioma impedirán duplicados. No se copiarán IDs de `vocabulario` como si fueran IDs de significados.

Las migraciones crearán únicamente estructuras nuevas. Sus políticas de lectura respetarán la visibilidad del contenido padre. Los imports serán transaccionales e idempotentes y solo escribirán en las estructuras nuevas. Se comprobará antes que no existan ya estructuras equivalentes reutilizables.

### API y selección de idioma

Mantener la respuesta alemana actual como valor predeterminado. Añadir un parámetro explícito para los otros idiomas y una ruta que lea las traducciones. Una traducción incompleta no se presentará como contenido listo ni se sustituirá silenciosamente por alemán.

Ofrecer por separado el idioma que se aprende y el idioma de la interfaz. El idioma de las explicaciones/traducciones de vocabulario deberá poder ser diferente del idioma aprendido; no producir ejercicios cuya pregunta y traducción sean la misma palabra por compartir ambos ajustes.

### Lectura, ejercicios y progreso

Reutilizar el motor existente. Cada idioma nuevo recibirá términos, ejemplos y datos gramaticales propios. El ejercicio de artículo alemán conservará su comportamiento; en otros idiomas solo se ofrecerán actividades aplicables y con los datos necesarios. Finlandés no recibirá ejercicios de artículos alemanes.

El progreso y las colas de los otros idiomas usarán claves separadas. Los datos locales alemanes existentes no se migrarán ni se borrarán. Los enlaces compartidos de los otros idiomas incorporarán su código, manteniendo las URLs alemanas actuales.

### Contenido

Traducir el catálogo disponible y sus versiones A2/B1/B2/C1 conservando el nivel y la información de cada fuente. Las traducciones son datos nuevos; no se reescribirán los originales. Se conservará la distinción entre traducción de la interfaz y material disponible para practicar.

## Verificación y entrega

- Guardar recuentos y huellas de las filas existentes en las tablas de contenido y vocabulario antes de cualquier import y compararlos después; la comparación debe ser idéntica.
- Probar la migración y una segunda ejecución del import: sin duplicados ni escrituras alemanas.
- Probar las tres API alemanas y sus URLs anteriores sin cambiar su respuesta esperada.
- Probar selección, lectura, vocabulario, actividades y enlaces compartidos de cada idioma añadido, incluido finlandés y caracteres Unicode.
- Probar que cambiar de idioma o reiniciar su progreso no modifica el progreso alemán.
- Entregar rama/PR, migración e import revisables y resultados de las comprobaciones. Mantener cualquier cambio de producción como último paso, después de disponer de esa versión comprobada.

## Decisiones pendientes de revisión

Esta propuesta usa el catálogo actual como fuente de las traducciones y añade ES/EN/FI/IT/PT, los idiomas solicitados en el contexto de Claude. La estructura exacta de las tablas y los parámetros se concretará en el plan a partir del inventario real, conservando los límites anteriores.
