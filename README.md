# imKontext.node

Base de trabajo para migrar `imKontext` a una app Node.

## Estructura

- `imKontext/`: frontend actual servido por Node.
- `backend/`: backend previo con Express + Supabase y scripts de contenido.
- `actualización/`: versión intermedia usada como referencia para el nuevo flujo.

## Arranque

```bash
npm install
npm run dev
```

Después abre:

```txt
http://localhost:3000
```

## Estado actual

- La raíz del proyecto ya funciona como app Node con `server.js`.
- Node sirve estáticamente la carpeta `imKontext/`.
- El frontend sigue leyendo los textos directamente desde Supabase.
- `backend/` sigue disponible como referencia para una futura integración de API dentro de la app Node.

## Siguiente paso recomendado

Mover gradualmente la lógica que hoy vive en el frontend o en `backend/` hacia una sola app Node, empezando por:

1. centralizar variables de entorno
2. decidir si Supabase se consume desde cliente o desde servidor
3. integrar rutas `/api/*` propias en la raíz del proyecto
