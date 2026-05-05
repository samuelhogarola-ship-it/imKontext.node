/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — practice.js
   Exercise engine. Depends on globals set by app.js:
     $, selectedText, selectedLevel, selectedTextVersion,
     numPalabras, currentVocab, queue, currentIdx, score,
     wrongWords, selectedModos, slider, apiFetch, showScreen,
     goToTextos, refreshSelectedTextVersion
   Also depends on common.js:
     EXERCISE_CONFIG, saveSessionErrors, getPersistedErrors,
     clearPersistedErrors, getPersistedErrorIds
   Also depends on shared/practice-core.js:
     shuffle, getRandomWrong, buildQueue, getModoForIdx,
     blankifyWord, getProgressPercent, createScore
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
    queue = buildQueue(vocab, numPalabras, getPersistedErrorIds());
    clearPersistedErrors();

    currentIdx = 0;
    score = createScore();
    wrongWords = [];
    questionStates = [];

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
   COUNTDOWN + TRANSLATION HELPERS
══════════════════════════════════════════════════════════════ */
let _cdTimer = null;
let _advanceLocked = false;
let questionStates = [];

function clearCountdown() {
  if (_cdTimer) { clearInterval(_cdTimer); _cdTimer = null; }
  const el = $('next-countdown');
  if (el) { el.innerHTML = ''; el.style.display = 'none'; }
}

function lockAdvance() {
  if (_advanceLocked) return false;
  _advanceLocked = true;
  return true;
}

function startCountdown(callback, seg = EXERCISE_CONFIG.autoNextDelay) {
  clearCountdown();
  const el = $('next-countdown');
  if (!el) { callback(); return; }
  el.style.display = 'flex';
  let rem = seg;

  const render = () => {
    const pct = (rem / seg) * 100;
    el.innerHTML = `
      <span class="cd-label">Siguiente en</span>
      <span class="cd-circle">
        <svg viewBox="0 0 36 36" class="cd-svg">
          <circle class="cd-track" cx="18" cy="18" r="15.9"/>
          <circle class="cd-ring" cx="18" cy="18" r="15.9"
            stroke-dasharray="${pct} 100" stroke-dashoffset="0"/>
        </svg>
        <span class="cd-num">${rem}</span>
      </span>`;
  };
  render();

  _cdTimer = setInterval(() => {
    rem--;
    if (rem <= 0) { clearCountdown(); callback(); }
    else render();
  }, 1000);
}

const SVG_CHEVRON_DOWN = `<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m5 8 7 7 7-7"/></svg>`;
const SVG_CHEVRON_UP   = `<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m19 16-7-7-7 7"/></svg>`;

function resetTraduccionToggle() {
  const panel  = $('translation-panel');
  const toggle = $('btn-toggle-traduccion');
  if (!panel || !toggle) return;
  panel.style.display = 'none';
  toggle.setAttribute('aria-expanded', 'false');
  toggle.innerHTML = `${SVG_CHEVRON_DOWN} Ver traducción`;
}

function revealTranslationText(text) {
  const panel  = $('translation-panel');
  const toggle = $('btn-toggle-traduccion');
  if (!panel || !toggle) return;
  if (!text) { resetTraduccionToggle(); return; }
  panel.textContent = text;
  panel.style.display = 'block';
  toggle.style.display = 'inline-flex';
  toggle.setAttribute('aria-expanded', 'true');
  toggle.innerHTML = `${SVG_CHEVRON_UP} Ocultar traducción`;
}

function revealTranslation(word) {
  const lines = getRevealLines(word);
  revealTranslationText(lines.join('\n'));
}

function revealCorrectOption(correctLabel) {
  if (!correctLabel) return;
  $('opciones-wrap').querySelectorAll('.opcion').forEach(btn => {
    if (btn.textContent === correctLabel) btn.classList.add('correct-ans');
  });
}

function renderQuestionHint(text) {
  const sub = $('pregunta-sub');
  if (!sub) return;
  if (!text) { sub.textContent = ''; return; }

  sub.innerHTML = `
    <button class="pregunta-hint-toggle" id="pregunta-hint-toggle" type="button" aria-expanded="false">
      💡 Tipp
    </button>
    <div class="pregunta-hint-panel" id="pregunta-hint-panel">${escapeHtml(text)}</div>
  `;

  const toggle = $('pregunta-hint-toggle');
  const panel  = $('pregunta-hint-panel');
  toggle.addEventListener('click', () => {
    const isOpen = panel.classList.contains('visible');
    panel.classList.toggle('visible', !isOpen);
    toggle.setAttribute('aria-expanded', String(!isOpen));
    toggle.textContent = !isOpen ? 'Ocultar tipp' : '💡 Tipp';
  });
}

