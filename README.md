# imKontext.node

Base de trabajo para migrar `imKontext` a una app Node.

## Estructura

- `imKontext/`: frontend actual servido por Node.
- `backend/`: backend previo con Express + Supabase y scripts de contenido.
- `actualización/`: versión intermedia usada como referencia para el nuevo flujo.

## Arranque local

```bash
npm install
npm run dev
```

Después abre:

```txt
http://localhost:3000
```

## Variables de entorno

La app Node ya consulta Supabase desde `server.js`. Para local y para producción usa estas variables:

```bash
SUPABASE_URL=https://fvhxbbhxucwawypfzikf.supabase.co
SUPABASE_ANON_KEY=tu_clave_anon
PORT=3000
```

También se acepta `SUPABASE_ANON` como nombre alternativo.

## Despliegue en Hostinger Node

1. Sube la raíz completa del proyecto `imKontext.node`.
2. Asegúrate de que Hostinger arranca desde la raíz, donde están `package.json` y `server.js`.
3. Configura estas variables en el panel de la app Node:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
   - `PORT`
4. Usa como comando de inicio:

```bash
npm start
```

## Comprobación rápida

Cuando esté online, estas rutas deben responder:

- `/api/health`
- `/api/texts`

Si `/api/health` devuelve `supabaseConfigured: true`, la conexión básica está lista.

## Estado actual

- La raíz del proyecto funciona como app Node con `server.js`.
- El frontend ya no habla con Supabase directamente; usa rutas locales `/api/*`.
- La app Node consulta Supabase en servidor y sirve la carpeta `imKontext/`.
