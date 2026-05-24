/* ═══════════════════════════════════════════════════════════════
   app-footer.js — Core footer for static pages (metodologia, legal)
   Inject the shared nav into #app-footer so the link list is
   maintained in a single place instead of duplicated per page.
═══════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  var NAV_HTML = [
    '<nav class="app-footer-nav" aria-label="Navegación">',
    '  <a href="https://www.samuelcoachdealeman.com/" target="_blank" rel="noreferrer">Samuel Coach de alemán</a>',
    '  <span class="app-footer-sep">|</span>',
    '  <a href="https://www.vokabellab.com/" target="_blank" rel="noreferrer">Vokabel Lab</a>',
    '  <span class="app-footer-sep">|</span>',
    '  <a href="https://derdiedas.vokabellab.com/" target="_blank" rel="noreferrer">der die das</a>',
    '  <span class="app-footer-sep">|</span>',
    '  <a href="/webfuengirola">Web Fuengirola Studio</a>',
    '  <span class="app-footer-sep">|</span>',
    '  <a href="/" class="nav-active">im Kontext</a>',
    '</nav>',
  ].join('\n');

  function initFooter() {
    var footer = document.getElementById('app-footer');
    if (!footer) return;
    footer.innerHTML = NAV_HTML;
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initFooter);
  } else {
    initFooter();
  }
})();
