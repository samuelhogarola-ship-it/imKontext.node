# NEXT — Tareas pendientes y enfoque actual

## ENFOQUE ACTUAL
Footer + páginas legales completas y mergeadas. Tests pendientes de la sesión anterior siguen abiertos.

---

## Tareas pendientes

### Tests E2E
- [ ] Añadir test para el flujo **"Repasar solo errores"**:
  responder mal → terminar → botón "Repasar errores" → nuevo ejercicio arranca
  Es el único flujo principal sin cobertura todavía.

### Mantenimiento de fixtures
- [ ] Si se añade o renombra un campo en Supabase, actualizar los tres fixtures:
  `e2e/fixtures/texts.json`, `text-version.json`, `vocabulary.json`
  Ejecutar `npm run test:integration` para detectar desviaciones.

---

## Completado (referencia)
- [x] Playwright configurado y funcionando localmente (puerto 3100)
- [x] 9 tests E2E mockeados — smoke, practice, errors
- [x] Suite de integración Supabase separada (`npm run test:integration`)
- [x] CI en GitHub Actions (solo suite mockeada)
- [x] `data-testid` en elementos dinámicos (`featured-card`, `text-row`, `palabra-token`)
- [x] Nav links movidos a footer en páginas internas (PR #39)
- [x] Bottom bar landing: Metodología · Contacto · Legal, todos como botones (PR #40)
- [x] `/metodologia` — página con método, tipos de ejercicio, niveles y cards de ecosistema (PR #40)
- [x] `/legal` — Aviso Legal LSSI + Política Privacidad RGPD + Cookies; email con [RELLENAR] (PR #40)
- [x] `core/legal.js` — módulo compartido de bottom bar y estructura de página legal (PR #16)
- [x] `core/page-footer.js` + `page-footer.css` — patrón footer-2page como módulo core (PR #17)
