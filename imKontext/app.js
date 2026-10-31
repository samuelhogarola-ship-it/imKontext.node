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
let selectedCategory = null; // null = all categories
let currentTextsPage = 0;
let selectedModos  = [];  // array — supports multi-select
let currentVocab     = [];
let currentTextVocab = [];   // linked vocab for current text version (reader underlines)
let queue          = [];
let currentIdx     = 0;
let score          = { correct: 0, wrong: 0 };
let wrongWords     = [];  // words answered incorrectly in current session
let numPalabras    = 0;
let isReaderModeActive = false;
const TEXTS_PER_PAGE = 10;

/* ── TARGET LANGUAGE ROUTES ──────────────────────────────────── */
const LANGUAGE_ROUTE_MAP = Object.freeze({
  de: { canonical: 'deutsch', aliases: ['deutsch', 'german'] },
  es: { canonical: 'espanol', aliases: ['espanol', 'español', 'spanish'] },
  en: { canonical: 'english', aliases: ['english', 'inglés', 'ingles'] },
  fi: { canonical: 'suomi', aliases: ['suomi', 'finés', 'fines', 'finnish'] },
  it: { canonical: 'italiano', aliases: ['italiano', 'italian'] },
  pt: { canonical: 'portugues', aliases: ['portugues', 'português', 'portuguese'] },
});
let activeLanguagePrefix = '';

function normalizeLanguageRouteSegment(segment) {
  return decodeURIComponent(String(segment || ''))
    .trim()
    .toLocaleLowerCase('es')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '');
}

function resolveLanguageRoute(pathname = window.location.pathname) {
  const segment = String(pathname || '').split('/').filter(Boolean)[0];
  const normalized = normalizeLanguageRouteSegment(segment);
  if (!normalized) return null;

  for (const [targetLang, config] of Object.entries(LANGUAGE_ROUTE_MAP)) {
    const alias = config.aliases.find(candidate => normalizeLanguageRouteSegment(candidate) === normalized);
    if (alias) {
      return {
        targetLang,
        canonicalPath: `/${config.canonical}`,
        isAlias: normalizeLanguageRouteSegment(alias) !== config.canonical,
      };
    }
  }
  return null;
}

function languagePathPrefix() {
  return activeLanguagePrefix;
}

function withLanguagePath(pathname) {
  const base = pathname === '/' ? '' : String(pathname || '').replace(/\/$/, '');
  return `${languagePathPrefix()}${base || '/'}`;
}

function applyLanguageRoute(pathname = window.location.pathname, { replaceAlias = true } = {}) {
  const route = resolveLanguageRoute(pathname);
  if (!route) {
    activeLanguagePrefix = '';
    return { pathname, route: null };
  }

  setTargetLang(route.targetLang);
  activeLanguagePrefix = route.canonicalPath;
  const rest = pathname.slice(pathname.indexOf('/', 1)) || '/';
  const canonicalPath = withLanguagePath(rest);
  if (replaceAlias && (route.isAlias || pathname !== canonicalPath)) {
    history.replaceState({ screen: rest === '/' ? 'landing' : 'app', targetLang: route.targetLang }, '', canonicalPath);
  }
  return { pathname: rest, route };
}

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
  profile:   $('screen-profile'),
};

function getCategoryLabels() {
  return {
    tecnologia: t('cat.tecnologia'),
    sociedad: t('cat.sociedad'),
    deporte: t('cat.deporte'),
    movilidad: t('cat.movilidad'),
    medioambiente: t('cat.medioambiente'),
    salud: t('cat.salud'),
    educacion: t('cat.educacion'),
    trabajo: t('cat.trabajo'),
    ciencia: t('cat.ciencia'),
    cultura: t('cat.cultura'),
    internacional: t('cat.internacional'),
    politica: t('cat.politica'),
    economia: t('cat.economia'),
  };
}

