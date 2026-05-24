/* ═══════════════════════════════════════════════════════════════
   webfuengirola-page.js — Core content module for /webfuengirola
   Single source of truth for page copy and carousel behaviour.
   Injected into the static shell at imKontext/webfuengirola.html.
═══════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  /* ── PAGE HTML ─────────────────────────────────────────────── */

  var PAGE_HTML = '\
<p class="static-kicker">Vokabel Lab · Ecosistema</p>\
<img class="wf-logo" src="/logo-wf.webp" alt="Web Fuengirola Studio">\
<h1 class="static-title">Web Fuengirola Studio</h1>\
<p class="static-lead">Diseño web y SEO local en Fuengirola, Costa del Sol. Webs rápidas, modernas y adaptadas al móvil para tiendas, restaurantes, clínicas, autónomos y negocios de la Costa del Sol. <strong>Webs publicadas en 48 horas.</strong></p>\
\
<section class="static-section">\
  <h2>El estudio de diseño web de referencia en Fuengirola y la Costa del Sol</h2>\
  <p>Web Fuengirola Studio es el estudio de diseño web especializado en negocios locales de Fuengirola, Mijas, Benalmádena, Torremolinos y toda la Costa del Sol. Trabajan con comercios, autónomos, restaurantes, clínicas y pequeñas empresas que necesitan una presencia digital real: una web profesional que cargue rápido, se vea bien en móvil y aparezca cuando un cliente potencial busca en Google.</p>\
  <p>Muchos pequeños empresarios llevan años sin web, con una web desactualizada o con una presencia en redes que no convierte. Web Fuengirola Studio resuelve eso de raíz: diseñan páginas web profesionales desde 300&nbsp;€ + IVA, publicadas en 48 horas, con SEO local activado desde el primer día para que el negocio aparezca en Google Maps, en las búsquedas locales de Fuengirola y en los resultados que realmente importan.</p>\
  <p>No trabajan con grandes corporaciones. Su foco es el pequeño empresario de la Costa del Sol: el que abre a las 9, cierra tarde y necesita que su web trabaje por él mientras atiende a sus clientes. Esa es la filosofía detrás de cada proyecto que construyen.</p>\
  <p>Vokabel Lab, der die das e imKontext son aplicaciones de aprendizaje nacidas en este mismo estudio — prueba de que cuando diseño, tecnología y propósito se alinean, el resultado va mucho más allá de una web bonita.</p>\
</section>\
\
<section class="static-section">\
  <h2>Diseño web, SEO local y mucho más para negocios en Fuengirola</h2>\
  <div class="wf-carousel" id="wf-carousel">\
    <div class="wf-carousel-viewport"><div class="wf-carousel-track" id="wf-track">\
      <div class="wf-slide">\
        <div class="wf-card"><span class="wf-card-icon">🖥️</span><h3>Diseño web profesional</h3><p>Webs rápidas, modernas y adaptadas a móvil para negocios locales. Publicadas en 48 horas desde 300&nbsp;€ + IVA.</p></div>\
        <div class="wf-card"><span class="wf-card-icon">📍</span><h3>SEO local en Fuengirola</h3><p>Posicionamiento en Google para aparecer cuando alguien busca tu servicio en Fuengirola y la Costa del Sol.</p></div>\
      </div>\
      <div class="wf-slide">\
        <div class="wf-card"><span class="wf-card-icon">📱</span><h3>Community Manager</h3><p>Gestión profesional de redes sociales: contenido, publicaciones y estrategia adaptada al negocio local.</p></div>\
        <div class="wf-card"><span class="wf-card-icon">🔧</span><h3>Mantenimiento web</h3><p>Actualizaciones, seguridad, copias de seguridad y soporte continuo para que la web siempre funcione.</p></div>\
      </div>\
    </div></div>\
    <div class="wf-controls">\
      <button class="wf-btn" id="wf-prev" aria-label="Anterior">←</button>\
      <button class="wf-btn" id="wf-next" aria-label="Siguiente">→</button>\
      <div class="wf-dots" id="wf-dots" aria-hidden="true"></div>\
    </div>\
  </div>\
</section>\
\
<div class="static-cta">\
  <p>¿Tienes una idea para tu negocio en Fuengirola?</p>\
  <a href="https://www.webfuengirola.es/" target="_blank" rel="noreferrer">Visitar webfuengirola.es →</a>\
</div>';

  /* ── INJECT ────────────────────────────────────────────────── */

  function injectPage() {
    var main = document.getElementById('wf-main');
    if (!main) return;
    main.innerHTML = PAGE_HTML;
    initCarousel();
  }

  /* ── CAROUSEL ──────────────────────────────────────────────── */

  function initCarousel() {
    var track    = document.getElementById('wf-track');
    var dotsEl   = document.getElementById('wf-dots');
    var btnPrev  = document.getElementById('wf-prev');
    var btnNext  = document.getElementById('wf-next');
    if (!track) return;

    var slides  = track.querySelectorAll('.wf-slide');
    var total   = slides.length;
    var current = 0;
    var timer   = null;

    /* build dots */
    for (var i = 0; i < total; i++) {
      var dot = document.createElement('button');
      dot.className = 'wf-dot';
      dot.setAttribute('aria-label', 'Ir a slide ' + (i + 1));
      dot.dataset.i = i;
      dotsEl.appendChild(dot);
    }
    var dots = dotsEl.querySelectorAll('.wf-dot');

    function goTo(n) {
      current = (n + total) % total;
      track.style.transform = 'translateX(-' + (current * 100) + '%)';
      dots.forEach(function (d, i) { d.classList.toggle('active', i === current); });
    }

    function resetTimer() {
      clearInterval(timer);
      timer = setInterval(function () { goTo(current + 1); }, 8000);
    }

    btnPrev.addEventListener('click', function () { goTo(current - 1); resetTimer(); });
    btnNext.addEventListener('click', function () { goTo(current + 1); resetTimer(); });
    dotsEl.addEventListener('click', function (e) {
      var d = e.target.closest('.wf-dot');
      if (d) { goTo(Number(d.dataset.i)); resetTimer(); }
    });

    goTo(0);
    resetTimer();
  }

  /* ── BOOT ──────────────────────────────────────────────────── */

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', injectPage);
  } else {
    injectPage();
  }
})();
