# Matriz de comparacion Supabase — VokabelWorld

Rellenar esta matriz una vez abiertos los tres proyectos reales.

## Resumen por concepto

| Concepto | imKontext | VokabelLab | Rivaz | Decision | Regla aplicada |
| --- | --- | --- | --- | --- | --- |
| contenido base | existe | no detectado | ? | reutilizar `imKontext` | canonico |
| versiones por nivel | existe | no detectado | ? | reutilizar `imKontext` | canonico |
| relacion texto-vocabulario | existe | no detectado | ? | reutilizar `imKontext` | canonico |
| vocabulario | existe | existe | ? | reutilizar `imKontext` y mapear shape | canonico |
| catalogo de apps | no detectado | no detectado en dump remoto | ? | probablemente crear, salvo que aparezca en otro proyecto | comprobar antes de crear |
| perfiles de usuario | no detectado | `profiles` | ? | reutilizar concepto remoto existente | comprobar antes de crear |
| acceso por app | no detectado | no detectado en dump remoto | ? | pendiente | comprobar antes de crear |
| snapshots de stats | no detectado | no detectado en dump remoto | ? | pendiente | comprobar antes de crear |
| roles admin | no detectado | no detectado en dump remoto | ? | pendiente | comprobar antes de crear |
| auditoria admin | no detectada | no detectada en migracion vista | ? | pendiente | comprobar antes de crear |

## Tabla origen -> destino

| Proyecto origen | Tabla origen | Concepto | Destino en Supabase principal | Accion | Riesgo |
| --- | --- | --- | --- | --- | --- |
| `imKontext` | `texts` | contenido base | `texts` | reutilizar | bajo |
| `imKontext` | `text_versions` | versiones por nivel | `text_versions` | reutilizar | bajo |
| `imKontext` | `text_version_vocabulary` | relacion texto-vocabulario | `text_version_vocabulary` | reutilizar | bajo |
| `imKontext` | `vocabulario` | vocabulario global | `vocabulario` | reutilizar | medio |
| `VokabelLab` | `vocabulario` | vocabulario app publica | `vocabulario` | migrar/reconciliar | medio por shape distinto |
| `VokabelLab` | `profiles` | perfil usuario | pendiente de decidir | extender o renombrar concepto | medio |
| `VokabelLab` | `study_sessions` | sesiones de estudio | pendiente de decidir | evaluar si se conserva o se migra a stats snapshot | medio |
| `VokabelLab` | `session_answers` | respuestas por sesion | pendiente de decidir | evaluar si se conserva o se agrega a snapshot/historial | medio |
| `VokabelLab` | `themas` | agrupacion tematica | pendiente de decidir | mapear a categorias/curriculum | medio |
| `VokabelLab` | `user_progress` | progreso usuario | pendiente de decidir | evaluar convergencia con stats-core remoto | medio-alto |

Acciones permitidas:

- reutilizar
- extender
- migrar
- descartar

## Colisiones detectadas

| Tipo | Objeto | Proyectos afectados | Resolucion propuesta |
| --- | --- | --- | --- |
| naming | `profiles` vs `user_profiles` | VokabelLab vs propuesta FASE 1 | preferir reutilizacion/extension del concepto existente |
| shape | `vocabulario(de, es, artikel, type, thema_id, is_active)` | VokabelLab vs `vocabulario(german, spanish, article, word_type, ...)` en imKontext | mapear columnas y confirmar si son datasets iguales o paralelos |
| discrepancia | migracion local `labworld_secure_platform` vs dump remoto real | VokabelLab local vs VokabelLab remoto | basar la fase 1 en dump remoto real; tratar migracion local como pista, no como estado desplegado |

## Estructuras reutilizables en imKontext

- `texts`
- `text_versions`
- `text_version_vocabulary`
- `vocabulario`

## Estructuras ausentes en imKontext

- catalogo de apps
- perfiles de usuario
- acceso por app
- snapshots remotos de stats
- roles admin/plataforma
- auditoria admin
- sesiones y respuestas de estudio de VokabelLab si se decide preservarlas

## Observaciones finales

- el dump remoto real de `VokabelLab` contiene solo:
  - `profiles`
  - `session_answers`
  - `study_sessions`
  - `themas`
  - `user_progress`
  - `vocabulario`
- por tanto, la migracion local `labworld_secure_platform` no puede asumirse como estado productivo desplegado
- cualquier decision de FASE 1 debe priorizar el dump remoto real sobre migraciones locales no verificadas
- `Rivaz` sigue bloqueando el cierre de la matriz final
