# Checklist de cutover y rollback — FASE 1

## Antes del cutover

- backup completo de `imKontext`
- backup completo de `VokabelLab`
- backup completo de `Rivaz`
- backups verificados
- backups almacenados fuera de Supabase
- inventario completo de los tres proyectos
- matriz origen -> destino completa
- colisiones resueltas
- SQL de preflight ejecutado
- SQL de validacion ejecutado
- validacion de lecturas por app completada
- plan de rollback documentado

## Durante el cutover

- activar ventana de mantenimiento si hace falta
- congelar cambios manuales sobre proyectos origen
- ejecutar migracion en orden planificado
- validar lecturas criticas de `imKontext`
- validar lecturas criticas de `VokabelLab`
- validar lecturas criticas de `Rivaz`
- cambiar variables de entorno
- redeploy de superficies necesarias

## Despues del cutover

- verificar `/api/health` de `imKontext`
- verificar `/api/texts` de `imKontext`
- verificar lecturas propias de `VokabelLab`
- verificar lecturas propias de `Rivaz`
- confirmar que ningun frontend usa `service_role`
- confirmar que las rutas publicas de `imKontext` no cambian
- mantener proyectos origen intactos varios dias

## Rollback

Si algo falla:

- restaurar variables de entorno originales
- redeploy
- volver a proyectos Supabase originales

No hacer:

- restauracion de datos como primer paso
- reconstruccion de infraestructura
- cambios manuales destructivos en el proyecto destino durante rollback
