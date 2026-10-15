/* Legacy shared retained for cached pages. Analytics is exclusively Umami. */
(function () {
  'use strict';

  // Cached consent and event handlers may still call the old API.
  function noop() {}
  window.GoogleAnalyticsCore = {
    init: noop, grantConsent: noop, revokeConsent: noop,
    trackEvent: noop, trackPageview: noop
  };

  if (window.ImKontextUmami) return;
  if (document.querySelector('script[data-umami-bootstrap]')) return;
  var script = document.createElement('script');
  script.defer = true;
  script.dataset.umamiBootstrap = 'true';
  script.src = '/shared/umami-analytics.js';
  document.head.appendChild(script);
})();
