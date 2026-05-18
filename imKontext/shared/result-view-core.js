/* ═══════════════════════════════════════════════════════════════
   imKontext — shared/result-view-core.js
   Pure helpers for the end-of-session results summary.
   No DOM, no fetch, no globals. Load before practice.js.
═══════════════════════════════════════════════════════════════ */

/* ── ESCAPE ──────────────────────────────────────────────────── */
function escapeHTML(str) {
  const map = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' };
  return String(str ?? '').replace(/[&<>"']/g, c => map[c]);
}

/* ── ROW DATA ────────────────────────────────────────────────── */
// Returns a plain array of row objects — one per answered question.
function buildResumenRows(questionStates, queue) {
  return queue.map((word, i) => {
    const s = questionStates[i];
    if (!s?.answered) return null;
    return {
      german:        word.german,
      spanish:       word.spanish,
      correct:       s.correct,
      correctAnswer: s.correctAnswer || s.solutionText || null,
      wasNoSe:       s.wasNoSe,
      mode:          s.mode,
    };
  }).filter(Boolean);
}

/* ── HTML BUILDER ────────────────────────────────────────────── */
// Returns an HTML string for the full answers list — safe to assign to innerHTML.
function renderResumenHTML(rows) {
  if (!rows.length) return '';
  return rows.map(row => {
    const cls  = row.correct ? 'correct' : 'wrong';
    const icon = row.correct ? '✓' : '✗';
    const correction = (!row.correct && row.correctAnswer)
      ? `<span class="resumen-correction">${escapeHTML(row.correctAnswer)}</span>`
      : '';
    return `<div class="resumen-item ${cls}">` +
      `<span class="resumen-icon">${icon}</span>` +
      `<span class="resumen-word">${escapeHTML(row.german)}</span>` +
      correction +
      `</div>`;
  }).join('');
}
