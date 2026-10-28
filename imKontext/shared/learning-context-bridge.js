/* Shared learning identity for ImKontext. The host may provide SaasClient to
 * create/reuse the context without coupling this app to VokabelWorld UI. */
(function (scope) {
  'use strict';
  var identity = { appId: 'imkontext', worldId: 'imkontext' };
  function ensure(options) {
    var input = Object.assign({}, options || {}, identity);
    if (scope.SaasClient && typeof scope.SaasClient.ensureLearningContext === 'function') return scope.SaasClient.ensureLearningContext(input).then(function (context) {
      scope.VokabelWorldContext = Object.assign({}, identity, { current: context });
      return context;
    });
    var client = scope.supabase;
    if (!client || !client.auth || typeof client.auth.getSession !== 'function' || typeof client.from !== 'function') return Promise.resolve(null);
    return client.auth.getSession().then(function (result) {
      var session = result && result.data && result.data.session;
      if (!session || !session.user) return null;
      return client.from('learning_contexts').upsert({
        user_id: session.user.id, source_lang: input.sourceLang || 'es', target_lang: input.targetLang || 'de',
        app_id: identity.appId, world_id: identity.worldId, label: input.label || 'ImKontext · alemán en contexto', status: 'active'
      }, { onConflict: 'user_id,source_lang,target_lang,app_id,world_id' }).select().single().then(function (response) {
        if (response.error) throw response.error;
        scope.VokabelWorldContext = Object.assign({}, identity, { current: response.data });
        return response.data;
      });
    });
  }
  scope.VokabelWorldContext = Object.assign({}, identity, { ensure: ensure });
  scope.addEventListener('vokabellab:auth-change', function () { ensure({ sourceLang: 'es', targetLang: 'de' }).catch(function () {}); });
})(window);
