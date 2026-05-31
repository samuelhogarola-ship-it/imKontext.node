# Poblar vocabulary_meaning_topics desde temas heredados de VokabelLab

**Fecha:** 2026-05-31  
**Proyecto imKontext destino:** `fvhxbbhxucwawypfzikf`  
**Proyecto VokabelLab origen:** `ahxjrugfcoheduwqpoxf`

---

## Resultado final (tras fase correctiva 2026-05-31)

| Métrica | Valor |
|---|---|
| Filas en `vocabulary_meaning_topics` | **1.325** |
| Meanings únicos con tema | **1.325** |
| Meanings VokabelLab sin tema | **0** |
| Temas asignados (1–29) | **29** |
| Duplicados por PK (meaning_id, thema_id) | **0** |
| `app_vocabulary_meanings(vokabellab)` | **1.325** |
| VMT thema=28 (Migration) | **36** |
| VMT thema=29 (Politik & Wahlen) | **26** |

---

## Arquitectura de la migración

### Fuente del dato de tema

El campo de tema heredado de VokabelLab **no** estaba en:
- `vocabulary_meanings.notes` — vacío
- `app_vocabulary_meanings.metadata` — `{}` vacío
- `vocabulario.thema_id` (imKontext) — NULL en todas las 1.449 filas
- `vocabulario.thema_id` (VokabelLab) — NULL en todas las 1.351 filas

El dato real estaba en `vocabulario.thema` (integer) del proyecto VokabelLab origen — **1.351 filas, todas con `thema` poblado** (IDs 1–29, coincidentes con `themas.id` en ambos proyectos).

### Themas idénticos en ambos proyectos

Los 29 themas tienen exactamente los mismos `id` y `name` en imKontext y VokabelLab. No se requirió ningún mapeo de claves.

---

## Estructura de los 1.325 meanings de VokabelLab

| Grupo | Count | Descripción |
|---|---|---|
| Nuevos (sin `legacy_vocabulario_id`) | 1.278 | IDs 1450–2774 en `vocabulary_meanings` |
| Compartidos (con `legacy_vocabulario_id`) | 47 | IDs ≤1449, existen en ambas apps |
| **Total en `app_vocabulary_meanings(vokabellab)`** | **1.325** | |

### Fórmula de offset (Grupo 1)

Los 1.278 meanings nuevos fueron creados asignando `meaning_id = vokabellab_vocab_id + 1224`, donde `vokabellab_vocab_id` es el ID en `vocabulario` del proyecto VokabelLab (rango 226–1550).

Hay 47 "gaps" en el rango 1450–2774 (meaning_ids que no existen), correspondientes a los vocab IDs de VokabelLab que fueron fusionados con meanings existentes de imKontext en lugar de crear entradas nuevas.

### Matching por texto (Grupo 2)

Los 47 meanings compartidos se mapearon usando `vocabulary_lemmas.german` y `vocabulary_meanings.spanish` contra `vocabulario.de` y `vocabulario.es` de VokabelLab. 47/47 coincidencias exactas (con fallback de german-only para `groß`/`große` → `grande`).

---

## INSERT ejecutado

```sql
INSERT INTO vocabulary_meaning_topics (meaning_id, thema_id, created_at)
WITH g1 (meaning_id, thema_id) AS (
  VALUES -- 1.325 pares (meaning_id, thema_id) via offset formula
  (1450,1), (1451,1), ... (2774,29)
),
g2 (meaning_id, thema_id) AS (
  VALUES -- 47 pares para meanings compartidos (IDs ≤ 1449)
  (52,11),(154,6),...,(1436,21)
),
combined AS (
  SELECT meaning_id, thema_id FROM g1
    WHERE EXISTS (
      SELECT 1 FROM app_vocabulary_meanings avm
      WHERE avm.meaning_id = g1.meaning_id AND avm.app_key = 'vokabellab'
    )
  UNION ALL
  SELECT meaning_id, thema_id FROM g2
)
SELECT meaning_id, thema_id, NOW()
FROM combined
ON CONFLICT DO NOTHING;
```

