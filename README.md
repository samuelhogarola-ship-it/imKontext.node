# imKontext.node

## Qué es

`imKontext.node` es una app activa de lectura contextual para aprender alemán. Sirve el frontend desde Node, expone una API local en rutas `/api/*` y consulta contenido y vocabulario desde Supabase.

## Arquitectura

- `server.js`: servidor Node con Express, archivos estáticos y API local.
- `imKontext/`: frontend servido por Node.
- `/api/*`: capa servidor para textos, versiones y vocabulario.
- Supabase: origen de datos para contenidos y vocabulario.

## Stack

- Node.js
- Express
- HTML, CSS y JavaScript en frontend
- Supabase REST API

## Relación con core / Vokabel-World

`imKontext.node` forma parte del ecosistema técnico Vokabel-World. Cuando una necesidad ya existe en `core`, debe reutilizarse antes de crear helpers nuevos. `VokabelLab` actúa como app principal o hub del ecosistema.

## Frontend

El frontend vive en `imKontext/` y se sirve desde el mismo proceso Node. La app carga la interfaz principal, consume la API local y mantiene las URLs shareables y el SEO desde la propia app.

Rutas de interfaz clave:

- `/`
- `/textos/:slug?nivel=A1`
- `/textos/:slug?nivel=A2`
- `/textos/:slug?nivel=B1`
- `/textos/:slug?nivel=B2`
- `/textos/:slug?nivel=C1`

## Backend/API

La API local se expone desde `server.js` en rutas `/api/*`.

Rutas principales:

- `/api/health`
- `/api/texts`
- `/api/text-version`
- `/api/text-version-vocabulary`
- `/api/vocabulario`

## Supabase

La app consulta Supabase desde servidor. Variables soportadas:

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_ANON`
- `PORT`

`SUPABASE_ANON` se acepta como alias de compatibilidad si no se usa `SUPABASE_ANON_KEY`.
`SUPABASE_URL` y `SUPABASE_ANON_KEY` ya no tienen fallbacks hardcodeados: hay que configurarlos en cada entorno. Esto facilita apuntar todas las apps VokabelWorld a un único proyecto Supabase sin arrastrar credenciales del proyecto antiguo.

## Arranque local

```bash
npm install
npm run dev
```

Después abre:

```txt
http://localhost:3000
```

Para una comprobación rápida:

- `http://localhost:3000/api/health`
- `http://localhost:3000/api/texts`

## Deploy

Despliega la raíz completa de `imKontext.node` como app Node.

- comando de arranque: `npm start`
- punto de entrada: `server.js`
- raíz de despliegue: carpeta del proyecto
- variables recomendadas: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `PORT`
- comprobar en producción: `/api/health`, `/api/texts` y una ruta de texto compartible con `?nivel=`