function disableNoSeButton() {
  const btn = $('btn-no-se');
  if (btn) btn.disabled = true;
}

function renderNoSeButton(onClick) {
  const wrap = $('opciones-wrap');
  const btn  = document.createElement('button');
  btn.type = 'button';
  btn.id = 'btn-no-se';
  btn.className = 'btn-back practice-skip-btn';
  btn.textContent = 'No la sé';
  btn.addEventListener('click', onClick);
  wrap.appendChild(btn);
}

function handleNoSe(word, correctLabel) {
  revealCorrectOption(correctLabel);
  disableOptions();
  disableNoSeButton();
  const answerState = recordAnswerOnce(currentIdx, false, word, {
    selectedAnswer: null,
    correctAnswer: correctLabel || '',
    solutionText: correctLabel || '',
    wasNoSe: true,
    translationShown: true,
    revealCorrectAnswer: true,
  });
  $('respuesta-feedback').textContent = answerState.feedbackText;
  $('respuesta-feedback').className = 'respuesta-feedback wrong';
  revealTranslation(word);
  autoNext();
}

function buildQuestionState(index, correct, word, extras = {}) {
  const answerMode  = extras.mode || getModo(index);
  const feedbackText = extras.feedbackText || (correct
    ? '✓ ¡Correcto!'
    : `✗ Era: "${extras.solutionText || extras.correctAnswer || ''}"`);
  return {
    answered: true,
    correct,
    selectedAnswer:    extras.selectedAnswer ?? null,
    correctAnswer:     extras.correctAnswer ?? null,
    solutionText:      extras.solutionText ?? extras.correctAnswer ?? null,
    translationText:   extras.translationText ?? getRevealLines(word).join('\n'),
    translationShown:  extras.translationShown !== false,
    feedbackText,
    mode:              answerMode,
    wordId:            word?.id,
    wasNoSe:           Boolean(extras.wasNoSe),
    revealCorrectAnswer: extras.revealCorrectAnswer !== false,
    builtSentence:     extras.builtSentence ?? null,
  };
}

function recordAnswerOnce(index, correct, word, extras = {}) {
  if (questionStates[index]?.answered) return questionStates[index];

  const state = buildQuestionState(index, correct, word, extras);
  questionStates[index] = state;

  if (correct) {
    score.correct++;
  } else {
    score.wrong++;
    if (word && !wrongWords.find(w => w.id === word.id)) {
      wrongWords.push(word);
    }
  }

  return state;
}

function applyAnsweredState(state, word) {
  if (!state?.answered) return;

  $('respuesta-feedback').textContent = state.feedbackText || '';
  $('respuesta-feedback').className = `respuesta-feedback ${state.correct ? 'correct' : 'wrong'}`;

  if (state.translationShown) {
    revealTranslationText(state.translationText || getRevealLines(word).join('\n'));
  }

  if (state.mode === 'flashcards') {
    $('flashcard-card').classList.add('flipped');
    $('btn-flashcard-si').disabled = true;
    $('btn-flashcard-no').disabled = true;
    $('btn-siguiente').style.display = 'inline-flex';
  } else if (state.mode === 'ordenar') {
    const banco = $('banco-palabras');
    const constr = $('orden-construccion');
    Array.from(banco.querySelectorAll('.palabra-token')).forEach(btn => btn.disabled = true);
    if (constr) constr.classList.add('disabled');
    if (state.builtSentence) {
      constr.innerHTML = '';
      state.builtSentence.split(' ').filter(Boolean).forEach(token => {
        const pill = document.createElement('button');
        pill.className = 'palabra-token';
        pill.textContent = token;
        pill.disabled = true;
        constr.appendChild(pill);
      });
      banco.innerHTML = '';
    }
  } else {
    disableOptions();
    disableNoSeButton();
    if (state.selectedAnswer) {
      $('opciones-wrap').querySelectorAll('.opcion').forEach(btn => {
        if (btn.textContent === state.selectedAnswer) {
          btn.classList.add(state.correct ? 'correct-ans' : 'wrong-ans');
        }
      });
    }
    if ((!state.correct || state.wasNoSe) && state.revealCorrectAnswer) {
      revealCorrectOption(state.correctAnswer || state.solutionText);
    }
  }

  $('btn-siguiente').disabled = false;
  setNextHandler(() => {
    clearCountdown();
    if (!lockAdvance()) return;
    nextWord();
  });
}

