# Matriz de comparacion Supabase — VokabelWorld

Rellenar esta matriz una vez abiertos los tres proyectos reales.

## Resumen por concepto

| Concepto | imKontext | VokabelLab | Rivaz | Decision | Regla aplicada |
| --- | --- | --- | --- | --- | --- |
| contenido base | existe | no detectado | ? | reutilizar `imKontext` | canonico |
| versiones por nivel | existe | no detectado | ? | reutilizar `imKontext` | canonico |
| relacion texto-vocabulario | existe | no detectado | ? | reutilizar `imKontext` | canonico |
| vocabulario | existe | existe | ? | reutilizar `imKontext` y mapear shape | canonico |
| catalogo de apps | no detectado | `apps_catalog` | ? | reutilizar concepto de VokabelLab si `imKontext` no tiene equivalente real | comprobar antes de crear |
| perfiles de usuario | no detectado | `profiles` | ? | reutilizar concepto de VokabelLab si `imKontext` no tiene equivalente real | comprobar antes de crear |
| acceso por app | no detectado | `user_app_access` | ? | reutilizar concepto de VokabelLab si `imKontext` no tiene equivalente real | comprobar antes de crear |
| snapshots de stats | no detectado | `user_stats_snapshots` | ? | extender porque falta `app_id` en VokabelLab | comprobar antes de crear |
| roles admin | no detectado | `platform_roles` | ? | comparar con candidato `admin_roles` | comprobar antes de crear |
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
| `VokabelLab` | `apps_catalog` | catalogo apps | pendiente de decidir | extender/reutilizar | medio |
| `VokabelLab` | `user_app_access` | acceso por app | pendiente de decidir | extender/reutilizar | medio |
| `VokabelLab` | `user_stats_snapshots` | snapshot remoto stats | pendiente de decidir | extender | alto por falta de `app_id` |
| `VokabelLab` | `platform_roles` | rol admin plataforma | pendiente de decidir | extender/reutilizar | medio |

Acciones permitidas:

- reutilizar
- extender
- migrar
- descartar

## Colisiones detectadas

| Tipo | Objeto | Proyectos afectados | Resolucion propuesta |
| --- | --- | --- | --- |
| naming | `apps_catalog` vs `app_catalog` | VokabelLab vs propuesta FASE 1 | no crear tabla nueva hasta decidir si se reutiliza `apps_catalog` |
| naming | `profiles` vs `user_profiles` | VokabelLab vs propuesta FASE 1 | preferir reutilizacion/extension del concepto existente |
| naming | `platform_roles` vs `admin_roles` | VokabelLab vs propuesta FASE 1 | validar si `platform_roles` cubre el mismo concepto |
| modelo | `user_stats_snapshots` sin `app_id` | VokabelLab vs direccion unificada | extender modelo o migrar a PK compuesta |
| datos | `apps_catalog.id = vokabel-lab` | VokabelLab vs `app_id` previsto `vokabellab` | definir mapeo canonico antes del cutover |
| shape | `vocabulario(de, es, artikel, type, thema_id, is_active)` | VokabelLab vs `vocabulario(german, spanish, article, word_type, ...)` en imKontext | mapear columnas y confirmar si son datasets iguales o paralelos |

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

## Observaciones finales

- `VokabelLab` ya aporta un modelo real de plataforma segura; antes de crear tablas candidatas nuevas en `imKontext` hay que comparar contra este modelo
- `Rivaz` sigue bloqueando el cierre de la matriz final