function setReadingMode(active) {
  isReaderModeActive = active;
  document.body.classList.toggle('reader-mode-active', active);

  const btn = $('btn-toggle-reading-mode');
  if (btn) {
    btn.setAttribute('aria-pressed', String(active));
    btn.textContent = active ? t('content.exit_reading') : t('content.reading_mode');
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

  ['textos','content','activity','ejercicio','resultado','dashboard','profile'].forEach(s => {
    const el = screens[s];
    if (el) el.style.display = s === name ? '' : 'none';
  });
  $('main-card').classList.toggle('is-textos', name === 'textos');
  $('main-card').classList.toggle('is-exercise', name === 'ejercicio');
  $('app-header').classList.toggle('app-is-landing', name === 'landing');
  $('nav-practice')?.classList.toggle('is-active', ['textos','content','activity','ejercicio','resultado'].includes(name));
  $('nav-dashboard')?.classList.toggle('is-active', name === 'dashboard');
  $('nav-profile')?.classList.toggle('is-active', name === 'profile');

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
  const base = withLanguagePath(`/textos/${encodeURIComponent(text.slug)}`);
  return level ? `${base}?nivel=${level.toUpperCase()}` : base;
}

function showLanding() {
  $('main-app').style.display = 'none';
  screens.landing.style.display = '';
  $('app-header').classList.add('app-is-landing');
  const footer = $('app-footer');
  if (footer) footer.style.display = 'none';
  const deck = $('ln-deck');
  if (deck) deck.innerHTML = t('landing.deck') + '<br>' + t('landing.deck2');
  updateSEOMeta({
    title: t('seo.home_title'),
    description: t('seo.home_desc'),
    canonical: window.location.origin + withLanguagePath('/')
  });
  applyI18nToDOM();
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
    errEl.textContent = t('textos.not_found');
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
    btn.textContent = t('content.shared');
  } catch {
    prompt(t('misc.copy_link'), url);
    return;
  }
  setTimeout(() => { btn.textContent = t('content.share'); }, 2000);
});

/* ── POPSTATE ────────────────────────────────────────────────── */
window.addEventListener('popstate', async () => {
  const { pathname } = applyLanguageRoute(window.location.pathname);
  const levelParam = new URLSearchParams(window.location.search).get('nivel');

  if (pathname === '/dashboard') {
    await showDashboard();
  } else if (pathname === '/profile' || pathname === '/perfil') {
    await showProfile({ pushState: false });
  } else if (pathname === '/textos') {
    await goToTextos({ pushState: false });
  } else if (pathname.startsWith('/textos/')) {
    const slug = decodeURIComponent(pathname.slice('/textos/'.length));
    if (levelParam) selectedLevel = levelParam.toLowerCase();
    await openTextBySlug(slug);
  } else {
    selectedTopic = null;
    selectedCategory = null;
    showLanding();
  }
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 1 → LANDING
══════════════════════════════════════════════════════════════ */
$('btn-entrar').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});
$('btn-login')?.addEventListener('click', () => {
  openAccountDialog();
});

function openAccountDialog() {
  const dialog = $('account-dialog');
  if (!dialog) return;
  window.AuthCore?.refresh?.();
  if (!dialog.open) dialog.showModal();
}

function closeAccountDialog() {
  const dialog = $('account-dialog');
  if (dialog?.open) dialog.close();
}

$('account-dialog-close')?.addEventListener('click', closeAccountDialog);
$('account-dialog')?.addEventListener('click', event => {
  if (event.target === $('account-dialog')) closeAccountDialog();
});
$('auth-header-btn')?.addEventListener('click', () => {
  if (window.VokabelLab?.user?.status === 'authenticated') showProfile();
  else openAccountDialog();
});

