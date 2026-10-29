import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import test from 'node:test';

const i18n = readFileSync(new URL('../imKontext/i18n.js', import.meta.url), 'utf8');
const practice = readFileSync(new URL('../imKontext/practice.js', import.meta.url), 'utf8');
const server = readFileSync(new URL('../server.js', import.meta.url), 'utf8');

test('English exercises use translated fields and the API exposes all available vocabulary fields', () => {
  assert.match(i18n, /en:.*English/s);
  assert.match(i18n, /function getTargetWord\(word\)/);
  assert.match(i18n, /function getTargetExample\(word\)/);
  assert.match(practice, /getTargetWord\(word\)/);
  assert.match(practice, /getTargetExample\(word\)/);
  assert.match(server, /text_version_vocabulary_core\?text_version_id=.*select=\*/);
});
