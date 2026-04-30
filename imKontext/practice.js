/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — practice.js
   Exercise engine. Depends on globals set by app.js:
     $, selectedText, selectedLevel, selectedTextVersion,
     numPalabras, currentVocab, queue, currentIdx, score,
     wrongWords, selectedModos, slider, apiFetch, showScreen,
     goToTextos, refreshSelectedTextVersion
   Also depends on common.js:
     EXERCISE_CONFIG, saveSessionErrors, getPersistedErrors,
     clearPersistedErrors
═══════════════════════════════════════════════════════════════ */

/* ── START PRACTICE ──────────────────────────────────────────── */
$('btn-empezar').addEventListener('click', startPractice);

async function startPractice() {
  if (!selectedText) return;

  $('btn-empezar').disabled = true;
  $('btn-empezar').textContent = 'Cargando…';

  try {
    const version = selectedTextVersion && String(selectedTextVersion.level || '').toLowerCase() === selectedLevel
      ? selectedTextVersion
      : await refreshSelectedTextVersion({ updateContent: false });
    if (!version?.id) throw new Error('No hay versión para este nivel.');
    const vId = version.id;

    const links = await apiFetch(
      `/api/text-version-vocabulary?textVersionId=${encodeURIComponent(vId)}`
    );
    const vocabIds = links.map(l => l.vocabulario_id);
    if (!vocabIds.length) throw new Error('No hay vocabulario para este texto y nivel.');

    const vocab = await apiFetch(
      `/api/vocabulario?ids=${encodeURIComponent(vocabIds.join(','))}`
    );
    currentVocab = vocab;

    // Build queue: persisted errors first, then fresh words up to numPalabras
    const shuffled = [...vocab].sort(() => Math.random() - .5);
    const n = Math.min(numPalabras, shuffled.length);
    const errorWords = getPersistedErrors(shuffled);
    const freshWords = shuffled.filter(w => !persistedErrorIds.includes(w.id));
    const errorSlice = errorWords.slice(0, n);
    const freshSlice = freshWords.slice(0, Math.max(0, n - errorSlice.length));
    queue = [...errorSlice, ...freshSlice];
    clearPersistedErrors();

    currentIdx = 0;
    score = { correct: 0, wrong: 0 };
    wrongWords = [];

    const pKey = `progress_${selectedText.id}_${selectedLevel}`;
    const existing = JSON.parse(localStorage.getItem(pKey) || 'null');
    localStorage.setItem(pKey, JSON.stringify({
      total: vocab.length,
      done: existing?.done || 0,
    }));

    slider.max = vocab.length;
    $('slider-max-label').textContent = vocab.length;

    showScreen('ejercicio');
    buildExercise();

  } catch (err) {
    console.error(err);
    $('error-msg').textContent = `Error: ${err.message}`;
  } finally {
    $('btn-empezar').disabled = false;
    $('btn-empezar').textContent = 'Empezar práctica 🚀';
  }
}

/* ══════════════════════════════════════════════════════════════
   EJERCICIO ENGINE
══════════════════════════════════════════════════════════════ */
const MODOS = ['test', 'flashcards', 'ordenar', 'articulo', 'lueckentext'];

function getModo(idx) {
  if (selectedModos && selectedModos.length === 1) return selectedModos[0];
  if (selectedModos && selectedModos.length > 1) return selectedModos[idx % selectedModos.length];
  return MODOS[idx % MODOS.length];
}

function buildExercise() {
  if (currentIdx >= queue.length) {
    showResultado(); return;
  }

  const word  = queue[currentIdx];
  const modo  = getModo(currentIdx);
  const total = queue.length;

  $('prog-actual').textContent = currentIdx + 1;
  $('prog-total').textContent  = total;
  $('prog-fill').style.width   = `${((currentIdx) / total) * 100}%`;

  const dotsWrap = $('progreso-dots');
  dotsWrap.innerHTML = '';
  queue.forEach((_, i) => {
    const d = document.createElement('div');
    d.className = 'progreso-dot' + (i < currentIdx ? ' correct' : i === currentIdx ? ' current' : '');
    dotsWrap.appendChild(d);
  });

  const labels = {
    test: '🎯 Test', flashcards: '🃏 Flashcard',
    ordenar: '🔀 Ordenar', articulo: '📖 Artículo', lueckentext: '✏️ Lückentext'
  };
  $('tipo-badge').textContent = labels[modo] || modo;

  $('opciones-wrap').innerHTML = '';
  $('opciones-wrap').style.display = 'none';
  $('flashcard-wrap').style.display = 'none';
  $('input-wrap').style.display = 'none';
  $('ordenar-wrap').style.display = 'none';
  $('respuesta-feedback').textContent = '';
  $('respuesta-feedback').className   = 'respuesta-feedback';
  $('next-countdown').textContent     = '';
  $('translation-panel').classList.remove('visible');
  $('translation-panel').textContent  = '';
  $('btn-toggle-traduccion').style.display = 'none';
  $('btn-toggle-traduccion').textContent   = 'Ver traducción';
  $('btn-siguiente').disabled = true;
  $('btn-siguiente').style.display = 'inline-flex';

  switch (modo) {
    case 'test':        buildTest(word);        break;
    case 'flashcards':  buildFlashcard(word);   break;
    case 'ordenar':     buildOrdenar(word);     break;
    case 'articulo':    buildArticulo(word);    break;
    case 'lueckentext': buildLueckentext(word); break;
  }
}

