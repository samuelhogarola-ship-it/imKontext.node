/* Shared learning identity for ImKontext. The host may provide SaasClient to
 * create/reuse the context without coupling this app to VokabelWorld UI. */
(function (scope) {
  'use strict';
  var identity = { appId: 'imkontext', worldId: 'imkontext' };
  function ensure(options) {
    var input = Object.assign({}, options || {}, identity);
    if (!scope.SaasClient || typeof scope.SaasClient.ensureLearningContext !== 'function') return Promise.resolve(null);
    return scope.SaasClient.ensureLearningContext(input).then(function (context) {
      scope.VokabelWorldContext = Object.assign({}, identity, { current: context });
      return context;
    });
  }
  scope.VokabelWorldContext = Object.assign({}, identity, { ensure: ensure });
})(window);
