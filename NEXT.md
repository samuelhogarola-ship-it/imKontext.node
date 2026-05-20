# NEXT — Tareas pendientes y enfoque actual

## ENFOQUE ACTUAL
Infraestructura de tests completada. Siguiente área: ampliar cobertura de flujos secundarios.

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