/* ══════════════════════════════════════════════════════════════
   PANTALLA 2 — SELECCIÓN DE TEXTOS
══════════════════════════════════════════════════════════════ */
async function goToTextos({ pushState: doPush = true } = {}) {
  if (doPush) {
    history.pushState({ screen: 'textos', targetLang: getTargetLang() }, '', withLanguagePath('/textos'));
  }
  updateSEOMeta({
    title: t('seo.textos_title'),
    description: t('seo.textos_desc'),
    canonical: window.location.origin + withLanguagePath('/textos')
  });
  showScreen('textos');
  applyI18nToDOM();
  currentTextsPage = 0;

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
    renderTextGrid(getFilteredTexts());
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
    grid.innerHTML = `<div class="txsel-empty">${escapeHtml(t('textos.empty'))}</div>`;
    return;
  }

  const sorted = sortTextsByDate(list);

  const featured = getFeaturedText(sorted);
  const rest = featured ? sorted.filter(text => text.id !== featured.id) : sorted;
  const totalPages = Math.max(1, Math.ceil(rest.length / TEXTS_PER_PAGE));
  currentTextsPage = Math.min(currentTextsPage, totalPages - 1);
  const startIdx = currentTextsPage * TEXTS_PER_PAGE;
  const visibleTexts = rest.slice(startIdx, startIdx + TEXTS_PER_PAGE);

  if (featured) {
    const featuredWrap = document.createElement('section');
    featuredWrap.className = 'tx-featured';
    featuredWrap.innerHTML = `
      ${renderArchiveNotice(sorted)}
      <div class="tx-featured-head">
        <p class="tx-featured-kicker">Destacado de la semana</p>
        ${renderFeaturedAccessTag(featured)}
      </div>
      <button class="tx-featured-card catalog-compact" data-testid="featured-card" type="button" aria-label="Abrir tema principal: ${escapeHtml(featured.title)}">
        <div class="tx-featured-media" aria-hidden="true">
          <img class="tx-featured-image" src="/textos-featured-hero.png" alt="">
        </div>
        <div class="tx-featured-copy">
          <div class="tx-featured-copy-inner">
            <div class="tx-featured-source-line">
              <span class="tx-featured-source">${escapeHtml(getEditorialSourceLabel(featured))}</span>
              <span class="tx-featured-date">${formatShortDate(featured.published_at)}</span>
            </div>
            <h3 class="tx-featured-title">${escapeHtml(featured.title)}</h3>
            <div class="tx-featured-meta">
              ${renderPrimaryLevelBadge(featured.levels)}
            </div>
            <p class="tx-featured-desc">${renderFeaturedSummary(featured)}</p>
          </div>
        </div>
        <span class="tx-featured-arrow">→</span>
      </button>
    `;
    featuredWrap.querySelector('[data-testid="featured-card"]').addEventListener('click', () => selectText(featured));
    grid.appendChild(featuredWrap);
  }

  const listEl = document.createElement('div');
  listEl.className = 'tx-topic-list';
  visibleTexts.forEach((item, index) => {
    listEl.appendChild(createTextRow(item, startIdx + index + 1));
  });
  grid.appendChild(listEl);
  renderTextsPagination(rest.length);
}

