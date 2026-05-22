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
function isPremiumUser() { return false; } // replace when auth exists
const SUPPORT_EMAIL = 'www.vokabellab@pm.me';
let allTexts       = [];   // [{id, title, slug, text_content, topic, ... levels:[]}]
let selectedText   = null; // selected text object from Supabase
let selectedTextVersion = null; // exact text_version for the selected text + level
let selectedLevel  = 'b1';
let selectedTopic  = null; // null = all topics
let selectedModos  = [];  // array — supports multi-select
let currentVocab     = [];
let currentTextVocab = [];   // linked vocab for current text version (reader underlines)
let queue          = [];
let currentIdx     = 0;
let score          = { correct: 0, wrong: 0 };
let wrongWords     = [];  // words answered incorrectly in current session
let numPalabras    = 0;
let isReaderModeActive = false;

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
  dashboard: $('screen-dashboard'),
};

function setReadingMode(active) {
  isReaderModeActive = active;
  document.body.classList.toggle('reader-mode-active', active);

  const btn = $('btn-toggle-reading-mode');
  if (btn) {
    btn.setAttribute('aria-pressed', String(active));
    btn.textContent = active ? 'Salir lectura ×' : 'Modo lectura ⤢';
  }
}

async function exitReadingMode() {
  if (document.fullscreenElement) {
    try {
      await document.exitFullscreen();
    } catch {}
  }
  setReadingMode(false);
}

async function toggleReadingMode() {
  if (isReaderModeActive) {
    await exitReadingMode();
    return;
  }

  setReadingMode(true);

  const target = $('screen-content');
  if (target?.requestFullscreen) {
    try {
      await target.requestFullscreen();
    } catch {}
  }
}

document.addEventListener('fullscreenchange', () => {
  if (document.fullscreenElement === $('screen-content')) {
    setReadingMode(true);
    return;
  }

  if (isReaderModeActive) {
    setReadingMode(false);
  }
});

/* ── SHOW/HIDE SCREEN ────────────────────────────────────────── */
async function showScreen(name) {
  $('main-app').style.display = name === 'landing' ? 'none' : 'block';
  screens.landing.style.display = name === 'landing' ? '' : 'none';

  ['textos','content','activity','ejercicio','resultado','dashboard'].forEach(s => {
    const el = screens[s];
    if (el) el.style.display = s === name ? '' : 'none';
  });
  $('main-card').classList.toggle('is-textos', name === 'textos');
  $('app-header').classList.toggle('app-is-landing', name === 'landing');

  const footer = $('app-footer');
  if (footer) footer.style.display = name === 'landing' ? 'none' : 'block';

  // hide loading/error when showing a real screen
  $('loading').style.display = 'none';
  $('error-msg').textContent = '';

  if (name !== 'content' && isReaderModeActive) {
    await exitReadingMode();
  }

  window.scrollTo({ top: 0, behavior: 'smooth' });
}

/* ── SEO & ROUTING HELPERS ───────────────────────────────────── */
function updateSEOMeta({ title, description, canonical }) {
  document.title = title;
  const set = (id, attr, val) => { const el = document.getElementById(id); if (el) el.setAttribute(attr, val); };
  set('meta-description', 'content', description);
  set('link-canonical',   'href',    canonical);
  set('og-title',         'content', title);
  set('og-description',   'content', description);
  set('og-url',           'content', canonical);
  set('tw-title',         'content', title);
  set('tw-description',   'content', description);
}

function getTextUrl(text, level) {
  const base = `/textos/${encodeURIComponent(text.slug)}`;
  return level ? `${base}?nivel=${level.toUpperCase()}` : base;
}

function showLanding() {
  $('main-app').style.display = 'none';
  screens.landing.style.display = '';
  $('app-header').classList.add('app-is-landing');
  const footer = $('app-footer');
  if (footer) footer.style.display = 'none';
  updateSEOMeta({
    title: 'APP Vokabel Lab imKontext',
    description: 'Aprende alemán con textos de actualidad. Practica vocabulario real con imKontext de Vokabel Lab.',
    canonical: window.location.origin + '/'
  });
}