/* ── TEST ────────────────────────────────────────────────────── */
function buildTest(word) {
  $('pregunta-texto').textContent = word.german;
  $('pregunta-sub').textContent   = word.word_type || '';
  $('btn-toggle-traduccion').style.display = 'block';
  $('translation-panel').textContent = word.example_sentence_de || '';

  const wrong3 = getRandomWrong(word, 3);
  const opts = shuffle([word.spanish, ...wrong3.map(w => w.spanish)]);

  const wrap = $('opciones-wrap');
  wrap.style.display = 'flex';
  opts.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'opcion';
    btn.textContent = opt;
    btn.addEventListener('click', () => {
      const correct = opt === word.spanish;
      markAnswer(btn, correct, word, correct ? null : word.spanish);
      disableOptions();
      autoNext();
    });
    wrap.appendChild(btn);
  });
}

/* ── FLASHCARD ───────────────────────────────────────────────── */
function buildFlashcard(word) {
  $('pregunta-texto').textContent = '';
  $('pregunta-sub').textContent   = '';
  $('flashcard-wrap').style.display = 'block';
  $('btn-siguiente').style.display  = 'none';

  const fc = $('flashcard-card');
  fc.classList.remove('flipped');
  $('flashcard-front').textContent = word.german;
  $('flashcard-back').textContent  = word.spanish;

  fc.onclick = () => fc.classList.toggle('flipped');

  $('btn-flashcard-si').onclick = () => {
    recordScore(true, word);
    nextWord();
  };
  $('btn-flashcard-no').onclick = () => {
    recordScore(false, word);
    nextWord();
  };
}

/* ── ORDENAR ─────────────────────────────────────────────────── */
function buildOrdenar(word) {
  const sentence = word.example_sentence_de || `${word.german} — ${word.spanish}`;
  $('pregunta-texto').textContent = `Ordena las palabras:`;
  $('pregunta-sub').textContent   = word.spanish;

  const tokens = sentence.split(' ').sort(() => Math.random() - .5);
  const banco  = $('banco-palabras');
  const constr = $('orden-construccion');
  banco.innerHTML = constr.innerHTML = '';
  $('ordenar-wrap').style.display = 'block';

  tokens.forEach(t => {
    const pill = document.createElement('button');
    pill.className = 'palabra-token';
    pill.textContent = t;
    pill.onclick = () => {
      constr.appendChild(pill);
      checkOrdenar(sentence);
    };
    banco.appendChild(pill);
  });

  constr.addEventListener('click', e => {
    if (e.target.classList.contains('palabra-token')) {
      banco.appendChild(e.target);
      checkOrdenar(sentence);
    }
  });
}

function checkOrdenar(original) {
  const constr  = $('orden-construccion');
  const built   = Array.from(constr.querySelectorAll('.palabra-token')).map(p => p.textContent).join(' ');
  const allUsed = $('banco-palabras').querySelectorAll('.palabra-token').length === 0;
  if (allUsed) {
    const correct = built.trim() === original.trim();
    $('respuesta-feedback').textContent = correct ? '✓ ¡Correcto!' : `✗ Era: "${original}"`;
    $('respuesta-feedback').className   = `respuesta-feedback ${correct ? 'correct' : 'wrong'}`;
    recordScore(correct, queue[currentIdx]);
    setNextHandler(() => nextWord());
    $('btn-siguiente').disabled = false;
  }
}

