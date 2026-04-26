/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — app.js v7
   Supabase: textos dinámicos + flujo 3 pasos
═══════════════════════════════════════════════════════════════ */

/* ── SUPABASE CONFIG ─────────────────────────────────────────── */
const SUPABASE_URL  = 'https://fvhxbbhxucwawypfzikf.supabase.co';
const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2aHhiYmh4dWN3YXd5cGZ6aWtmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyMzEzMzEsImV4cCI6MjA5MDgwNzMzMX0.LBSbe0SGXM5mGB9Ym6ljLUyI1Tug7yP9YNFlROE6kRE';

async function sbFetch(path) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, {
    headers: {
      'apikey': SUPABASE_ANON,
      'Authorization': `Bearer ${SUPABASE_ANON}`,
    }
  });
  if (!res.ok) throw new Error(`Supabase error ${res.status}`);
  return res.json();
}

/* ── STATE ───────────────────────────────────────────────────── */
let allTexts       = [];   // [{id, title, slug, text_content, topic, ... levels:[]}]
let selectedText   = null; // selected text object from Supabase
let selectedLevel  = 'b1';
let selectedModo   = null;
let currentVocab   = [];
let queue          = [];
let currentIdx     = 0;
let score          = { correct: 0, wrong: 0 };
let streak         = 0;
let numPalabras    = 10;

/* ── DOM REFS ────────────────────────────────────────────────── */
const $  = id => document.getElementById(id);
const $$ = sel => document.querySelector(sel);

const screens = {
  landing:   $('screen-landing'),
  textos:    $('screen-textos'),
  content:   $('screen-content'),
  activity:  $('screen-activity'),
  ejercicio: $('screen-ejercicio'),
  resultado: $('screen-resultado'),
};

/* ── SHOW/HIDE SCREEN ────────────────────────────────────────── */
function showScreen(name) {
  $('main-app').style.display = name === 'landing' ? 'none' : 'block';
  screens.landing.style.display = name === 'landing' ? '' : 'none';

  ['textos','content','activity','ejercicio','resultado'].forEach(s => {
    const el = screens[s];
    if (el) el.style.display = s === name ? '' : 'none';
  });

  // hide loading/error when showing a real screen
  $('loading').style.display = 'none';
  $('error-msg').textContent = '';

  window.scrollTo({ top: 0, behavior: 'smooth' });
}

