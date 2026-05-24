/* ═══════════════════════════════════════════════════════════════
   cookie-banner.js — consent banner for all pages
   Injects banner HTML, reads/writes localStorage consent key.
   Add <script src="/cookie-banner.js"> to any page that needs it.
═══════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  var CONSENT_KEY = 'cookie_consent_decision';

  var BANNER_HTML =
    '<div id="cookie-banner" class="cookie-banner-wrapper">' +
      '<div class="cookie-banner-card">' +
        '<div class="cookie-banner-img-container">' +
          '<img src="/imK.cookie.webp" alt="Cookies Vokabel Lab" class="cookie-banner-img">' +
        '</div>' +
        '<h2>CONTROLA TU PRIVACIDAD</h2>' +
        '<p>Utilizamos cookies propias y de terceros para analizar nuestros servicios y mostrarte' +
        ' contenido relacionado con tus preferencias. Puedes aceptar todas las cookies, rechazarlas' +
        ' o configurarlas. Para más información, consulta nuestra' +
        ' <a href="/legal" class="cookie-link">Política de Cookies</a>.</p>' +
        '<div class="cookie-banner-buttons">' +
          '<button id="btn-cookie-reject" class="cookie-btn btn-cookie-secondary">RECHAZAR</button>' +
          '<button id="btn-cookie-accept" class="cookie-btn btn-cookie-primary">ACEPTAR</button>' +
        '</div>' +
        '<div class="cookie-banner-footer">' +
          '<a href="/legal" class="cookie-config-link">CONFIGURACIÓN DE COOKIES</a>' +
        '</div>' +
      '</div>' +
    '</div>';

  function init() {
    if (localStorage.getItem(CONSENT_KEY)) return;

    var wrapper = document.createElement('div');
    wrapper.innerHTML = BANNER_HTML;
    document.body.appendChild(wrapper.firstChild);

    var banner    = document.getElementById('cookie-banner');
    var btnAccept = document.getElementById('btn-cookie-accept');
    var btnReject = document.getElementById('btn-cookie-reject');

    banner.style.display = 'block';

    btnAccept.addEventListener('click', function () {
      localStorage.setItem(CONSENT_KEY, 'accepted');
      banner.style.display = 'none';
    });

    btnReject.addEventListener('click', function () {
      localStorage.setItem(CONSENT_KEY, 'rejected');
      banner.style.display = 'none';
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