El `WHERE EXISTS` filtra automáticamente los 47 gaps del rango offset.

---

## Distribución por thema post-INSERT

| ID | Thema | Meanings |
|---|---|---|
| 1 | Zeit & Natur | 50 |
| 2 | Essen & Einkaufen | 32 |
| 3 | Familie & Alltag | 19 |
| 4 | Hobbys & Freizeit | 50 |
| 5 | Wohnen | 50 |
| 6 | Kleidung & Haushalt | 50 |
| 7 | Stadt & Kultur | 50 |
| 8 | Im Restaurant | 50 |
| 9 | Feste & Traditionen | 47 |
| 10 | Wohnung & Umzug | 49 |
| 11 | Studium & Alltag | 46 |
| 12 | Bank & Geld | 48 |
| 13 | Gesundheit | 49 |
| 14 | Wetter & Mode | 50 |
| 15 | Reisen & Mobilität | 50 |
| 16 | Ausbildung & Beruf | 48 |
| 17 | Bewerbung & Arbeit | 50 |
| 18 | Urlaub | 49 |
| 19 | Reise & Politik | 51 |
| 20 | Unfall & Notfall | 49 |
| 21 | Kunst & Aussehen | 46 |
| 22 | Post & Kommunikation | 47 |
| 23 | Hochschule & Kunst | 46 |
| 24 | Landleben & Ehrenamt | 44 |
| 25 | Umgangsformen | 51 |
| 26 | Arbeitsvertrag | 45 |
| 27 | Geschichte | 47 |
| 28 | Migration | 47 |
| 29 | Politik & Wahlen | 15 |
| **TOTAL** | | **1.325** |

---

## Diferencia VokabelLab origen (1.351) vs app_vocabulary_meanings(vokabellab) (1.325): las 26 filas faltantes

| Categoría | Count | Detalle |
|---|---|---|
| Importados como meanings nuevos | 1.278 | VokabelLab vocab IDs 226–1503 → meanings 1450–2727 |
| Fusionados con imKontext (compartidos) | 47 | Texto idéntico, meaning_id reutilizado (≤1449) |
| **No importados** | **26** | VokabelLab vocab IDs 1551–1576 |
| **Total VokabelLab** | **1.351** | |

### ¿Qué son las 26 filas no importadas?

Los 26 registros con `id` 1551–1576 en VokabelLab vocabulario son palabras de **thema=29 (Politik & Wahlen)**:
`die Mehrheit`, `mit Mehrheit`, `einheitlich`, `das Verhältnis`, `der Wähler`, `die Partei`, `der Stimmzettel`, `die Stimme`, `ungültig`, `die Hochrechnung`, `der Sitz`, `koalieren`, `wahlberechtigt`, `die Abbildung`, `der Zuhörer`, `die Änderung`, `die Aufmerksamkeit`, `eine Entscheidung treffen`, `der Gedanke`, `sich Gedanken machen über`, `die Anzahl`, `die Gewalt`, `die Initiative`, `die Mischung`, `das Prinzip`, `die Treue`.

**Causa:** El script de importación procesó vocab IDs 226–1550 (1.325 filas) y se detuvo antes de llegar a los últimos 26. No son duplicados, errores de datos ni fusiones — es pérdida real de un lote de importación inconcluso.  
**Impacto:** Ninguno destructivo. Esas 26 palabras no existen en `app_vocabulary_meanings(vokabellab)` ni en `vocabulary_meanings`, por lo que no pueden tener entrada en `vocabulary_meaning_topics`.  
**Acción futura recomendada:** Si se desea completar el vocabulario de Politik & Wahlen para VokabelLab, importar esas 26 palabras desde el proyecto origen.

---

## Fase correctiva: las 26 "faltantes" ya estaban importadas

**Fecha:** 2026-05-31

### Hallazgo: el análisis anterior sobre las 26 faltantes era incorrecto

