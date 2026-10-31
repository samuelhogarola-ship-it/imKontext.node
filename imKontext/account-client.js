(function (scope) {
  'use strict';

  function configuredBaseUrl() {
    const explicit = typeof scope.VOKABEL_ACCOUNT_BASE_URL === 'string' ? scope.VOKABEL_ACCOUNT_BASE_URL : '';
    const meta = scope.document?.querySelector?.('meta[name="vokabel-account-base-url"]')?.content || '';
    return (explicit || meta || 'https://www.vokabellab.com').trim().replace(/\/$/, '');
  }

  async function session() {
    try {
      const client = scope.AuthCore?.getClient?.() || (scope.supabase?.auth && scope.supabase);
      if (!client?.auth?.getSession) return null;
      return (await client.auth.getSession())?.data?.session || null;
    } catch (_error) {
      return null;
    }
  }

  async function request(path, options) {
    const baseUrl = configuredBaseUrl();
    const currentSession = await session();
    if (!baseUrl || !currentSession?.access_token || typeof scope.fetch !== 'function') return null;
    try {
      const response = await scope.fetch(`${baseUrl}${path}`, {
        ...options,
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: `Bearer ${currentSession.access_token}`,
          ...(options?.headers || {})
        }
      });
      if (!response.ok) return null;
      return await response.json();
    } catch (_error) {
      return null;
    }
  }

  const json = (method, body) => ({ method, body: JSON.stringify(body) });
  const getAccount = () => request('/api/account');
  const setActiveLanguage = (languageCode) => request('/api/account/active-language', json('PUT', { languageCode }));
  const visitWorld = (worldId, languageCode) => request(`/api/account/worlds/${encodeURIComponent(worldId)}/visit`, json('POST', { languageCode }));
  const putSummary = (worldId, languageCode, summary) => request(`/api/account/worlds/${encodeURIComponent(worldId)}/summary`, json('PUT', { languageCode, summary }));
  const recordLegacyImport = (input) => request('/api/account/imports', json('POST', input));

  async function introspect(appSession) {
    const baseUrl = configuredBaseUrl();
    if (!baseUrl || !appSession || typeof scope.fetch !== 'function') return false;
    try {
      const response = await scope.fetch(`${baseUrl}/api/auth/introspect`, json('POST', { session: appSession }));
      return response.ok && Boolean((await response.json())?.active);
    } catch (_error) {
      return false;
    }
  }

  async function currentUserId() {
    return (await session())?.user?.id || null;
  }

  scope.VokabelAccountClient = {
    configuredBaseUrl, currentUserId, getAccount, setActiveLanguage,
    visitWorld, putSummary, recordLegacyImport, introspect
  };
})(typeof window !== 'undefined' ? window : globalThis);

