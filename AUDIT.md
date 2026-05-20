# AUDIT — Registro estratégico del proyecto

## 2026-05-20 — Infraestructura de tests E2E

### Qué se construyó
Suite Playwright completa para `imKontext.node`, dividida en dos capas:

**Capa mockeada** (`e2e/`, CI):
- 9 tests sin dependencia de red ni Supabase
- Fixtures locales en `e2e/fixtures/` (texts, text-version, vocabulary)
- Helper `mockApi(page)` intercepta las 3 rutas API por `url.pathname` exacto
- Corre en cada PR y push a `main` vía GitHub Actions

**Capa de integración** (`integration/`, manual):
- 4 tests que verifican la conexión real con Supabase
- Comprueban shape del API, existencia de textos accesibles y contenido de versión
- Se ejecutan con `npm run test:integration` — nunca en CI

### Decisiones estratégicas
- **Mocks sobre fixtures estáticas**: elegido frente a un servidor fake o base de datos de test.
  Mantenimiento bajo, cobertura suficiente para smoke/flujo.
- **Integración separada de CI**: los tests de Supabase son lentos y dependen de datos
  cambiantes. Mantenerlos fuera de CI evita falsos negativos por downtime o cambios de contenido.
- **data-testid en lugar de selectores CSS**: los tres elementos dinámicos clave
  (`featured-card`, `text-row`, `palabra-token`) usan atributos de test estables.

### Riesgos conocidos
- Fixtures pueden quedar desactualizadas si cambia el schema de Supabase.
  Mitigación: `npm run test:integration` como chequeo manual periódico.
- Si desaparece el último texto `free` en Supabase, los tests de integración fallan.
  Los E2E mockeados no se ven afectados.
