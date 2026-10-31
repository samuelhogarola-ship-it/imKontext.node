import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { runInNewContext } from 'node:vm';

const values = new Map([
  ['progress_text-1_a1', JSON.stringify({ total: 10, done: 4 })],
  ['progress_text-2_b1', JSON.stringify({ total: 8, done: 3 })]
]);
const context = {
  localStorage: {
    get length() { return values.size; },
    key: (index) => [...values.keys()][index],
    getItem: (key) => values.get(key) || null
  }
};
context.globalThis = context;
runInNewContext(readFileSync(new URL('../imKontext/world-summary.js', import.meta.url), 'utf8'), context);
const summary = context.ImKontextWorldSummary.build({
  userId: 'user-1', languageCode: 'es', moduleId: 'text:text-2:b1',
  mistakes: [{ id: 'word-7', es: 'aunque' }, { id: 'word-7', es: 'aunque' }],
  session: { correct: 3, wrong: 2 }, now: '2026-10-31T12:00:00.000Z'
});
assert.equal(summary.worldId, 'imkontext');
assert.equal(summary.languageCode, 'es');
assert.equal(summary.metrics.wordsCompleted, 7);
assert.equal(summary.frequentMistakes[0].key, 'vocabulary:word-7');
assert.equal(summary.frequentMistakes[0].count, 2);

const clientSource = readFileSync(new URL('../imKontext/account-client.js', import.meta.url), 'utf8');
assert.match(clientSource, /return response\.ok && Boolean/);
assert.match(clientSource, /api\/auth\/introspect/);
console.log('imKontext account adapter ok');
