/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — app.js
   API, text selection, reading flow, activity config, navigation.
   Exercise engine → practice.js
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
  await goToTextos(false);
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2 — SELECCIÓN DE TEXTOS
══════════════════════════════════════════════════════════════ */
async function goToTextos(autoOpenFeatured = false) {
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
    allTexts = await apiFetch('/api/texts');

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
          <div class="tx-featured-edition">
            <span class="tx-featured-edition-label">Número de la semana</span>
            <span class="tx-featured-edition-issue">${formatShortDate(featured.published_at) || 'Edición abierta'}</span>
          </div>
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

document.querySelectorAll('.content-lvl-chip').forEach(btn => {
  btn.addEventListener('click', async () => {
    if (btn.classList.contains('disabled')) return;
    selectedLevel = btn.dataset.level;
    syncLevelControls(getAvailableLevels(selectedText));
    if (selectedText) {
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

  document.querySelectorAll('.content-lvl-chip').forEach(btn => {
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

/* ── HELPERS ─────────────────────────────────────────────────── */
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

/* ══════════════════════════════════════════════════════════════
   INIT
══════════════════════════════════════════════════════════════ */
// Initial state: show landing
$('main-app').style.display = 'none';

// Preload slider max on level change handled inside loadActivityScreen
