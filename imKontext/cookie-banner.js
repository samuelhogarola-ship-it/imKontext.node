/* imKontext cookie consent + analytics config */
(function () {
  'use strict';

  function init() {
    // GA must initialise BEFORE the banner so gtag consent defaults
    // are queued before the script tag is injected (Consent Mode v2).
    if (window.GoogleAnalyticsCore) {
      GoogleAnalyticsCore.init({
        measurementId: 'G-KT1FWQKQEX',
        preferencesKey: 'imkontext_cookie_consent_preferences',
      });
    }

    CookieBannerCore.init({
      storageKey:  'imkontext_cookie_consent',
      imageSrc:    '/imK.cookie.webp',
      imageAlt:    'Cookies imKontext',
      imageWidth:  160,
      imageHeight: 157,
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
      onAccept: function (prefs) {
        if (prefs.analiticas && window.GoogleAnalyticsCore) GoogleAnalyticsCore.grantConsent();
      },
      onReject: function () {
        if (window.GoogleAnalyticsCore) GoogleAnalyticsCore.revokeConsent();
      },
      onSaveConfig: function (prefs) {
        if (!window.GoogleAnalyticsCore) return;
        if (prefs.analiticas) GoogleAnalyticsCore.grantConsent();
        else                  GoogleAnalyticsCore.revokeConsent();
      },
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