/* ══════════════════════════════════════════════════════════════
   PANTALLA 1 → LANDING
══════════════════════════════════════════════════════════════ */
$('btn-entrar').addEventListener('click', () => {
  $('main-app').style.display = 'block';
  screens.landing.style.display = 'none';
  goToTextos();
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2 — SELECCIÓN DE TEXTOS
══════════════════════════════════════════════════════════════ */
async function goToTextos() {
  showScreen('textos');

  // If already loaded, just render
  if (allTexts.length > 0) {
    renderTextGrid(allTexts);
    return;
  }

  // Load from Supabase
  $('txsel-loading').style.display = 'flex';
  $('txsel-grid').style.display    = 'none';
  $('txsel-error').style.display   = 'none';

  try {
    // 1. Get all texts
    const texts = await sbFetch(
      'texts?select=id,title,slug,text_content,topic,access_status,published_at&order=published_at.desc.nullslast,id.desc'
    );

    // 2. Get all levels per text
    const versions = await sbFetch('text_versions?select=text_id,level');

    // Build map: text_id → [levels]
    const levMap = {};
    versions.forEach(v => {
      if (!levMap[v.text_id]) levMap[v.text_id] = new Set();
      levMap[v.text_id].add(v.level);
    });

    allTexts = texts.map(t => ({
      ...t,
      levels: levMap[t.id] ? Array.from(levMap[t.id]).sort() : []
    }));

    renderTextGrid(allTexts);
  } catch (err) {
    console.error(err);
    $('txsel-loading').style.display = 'none';
    $('txsel-error').style.display   = 'block';
  }
}

function renderTextGrid(list) {
  $('txsel-loading').style.display = 'none';
  $('txsel-error').style.display   = 'none';

  const grid = $('txsel-grid');
  grid.style.display = 'grid';
  grid.innerHTML = '';

  if (list.length === 0) {
    grid.innerHTML = '<div class="txsel-empty">No se encontraron textos.</div>';
    return;
  }

  list.forEach((text, i) => {
    const card = document.createElement('button');
    card.className = 'tx-card';
    card.setAttribute('role', 'listitem');
    card.setAttribute('aria-label', `Seleccionar texto: ${text.title}`);

    const lvlBadges = text.levels.map(l =>
      `<span class="tx-lvl-badge tx-lvl-badge--${l}">${l}</span>`
    ).join('');

    card.innerHTML = `
      <span class="tx-card-num">#${String(i + 1).padStart(2, '0')}</span>
      <span class="tx-card-title">${escapeHtml(text.title)}</span>
      <div class="tx-card-levels">${lvlBadges}</div>
      <span class="tx-card-arrow">→</span>
    `;

    card.addEventListener('click', () => selectText(text));
    grid.appendChild(card);
  });
}

// Live search
$('txsel-search').addEventListener('input', e => {
  const q = e.target.value.toLowerCase().trim();
  if (!q) { renderTextGrid(allTexts); return; }
  const filtered = allTexts.filter(t => t.title.toLowerCase().includes(q));
  renderTextGrid(filtered);
});

$('btn-volver-landing-from-textos').addEventListener('click', () => {
  $('main-app').style.display = 'none';
  screens.landing.style.display = '';
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2b — DETALLE DE TEXTO
══════════════════════════════════════════════════════════════ */
function selectText(text) {
  selectedText = text;

  // Update header
  $('content-title').textContent = text.title || 'Texto';
  $('content-description').textContent =
    `Lee "${text.title}" directamente desde Supabase y vuelve cuando estés listo para practicar el vocabulario.`;
  $('content-meta').innerHTML = renderTextMeta(text);
  $('content-body').innerHTML = renderTextBody(text);

  // Also update activity title for step 3
  $('act-text-title').textContent = text.title || 'Configura tu práctica';

  showScreen('content');
}

$('btn-volver-textos').addEventListener('click', () => {
  goToTextos();
});

$('btn-ir-actividad').addEventListener('click', () => {
  loadActivityScreen();
  showScreen('activity');
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 3 — CONFIGURAR ACTIVIDAD
══════════════════════════════════════════════════════════════ */
function loadActivityScreen() {
  if (!selectedText) return;
  updateProgressPanel();
  checkSavedProgress();
}

$('btn-volver-contenido-from-activity').addEventListener('click', () => {
  showScreen('content');
});

// Level chips
document.querySelectorAll('#level-selector .config-chip').forEach(btn => {
  btn.addEventListener('click', () => {
    document.querySelectorAll('#level-selector .config-chip').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    selectedLevel = btn.dataset.level;
    updateProgressPanel();
    updateSliderMax();
  });
});

// Mode chips (toggle)
document.querySelectorAll('#practice-selector .config-chip').forEach(btn => {
  btn.addEventListener('click', () => {
    if (btn.classList.contains('active')) {
      btn.classList.remove('active');
      selectedModo = null;
    } else {
      document.querySelectorAll('#practice-selector .config-chip').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      selectedModo = btn.dataset.modo;
    }
    updateModoHint();
  });
});

function updateModoHint() {
  const hint = $('practice-hint');
  if (!selectedModo) {
    hint.textContent = 'Si no eliges ninguna actividad, practicarás con todos los formatos.';
  } else {
    const labels = {
      ordenar: 'Ordenarás frases en el orden correcto.',
      test: 'Elegirás la traducción correcta entre 4 opciones.',
      flashcards: 'Verás la palabra y decidirás si la sabes o no.',
      articulo: 'Escribirás el artículo correcto (der/die/das).',
      lueckentext: 'Completarás huecos en frases.',
    };
    hint.textContent = labels[selectedModo] || '';
  }
}

// Words slider
const slider = $('slider-palabras');
slider.addEventListener('input', () => {
  numPalabras = parseInt(slider.value);
  $('num-palabras-display').textContent = numPalabras;
});

async function updateSliderMax() {
  if (!selectedText) return;
  try {
    const versions = await sbFetch(
      `text_versions?text_id=eq.${selectedText.id}&level=eq.${selectedLevel.toUpperCase()}&select=id`
    );
    const vId = versions[0]?.id;
    if (!vId) return;
    const vocab = await sbFetch(
      `text_version_vocabulary?text_version_id=eq.${vId}&select=vocabulario_id`
    );
    const max = vocab.length || 10;
    slider.max = max;
    $('slider-max-label').textContent = max;
    if (numPalabras > max) {
      numPalabras = max;
      slider.value = max;
      $('num-palabras-display').textContent = max;
    }
  } catch {}
}

/* ── Progress panel ─────────────────────────────────────────── */
function updateProgressPanel() {
  if (!selectedText) return;
  const key = `progress_${selectedText.id}_${selectedLevel}`;
  const data = JSON.parse(localStorage.getItem(key) || 'null');
  const lvlLabel = selectedLevel.toUpperCase();

  $('weekly-progress-title').textContent = `Progreso ${lvlLabel}`;

  if (data) {
    const pct = data.total > 0 ? Math.round((data.done / data.total) * 100) : 0;
    $('weekly-progress-pct').textContent = `${pct}% completado`;
    $('weekly-progress-fill').style.width = `${pct}%`;
    $('weekly-progress-main').textContent = `${data.done} / ${data.total} palabras practicadas`;
    $('weekly-progress-sub').textContent  = `${data.total} palabras en nivel ${lvlLabel}`;
  } else {
    $('weekly-progress-pct').textContent  = '0% completado';
    $('weekly-progress-fill').style.width = '0%';
    $('weekly-progress-main').textContent = '0 / 0 palabras practicadas';
    $('weekly-progress-sub').textContent  = `Nivel ${lvlLabel}`;
  }
}

function checkSavedProgress() {
  if (!selectedText) return;
  const key = `queue_${selectedText.id}_${selectedLevel}`;
  const saved = localStorage.getItem(key);
  const banner = $('progreso-guardado-banner');
  if (saved) {
    const q = JSON.parse(saved);
    $('prog-guardado-txt').textContent = `${q.length} palabras pendientes`;
    banner.style.display = 'block';
  } else {
    banner.style.display = 'none';
  }
}

$('btn-reset-progress').addEventListener('click', () => {
  if (!selectedText) return;
  const key = `progress_${selectedText.id}_${selectedLevel}`;
  const qkey = `queue_${selectedText.id}_${selectedLevel}`;
  localStorage.removeItem(key);
  localStorage.removeItem(qkey);
  updateProgressPanel();
  checkSavedProgress();
});

/* ── Start practice ─────────────────────────────────────────── */
$('btn-empezar').addEventListener('click', startPractice);

async function startPractice() {
  if (!selectedText) return;

  $('btn-empezar').disabled = true;
  $('btn-empezar').textContent = 'Cargando…';

  try {
    // 1. Get text version for selected level
    const versions = await sbFetch(
      `text_versions?text_id=eq.${selectedText.id}&level=eq.${selectedLevel.toUpperCase()}&select=id`
    );
    if (!versions.length) throw new Error('No hay versión para este nivel.');
    const vId = versions[0].id;

    // 2. Get vocabulary IDs for this version
    const links = await sbFetch(
      `text_version_vocabulary?text_version_id=eq.${vId}&select=vocabulario_id`
    );
    const vocabIds = links.map(l => l.vocabulario_id);

    if (!vocabIds.length) throw new Error('No hay vocabulario para este texto y nivel.');

    // 3. Get vocabulary details
    const vocab = await sbFetch(
      `vocabulario?id=in.(${vocabIds.join(',')})&select=id,german,spanish,article,word_type,example_sentence_de`
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
    streak++;
    $('streak-count').textContent = streak;
  } else {
    score.wrong++;
    streak = 0;
    $('streak-count').textContent = 0;
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

function escapeHtml(str) {
  return String(str ?? '')
    .replace(/&/g,'&amp;')
    .replace(/</g,'&lt;')
    .replace(/>/g,'&gt;');
}

function renderTextMeta(text) {
  const bits = [];

  if (text.topic) {
    bits.push(`<span class="txdet-pill">${escapeHtml(text.topic)}</span>`);
  }

  if (text.access_status) {
    bits.push(`<span class="txdet-pill txdet-pill--muted">${escapeHtml(text.access_status)}</span>`);
  }

  if (text.published_at) {
    bits.push(`<span class="txdet-meta-date">${escapeHtml(formatDate(text.published_at))}</span>`);
  }

  return bits.join('');
}

function renderTextBody(text) {
  const raw = String(text.text_content || '').trim();

  if (!raw) {
    return `
      <p class="txdet-empty">
        Este texto todavía no tiene contenido base guardado en Supabase.
        Puedes continuar igualmente a los ejercicios si el vocabulario del nivel ya está cargado.
      </p>
    `;
  }

  return raw
    .split(/\n\s*\n/)
    .map(paragraph => `<p>${escapeHtml(paragraph).replace(/\n/g, '<br>')}</p>`)
    .join('');
}

function formatDate(value) {
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;

  return new Intl.DateTimeFormat('es-ES', {
    day: 'numeric',
    month: 'long',
    year: 'numeric'
  }).format(date);
}

/* ── NAV BUTTONS ─────────────────────────────────────────────── */
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

/* ══════════════════════════════════════════════════════════════
   INIT
══════════════════════════════════════════════════════════════ */
// Initial state: show landing
$('main-app').style.display = 'none';

// Preload slider max on level change handled inside loadActivityScreen
