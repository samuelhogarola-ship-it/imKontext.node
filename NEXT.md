# NEXT — Tareas pendientes y enfoque actual

## ENFOQUE ACTUAL
Core léxico unificado operativo en imKontext. PR #63 en revisión de CI.
Próximo foco: merge PR #63 → conectar VokabelLab al core en su repo → conectar DerDieDas → retirar `vocabulario` + `text_version_vocabulary`.

---

## Tareas pendientes

### Core léxico — pendiente de otros repos
- [ ] **VokabelLab**: conectar frontend a `vocabulary_meanings WHERE app_key='vokabellab'` + join `vocabulary_meaning_topics` para themas. Pool disponible en Supabase, listo para consumir.
- [ ] **DerDieDas**: conectar frontend a `app_vocabulary_lemmas WHERE app_key='der-die-das'` + `vocabulary_lemmas` (article ya poblado en 812 lemmas).
- [ ] **Retirar tablas legacy**: una vez VokabelLab y DerDieDas en producción, aplicar `DROP TABLE vocabulario` y `DROP TABLE text_version_vocabulary` en una migración final.
- [ ] **59 meanings de imKontext sin thema**: no están vinculados a ningún texto. Asignar temáticamente si en algún momento se publican.

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
- [x] Core léxico unificado — imKontext conectado al core (PR #63): `text_version_meanings`, `example_es`, vista `text_version_vocabulary_core`, endpoint `/api/text-version-vocabulary-core`, themas asignados a 1,390 meanings, legacy eliminado de server.js — CI ✅
- [x] Google Analytics GA4 (G-KT1FWQKQEX) integrado con Consent Mode v2 — PR #55, CI ✅
- [x] Snapshots visuales regenerados en Linux (ubuntu-latest) para evitar drift macOS/CI
- [x] Workflow `update-snapshots.yml` añadido para regenerar baselines en Linux cuando sea necesario
- [x] Footer compartido visible en `/`, `/metodologia` y `/legal`
- [x] Enlace **Web Fuengirola Studio** añadido al footer en todas las páginas
- [x] `shared/app-footer.js` — plantilla de footer como módulo core; metodologia y legal la cargan dinámicamente
- [x] Landing ajustada para mostrar el footer sin scroll y CTA actualizado a "Empieza ahora"
- [x] `data-testid` en elementos dinámicos (`featured-card`, `text-row`, `palabra-token`)
- [x] Nav links movidos a footer en páginas internas (PR #39)
- [x] Bottom bar landing: Metodología · Contacto · Legal, todos como botones (PR #40)
- [x] `/metodologia` — página con método, tipos de ejercicio, niveles y cards de ecosistema (PR #40)
- [x] `/legal` — Aviso Legal LSSI + Política Privacidad RGPD + Cookies; email con [RELLENAR] (PR #40)
- [x] `core/legal.js` — módulo compartido de bottom bar y estructura de página legal (PR #16)
- [x] `core/page-footer.js` + `page-footer.css` — patrón footer-2page como módulo core (PR #17)