function restoreQuestionState(index, word, modo) {
  const state = questionStates[index];
  if (!state || !state.answered) return;
  if (state.wordId && word?.id && state.wordId !== word.id) return;
  if (state.mode && state.mode !== modo) return;
  applyAnsweredState(state, word);
}

/* ══════════════════════════════════════════════════════════════
   EJERCICIO ENGINE
══════════════════════════════════════════════════════════════ */
const MODOS = ['test', 'flashcards', 'ordenar', 'articulo', 'lueckentext'];

function getModo(idx) {
  return getModoForIdx(idx, selectedModos, MODOS);
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
  clearCountdown();
  _advanceLocked = false;
  $('translation-panel').textContent = '';
  resetTraduccionToggle();
  $('btn-toggle-traduccion').style.display = 'none';
  $('btn-siguiente').disabled = true;
  $('btn-siguiente').style.display = 'inline-flex';

  switch (modo) {
    case 'test':        buildTest(word);        break;
    case 'flashcards':  buildFlashcard(word);   break;
    case 'ordenar':     buildOrdenar(word);     break;
    case 'articulo':    buildArticulo(word);    break;
    case 'lueckentext': buildLueckentext(word); break;
  }

  restoreQuestionState(currentIdx, word, modo);
}

/* ── TEST ────────────────────────────────────────────────────── */
function buildTest(word) {
  $('pregunta-texto').textContent = word.german;
  renderQuestionHint(word.word_type || '');

  const wrong3 = getRandomWrong(word, currentVocab, 3);
  const opts = shuffle([word.spanish, ...wrong3.map(w => w.spanish)]);

  const wrap = $('opciones-wrap');
  wrap.style.display = 'flex';
  opts.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'opcion';
    btn.textContent = opt;
    btn.addEventListener('click', () => {
      const correct = opt === word.spanish;
      markAnswer(btn, correct, word, correct ? null : word.spanish, { selectedAnswer: opt, correctAnswer: word.spanish });
      disableOptions();
      disableNoSeButton();
      autoNext();
    });
    wrap.appendChild(btn);
  });

  renderNoSeButton(() => handleNoSe(word, word.spanish));
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
    recordAnswerOnce(currentIdx, true, word, {
      mode: 'flashcards',
      selectedAnswer: 'Sí',
      solutionText: word.spanish || word.german || '',
      feedbackText: '✓ ¡Correcto!'
    });
    nextWord();
  };
  $('btn-flashcard-no').onclick = () => {
    recordAnswerOnce(currentIdx, false, word, {
      mode: 'flashcards',
      selectedAnswer: 'No la sé',
      solutionText: word.spanish || word.german || '',
      feedbackText: `✗ Era: "${word.spanish || word.german || ''}"`,
      wasNoSe: true,
      translationShown: true
    });
    nextWord();
  };
}

/* ── ORDENAR ─────────────────────────────────────────────────── */
function buildOrdenar(word) {
  const sentence = word.example_sentence_de || word.german;
  $('pregunta-texto').textContent = `Ordena las palabras:`;
  renderQuestionHint(word.word_type || '');

  const tokens = shuffle(sentence.split(' '));
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
    recordAnswerOnce(currentIdx, correct, queue[currentIdx], {
      mode: 'ordenar',
      selectedAnswer: built,
      solutionText: original,
      correctAnswer: original,
      builtSentence: built,
      translationShown: true,
    });
    revealTranslation(queue[currentIdx]);
    autoNext();
  }
}

/* ── ARTÍCULO ────────────────────────────────────────────────── */
function buildArticulo(word) {
  const article = word.article?.toLowerCase();
  $('pregunta-texto').innerHTML = `<em>___</em> ${word.german}`;
  renderQuestionHint(word.word_type || '');

  const opts = ['der', 'die', 'das'];
  const wrap = $('opciones-wrap');
  wrap.style.display = 'flex';

  opts.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'opcion';
    btn.textContent = opt;
    btn.onclick = () => {
      const correctLabel = article || 'das';
      const correct = opt === correctLabel;
      markAnswer(btn, correct, word, correctLabel, { selectedAnswer: opt, correctAnswer: correctLabel });
      disableOptions();
      disableNoSeButton();
      autoNext();
    };
    wrap.appendChild(btn);
  });

  renderNoSeButton(() => handleNoSe(word, article || 'das'));
}

