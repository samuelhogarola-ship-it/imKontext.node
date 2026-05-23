# NEXT — Tareas pendientes y enfoque actual

## ENFOQUE ACTUAL
Polish editorial visual system en toda la app (landing, app principal y páginas estáticas), sin tocar lógica ni layout. Después queda como gap principal el E2E de "Repasar solo errores".

---

## Tareas pendientes

### Footer
- [ ] Añadir enlace **web fuengirola** al footer (`#app-footer` y páginas estáticas)
- [ ] Cargar la plantilla del footer desde un archivo en `core/` en lugar de duplicarla en cada HTML

### Tests E2E
- [ ] Añadir test para el flujo **"Repasar solo errores"**:
  responder mal → terminar → botón "Repasar errores" → nuevo ejercicio arranca
  Es el único flujo principal sin cobertura todavía.

### Mantenimiento de fixtures
- [ ] Si se añade o renombra un campo en Supabase, actualizar los tres fixtures:
  `e2e/fixtures/texts.json`, `text-version.json`, `vocabulary.json`
  Ejecutar `npm run test:integration` para detectar desviaciones.
  Trabajo postergado: no meter todavía esta suite en CI.

---

## Completado (referencia)
- [x] Playwright configurado y funcionando localmente (puerto 3100)
- [x] 9 tests E2E mockeados — smoke, practice, errors
- [x] Suite de integración Supabase separada (`npm run test:integration`)
- [x] CI en GitHub Actions (solo suite mockeada)
- [x] Suite de visual regression con Playwright estabilizada para CI (`e2e/visual.spec.js`)
- [x] Footer compartido visible en `/`, `/metodologia` y `/legal`
- [x] Landing ajustada para mostrar el footer sin scroll y CTA actualizado a "Empieza ahora"
- [x] `data-testid` en elementos dinámicos (`featured-card`, `text-row`, `palabra-token`)
- [x] Nav links movidos a footer en páginas internas (PR #39)
- [x] Bottom bar landing: Metodología · Contacto · Legal, todos como botones (PR #40)
- [x] `/metodologia` — página con método, tipos de ejercicio, niveles y cards de ecosistema (PR #40)
- [x] `/legal` — Aviso Legal LSSI + Política Privacidad RGPD + Cookies; email con [RELLENAR] (PR #40)
- [x] `core/legal.js` — módulo compartido de bottom bar y estructura de página legal (PR #16)
- [x] `core/page-footer.js` + `page-footer.css` — patrón footer-2page como módulo core (PR #17)
