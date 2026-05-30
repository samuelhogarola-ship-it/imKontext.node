# Matriz de variables de entorno — FASE 1

## Regla principal

- frontend y cliente publico: solo `anon`
- backend, migraciones y tareas internas: `service_role`
- nunca exponer `SUPABASE_SERVICE_ROLE_KEY` al frontend
- para listar proyectos o automatizar dumps remotos con Supabase CLI hace falta `SUPABASE_ACCESS_TOKEN` o `supabase login`

## Variables por superficie

| Superficie | Variables obligatorias | Permitido `service_role` | Notas |
| --- | --- | --- | --- |
| `imKontext.node` servidor publico | `SUPABASE_URL`, `SUPABASE_ANON_KEY` | no | mantiene consumo actual REST |
| `imKontext.node/backend` | `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` | si | solo backend privado |
| `VokabelLab` frontend | `SUPABASE_URL`, `SUPABASE_ANON_KEY` | no | completar tras inventario |
| `VokabelLab` backend | `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` | si | completar tras inventario |
| `Rivaz` frontend | `SUPABASE_URL`, `SUPABASE_ANON_KEY` | no | completar tras inventario |
| `Rivaz` backend | `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` | si | completar tras inventario |

## Checklist antes de reapuntar una app

- inventario completo terminado
- backup verificado disponible
- shape de lecturas validado
- policies activas
- SQL de validacion ejecutado
- rollback documentado
- proyecto original intacto
