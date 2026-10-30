/* ═══════════════════════════════════════════════════════════════
   imKontext — shared/practice-core.js
   Pure, DOM-free helpers for all exercise modes.
   No fetch, no document, no localStorage, no globals.
   Must be loaded before app.js and practice.js.
═══════════════════════════════════════════════════════════════ */

/* ── SHUFFLE ─────────────────────────────────────────────────── */
// Fisher-Yates — unbiased, unlike sort(random).
function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

/* ── NORMALIZE ───────────────────────────────────────────────── */
// Case-insensitive, trimmed comparison base.
function normalize(str) {
  return String(str ?? '').trim().toLowerCase();
}

/* ── DISTRACTORS ─────────────────────────────────────────────── */
// Returns n words from pool that are not the target.
// Prefers same word_type; falls back to full pool when needed.
function getRandomWrong(word, pool, n) {
  const others = pool.filter(w => w.id !== word.id);
  const sameType = word.word_type
    ? shuffle(others.filter(w => w.word_type === word.word_type))
    : [];
  if (sameType.length >= n) return sameType.slice(0, n);
  const usedIds = new Set(sameType.map(w => w.id));
  const fallback = shuffle(others.filter(w => !usedIds.has(w.id)));
  return [...sameType, ...fallback].slice(0, n);
}

/* ── TEST DIRECTION ─────────────────────────────────────────── */
// Maps already-localized vocabulary fields into the visible Test sides.
// Unknown values default to reverse so a new session asks for the language
// the learner is practising.
function buildTestDirectionData(fields, direction) {
  const normalizedDirection = direction === 'forward' ? 'forward' : 'reverse';
  const reverse = normalizedDirection === 'reverse';
  return {
    direction: normalizedDirection,
    prompt: reverse ? fields.nativeWord : fields.targetWord,
    answer: reverse ? fields.targetWord : fields.nativeWord,
    answerColumn: reverse ? fields.targetColumn : fields.nativeColumn,
    promptLang: reverse ? fields.nativeLang : fields.targetLang,
    answerLang: reverse ? fields.targetLang : fields.nativeLang,
  };
}

function hasUsableTestPair(data) {
  return Boolean(normalize(data?.prompt) && normalize(data?.answer));
}

/* ── QUEUE BUILDER ───────────────────────────────────────────── */
// Builds a capped, shuffled queue. Words in errorIds are placed first.
function buildQueue(vocab, n, errorIds) {
  const ids = errorIds || [];
  const shuffled = shuffle(vocab);
  const capped = Math.min(n, shuffled.length);
  if (!ids.length) return shuffled.slice(0, capped);
  const errors = shuffled.filter(w => ids.includes(w.id));
  const fresh  = shuffled.filter(w => !ids.includes(w.id));
  const errorSlice = errors.slice(0, capped);
  const freshSlice = fresh.slice(0, Math.max(0, capped - errorSlice.length));
  return [...errorSlice, ...freshSlice];
}

/* ── MODE SELECTOR ───────────────────────────────────────────── */
// Returns the mode name for idx given app overrides and a fallback list.
function getModoForIdx(idx, selectedModos, fallbackModos) {
  if (selectedModos && selectedModos.length === 1) return selectedModos[0];
  if (selectedModos && selectedModos.length > 1) return selectedModos[idx % selectedModos.length];
  return fallbackModos[idx % fallbackModos.length];
}

/* ── BLANK BUILDER ───────────────────────────────────────────── */
// Replaces the target word in a sentence with ______, or returns null.
// Uses stripArticle() from i18n.js when available, falls back to German articles.
function blankifyWord(sentence, word) {
  if (!sentence) return null;

  function escRx(str) {
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }

  const tryReplace = (term) => {
    const re = new RegExp(`\\b${escRx(term)}\\b`, 'i');
    return re.test(sentence) ? sentence.replace(re, '______') : null;
  };

  let result = tryReplace(word);
  if (result) return result;

  const noArticle = typeof stripArticle === 'function'
    ? stripArticle(word)
    : word.replace(/^(der|die|das|den|dem|des|ein|eine|einen|einem|einer)\s+/i, '');
  if (noArticle !== word) {
    result = tryReplace(noArticle);
    if (result) return result;
  }

  return null;
}

/* ── PROGRESS ────────────────────────────────────────────────── */
function getProgressPercent(correct, total) {
  return total > 0 ? Math.round((correct / total) * 100) : 0;
}

function createScore() {
  return { correct: 0, wrong: 0 };
}