function createTextRow(text, position) {
  const row = document.createElement('button');
  const isLocked = !canAccessText(text);
  row.className = `tx-row${isLocked ? ' tx-row--locked' : ''}`;
  row.dataset.testid = 'text-row';
  row.setAttribute('type', 'button');
  row.setAttribute('role', 'listitem');
  row.setAttribute('aria-label', `Seleccionar texto: ${text.title}`);

  row.innerHTML = `
    <span class="tx-row-num">${String(position).padStart(2, '0')}</span>
    <span class="tx-row-source">${escapeHtml(getEditorialSourceLabel(text))}</span>
    <span class="tx-row-date">${formatShortDate(text.published_at)}</span>
    <span class="tx-row-title">${escapeHtml(text.title)}</span>
    <div class="tx-row-meta">
      ${renderAccessTag(text)}
      ${renderPrimaryLevelBadge(text.levels)}
    </div>
    <span class="tx-row-arrow">${isLocked ? '<svg width="11" height="13" viewBox="0 0 11 13" fill="none" aria-hidden="true"><rect x=".7" y="5.5" width="9.6" height="7" rx="1.3" stroke="currentColor" stroke-width="1.3"/><path d="M3 5.5V3.5a2.5 2.5 0 0 1 5 0v2" stroke="currentColor" stroke-width="1.3" stroke-linecap="round"/></svg>' : '→'}</span>
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

function renderPrimaryLevelBadge(levels = []) {
  const level = pickPreferredLevel(levels);
  return level
    ? `<span class="tx-lvl-badge tx-lvl-badge--${level}">${escapeHtml(level)}</span>`
    : '';
}

function pickPreferredLevel(levels = []) {
  if (!Array.isArray(levels) || levels.length === 0) return '';
  const preferred = levels.find(level => String(level).toLowerCase() === selectedLevel);
  return preferred || levels[0] || '';
}

function getEditorialSourceLabel(text) {
  const raw = String(text?.source || text?.topic || getCategoryLabel(text?.categoria) || 'Archivo').trim();
  return raw || 'Archivo';
}

function renderFeaturedSummary(text) {
  const preview = String(text?.previewContent || '').replace(/\s+/g, ' ').trim();
  if (preview) {
    const firstSentence = preview.split(/(?<=[.!?])\s+/)[0] || preview;
    const shortPreview = firstSentence.length > 180
      ? `${firstSentence.slice(0, 177).trimEnd()}...`
      : firstSentence;
    return escapeHtml(shortPreview);
  }
  return escapeHtml(renderFeaturedDescription(text));
}

function renderArchiveNotice(list = []) {
  const premiumCount = list.filter(text => text?.access_status === 'premium').length;
  if (premiumCount === 0) return '';

  return `
    <div class="tx-archive-note" role="note">
      <span class="tx-archive-note-icon" aria-hidden="true">✦</span>
      <p class="tx-archive-note-copy"><strong>Esta selección incluye textos premium.</strong> El texto destacado semanal sigue apareciendo primero para entrar directamente.</p>
    </div>
  `;
}

function formatShortDate(value) {
  if (!value) return '';
  return new Date(value).toLocaleDateString(getDateLocale(), { day: '2-digit', month: 'short', year: 'numeric' });
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
  let list = allTexts;
  if (selectedCategory) {
    list = list.filter(t => t.categoria === selectedCategory);
  }
  return list;
}

function renderTextsPagination(totalTexts) {
  const container = $('txsel-pagination');
  if (!container) return;

  if (totalTexts <= TEXTS_PER_PAGE) {
    container.style.display = 'none';
    container.innerHTML = '';
    return;
  }

  const totalPages = Math.ceil(totalTexts / TEXTS_PER_PAGE);
  const start = currentTextsPage * TEXTS_PER_PAGE + 1;
  const end = Math.min(totalTexts, start + TEXTS_PER_PAGE - 1);

  container.style.display = 'flex';
  container.innerHTML = `
    <button
      class="txsel-page-btn"
      id="txsel-page-prev"
      type="button"
      aria-label="Ver textos anteriores"
      ${currentTextsPage === 0 ? 'disabled' : ''}
    >
      ←
    </button>
    <p class="txsel-page-status">${start}-${end} de ${totalTexts}</p>
    <button
      class="txsel-page-btn"
      id="txsel-page-next"
      type="button"
      aria-label="Ver más textos"
      ${currentTextsPage >= totalPages - 1 ? 'disabled' : ''}
    >
      →
    </button>
  `;

  $('txsel-page-prev')?.addEventListener('click', () => {
    if (currentTextsPage === 0) return;
    currentTextsPage -= 1;
    renderTextGrid(getFilteredTexts());
  });

  $('txsel-page-next')?.addEventListener('click', () => {
    if (currentTextsPage >= totalPages - 1) return;
    currentTextsPage += 1;
    renderTextGrid(getFilteredTexts());
  });
}

function buildTopicChips() {
  const container = $('txsel-topic-filter');
  if (!container) return;
  const categories = [...new Set(
    allTexts
      .map(text => text.categoria)
      .filter(Boolean)
  )].sort((a, b) => getCategoryLabel(a).localeCompare(getCategoryLabel(b), 'es'));

  container.innerHTML = '';

  if (categories.length === 0) {
    return;
  }

  const allLabel = getUILang() === 'es' ? 'Todas' : getUILang() === 'de' ? 'Alle' : getUILang() === 'fi' ? 'Kaikki' : getUILang() === 'it' ? 'Tutte' : getUILang() === 'pt' ? 'Todas' : 'All';
  const featuredCategories = ['tecnologia', 'sociedad', 'medioambiente'].filter(value => categories.includes(value));
  const visibleCategories = [...featuredCategories, ...categories.filter(value => !featuredCategories.includes(value))].slice(0, 3);
  const options = [{ value: null, label: allLabel }, ...visibleCategories.map(value => ({
    value,
    label: getCategoryLabel(value),
  }))];

  options.forEach(({ value, label }) => {
    const btn = document.createElement('button');
    btn.type = 'button';
    btn.className = 'txsel-topic-chip';
    btn.textContent = label;
    btn.dataset.category = value || '';
    btn.classList.toggle('active', value === selectedCategory || (!value && !selectedCategory));
    btn.addEventListener('click', () => {
      if (selectedCategory === value) return;
      selectedCategory = value;
      currentTextsPage = 0;
      updateTopicChips();
      renderTextGrid(getFilteredTexts());
    });
    container.appendChild(btn);
  });

  if (categories.length > 3) {
    const select = document.createElement('select');
    select.className = 'txsel-category-select';
    select.setAttribute('aria-label', allLabel);
    select.innerHTML = `<option value="">${escapeHtml(allLabel)}</option>${categories.map(value => `<option value="${escapeHtml(value)}">${escapeHtml(getCategoryLabel(value))}</option>`).join('')}`;
    select.value = selectedCategory || '';
    select.addEventListener('change', () => {
      selectedCategory = select.value || null;
      currentTextsPage = 0;
      updateTopicChips();
      renderTextGrid(getFilteredTexts());
    });
    container.appendChild(select);
  }
}

function updateTopicChips() {
  document.querySelectorAll('#txsel-topic-filter .txsel-topic-chip').forEach(chip => {
    const value = chip.dataset.category || null;
    chip.classList.toggle('active', value === selectedCategory || (!value && !selectedCategory));
  });
}

function getCategoryLabel(slug) {
  return getCategoryLabels()[slug] || slug;
}

$('btn-volver-landing-from-textos').addEventListener('click', () => {
  selectedTopic = null;
  selectedCategory = null;
  history.pushState({ screen: 'landing', targetLang: getTargetLang() }, '', withLanguagePath('/'));
  showLanding();
});

// Nav: volver a la landing desde logo o enlace activo
['nav-pagina-principal', 'nav-imkontext-link'].forEach(id => {
  const el = document.getElementById(id);
  if (!el) return;
  el.addEventListener('click', e => {
    e.preventDefault();
    selectedTopic = null;
    selectedCategory = null;
    history.pushState({ screen: 'landing', targetLang: getTargetLang() }, '', withLanguagePath('/'));
    showLanding();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
});

// Nav: "Dashboard"
document.getElementById('nav-dashboard').addEventListener('click', async e => {
  e.preventDefault();
  if (window.location.pathname !== withLanguagePath('/dashboard')) {
    history.pushState({ screen: 'dashboard', targetLang: getTargetLang() }, '', withLanguagePath('/dashboard'));
  }
  await showDashboard();
});

document.getElementById('nav-practice').addEventListener('click', async e => {
  e.preventDefault();
  await goToTextos({ pushState: true });
});

async function showProfile({ pushState: doPush = true } = {}) {
  if (doPush && window.location.pathname !== withLanguagePath('/profile')) {
    history.pushState({ screen: 'profile', targetLang: getTargetLang() }, '', withLanguagePath('/profile'));
  }
  await window.AuthCore?.refresh?.();
  await showScreen('profile');
}

document.getElementById('nav-profile').addEventListener('click', async e => {
  e.preventDefault();
  await showProfile();
});

document.getElementById('btn-volver-from-profile').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});

window.addEventListener('vokabellab:auth-change', event => {
  const authenticated = Boolean(event.detail?.authenticated);
  const headerButton = $('auth-header-btn');
  if (headerButton) headerButton.textContent = authenticated ? 'Mi perfil' : 'Iniciar sesión';
  if (authenticated) closeAccountDialog();
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

  const globalScoreClass = globalPct >= DASHBOARD_CONFIG.progressThresholds.good ? 'db-score--good'
                         : globalPct >= DASHBOARD_CONFIG.progressThresholds.ok   ? 'db-score--ok'
                         : 'db-score--low';

  $('db-stats-grid').innerHTML = `
    <div class="db-stat-col">
      <span class="db-stat-num">${totalDone}</span>
      <span class="db-stat-lbl">${escapeHtml(t('result.words'))}<br>${escapeHtml(t('result.correct'))}</span>
    </div>
    <div class="db-stat-col">
      <span class="db-stat-num">${activeTexts}</span>
      <span class="db-stat-lbl">${escapeHtml(t('textos.title'))}</span>
    </div>
    <div class="db-stat-col db-stat-col--circle">
      <span class="db-global-circle ${globalScoreClass}">${globalPct}%</span>
      <span class="db-stat-lbl">${escapeHtml(t('progress.tracking'))}</span>
    </div>
  `;

  const levelOrder = { a2: 0, b1: 1, b2: 2, c1: 3 };
  entries.sort((a, b) => {
    const ta = a.text?.title || a.textId;
    const tb = b.text?.title || b.textId;
    if (ta !== tb) return ta.localeCompare(tb, 'es');
    return (levelOrder[a.level] ?? 9) - (levelOrder[b.level] ?? 9);
  });

  const listEl = $('db-text-list');
  listEl.innerHTML = '';

  entries.forEach((e, i) => {
    const pct   = e.total > 0 ? Math.round((e.done / e.total) * 100) : 0;
    const title = e.text?.title ? escapeHtml(e.text.title) : `—`;
    const num   = String(i + 1).padStart(2, '0');
    const scoreClass = pct >= DASHBOARD_CONFIG.progressThresholds.good ? 'db-score--good'
                     : pct >= DASHBOARD_CONFIG.progressThresholds.ok   ? 'db-score--ok'
                     : 'db-score--low';

    const row = document.createElement('div');
    row.className = 'db-rank-row';
    row.innerHTML = `
      <span class="db-rank-num">${num}</span>
      <span class="db-rank-body">
        <span class="db-rank-meta">
          <span class="tx-lvl-badge tx-lvl-badge--${e.level}">${e.level.toUpperCase()}</span>
          <span class="db-rank-title">${title}</span>
        </span>
        <span class="db-bar-wrap">
          <span class="db-bar"><span class="db-bar-fill" style="width:${pct}%"></span></span>
          <span class="db-bar-label">${e.done} / ${e.total}</span>
        </span>
      </span>
      <span class="db-rank-score ${scoreClass}">${pct}%</span>
      <button class="db-rank-reset" type="button" aria-label="Reiniciar progreso">×</button>
    `;

    const goToText = e.text
      ? () => { selectedLevel = e.level; selectText(e.text); }
      : () => goToTextos({ pushState: true });

    row.addEventListener('click', goToText);

    row.querySelector('.db-rank-reset').addEventListener('click', ev => {
      ev.stopPropagation();
      localStorage.removeItem(e.key);
      localStorage.removeItem(`queue_${e.textId}_${e.level}`);
      showDashboard();
    });

    listEl.appendChild(row);
  });

  showScreen('dashboard');
}

document.getElementById('btn-volver-from-dashboard').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});

document.getElementById('btn-dashboard-go-textos').addEventListener('click', async () => {
  await goToTextos({ pushState: true });
});

// Footer nav links
['footer-imkontext-link', 'footer-imkontext-brand'].forEach(id => {
  const footerImkontext = document.getElementById(id);
  if (!footerImkontext) return;
  footerImkontext.addEventListener('click', e => {
    e.preventDefault();
    selectedTopic = null;
    selectedCategory = null;
    history.pushState({ screen: 'landing', targetLang: getTargetLang() }, '', withLanguagePath('/'));
    showLanding();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
});


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

  $('content-title').textContent = text.title || t('content.default_title');
  $('content-meta').innerHTML = renderTextMeta(text);
  $('act-text-title').textContent = text.title || t('activity.title');

  const canAccess = canAccessText(text);
  const freemiumNotice = $('freemium-notice');
  if (freemiumNotice) {
    freemiumNotice.style.display = isFreemiumText(text) ? '' : 'none';
  }
  $('btn-ir-actividad').style.display = canAccess ? '' : 'none';
  $('btn-toggle-reading-mode').style.display = canAccess ? '' : 'none';

  if (canAccess) {
    $('content-body').innerHTML = `<p class="txdet-empty">${escapeHtml(t('content.loading_version'))}</p>`;
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
    description: t('seo.text_detail_desc', { title: text.title, level: selectedLevel.toUpperCase() }),
    canonical: window.location.origin + getTextUrl(text, selectedLevel)
  });

  showScreen('content');
  applyI18nToDOM();
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
  if (!selectedModos.length) {
    hint.textContent = t('hint.none');
  } else if (selectedModos.length === 1) {
    hint.textContent = t(`mode_desc.${selectedModos[0]}`) || '';
  } else {
    const modeNames = selectedModos.map(m => t(`mode.${m}`) || m).join(' → ');
    hint.textContent = t('hint.multiple', { modes: modeNames });
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
          description: t('seo.text_detail_desc', { title: selectedText.title, level: selectedLevel.toUpperCase() }),
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
          `/api/text-version-vocabulary-core?textVersionId=${encodeURIComponent(selectedTextVersion.id)}`
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
      `/api/text-version-vocabulary-core?textVersionId=${encodeURIComponent(vId)}`
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
    status.textContent = t('level.unavailable', { level: levelLabel });
    $('btn-empezar').disabled = true;
    return;
  }

  if (!selectedTextVersion) {
    status.textContent = t('level.no_version', { level: levelLabel });
    $('btn-empezar').disabled = true;
    return;
  }

  if (typeof vocabCount === 'number') {
    status.textContent = vocabCount > 0
      ? t('level.vocab_count', { count: vocabCount, level: levelLabel })
      : t('level.no_vocab', { level: levelLabel });
    return;
  }

  status.textContent = t('level.selected', { level: levelLabel });
}

function updateProgressPanel() {
  if (!selectedText) return;
  const key = `progress_${selectedText.id}_${selectedLevel}`;
  const data = JSON.parse(localStorage.getItem(key) || 'null');
  const lvlLabel = selectedLevel.toUpperCase();

  $('weekly-progress-title').textContent = t('progress.title', { level: lvlLabel });

  if (data) {
    const pct = data.total > 0 ? Math.round((data.done / data.total) * 100) : 0;
    $('weekly-progress-pct').textContent = t('progress.pct', { pct });
    $('weekly-progress-fill').style.width = `${pct}%`;
    $('weekly-progress-main').textContent = t('progress.words_done', { done: data.done, total: data.total });
    $('weekly-progress-sub').textContent  = t('progress.words_in_level', { total: data.total, level: lvlLabel });
  } else {
    const total = numPalabras || 0;
    $('weekly-progress-pct').textContent  = t('progress.zero_pct');
    $('weekly-progress-fill').style.width = '0%';
    $('weekly-progress-main').textContent = t('progress.zero_words', { total });
    $('weekly-progress-sub').textContent  = t('progress.words_in_level', { total, level: lvlLabel });
  }
}

function checkSavedProgress() {
  if (!selectedText) return;
  const key = `queue_${selectedText.id}_${selectedLevel}`;
  const saved = localStorage.getItem(key);
  const banner = $('progreso-guardado-banner');
  if (saved) {
    const q = JSON.parse(saved);
    $('prog-guardado-txt').textContent = t('activity.words_pending', { n: q.length });
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
    const g  = String(getTargetWord(item) || '').trim();
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
        ${escapeHtml(t('content.empty_text'))}
        ${escapeHtml(t('content.empty_hint'))}
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
  set('vp-word', getTargetWord(item));

  // Detail rows — only shown when data is present
  const native = getNativeWord(item);
  row('vp-row-meaning',    !!native);                 set('vp-meaning',    native);
  row('vp-row-type',       !!item.word_type);         set('vp-type',       item.word_type);
  row('vp-row-plural',     !!item.plural_form);       set('vp-plural',     item.plural_form);
  row('vp-row-infinitive', !!item.infinitive);        set('vp-infinitive', item.infinitive);
  const targetEx = getTargetExample(item);
  row('vp-row-example',    !!targetEx);               set('vp-example',    targetEx);

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
        <svg class="premium-gate-icon" width="28" height="32" viewBox="0 0 28 32" fill="none" aria-hidden="true"><rect x="1.5" y="13" width="25" height="18" rx="3" stroke="currentColor" stroke-width="1.8"/><path d="M7 13V9a7 7 0 0 1 14 0v4" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/></svg>
        <p class="premium-gate-title">${escapeHtml(text.title)}</p>
        ${text.topic ? `<p class="premium-gate-topic">${escapeHtml(text.topic)}</p>` : ''}
        <p class="premium-gate-msg">${escapeHtml(t('content.premium_msg'))}</p>
        <a class="btn-back premium-gate-cta" href="mailto:${SUPPORT_EMAIL}">${escapeHtml(t('content.premium_cta'))} ${SUPPORT_EMAIL}</a>
      </div>
    </div>
  `;
}