/* ── LÜCKENTEXT ──────────────────────────────────────────────── */
function buildLueckentext(word) {
  const sentence = word.example_sentence_de || '';
  const blanked  = blankifyWord(sentence, word.german);

  if (blanked) {
    $('pregunta-texto').innerHTML = escapeHtml(blanked).replace(
      '______',
      '<span class="luecken-blank">______</span>'
    );
  } else {
    $('pregunta-texto').innerHTML = 'Completa el hueco: <span class="luecken-blank">______</span>';
  }
  renderQuestionHint(word.word_type || '');

  const wrong3 = getRandomWrong(word, currentVocab, 3);
  const opts   = shuffle([word.german, ...wrong3.map(w => w.german)]);

  const wrap = $('opciones-wrap');
  wrap.style.display = 'flex';
  opts.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'opcion';
    btn.textContent = opt;
    btn.addEventListener('click', () => {
      const correct = opt === word.german;
      markAnswer(btn, correct, word, correct ? null : word.german, { selectedAnswer: opt, correctAnswer: word.german });
      disableOptions();
      disableNoSeButton();
      autoNext();
    });
    wrap.appendChild(btn);
  });

  renderNoSeButton(() => handleNoSe(word, word.german));
}

/* ── HELPERS ─────────────────────────────────────────────────── */
function markAnswer(btn, correct, word, correctLabel, extras = {}) {
  btn.classList.add(correct ? 'correct-ans' : 'wrong-ans');
  if (!correct && correctLabel) {
    revealCorrectOption(correctLabel);
  }
  const answerState = recordAnswerOnce(currentIdx, correct, word, {
    ...extras,
    mode: extras.mode || getModo(currentIdx),
    solutionText: correct
      ? (extras.solutionText || correctLabel || extras.selectedAnswer || '')
      : (extras.solutionText || correctLabel || ''),
    translationShown: true,
    revealCorrectAnswer: !correct,
  });
  $('respuesta-feedback').textContent = answerState.feedbackText;
  $('respuesta-feedback').className   = `respuesta-feedback ${correct ? 'correct' : 'wrong'}`;
  revealTranslation(word);
}

function disableOptions() {
  $('opciones-wrap').querySelectorAll('.opcion').forEach(b => b.disabled = true);
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
  $('btn-siguiente').disabled = false;
  setNextHandler(() => {
    clearCountdown();
    if (!lockAdvance()) return;
    nextWord();
  });
  startCountdown(() => {
    if (!lockAdvance()) return;
    nextWord();
  });
}

function nextWord() {
  clearCountdown();
  currentIdx++;
  buildExercise();
}

/* ── NAV BUTTONS (exercise screen) ──────────────────────────── */
$('btn-atras').addEventListener('click', () => {
  clearCountdown();
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
  const pct   = getProgressPercent(score.correct, total);

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
    score = createScore();
    wrongWords = [];
    questionStates = [];
    queue = shuffle(queue);
    showScreen('ejercicio');
    buildExercise();
  };
}

$('btn-repasar-errores').addEventListener('click', () => {
  if (!wrongWords.length) return;
  queue = [...wrongWords];
  wrongWords = [];
  questionStates = [];
  score = createScore();
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
$('btn-toggle-traduccion').addEventListener('click', function () {
  const panel  = $('translation-panel');
  const isOpen = panel.style.display !== 'none' && panel.style.display !== '';
  const isTipp = this.innerHTML.includes('💡');

  if (isOpen) {
    panel.style.display = 'none';
    this.setAttribute('aria-expanded', 'false');
    this.innerHTML = isTipp
      ? `${SVG_CHEVRON_DOWN} 💡 Tipp`
      : `${SVG_CHEVRON_DOWN} Ver traducción`;
  } else {
    panel.style.display = 'block';
    this.setAttribute('aria-expanded', 'true');
    this.innerHTML = isTipp
      ? `${SVG_CHEVRON_UP} Ocultar tipp`
      : `${SVG_CHEVRON_UP} Ocultar traducción`;
  }
});
