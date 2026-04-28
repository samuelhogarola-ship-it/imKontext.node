/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — app.js v7
   Supabase: textos dinámicos + flujo 3 pasos
═══════════════════════════════════════════════════════════════ */

/* ── API CONFIG ──────────────────────────────────────────────── */
async function apiFetch(path) {
  const res = await fetch(path);
  if (!res.ok) {
    let details = "";
    try {
      const body = await res.json();
      details = body.details || body.error || "";
    } catch {}
    throw new Error(details || `API error ${res.status}`);
  }
  return res.json();
}

/* ── STATE ───────────────────────────────────────────────────── */
const isPremium    = false; // cambiar a true cuando exista acceso premium real
let allTexts       = [];   // [{id, title, slug, text_content, topic, ... levels:[]}]
let selectedText   = null; // selected text object from Supabase
let selectedTextVersion = null; // exact text_version for the selected text + level
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
$('btn-entrar').addEventListener('click', async () => {
  $('main-app').style.display = 'block';
  screens.landing.style.display = 'none';

  if (isPremium) {
    await goToTextos(false);
    return;
  }

  await goToTextos(true);
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2 — SELECCIÓN DE TEXTOS
══════════════════════════════════════════════════════════════ */
async function goToTextos(autoOpenFeatured = false) {
  showScreen('textos');

  // If already loaded, just render
  if (allTexts.length > 0) {
    renderTextGrid(allTexts);
    if (autoOpenFeatured) {
      const featured = getFeaturedText(allTexts);
      if (featured) await selectText(featured);
    }
    return;
  }

  // Load from Supabase
  $('txsel-loading').style.display = 'flex';
  $('txsel-grid').style.display    = 'none';
  $('txsel-error').style.display   = 'none';

  try {
    allTexts = await apiFetch('/api/texts');

    renderTextGrid(allTexts);
    if (autoOpenFeatured) {
      const featured = getFeaturedText(allTexts);
      if (featured) await selectText(featured);
    }
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
  grid.style.display = 'flex';
  grid.innerHTML = '';

  document.querySelectorAll('.txsel-lvl-chip').forEach(b => {
    b.classList.remove('disabled');
    b.disabled = false;
    b.classList.toggle('active', b.dataset.level === selectedLevel);
  });

  if (list.length === 0) {
    grid.innerHTML = '<div class="txsel-empty">No se encontraron textos.</div>';
    return;
  }

  const sorted = sortTextsByDate(list);

  const featured = getFeaturedText(sorted);
  const rest = featured ? sorted.filter(text => text.id !== featured.id) : sorted;

  if (featured) {
    const featuredWrap = document.createElement('section');
    featuredWrap.className = 'tx-featured';
    featuredWrap.innerHTML = `
      <div class="tx-featured-head">
        <p class="tx-featured-kicker">Tema principal de la semana</p>
        <span class="tx-access-tag tx-access-tag--free">FREE</span>
      </div>
      <button class="tx-featured-card" type="button" aria-label="Abrir tema principal: ${escapeHtml(featured.title)}">
        <div class="tx-featured-copy">
          <p class="tx-featured-topic">${escapeHtml(featured.topic || 'Tema destacado')}</p>
          <h3 class="tx-featured-title">${escapeHtml(featured.title)}</h3>
          <p class="tx-featured-desc">Este es el texto gratuito más reciente. Entra aquí para empezar por el tema destacado de esta semana.</p>
          <div class="tx-featured-meta">
            <div class="tx-row-levels">${renderLevelBadges(featured.levels)}</div>
            <span class="tx-row-date">${formatShortDate(featured.published_at)}</span>
          </div>
        </div>
        <span class="tx-featured-arrow">→</span>
      </button>
    `;
    featuredWrap.querySelector('.tx-featured-card').addEventListener('click', () => selectText(featured));
    grid.appendChild(featuredWrap);
  }

  const grouped = {};
  rest.forEach(text => {
    const key = (text.topic || 'Otros').trim() || 'Otros';
    if (!grouped[key]) grouped[key] = [];
    grouped[key].push(text);
  });

  Object.entries(grouped).forEach(([topic, texts]) => {
    const section = document.createElement('section');
    section.className = 'tx-topic-section';

    const heading = document.createElement('div');
    heading.className = 'tx-topic-heading';
    heading.innerHTML = `
      <h3 class="tx-topic-title">${escapeHtml(topic)}</h3>
      <span class="tx-topic-count">${texts.length} texto${texts.length === 1 ? '' : 's'}</span>
    `;
    section.appendChild(heading);

    const listEl = document.createElement('div');
    listEl.className = 'tx-topic-list';
    texts.forEach((item, index) => {
      listEl.appendChild(createTextRow(item, index + 1));
    });

    section.appendChild(listEl);
    grid.appendChild(section);
  });
}

function createTextRow(text, position) {
  const row = document.createElement('button');
  const isLocked = !canAccessText(text);
  row.className = `tx-row${isLocked ? ' tx-row--locked' : ''}`;
  row.setAttribute('type', 'button');
  row.setAttribute('role', 'listitem');
  row.setAttribute('aria-label', `Seleccionar texto: ${text.title}`);

  const topicStr = text.topic
    ? `<span class="tx-row-topic">${escapeHtml(text.topic)}</span>`
    : '';

  row.innerHTML = `
    <span class="tx-row-num">#${String(position).padStart(2, '0')}</span>
    <span class="tx-row-title">${escapeHtml(text.title)}</span>
    <div class="tx-row-meta">
      ${topicStr}
      ${renderAccessTag(text)}
      <div class="tx-row-levels">${renderLevelBadges(text.levels)}</div>
      <span class="tx-row-date">${formatShortDate(text.published_at)}</span>
    </div>
    <span class="tx-row-arrow">${isLocked ? '🔒' : '→'}</span>
  `;

  row.addEventListener('click', () => selectText(text));
  return row;
}

function canAccessText(text) {
  return isPremium || text.access_status !== 'premium';
}

function renderAccessTag(text) {
  if (text.access_status === 'premium') {
    return '<span class="tx-access-tag tx-access-tag--premium">PREMIUM</span>';
  }
  if (text.access_status === 'free') {
    return '<span class="tx-access-tag tx-access-tag--free">FREE</span>';
  }
  return '';
}

function renderLevelBadges(levels = []) {
  return levels.map(level => `<span class="tx-lvl-badge tx-lvl-badge--${level}">${level}</span>`).join('');
}

function formatShortDate(value) {
  if (!value) return '';
  return new Date(value).toLocaleDateString('es-ES', { day: '2-digit', month: 'short', year: 'numeric' });
}

function sortTextsByDate(list) {
  return [...list].sort((a, b) => {
    const aTime = a.published_at ? new Date(a.published_at).getTime() : 0;
    const bTime = b.published_at ? new Date(b.published_at).getTime() : 0;
    return bTime - aTime;
  });
}

function getFeaturedText(list) {
  return sortTextsByDate(list).find(text => text.access_status === 'free') || null;
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

// Nav: volver a la landing desde logo o enlace activo
['nav-pagina-principal', 'nav-imkontext-link'].forEach(id => {
  const el = document.getElementById(id);
  if (!el) return;
  el.addEventListener('click', e => {
    e.preventDefault();
    $('main-app').style.display = 'none';
    document.getElementById('screen-landing').style.display = '';
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
});

// Nav: "Dashboard" — placeholder hasta que exista la ruta
document.getElementById('nav-dashboard').addEventListener('click', e => {
  e.preventDefault();
  alert('El dashboard estará disponible próximamente.');
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2b — DETALLE DE TEXTO
══════════════════════════════════════════════════════════════ */
async function selectText(text) {
  if (!canAccessText(text)) {
    alert('Este texto es PREMIUM. Cuando tengamos login, aquí entraremos con acceso premium.');
    return;
  }

  selectedText = text;

  const available = getAvailableLevels(text);
  if (available.length && !available.includes(selectedLevel)) {
    selectedLevel = available[0];
  }

  syncLevelControls(available);

  $('content-title').textContent = text.title || 'Texto';
  $('content-description').textContent =
    `Lee "${text.title}" directamente desde Supabase y vuelve cuando estés listo para practicar el vocabulario.`;
  $('content-meta').innerHTML = renderTextMeta(text);
  $('content-body').innerHTML = '<p class="txdet-empty">Cargando la versión del texto para este nivel…</p>';

  $('act-text-title').textContent = text.title || 'Configura tu práctica';

  await refreshSelectedTextVersion();
  showScreen('content');
}

$('btn-volver-textos').addEventListener('click', () => {
  goToTextos();
});

$('btn-ir-actividad').addEventListener('click', async () => {
  await loadActivityScreen();
  showScreen('activity');
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 3 — CONFIGURAR ACTIVIDAD
══════════════════════════════════════════════════════════════ */
async function loadActivityScreen() {
  if (!selectedText) return;
  await refreshSelectedTextVersion({ updateContent: false });
  updateProgressPanel();
  checkSavedProgress();
  await updateSliderMax();
}

$('btn-volver-contenido-from-activity').addEventListener('click', () => {
  showScreen('content');
});

// Level chips
document.querySelectorAll('#level-selector .config-chip').forEach(btn => {
  btn.addEventListener('click', async () => {
    if (btn.classList.contains('disabled')) return;
    selectedLevel = btn.dataset.level;
    syncLevelControls(getAvailableLevels(selectedText));
    await refreshSelectedTextVersion({ updateContent: false });
    updateProgressPanel();
    checkSavedProgress();
    await updateSliderMax();
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
document.querySelectorAll('.txsel-lvl-chip').forEach(btn => {
  btn.addEventListener('click', async () => {
    if (btn.classList.contains('disabled')) return;
    selectedLevel = btn.dataset.level;
    syncLevelControls(getAvailableLevels(selectedText));
    if (selectedText && screens.content.style.display !== 'none') {
      await refreshSelectedTextVersion();
    }
  });
});

function getAvailableLevels(text) {
  return ((text?.levels || []).map(level => String(level).toLowerCase()));
}

function syncLevelControls(availableLevels = []) {
  const hasAvailableLevels = availableLevels.length > 0;

  document.querySelectorAll('.txsel-lvl-chip').forEach(btn => {
    const isAvailable = !hasAvailableLevels || availableLevels.includes(btn.dataset.level);
    btn.classList.toggle('active', btn.dataset.level === selectedLevel);
    btn.classList.toggle('disabled', hasAvailableLevels && !isAvailable);
    btn.disabled = hasAvailableLevels && !isAvailable;
  });

  document.querySelectorAll('#level-selector .config-chip').forEach(btn => {
    const isAvailable = !hasAvailableLevels || availableLevels.includes(btn.dataset.level);
    btn.classList.toggle('active', btn.dataset.level === selectedLevel);
    btn.classList.toggle('disabled', hasAvailableLevels && !isAvailable);
    btn.disabled = hasAvailableLevels && !isAvailable;
  });
}

async function refreshSelectedTextVersion(options = {}) {
  const { updateContent = true } = options;

  if (!selectedText) return null;

  const available = getAvailableLevels(selectedText);
  if (available.length && !available.includes(selectedLevel)) {
    selectedLevel = available[0];
  }

  syncLevelControls(available);

  try {
    const versions = await apiFetch(
      `/api/text-version?textId=${encodeURIComponent(selectedText.id)}&level=${encodeURIComponent(selectedLevel)}`
    );
    selectedTextVersion = versions[0] || null;
  } catch (error) {
    selectedTextVersion = null;
    throw error;
  }

  if (updateContent) {
    $('content-body').innerHTML = renderTextBody({
      ...selectedText,
      text_content: selectedTextVersion?.content || ''
    });
  }

  updateLevelStatus();
  return selectedTextVersion;
}

const slider = $('slider-palabras');
slider.addEventListener('input', () => {
  numPalabras = parseInt(slider.value);
  $('num-palabras-display').textContent = numPalabras;
});

async function updateSliderMax() {
  if (!selectedText) return;
  try {
    const version = selectedTextVersion && String(selectedTextVersion.level || '').toLowerCase() === selectedLevel
      ? selectedTextVersion
      : await refreshSelectedTextVersion({ updateContent: false });
    const vId = version?.id;
    if (!vId) {
      slider.max = 5;
      slider.value = 5;
      numPalabras = 5;
      $('slider-max-label').textContent = '0';
      $('num-palabras-display').textContent = '5';
      updateLevelStatus(0);
      return;
    }
    const vocab = await apiFetch(
      `/api/text-version-vocabulary?textVersionId=${encodeURIComponent(vId)}`
    );
    const max = vocab.length || 0;
    const safeMax = Math.max(max, 5);
    slider.max = safeMax;
    $('slider-max-label').textContent = max;
    if (numPalabras > safeMax) {
      numPalabras = safeMax;
      slider.value = safeMax;
      $('num-palabras-display').textContent = safeMax;
    }
    updateLevelStatus(max);
    $('btn-empezar').disabled = max === 0;
  } catch {
    $('btn-empezar').disabled = true;
  }
}

/* ── Progress panel ─────────────────────────────────────────── */
function updateLevelStatus(vocabCount) {
  const status = $('level-status');
  if (!selectedText) {
    status.textContent = '';
    return;
  }

  const levelLabel = selectedLevel.toUpperCase();
  const available = getAvailableLevels(selectedText);
  if (available.length && !available.includes(selectedLevel)) {
    status.textContent = `El nivel ${levelLabel} no está disponible para este texto.`;
    $('btn-empezar').disabled = true;
    return;
  }

  if (!selectedTextVersion) {
    status.textContent = `No se ha encontrado una versión ${levelLabel} para este texto.`;
    $('btn-empezar').disabled = true;
    return;
  }

  if (typeof vocabCount === 'number') {
    status.textContent = vocabCount > 0
      ? `Nivel ${levelLabel} listo: ${vocabCount} palabras disponibles para practicar.`
      : `Nivel ${levelLabel} cargado, pero todavía sin vocabulario asociado.`;
    return;
  }

  status.textContent = `Nivel ${levelLabel} seleccionado. Cargando vocabulario disponible…`;
}

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
  const raw = String(text.text_content || text.previewContent || '').trim();

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
