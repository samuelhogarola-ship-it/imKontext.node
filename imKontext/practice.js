/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — practice.js
   Exercise engine. Depends on globals set by app.js:
     $, selectedText, selectedLevel, selectedTextVersion,
     numPalabras, currentVocab, queue, currentIdx, score,
     slider, apiFetch, showScreen, goToTextos,
     refreshSelectedTextVersion
═══════════════════════════════════════════════════════════════ */

/* ── START PRACTICE ──────────────────────────────────────────── */
$('btn-empezar').addEventListener('click', startPractice);

async function startPractice() {
  if (!selectedText) return;

  $('btn-empezar').disabled = true;
  $('btn-empezar').textContent = 'Cargando…';

  try {
    // 1. Get text version for selected level
    const version = selectedTextVersion && String(selectedTextVersion.level || '').toLowerCase() === selectedLevel
      ? selectedTextVersion
      : await refreshSelectedTextVersion({ updateContent: false });
    if (!version?.id) throw new Error('No hay versión para este nivel.');
    const vId = version.id;

    // 2. Get vocabulary IDs for this version
    const links = await apiFetch(
      `/api/text-version-vocabulary?textVersionId=${encodeURIComponent(vId)}`
    );
    const vocabIds = links.map(l => l.vocabulario_id);

    if (!vocabIds.length) throw new Error('No hay vocabulario para este texto y nivel.');

    // 3. Get vocabulary details
    const vocab = await apiFetch(
      `/api/vocabulario?ids=${encodeURIComponent(vocabIds.join(','))}`
    );

    currentVocab = vocab;

    // Shuffle and slice
    const shuffled = [...vocab].sort(() => Math.random() - .5);
    const n = Math.min(numPalabras, shuffled.length);
    queue = shuffled.slice(0, n);
    currentIdx = 0;
    score = { correct: 0, wrong: 0 };

    // Save max for progress
    const pKey = `progress_${selectedText.id}_${selectedLevel}`;
    const existing = JSON.parse(localStorage.getItem(pKey) || 'null');
    localStorage.setItem(pKey, JSON.stringify({
      total: vocab.length,
      done: existing?.done || 0,
    }));

    // Slider max update
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
  if (selectedModo) return selectedModo;
  return MODOS[idx % MODOS.length];
}

function buildExercise() {
  if (currentIdx >= queue.length) {
    showResultado(); return;
  }

  const word  = queue[currentIdx];
  const modo  = getModo(currentIdx);
  const total = queue.length;

  // Progress bar
  $('prog-actual').textContent = currentIdx + 1;
  $('prog-total').textContent  = total;
  $('prog-fill').style.width   = `${((currentIdx) / total) * 100}%`;

  // Dots
  const dotsWrap = $('progreso-dots');
  dotsWrap.innerHTML = '';
  queue.forEach((_, i) => {
    const d = document.createElement('div');
    d.className = 'progreso-dot' + (i < currentIdx ? ' correct' : i === currentIdx ? ' current' : '');
    dotsWrap.appendChild(d);
  });

  // Badge
  const labels = {
    test: '🎯 Test', flashcards: '🃏 Flashcard',
    ordenar: '🔀 Ordenar', articulo: '📖 Artículo', lueckentext: '✏️ Lückentext'
  };
  $('tipo-badge').textContent = labels[modo] || modo;

  // Hide all input types
  $('opciones-wrap').innerHTML = '';
  $('opciones-wrap').style.display = 'none';
  $('flashcard-wrap').style.display = 'none';
  $('input-wrap').style.display = 'none';
  $('ordenar-wrap').style.display = 'none';
  $('respuesta-feedback').textContent = '';
  $('respuesta-feedback').className   = 'respuesta-feedback';
  $('next-countdown').textContent     = '';
  $('translation-panel').classList.remove('visible');
  $('btn-toggle-traduccion').style.display = 'none';
  $('btn-siguiente').disabled = true;
  $('btn-siguiente').style.display = 'inline-flex';

  switch (modo) {
    case 'test':       buildTest(word);       break;
    case 'flashcards': buildFlashcard(word);  break;
    case 'ordenar':    buildOrdenar(word);    break;
    case 'articulo':   buildArticulo(word);   break;
    case 'lueckentext':buildLueckentext(word);break;
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

  // allow clicking back from construction zone
  constr.addEventListener('click', e => {
    if (e.target.classList.contains('palabra-token')) {
      banco.appendChild(e.target);
      checkOrdenar(sentence);
    }
  });
}

function checkOrdenar(original) {
  const constr   = $('orden-construccion');
  const built    = Array.from(constr.querySelectorAll('.palabra-token')).map(p => p.textContent).join(' ');
  const allUsed  = $('banco-palabras').querySelectorAll('.palabra-token').length === 0;
  if (allUsed) {
    const correct = built.trim() === original.trim();
    $('respuesta-feedback').textContent  = correct ? '✓ ¡Correcto!' : `✗ Era: "${original}"`;
    $('respuesta-feedback').className    = `respuesta-feedback ${correct ? 'correct' : 'wrong'}`;
    recordScore(correct, queue[currentIdx]);
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
  const sentence = word.example_sentence_de || `${word.german} bedeutet ${word.spanish}.`;
  const blanked  = sentence.replace(word.german, '______');

  $('pregunta-texto').textContent = blanked;
  $('pregunta-sub').textContent   = `(${word.spanish})`;
  $('input-wrap').style.display   = 'block';

  const input = $('input-traduccion');
  input.value = '';
  input.focus();

  input.onkeydown = e => {
    if (e.key === 'Enter') checkLuecken(word);
  };

  $('btn-siguiente').disabled = false;
  $('btn-siguiente').onclick  = () => {
    checkLuecken(word);
    nextWord();
  };
}

function checkLuecken(word) {
  const val     = $('input-traduccion').value.trim().toLowerCase();
  const correct = val === word.german.toLowerCase();
  $('respuesta-feedback').textContent = correct ? '✓ ¡Correcto!' : `✗ Era: "${word.german}"`;
  $('respuesta-feedback').className   = `respuesta-feedback ${correct ? 'correct' : 'wrong'}`;
  recordScore(correct, word);
}

/* ── HELPERS ─────────────────────────────────────────────────── */
function markAnswer(btn, correct, word, correctLabel) {
  btn.classList.add(correct ? 'correct-ans' : 'wrong-ans');
  if (!correct && correctLabel) {
    const allBtns = $('opciones-wrap').querySelectorAll('.opcion');
    allBtns.forEach(b => { if (b.textContent === correctLabel) b.classList.add('correct-ans'); });
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
  }
}

function autoNext() {
  let t = 3;
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
  $('btn-siguiente').onclick  = () => { clearInterval(iv); nextWord(); };
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

$('btn-siguiente').addEventListener('click', () => { nextWord(); });

$('btn-terminar').addEventListener('click', () => { showResultado(); });

/* ══════════════════════════════════════════════════════════════
   RESULTADO
══════════════════════════════════════════════════════════════ */
function showResultado() {
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
    queue = [...queue].sort(() => Math.random() - .5);
    showScreen('ejercicio');
    buildExercise();
  };
}

$('btn-volver-menu').addEventListener('click', () => {
  showScreen('activity');
});

$('btn-salir-test').addEventListener('click', () => {
  goToTextos();
});

$('btn-repasar-errores').addEventListener('click', () => {
  // would need to track wrong words — placeholder
  showScreen('ejercicio');
  buildExercise();
});

/* ── TRANSLATION TOGGLE ──────────────────────────────────────── */
$('btn-toggle-traduccion').addEventListener('click', () => {
  $('translation-panel').classList.toggle('visible');
  $('btn-toggle-traduccion').textContent =
    $('translation-panel').classList.contains('visible') ? 'Ocultar' : 'Ver traducción';
});
