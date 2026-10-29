import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import test from 'node:test';

const page = readFileSync(new URL('../imKontext/index.html', import.meta.url), 'utf8');
const app = readFileSync(new URL('../imKontext/app.js', import.meta.url), 'utf8');
const practice = readFileSync(new URL('../imKontext/practice.js', import.meta.url), 'utf8');

test('the app exposes the UI language selector and keeps exercise answers language-aware', () => {
  assert.match(page, /id="lang-selector"/);
  assert.match(page, /id="lang-ui-grid"/);
  assert.match(app, /SUPPORTED_UI_LANGS/);
  assert.match(app, /setUILang\(lang\)/);
  assert.match(practice, /getTargetWord\(word\)/);
  assert.match(practice, /getNativeWord\(word\)/);
  assert.doesNotMatch(practice, /word\.spanish/);
  assert.match(app, /if \(typeof onAuthChange === 'function'\)/);
});

test('the reading mode centers the tapped vocabulary word above its detail panel', () => {
  assert.match(app, /const targetTop = \(window\.innerHeight - panelH\) \/ 2/);
});

test('choice exercises provide a no-answer path that unlocks the next question', () => {
  assert.match(practice, /id = 'btn-no-se'/);
  assert.match(practice, /renderNoSeButton\(\(\) => handleNoSe/);
  assert.match(practice, /function handleNoSe\(/);
  assert.match(practice, /function autoNext\(\)/);
  assert.match(practice, /\$\('btn-siguiente'\)\.disabled = false/);
});
