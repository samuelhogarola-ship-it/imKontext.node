# AGENTS.md

Guía corta para trabajar en `imKontext.node`.

## Principios

- Trata `imKontext.node` como app activa, no como repo provisional.
- Reutiliza `core` antes de crear lógica nueva.
- Mantén URLs shareables y SEO coherentes con el resto de Vokabel-World.
- No metas lógica experimental sin aislarla claramente.
- Haz el cambio más pequeño que resuelva el problema real.

## Reglas útiles

- Si un helper ya existe en `core`, úsalo o extiéndelo antes de duplicarlo aquí.
- Preserva el routing compartible de textos, especialmente `/textos/:slug?nivel=...`.
- Cuida canonical, SEO y share URLs cuando toques routing o metadatos.
- No cambies frontend y API a la vez si no es necesario.
- Evita mezclar cambios visuales con cambios funcionales en la misma PR.
- Si el cambio afecta routing, SEO, share URLs, deploy o lógica compartida, revísalo con más cuidado.
- Cambios en paywall, routing o API requieren PR dedicada.
- Cambios grandes o de varios archivos: rama dedicada y PR.
- Mantén `LabWorldCore` solo como compatibilidad legacy si aparece en código existente.

## Handover

Al cerrar una sesión, deja claro:

- rama actual
- objetivo
- archivos tocados
- pruebas hechas
- riesgo pendiente, si existe
