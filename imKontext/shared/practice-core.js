function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

function normalize(str) {
  return String(str ?? "").trim().toLowerCase();
}

function getRandomWrong(word, pool, n) {
  const others = pool.filter((w) => w.id !== word.id);
  const sameType = word.word_type
    ? shuffle(others.filter((w) => w.word_type === word.word_type))
    : [];

  if (sameType.length >= n) {
    return sameType.slice(0, n);
  }

  const usedIds = new Set(sameType.map((w) => w.id));
  const fallback = shuffle(others.filter((w) => !usedIds.has(w.id)));
  return [...sameType, ...fallback].slice(0, n);
}

function buildQueue(vocab, n, errorIds) {
  const ids = errorIds || [];
  const shuffled = shuffle(vocab);
  const capped = Math.min(n, shuffled.length);

  if (!ids.length) {
    return shuffled.slice(0, capped);
  }

  const errors = shuffled.filter((w) => ids.includes(w.id));
  const fresh = shuffled.filter((w) => !ids.includes(w.id));
  const errorSlice = errors.slice(0, capped);
  const freshSlice = fresh.slice(0, Math.max(0, capped - errorSlice.length));
  return [...errorSlice, ...freshSlice];
}

function getModoForIdx(idx, selectedModos, fallbackModos) {
  if (selectedModos && selectedModos.length === 1) {
    return selectedModos[0];
  }

  if (selectedModos && selectedModos.length > 1) {
    return selectedModos[idx % selectedModos.length];
  }

  return fallbackModos[idx % fallbackModos.length];
}

function blankifyWord(sentence, german) {
  if (!sentence) {
    return null;
  }

  function escRx(str) {
    return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  }

  const tryReplace = (term) => {
    const re = new RegExp(`\\b${escRx(term)}\\b`, "i");
    return re.test(sentence) ? sentence.replace(re, "______") : null;
  };

  let result = tryReplace(german);
  if (result) {
    return result;
  }

  const noArticle = german.replace(
    /^(der|die|das|den|dem|des|ein|eine|einen|einem|einer)\s+/i,
    ""
  );

  if (noArticle !== german) {
    result = tryReplace(noArticle);
    if (result) {
      return result;
    }
  }

  return null;
}

function getProgressPercent(correct, total) {
  return total > 0 ? Math.round((correct / total) * 100) : 0;
}

function createScore() {
  return { correct: 0, wrong: 0 };
}

const practiceCore = {
  shuffle,
  normalize,
  getRandomWrong,
  buildQueue,
  getModoForIdx,
  blankifyWord,
  getProgressPercent,
  createScore
};

if (typeof window !== "undefined") {
  window.LabWorldCore = window.LabWorldCore || {};
  Object.assign(window.LabWorldCore, practiceCore);
}

export {
  blankifyWord,
  buildQueue,
  createScore,
  getModoForIdx,
  getProgressPercent,
  getRandomWrong,
  normalize,
  shuffle
};