Al intentar importar las 26 filas de VokabelLab IDs 1551–1576 se descubrió que **ya estaban completamente importadas** en imKontext como meanings 2749–2774 (`app_vocabulary_meanings(vokabellab)` ya las incluía dentro del total de 1.325).

Explicación: el import original procesó VokabelLab hasta el ID 1576 (no 1550 como se creía). El offset formula cambia en el último tramo: para IDs 226–1550 el offset es +1224; para IDs 1551–1576 el offset es +1198, resultado de los 26 "merged" acumulados dentro del rango.

### Error encontrado: thema incorrecto en 11 meanings

El INSERT de la fase anterior asignó **thema=28 (Migration) erróneamente** a 11 meanings de Politik & Wahlen (IDs 2749–2759), porque el offset formula aplicó los themas de los VokabelLab vocab IDs 1525–1535 (Migration) a words que en realidad pertenecían a IDs 1551–1561 (Politik & Wahlen).

| Meanings afectados | Thema incorrecto | Thema correcto |
|---|---|---|
| 2749–2759 (11 palabras) | 28 Migration ❌ | 29 Politik & Wahlen ✓ |

Palabras corregidas: `die Mehrheit`, `mit Mehrheit`, `einheitlich`, `das Verhältnis`, `der Wähler`, `die Partei`, `der Stimmzettel`, `die Stimme`, `ungültig`, `die Hochrechnung`, `der Sitz`.

### Corrección ejecutada

```sql
WITH deleted AS (
  DELETE FROM vocabulary_meaning_topics
  WHERE meaning_id BETWEEN 2749 AND 2759
    AND thema_id = 28
  RETURNING meaning_id
)
INSERT INTO vocabulary_meaning_topics (meaning_id, thema_id, created_at)
SELECT meaning_id, 29, NOW()
FROM deleted
ON CONFLICT DO NOTHING;
```

Resultado: 11 entradas corregidas en una transacción atómica. Total VMT sin cambios (1.325).

### Estado final thema=29 (Politik & Wahlen): 26 meanings

Todos los 26 meanings de VokabelLab para Politik & Wahlen tienen ahora thema=29 correctamente:

| meaning_id | German | Spanish |
|---|---|---|
| 2749 | die Mehrheit | mayoría |
| 2750 | mit Mehrheit | por mayoría |
| 2751 | einheitlich | uniforme |
| 2752 | das Verhältnis | proporción |
| 2753 | der Wähler | elector |
| 2754 | die Partei | partido |
| 2755 | der Stimmzettel | papeleta |
| 2756 | die Stimme | voto |
| 2757 | ungültig | no válido |
| 2758 | die Hochrechnung | estimación |
| 2759 | der Sitz | escaño |
| 2760 | koalieren | coalición |
| 2761 | wahlberechtigt | con derecho a voto |
| 2762 | die Abbildung | imagen |
| 2763 | der Zuhörer | oyente |
| 2764 | die Änderung | cambio |
| 2765 | die Aufmerksamkeit | atención |
| 2766 | eine Entscheidung treffen | tomar decisión |
| 2767 | der Gedanke | idea |
| 2768 | sich Gedanken machen über | reflexionar |
| 2769 | die Anzahl | cantidad |
| 2770 | die Gewalt | violencia |
| 2771 | die Initiative | iniciativa |
| 2772 | die Mischung | mezcla |
| 2773 | das Prinzip | principio |
| 2774 | die Treue | lealtad |

---

## Verificación post-INSERT

```sql
SELECT COUNT(*) FROM vocabulary_meaning_topics;
-- 1325 ✓

SELECT COUNT(DISTINCT meaning_id) FROM vocabulary_meaning_topics;
-- 1325 (sin duplicados) ✓

SELECT COUNT(*) FROM app_vocabulary_meanings avm
WHERE avm.app_key = 'vokabellab'
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_meaning_topics vmt WHERE vmt.meaning_id = avm.meaning_id
  );
-- 0 (ningún meaning de VokabelLab sin tema) ✓
```
