(function () {
  'use strict';
  var params = new URLSearchParams(window.location.search);
  var next = params.get('next') || '/';
  if (!next.startsWith('/') || next.startsWith('//') || !/^\/(?:auth\/callback)?$/.test(new URL(next, window.location.origin).pathname) && next !== '/') next = '/';
  function finish() {
    window.history.replaceState({}, document.title, '/');
    window.location.replace(next);
  }
  function run() {
    if (!window.AuthCore || typeof window.AuthCore.getClient !== 'function') return;
    var client = window.AuthCore.getClient();
    if (!client || !client.auth) return;
    var tokenHash = params.get('token_hash');
    var type = params.get('type') || 'magiclink';
    var code = params.get('code');
    var result = tokenHash
      ? client.auth.verifyOtp({ token_hash: tokenHash, type: type })
      : code ? client.auth.exchangeCodeForSession(code) : client.auth.getSession();
    Promise.resolve(result).then(function (response) {
      if (!response || !response.error) finish();
    }).catch(function () {});
  }
  if (window.location.pathname === '/auth/callback') setTimeout(run, 0);
})();
