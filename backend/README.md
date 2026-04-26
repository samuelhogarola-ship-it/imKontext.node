# Backend imKontext

Este backend lee el vocabulario desde Supabase y expone `GET /api/vocabulario`.

## Variables necesarias

1. Copia `.env.example` a `.env`.
2. Rellena:

```env
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_SERVICE_ROLE_KEY=tu-service-role-key
# Opcional si no quieres usar service role:
# SUPABASE_ANON_KEY=tu-anon-key
PORT=3000
```

`SUPABASE_SERVICE_ROLE_KEY` es la opción recomendada para el backend. Si tienes RLS activo, con `SUPABASE_ANON_KEY` puede fallar la lectura de `vocabulario`.

## Actualizar la base de datos

Ejecuta el contenido de [deutsch-aktuell-mulltonnenrennen.sql](/Users/sam/Documents/imKontext/backend/deutsch-aktuell-mulltonnenrennen.sql) en el SQL Editor de Supabase.

Ese script:

- hace `upsert` del texto en `texts`
- hace `upsert` de los niveles en `text_versions`
- inserta el vocabulario que falte en `vocabulario`

## Comprobaciones rápidas

- `GET /api/health` confirma si faltan variables de entorno
- `GET /api/vocabulario` devuelve el vocabulario ya transformado para el frontend
