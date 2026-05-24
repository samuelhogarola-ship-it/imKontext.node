/* imKontext cookie consent config — delegates to CookieBannerCore */
(function () {
  'use strict';

  function init() {
    CookieBannerCore.init({
      storageKey:  'imkontext_cookie_consent',
      imageSrc:    '/imK.cookie.webp',
      imageAlt:    'Cookies imKontext',
      title:       'CONTROLA TU PRIVACIDAD',
      noticeHtml:  '<p>Utilizamos cookies propias y de terceros para analizar nuestros servicios y' +
                   ' mostrarte contenido relacionado con tus preferencias. Puedes aceptar todas las' +
                   ' cookies, rechazarlas o configurarlas. Para más información, consulta nuestra' +
                   ' <a href="/legal" class="cookie-link">Política de Cookies</a>.</p>',
      acceptLabel: 'ACEPTAR',
      rejectLabel: 'RECHAZAR',
      configLabel: 'CONFIGURACIÓN DE COOKIES',
      policyUrl:   '/legal',
      configUrl:   '/legal',
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