function formatDate(value) {
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;

  return new Intl.DateTimeFormat(getDateLocale(), {
    day: 'numeric',
    month: 'long',
    year: 'numeric'
  }).format(date);
}

/* ══════════════════════════════════════════════════════════════
   INIT — resolve URL and route
══════════════════════════════════════════════════════════════ */
if (typeof onAuthChange === 'function') {
  onAuthChange(() => {
    if (allTexts.length > 0 && screens.textos.style.display !== 'none') {
      renderTextGrid(getFilteredTexts());
    }
  });
}

/* ── LANGUAGE SELECTOR ─────────────────────────────────────── */
(function initLangSelector() {
  const btn = $('lang-selector-btn');
  const dropdown = $('lang-selector-dropdown');
  const flagEl = $('lang-selector-flag');
  const codeEl = $('lang-selector-code');
  const grid = $('lang-ui-grid');
  if (!btn || !dropdown || !grid) return;

  function updateSelectorDisplay() {
    const lang = getUILang();
    const info = LANG_NAMES[lang];
    if (info) {
      flagEl.textContent = info.flag;
      codeEl.textContent = lang.toUpperCase();
    }
  }

  function buildGrid() {
    grid.innerHTML = '';
    const currentLang = getUILang();
    SUPPORTED_UI_LANGS.forEach(lang => {
      const info = LANG_NAMES[lang];
      if (!info) return;
      const item = document.createElement('button');
      item.type = 'button';
      item.className = 'lang-option' + (lang === currentLang ? ' active' : '');
      item.dataset.lang = lang;
      item.setAttribute('role', 'menuitem');
      item.innerHTML = `<span class="lang-option-flag">${info.flag}</span><span class="lang-option-name">${info.native}</span>`;
      item.addEventListener('click', () => {
        setUILang(lang);
        applyI18nToDOM();
        updateSelectorDisplay();
        buildGrid();
        closeDropdown();
        const deck = $('ln-deck');
        if (deck) deck.innerHTML = t('landing.deck') + '<br>' + t('landing.deck2');
        updateSEOMeta({
          title: t('seo.home_title'),
          description: t('seo.home_desc'),
          canonical: window.location.origin + withLanguagePath('/')
        });
      });
      grid.appendChild(item);
    });
  }

  function closeDropdown() {
    dropdown.classList.remove('open');
    btn.setAttribute('aria-expanded', 'false');
  }

  btn.addEventListener('click', (e) => {
    e.stopPropagation();
    const isOpen = dropdown.classList.contains('open');
    if (isOpen) {
      closeDropdown();
    } else {
      buildGrid();
      dropdown.classList.add('open');
      btn.setAttribute('aria-expanded', 'true');
    }
  });

  document.addEventListener('click', (e) => {
    if (!e.target.closest('#lang-selector')) closeDropdown();
  });

  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeDropdown();
  });

  updateSelectorDisplay();
})();

(async function initRouting() {
  const { pathname } = applyLanguageRoute(window.location.pathname);
  const levelParam = new URLSearchParams(window.location.search).get('nivel');

  if (pathname === '/dashboard') {
    $('main-app').style.display = 'block';
    screens.landing.style.display = 'none';
    await showDashboard();
  } else if (pathname === '/profile' || pathname === '/perfil') {
    $('main-app').style.display = 'block';
    screens.landing.style.display = 'none';
    await showProfile({ pushState: false });
  } else if (pathname === '/textos') {
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
    const deck = $('ln-deck');
    if (deck) deck.innerHTML = t('landing.deck') + '<br>' + t('landing.deck2');
    applyI18nToDOM();
    updateSEOMeta({
      title: t('seo.home_title'),
      description: t('seo.home_desc'),
      canonical: window.location.origin + withLanguagePath('/')
    });
  }
})();