/* ── ARTÍCULO ────────────────────────────────────────────────── */
function buildArticulo(word) {
  const article = word.article?.toLowerCase();
  $('pregunta-texto').innerHTML = `<em>___</em> ${word.german}`;
  $('pregunta-sub').textContent = word.spanish;

  const opts = ['der', 'die', 'das'];
  const wrap = $('opciones-wrap');
  wrap.style.display = 'flex';

  opts.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'opcion';
    btn.textContent = opt;
    btn.onclick = () => {
      const correct = article ? opt === article : opt === 'das';
      markAnswer(btn, correct, word, article);
      disableOptions();
      autoNext();
    };
    wrap.appendChild(btn);
  });
}

/* ── LÜCKENTEXT ──────────────────────────────────────────────── */
function buildLueckentext(word) {
  // Build sentence with blank
  const sentence = word.example_sentence_de || '';
  const blanked  = blankifyWord(sentence, word.german);

  if (blanked) {
    // Highlight the blank within the sentence
    $('pregunta-texto').innerHTML = escapeHtml(blanked).replace(
      '______',
      '<span class="luecken-blank">______</span>'
    );
  } else {
    // Fallback: sentence shown separately, blank as generic prompt
    const prefix = sentence ? `${escapeHtml(sentence)}<br><br>` : '';
    $('pregunta-texto').innerHTML = `${prefix}¿Cómo se dice „${escapeHtml(word.spanish)}" auf Deutsch? <span class="luecken-blank">______</span>`;
  }
  $('pregunta-sub').textContent = '';

  // Collapsible Tipp (Spanish translation, hidden by default)
  $('btn-toggle-traduccion').style.display = 'block';
  $('btn-toggle-traduccion').textContent   = '💡 Tipp';
  $('translation-panel').textContent       = word.spanish;

  // 4 multiple-choice options (German words)
  const wrong3 = getRandomWrong(word, 3);
  const opts   = shuffle([word.german, ...wrong3.map(w => w.german)]);

  const wrap = $('opciones-wrap');
  wrap.style.display = 'flex';
  opts.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'opcion';
    btn.textContent = opt;
    btn.addEventListener('click', () => {
      const correct = opt === word.german;
      markAnswer(btn, correct, word, correct ? null : word.german);
      disableOptions();
      autoNext();
    });
    wrap.appendChild(btn);
  });
}

/* Returns sentence with the German word replaced by ______, or null if not found. */
function blankifyWord(sentence, german) {
  if (!sentence) return null;

  function escRx(str) {
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  }

  const tryReplace = (term) => {
    const re = new RegExp(`\\b${escRx(term)}\\b`, 'i');
    return re.test(sentence) ? sentence.replace(re, '______') : null;
  };

  let result = tryReplace(german);
  if (result) return result;

  // Try without leading article (der/die/das/den/dem/des/ein/eine/einen/einem/einer)
  const noArticle = german.replace(/^(der|die|das|den|dem|des|ein|eine|einen|einem|einer)\s+/i, '');
  if (noArticle !== german) {
    result = tryReplace(noArticle);
    if (result) return result;
  }

  return null;
}

/* ── HELPERS ─────────────────────────────────────────────────── */
function markAnswer(btn, correct, word, correctLabel) {
  btn.classList.add(correct ? 'correct-ans' : 'wrong-ans');
  if (!correct && correctLabel) {
    $('opciones-wrap').querySelectorAll('.opcion').forEach(b => {
      if (b.textContent === correctLabel) b.classList.add('correct-ans');
    });
  }
  recordScore(correct, word);
  $('respuesta-feedback').textContent = correct ? '✓ ¡Correcto!' : `✗ Era: "${correctLabel || ''}"`;
  $('respuesta-feedback').className   = `respuesta-feedback ${correct ? 'correct' : 'wrong'}`;
}

function disableOptions() {
  $('opciones-wrap').querySelectorAll('.opcion').forEach(b => b.disabled = true);
}

function recordScore(correct, word) {
  if (correct) {
    score.correct++;
  } else {
    score.wrong++;
    if (word && !wrongWords.find(w => w.id === word.id)) {
      wrongWords.push(word);
    }
  }
}

/* Replaces btn-siguiente with a fresh clone to wipe any prior listeners,
   then attaches exactly one click handler. */
function setNextHandler(fn) {
  const btn    = $('btn-siguiente');
  const newBtn = btn.cloneNode(true);
  btn.parentNode.replaceChild(newBtn, btn);
  newBtn.addEventListener('click', fn);
}

