(function (scope) {
  'use strict';

  function progressEntries() {
    const entries = [];
    try {
      for (let index = 0; index < scope.localStorage.length; index += 1) {
        const key = scope.localStorage.key(index);
        if (!key?.startsWith('progress_')) continue;
        const value = JSON.parse(scope.localStorage.getItem(key) || 'null');
        if (value && typeof value === 'object') entries.push({ key, ...value });
      }
    } catch (_error) {}
    return entries;
  }

  function build({ userId, languageCode, moduleId = '', mistakes = [], session = null, now = new Date().toISOString() } = {}) {
    const entries = progressEntries();
    const mistakeCounts = new Map();
    for (const word of mistakes || []) {
      const id = String(word?.id || word?.word_id || word?.de || word?.en || word?.es || '').trim();
      if (!id) continue;
      const key = `vocabulary:${id}`;
      const current = mistakeCounts.get(key) || { key, label: String(word?.de || word?.en || word?.es || id), count: 0 };
      current.count += 1;
      mistakeCounts.set(key, current);
    }
    const total = entries.reduce((sum, entry) => sum + (Number(entry.total) || 0), 0);
    const done = entries.reduce((sum, entry) => sum + (Number(entry.done) || 0), 0);
    return {
      schemaVersion: 1, userId, languageCode, worldId: 'imkontext', moduleId,
      lastActivityAt: session || done > 0 ? now : null,
      headlineMetric: { key: 'wordsCompleted', value: done },
      metrics: {
        textsStarted: entries.length, wordsCompleted: done, availableWords: total,
        sessionCorrect: Number(session?.correct) || 0,
        sessionWrong: Number(session?.wrong) || 0
      },
      frequentMistakes: [...mistakeCounts.values()].sort((a, b) => b.count - a.count).slice(0, 10)
    };
  }

  async function publish(options = {}) {
    const client = scope.VokabelAccountClient;
    if (!client?.configuredBaseUrl?.()) return null;
    const userId = await client.currentUserId();
    if (!userId) return null;
    const languageCode = options.languageCode || scope.getTargetLang?.() || 'de';
    if (!['de', 'en', 'es'].includes(languageCode)) return null;
    const summary = build({ ...options, userId, languageCode });
    await client.setActiveLanguage(languageCode);
    await client.visitWorld('imkontext', languageCode);
    return client.putSummary('imkontext', languageCode, summary);
  }

  scope.ImKontextWorldSummary = { build, publish, progressEntries };
})(typeof window !== 'undefined' ? window : globalThis);
