import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import test from 'node:test';

const page = readFileSync(new URL('../imKontext/index.html', import.meta.url), 'utf8');
const app = readFileSync(new URL('../imKontext/app.js', import.meta.url), 'utf8');
const styles = readFileSync(new URL('../imKontext/styles.css', import.meta.url), 'utf8');

test('catalog uses category filters without the non-functional search sidebar', () => {
  assert.doesNotMatch(page, /id="txsel-search"/);
  assert.match(page, /id="txsel-topic-filter"/);
  assert.match(app, /getCategoryLabels\(\)/);
  assert.match(styles, /\.tx-featured-card\.catalog-compact/);
});

test('exercise controls reserve a stable viewport position after feedback', () => {
  assert.match(styles, /\.nav-btns\s*\{[^}]*position:\s*sticky/s);
  assert.match(styles, /#screen-ejercicio\s*\{[^}]*padding-bottom:/s);
});