function autoNext() {
  let t = EXERCISE_CONFIG.autoNextDelay;
  const countdown = $('next-countdown');
  countdown.textContent = `Siguiente en ${t}…`;
  const iv = setInterval(() => {
    t--;
    if (t <= 0) {
      clearInterval(iv);
      countdown.textContent = '';
      nextWord();
    } else {
      countdown.textContent = `Siguiente en ${t}…`;
    }
  }, 1000);
  $('btn-siguiente').disabled = false;
  setNextHandler(() => { clearInterval(iv); nextWord(); });
}

function nextWord() {
  currentIdx++;
  buildExercise();
}

function getRandomWrong(word, n) {
  const pool = currentVocab.filter(w => w.id !== word.id);
  return shuffle(pool).slice(0, n);
}

function shuffle(arr) {
  return [...arr].sort(() => Math.random() - .5);
}

/* ── NAV BUTTONS (exercise screen) ──────────────────────────── */
$('btn-atras').addEventListener('click', () => {
  if (currentIdx > 0) { currentIdx--; buildExercise(); }
});

// btn-siguiente has NO global listener — it is wired exclusively by setNextHandler()
// inside autoNext() and by individual exercise builders that call setNextHandler directly.

$('btn-terminar').addEventListener('click', () => { showResultado(); });

/* ══════════════════════════════════════════════════════════════
   RESULTADO
══════════════════════════════════════════════════════════════ */
function showResultado() {
  // Persist errors before leaving the exercise screen
  saveSessionErrors(wrongWords);

  showScreen('resultado');

  const total = score.correct + score.wrong;
  const pct   = total > 0 ? Math.round((score.correct / total) * 100) : 0;

  $('punt-grande').textContent = `${pct}%`;
  $('punt-label').textContent  = pct >= 80 ? '¡Sehr gut! 🎉' : pct >= 60 ? '¡Gut gemacht! 👍' : 'Sigue practicando 💪';

  $('result-stats').innerHTML = `
    <div class="stat-item"><span class="stat-val">${score.correct}</span><span class="stat-lbl">Correctas</span></div>
    <div class="stat-item"><span class="stat-val">${score.wrong}</span><span class="stat-lbl">Errores</span></div>
    <div class="stat-item"><span class="stat-val">${queue.length}</span><span class="stat-lbl">Palabras</span></div>
  `;

  // Show "Repasar solo errores" only when there are errors
  const btnRepasar = $('btn-repasar-errores');
  if (wrongWords.length > 0) {
    btnRepasar.style.display = 'block';
    btnRepasar.textContent   = `Repasar solo errores (${wrongWords.length})`;
  } else {
    btnRepasar.style.display = 'none';
  }

  // Save progress
  if (selectedText) {
    const pKey = `progress_${selectedText.id}_${selectedLevel}`;
    const existing = JSON.parse(localStorage.getItem(pKey) || '{}');
    localStorage.setItem(pKey, JSON.stringify({
      total: existing.total || queue.length,
      done: (existing.done || 0) + score.correct,
    }));
  }

  $('btn-reiniciar').onclick = () => {
    currentIdx = 0;
    score = { correct: 0, wrong: 0 };
    wrongWords = [];
    queue = [...queue].sort(() => Math.random() - .5);
    showScreen('ejercicio');
    buildExercise();
  };
}

$('btn-repasar-errores').addEventListener('click', () => {
  if (!wrongWords.length) return;
  queue = [...wrongWords];
  wrongWords = [];
  score = { correct: 0, wrong: 0 };
  currentIdx = 0;
  clearPersistedErrors(); // errors will be re-saved if wrong again
  showScreen('ejercicio');
  buildExercise();
});

$('btn-volver-menu').addEventListener('click', () => {
  // Keep errors available for the next session
  saveSessionErrors(wrongWords);
  showScreen('activity');
});

$('btn-salir-test').addEventListener('click', () => {
  goToTextos();
});

/* ── TRANSLATION / TIPP TOGGLE ───────────────────────────────── */
$('btn-toggle-traduccion').addEventListener('click', () => {
  const panel = $('translation-panel');
  const btn   = $('btn-toggle-traduccion');
  panel.classList.toggle('visible');
  const isLuecken = btn.textContent.startsWith('💡');
  if (isLuecken) {
    btn.textContent = panel.classList.contains('visible') ? 'Ocultar tipp' : '💡 Tipp';
  } else {
    btn.textContent = panel.classList.contains('visible') ? 'Ocultar' : 'Ver traducción';
  }
});