async function openTextBySlug(slug) {
  if (!allTexts.length) {
    try {
      allTexts = await apiFetch('/api/texts');
    } catch {
      showScreen('textos');
      $('txsel-loading').style.display = 'none';
      $('txsel-error').style.display = 'block';
      return;
    }
  }
  const text = allTexts.find(t => t.slug === slug);
  if (!text) {
    showScreen('textos');
    $('txsel-loading').style.display = 'none';
    const errEl = $('txsel-error');
    errEl.style.display = 'block';
    errEl.textContent = 'No se encontró el texto solicitado.';
    return;
  }
  await selectText(text, { pushState: false });
}

/* ── SHARE BUTTON ────────────────────────────────────────────── */
$('btn-share-text').addEventListener('click', async () => {
  const url = window.location.href;
  const btn = $('btn-share-text');
  try {
    await navigator.clipboard.writeText(url);
    btn.textContent = '¡Copiado! ✓';
  } catch {
    prompt('Copia este enlace:', url);
    return;
  }
  setTimeout(() => { btn.textContent = 'Compartir ↗'; }, 2000);
});

/* ── POPSTATE ────────────────────────────────────────────────── */
window.addEventListener('popstate', async () => {
  const pathname = window.location.pathname;
  const levelParam = new URLSearchParams(window.location.search).get('nivel');

  if (pathname === '/textos') {
    await goToTextos({ pushState: false });
  } else if (pathname.startsWith('/textos/')) {
    const slug = decodeURIComponent(pathname.slice('/textos/'.length));
    if (levelParam) selectedLevel = levelParam.toLowerCase();
    await openTextBySlug(slug);
  } else {
    selectedTopic = null;
    showLanding();
  }
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 1 → LANDING
══════════════════════════════════════════════════════════════ */
$('btn-entrar').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2 — SELECCIÓN DE TEXTOS
══════════════════════════════════════════════════════════════ */
async function goToTextos({ pushState: doPush = true } = {}) {
  if (doPush) {
    history.pushState({ screen: 'textos' }, '', '/textos');
  }
  updateSEOMeta({
    title: 'imKontext — Elige un texto',
    description: 'Explora los textos de actualidad en alemán. Elige el artículo que quieres leer y practicar hoy.',
    canonical: window.location.origin + '/textos'
  });
  showScreen('textos');

  // If already loaded, just render
  if (allTexts.length > 0) {
    buildTopicChips();
    renderTextGrid(getFilteredTexts());
    return;
  }

  // Load from Supabase
  $('txsel-loading').style.display = 'flex';
  $('txsel-grid').style.display    = 'none';
  $('txsel-error').style.display   = 'none';

  try {
    allTexts = await apiFetch('/api/texts');

    buildTopicChips();
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
        ${renderFeaturedAccessTag(featured)}
      </div>
      <button class="tx-featured-card" data-testid="featured-card" type="button" aria-label="Abrir tema principal: ${escapeHtml(featured.title)}">
        <div class="tx-featured-copy">
          <div class="tx-featured-edition">
            <span class="tx-featured-edition-label">Número de la semana</span>
            <span class="tx-featured-edition-issue">${formatShortDate(featured.published_at) || 'Edición abierta'}</span>
          </div>
          <p class="tx-featured-topic">${escapeHtml(featured.topic || 'Tema destacado')}</p>
          <h3 class="tx-featured-title">${escapeHtml(featured.title)}</h3>
          <p class="tx-featured-desc">${renderFeaturedDescription(featured)}</p>
          <div class="tx-featured-meta">
            <div class="tx-row-levels">${renderLevelBadges(featured.levels)}</div>
            <span class="tx-row-date">${formatShortDate(featured.published_at)}</span>
          </div>
        </div>
        <span class="tx-featured-arrow">→</span>
      </button>
    `;
    featuredWrap.querySelector('[data-testid="featured-card"]').addEventListener('click', () => selectText(featured));
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
  row.dataset.testid = 'text-row';
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

function isTextPracticallyComplete(text) {
  return Boolean(text.slug)
    && Array.isArray(text.levels)
    && text.levels.length > 0
    && Boolean(text.hasLoadedVocabulary);
}

function isFreemiumText(text) {
  return !isPremiumUser()
    && text?.access_status === 'premium'
    && isTextPracticallyComplete(text);
}

function canAccessText(text) {
  return isPremiumUser() || text.access_status !== 'premium' || isFreemiumText(text);
}

function renderAccessTag(text) {
  if (isFreemiumText(text)) {
    return '<span class="tx-access-tag tx-access-tag--freemium">PREMIUM · GRATIS AHORA</span>';
  }
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
    const aAccessible = canAccessText(a) ? 0 : 1;
    const bAccessible = canAccessText(b) ? 0 : 1;
    if (aAccessible !== bAccessible) return aAccessible - bAccessible;

    const aTime = a.published_at ? new Date(a.published_at).getTime() : 0;
    const bTime = b.published_at ? new Date(b.published_at).getTime() : 0;
    return bTime - aTime;
  });
}

function getFeaturedText(list) {
  return sortTextsByDate(list).find(canAccessText) || null;
}

function renderFeaturedAccessTag(text) {
  if (isFreemiumText(text)) {
    return '<span class="tx-access-tag tx-access-tag--freemium">PROMO · GRATIS AHORA</span>';
  }
  if (text.access_status === 'free') {
    return '<span class="tx-access-tag tx-access-tag--free">FREE</span>';
  }
  if (text.access_status === 'premium') {
    return '<span class="tx-access-tag tx-access-tag--premium">PREMIUM</span>';
  }
  return '';
}

function renderFeaturedDescription(text) {
  if (isFreemiumText(text)) {
    return 'Promoción activa: este texto premium está desbloqueado gratis por tiempo limitado. Entra aquí para aprovecharlo.';
  }

  return 'Este es el texto gratuito más reciente. Entra aquí para empezar por el tema destacado de esta semana.';
}

function getFilteredTexts() {
  const q = $('txsel-search').value.toLowerCase().trim();
  let list = allTexts;
  if (q) list = list.filter(t => t.title.toLowerCase().includes(q));
  if (selectedTopic) list = list.filter(t => (t.topic || 'Otros').trim() === selectedTopic);
  return list;
}

function buildTopicChips() {
  const container = $('txsel-topic-filter');
  if (!container || !allTexts.length) return;

  const topics = [...new Set(allTexts.map(t => (t.topic || 'Otros').trim()))].sort();
  container.innerHTML = '';

  const makeChip = (label, topic) => {
    const btn = document.createElement('button');
    btn.type = 'button';
    btn.className = 'txsel-topic-chip';
    btn.textContent = label;
    if (topic) btn.dataset.topic = topic;
    btn.addEventListener('click', () => {
      selectedTopic = (topic && selectedTopic !== topic) ? topic : null;
      updateTopicChips();
      renderTextGrid(getFilteredTexts());
    });
    return btn;
  };

  container.appendChild(makeChip('Todos'));
  topics.forEach(t => container.appendChild(makeChip(t, t)));
  updateTopicChips();
}

function updateTopicChips() {
  document.querySelectorAll('.txsel-topic-chip').forEach(chip => {
    const isAll = !chip.dataset.topic;
    chip.classList.toggle('active', isAll ? selectedTopic === null : chip.dataset.topic === selectedTopic);
  });
}

// Live search
$('txsel-search').addEventListener('input', () => {
  renderTextGrid(getFilteredTexts());
});

$('btn-volver-landing-from-textos').addEventListener('click', () => {
  selectedTopic = null;
  history.pushState({ screen: 'landing' }, '', '/');
  showLanding();
});

// Nav: volver a la landing desde logo o enlace activo
['nav-pagina-principal', 'nav-imkontext-link'].forEach(id => {
  const el = document.getElementById(id);
  if (!el) return;
  el.addEventListener('click', e => {
    e.preventDefault();
    selectedTopic = null;
    history.pushState({ screen: 'landing' }, '', '/');
    showLanding();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
});

// Nav: "Dashboard"
document.getElementById('nav-dashboard').addEventListener('click', async e => {
  e.preventDefault();
  await showDashboard();
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA — DASHBOARD
══════════════════════════════════════════════════════════════ */
function parseDashboardEntries() {
  const entries = [];
  for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    if (!key.startsWith('progress_')) continue;
    try {
      const data = JSON.parse(localStorage.getItem(key));
      if (!data || typeof data.done !== 'number') continue;
      const withoutPrefix = key.slice('progress_'.length);
      const lastUnderscore = withoutPrefix.lastIndexOf('_');
      const textId = withoutPrefix.slice(0, lastUnderscore);
      const level  = withoutPrefix.slice(lastUnderscore + 1);
      if (!textId || !level) continue;
      const text = allTexts.find(t => String(t.id) === textId) || null;
      entries.push({ key, textId, level, done: data.done || 0, total: data.total || 0, text });
    } catch {}
  }
  return entries;
}

async function showDashboard() {
  if (!allTexts.length) {
    try { allTexts = await apiFetch('/api/texts'); } catch {}
  }

  const entries = parseDashboardEntries();
  const empty   = $('db-empty');
  const content = $('db-content');

  if (!entries.length) {
    empty.style.display   = 'block';
    content.style.display = 'none';
    showScreen('dashboard');
    return;
  }

  empty.style.display   = 'none';
  content.style.display = 'block';

  const totalDone  = entries.reduce((s, e) => s + e.done,  0);
  const totalWords = entries.reduce((s, e) => s + e.total, 0);
  const globalPct  = totalWords > 0 ? Math.round((totalDone / totalWords) * 100) : 0;
  const activeTexts = new Set(entries.map(e => e.textId)).size;

  $('db-stats-grid').innerHTML = `
    <div class="db-stat-card">
      <span class="db-stat-val">${totalDone}</span>
      <span class="db-stat-lbl">Palabras practicadas</span>
    </div>
    <div class="db-stat-card">
      <span class="db-stat-val">${activeTexts}</span>
      <span class="db-stat-lbl">Textos activos</span>
    </div>
    <div class="db-stat-card">
      <span class="db-stat-val">${globalPct}%</span>
      <span class="db-stat-lbl">Progreso global</span>
    </div>
  `;

  const levelOrder = { a2: 0, b1: 1, b2: 2, c1: 3 };
  entries.sort((a, b) => {
    const ta = a.text?.title || a.textId;
    const tb = b.text?.title || b.textId;
    if (ta !== tb) return ta.localeCompare(tb, 'es');
    return (levelOrder[a.level] ?? 9) - (levelOrder[b.level] ?? 9);
  });

  $('db-text-list').innerHTML = entries.map(e => {
    const pct   = e.total > 0 ? Math.round((e.done / e.total) * 100) : 0;
    const title = e.text?.title ? escapeHtml(e.text.title) : `Texto ${e.textId.slice(0, 8)}…`;
    return `
      <div class="db-text-row">
        <div class="db-text-info">
          <span class="tx-lvl-badge tx-lvl-badge--${e.level}">${e.level.toUpperCase()}</span>
          <span class="db-text-title">${title}</span>
        </div>
        <div class="db-text-progress">
          <div class="db-progress-bar">
            <div class="db-progress-fill" style="width:${pct}%"></div>
          </div>
          <span class="db-progress-pct">${e.done}/${e.total} · ${pct}%</span>
        </div>
      </div>
    `;
  }).join('');

  showScreen('dashboard');
}

document.getElementById('btn-volver-from-dashboard').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});

document.getElementById('btn-dashboard-go-textos').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});

// Footer nav links
const footerImkontext = document.getElementById('footer-imkontext-link');
if (footerImkontext) {
  footerImkontext.addEventListener('click', e => {
    e.preventDefault();
    selectedTopic = null;
    history.pushState({ screen: 'landing' }, '', '/');
    showLanding();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
}


/* ══════════════════════════════════════════════════════════════
   PANTALLA 2b — DETALLE DE TEXTO
══════════════════════════════════════════════════════════════ */
async function selectText(text, { pushState: doPush = true } = {}) {
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
  $('act-text-title').textContent = text.title || 'Configura tu práctica';

  const canAccess = canAccessText(text);
  const freemiumNotice = $('freemium-notice');
  if (freemiumNotice) {
    freemiumNotice.style.display = isFreemiumText(text) ? '' : 'none';
  }
  $('btn-ir-actividad').style.display = canAccess ? '' : 'none';
  $('btn-toggle-reading-mode').style.display = canAccess ? '' : 'none';

  if (canAccess) {
    $('content-body').innerHTML = '<p class="txdet-empty">Cargando la versión del texto para este nivel…</p>';
    await refreshSelectedTextVersion();
  } else {
    $('content-body').innerHTML = renderPremiumGateBody(text);
  }

  if (doPush && text.slug) {
    history.pushState(
      { screen: 'content', slug: text.slug, level: selectedLevel },
      '',
      getTextUrl(text, selectedLevel)
    );
  }

  updateSEOMeta({
    title: `${text.title} | Nivel ${selectedLevel.toUpperCase()} | imKontext`,
    description: `Lee y practica vocabulario alemán con "${text.title}". Nivel ${selectedLevel.toUpperCase()}. imKontext de Vokabel Lab.`,
    canonical: window.location.origin + getTextUrl(text, selectedLevel)
  });

  showScreen('content');
}

$('btn-volver-textos').addEventListener('click', async () => {
  await exitReadingMode();
  await goToTextos({ pushState: true });
});

$('btn-ir-actividad').addEventListener('click', async () => {
  await exitReadingMode();
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

$('btn-toggle-reading-mode').addEventListener('click', async () => {
  await toggleReadingMode();
});

$('btn-terminar-lectura').addEventListener('click', async () => {
  await exitReadingMode();
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

// Mode chips (multi-select toggle)
document.querySelectorAll('#practice-selector .config-chip').forEach(btn => {
  btn.addEventListener('click', () => {
    const modo = btn.dataset.modo;
    if (btn.classList.contains('active')) {
      btn.classList.remove('active');
      selectedModos = selectedModos.filter(m => m !== modo);
    } else {
      btn.classList.add('active');
      selectedModos = [...selectedModos, modo];
    }
    updateModoHint();
  });
});

function updateModoHint() {
  const hint = $('practice-hint');
  const labels = {
    ordenar:     'Ordenar frases',
    test:        'Test de vocabulario',
    flashcards:  'Flashcards',
    articulo:    'Artículos (der/die/das)',
    lueckentext: 'Lückentext',
  };
  if (!selectedModos.length) {
    hint.textContent = 'Sin filtro: practicarás con todos los formatos.';
  } else if (selectedModos.length === 1) {
    const descriptions = {
      ordenar:     'Ordenarás frases en el orden correcto.',
      test:        'Elegirás la traducción correcta entre 4 opciones.',
      flashcards:  'Verás la palabra y decidirás si la sabes o no.',
      articulo:    'Elegirás el artículo correcto (der/die/das).',
      lueckentext: 'Completarás huecos en frases con 4 opciones.',
    };
    hint.textContent = descriptions[selectedModos[0]] || '';
  } else {
    hint.textContent = `Alternando: ${selectedModos.map(m => labels[m] || m).join(' → ')}.`;
  }
}

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
      if (selectedText.slug) {
        history.replaceState(
          { screen: 'content', slug: selectedText.slug, level: selectedLevel },
          '',
          getTextUrl(selectedText, selectedLevel)
        );
        updateSEOMeta({
          title: `${selectedText.title} | Nivel ${selectedLevel.toUpperCase()} | imKontext`,
          description: `Lee y practica vocabulario alemán con "${selectedText.title}". Nivel ${selectedLevel.toUpperCase()}. imKontext de Vokabel Lab.`,
          canonical: window.location.origin + getTextUrl(selectedText, selectedLevel)
        });
      }
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
    closeVocabPanel();
    if (selectedTextVersion?.id) {
      try {
        currentTextVocab = await apiFetch(
          `/api/text-version-vocabulary?textVersionId=${encodeURIComponent(selectedTextVersion.id)}`
        );
      } catch {
        currentTextVocab = [];
      }
    } else {
      currentTextVocab = [];
    }
    $('content-body').innerHTML = renderTextBody(
      { ...selectedText, text_content: selectedTextVersion?.content || '' },
      currentTextVocab
    );
  }

  updateLevelStatus();
  return selectedTextVersion;
}

async function updateSliderMax() {
  if (!selectedText) return;
  try {
    const version = selectedTextVersion && String(selectedTextVersion.level || '').toLowerCase() === selectedLevel
      ? selectedTextVersion
      : await refreshSelectedTextVersion({ updateContent: false });
    const vId = version?.id;
    if (!vId) {
      numPalabras = 0;
      updateLevelStatus(0);
      return;
    }
    const vocab = await apiFetch(
      `/api/text-version-vocabulary?textVersionId=${encodeURIComponent(vId)}`
    );
    const max = vocab.length || 0;
    numPalabras = max;
    updateLevelStatus(max);
    updateProgressPanel();
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
    const total = numPalabras || 0;
    $('weekly-progress-pct').textContent  = '0% completado';
    $('weekly-progress-fill').style.width = '0%';
    $('weekly-progress-main').textContent = `0 / ${total} palabras practicadas`;
    $('weekly-progress-sub').textContent  = total > 0 ? `${total} palabras en nivel ${lvlLabel}` : `Nivel ${lvlLabel}`;
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

const ARTICLE_PREFIX_RE = /^(?:der|die|das)\s+/i;
const VOCAB_WORD_EDGE   = 'a-zA-ZäöüÄÖÜß';
const ADJ_ENDINGS       = ['e', 'en', 'er', 'es', 'em'];

function buildVocabData(vocab) {
  if (!vocab || !vocab.length) return { pattern: null, termToId: null };
  const terms   = new Set();
  const termToId = new Map(); // lowercase term → vocab id

  vocab.forEach(item => {
    const g  = String(item.german || '').trim();
    if (!g) return;

    const wt   = String(item.word_type || '').toLowerCase().trim();
    const bare = g.replace(ARTICLE_PREFIX_RE, '');

    const add = t => { if (t) { terms.add(t); termToId.set(t.toLowerCase(), item.id); } };

    add(g);
    if (bare !== g) add(bare);

    if (wt === 'noun') {
      const plural = String(item.plural_form || '').trim().replace(ARTICLE_PREFIX_RE, '');
      if (plural) add(plural);
    } else if (wt === 'verb') {
      [item.infinitive, item.past_simple, item.past_participle].forEach(f => {
        const v = String(f || '').trim();
        if (v) add(v);
      });
    } else if (wt === 'adjective') {
      ADJ_ENDINGS.forEach(sfx => add(bare + sfx));
    }
  });

  if (!terms.size) return { pattern: null, termToId: null };
  const escaped = [...terms]
    .sort((a, b) => b.length - a.length)
    .map(t => t.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'));
  return {
    pattern: new RegExp(
      `(?<![${VOCAB_WORD_EDGE}])(${escaped.join('|')})(?![${VOCAB_WORD_EDGE}])`,
      'gi'
    ),
    termToId
  };
}

function applyVocabUnderlines(escapedText, pattern, termToId) {
  if (!pattern) return escapedText;
  return escapedText.replace(pattern, (match) => {
    const id = termToId.get(match.toLowerCase()) || '';
    return `<span class="vocab-underline" data-vocab-id="${id}">${match}</span>`;
  });
}

function renderTextBody(text, vocab) {
  const raw = String(text.text_content || text.previewContent || '').trim();

  if (!raw) {
    return `
      <p class="txdet-empty">
        Este texto todavía no tiene contenido base guardado en Supabase.
        Puedes continuar igualmente a los ejercicios si el vocabulario del nivel ya está cargado.
      </p>
    `;
  }

  const { pattern, termToId } = buildVocabData(vocab);

  return raw
    .split(/\n\s*\n/)
    .map(paragraph => {
      let html = escapeHtml(paragraph);
      html = applyVocabUnderlines(html, pattern, termToId);
      return `<p>${html.replace(/\n/g, '<br>')}</p>`;
    })
    .join('');
}

/* ── VOCAB DETAIL PANEL ──────────────────────────────────────── */
function openVocabPanel(item, triggerEl) {
  if (!item) return;

  const set = (id, val) => { const el = $(id); if (el) el.textContent = String(val || ''); };
  const row = (id, visible) => { const el = $(id); if (el) el.hidden = !visible; };

  // Header
  const articleEl = $('vp-article');
  if (articleEl) {
    articleEl.textContent = item.article || '';
    articleEl.hidden = !item.article;
  }
  set('vp-word', item.german);

  // Detail rows — only shown when data is present
  row('vp-row-meaning',    !!item.spanish);           set('vp-meaning',    item.spanish);
  row('vp-row-type',       !!item.word_type);         set('vp-type',       item.word_type);
  row('vp-row-plural',     !!item.plural_form);       set('vp-plural',     item.plural_form);
  row('vp-row-infinitive', !!item.infinitive);        set('vp-infinitive', item.infinitive);
  row('vp-row-example',    !!item.example_sentence_de); set('vp-example',  item.example_sentence_de);

  const panel = $('vocab-panel');
  panel.removeAttribute('aria-hidden');
  panel.classList.add('is-open');

  // On mobile, scroll so the tapped word sits above the bottom sheet
  if (triggerEl && window.innerWidth < 680) {
    const panelH = window.innerHeight * 0.55;
    const rect = triggerEl.getBoundingClientRect();
    const targetTop = (window.innerHeight - panelH) / 2;
    const delta = rect.top - targetTop;
    if (Math.abs(delta) > 8) {
      const scrollEl = $('screen-content');
      (scrollEl || window).scrollBy({ top: delta, behavior: 'smooth' });
    }
  }
}

function closeVocabPanel() {
  const panel = $('vocab-panel');
  if (!panel) return;
  panel.setAttribute('aria-hidden', 'true');
  panel.classList.remove('is-open');
}

$('content-body').addEventListener('click', e => {
  const span = e.target.closest('.vocab-underline[data-vocab-id]');
  if (!span) return;
  const item = (currentTextVocab || []).find(v => String(v.id) === span.dataset.vocabId);
  if (item) openVocabPanel(item, span);
});

$('vp-close').addEventListener('click', closeVocabPanel);

document.addEventListener('click', e => {
  if (!$('vocab-panel')?.classList.contains('is-open')) return;
  if (e.target.closest('#vocab-panel') || e.target.closest('.vocab-underline')) return;
  closeVocabPanel();
});

function renderPremiumGateBody(text) {
  const excerpt = String(text.previewContent || '').trim().slice(0, 350);
  const excerptHtml = excerpt
    ? excerpt.split(/\n\s*\n/).map(p => `<p>${escapeHtml(p)}</p>`).join('')
    : '';
  return `
    <div class="premium-gate">
      ${excerptHtml ? `<div class="premium-gate-excerpt">${excerptHtml}</div>` : ''}
      <div class="premium-gate-lock">
        <span class="premium-gate-icon" aria-hidden="true">🔒</span>
        <p class="premium-gate-title">${escapeHtml(text.title)}</p>
        ${text.topic ? `<p class="premium-gate-topic">${escapeHtml(text.topic)}</p>` : ''}
        <p class="premium-gate-msg">Este texto es premium. Escríbenos para obtener acceso.</p>
        <a class="btn-back premium-gate-cta" href="mailto:${SUPPORT_EMAIL}">Contactar → ${SUPPORT_EMAIL}</a>
      </div>
    </div>
  `;
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
   INIT — resolve URL and route
══════════════════════════════════════════════════════════════ */
(async function initRouting() {
  const pathname = window.location.pathname;
  const levelParam = new URLSearchParams(window.location.search).get('nivel');

  if (pathname === '/textos') {
    $('main-app').style.display = 'block';
    screens.landing.style.display = 'none';
    await goToTextos({ pushState: false });
  } else if (pathname.startsWith('/textos/')) {
    const slug = decodeURIComponent(pathname.slice('/textos/'.length));
    if (levelParam) selectedLevel = levelParam.toLowerCase();
    $('main-app').style.display = 'block';
    screens.landing.style.display = 'none';
    $('app-header').classList.remove('app-is-landing');
    await openTextBySlug(slug);
  } else {
    // Default: landing
    $('main-app').style.display = 'none';
    updateSEOMeta({
      title: 'APP Vokabel Lab imKontext',
      description: 'Aprende alemán con textos de actualidad. Practica vocabulario real con imKontext de Vokabel Lab.',
      canonical: window.location.origin + '/'
    });
  }
})();
