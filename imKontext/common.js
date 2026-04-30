/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — common.js
   Shared configuration: dashboard, exercise stats, error behavior.
   Must be loaded before app.js and practice.js.
═══════════════════════════════════════════════════════════════ */

/* ── EXERCISE CONFIG ─────────────────────────────────────────── */
const EXERCISE_CONFIG = {
  autoNextDelay: 3,   // seconds before auto-advancing after correct answer
  optionsCount: 4,    // multiple-choice options per question
  minWords: 5,
  defaultWords: 10,
};

/* ── ERROR BEHAVIOR ──────────────────────────────────────────── */
const ERROR_CONFIG = {
  prioritizeErrors: true,   // show error words first in next session
  persistAcrossMenu: true,  // remember errors when returning to menu
};

/* ── DASHBOARD CONFIG ────────────────────────────────────────── */
const DASHBOARD_CONFIG = {
  showWeeklyProgress: true,
  showAccuracy: true,
  showStreak: false,        // reserved — not yet implemented
  progressThresholds: {
    good: 80,               // ≥80 % → green
    ok: 60,                 // ≥60 % → yellow
    // below 60 → red
  },
};

/* ── PERSISTED ERRORS ────────────────────────────────────────── */
// In-memory store of word IDs the user got wrong in the last session.
// Survives navigation back to the activity menu but clears on page reload.
// Cleared automatically once consumed as the front of a new queue.

let persistedErrorIds = [];

function saveSessionErrors(wrongWords) {
  persistedErrorIds = (wrongWords || []).map(w => w.id);
}

function getPersistedErrors(vocab) {
  if (!persistedErrorIds.length) return [];
  return vocab.filter(v => persistedErrorIds.includes(v.id));
}

function clearPersistedErrors() {
  persistedErrorIds = [];
}
