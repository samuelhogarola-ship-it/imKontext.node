import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const root = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const app = fs.readFileSync(path.join(root, 'imKontext/app.js'), 'utf8');
const auth = fs.readFileSync(path.join(root, 'imKontext/shared/auth-core.js'), 'utf8');

test('language route resolver exposes canonical slugs and aliases', () => {
  assert.match(app, /const LANGUAGE_ROUTE_MAP/);
  assert.match(app, /english/);
  assert.match(app, /suomi/);
  assert.match(app, /espanol/);
  assert.match(app, /deutsch/);
  assert.match(app, /italiano/);
  assert.match(app, /portugues/);
  assert.match(app, /function resolveLanguageRoute/);
});

test('navigation helpers preserve the active language prefix', () => {
  assert.match(app, /function languagePathPrefix/);
  assert.match(app, /function withLanguagePath/);
  assert.match(app, /withLanguagePath\('\/textos'\)/);
  assert.match(app, /withLanguagePath\('\/dashboard'\)/);
});

test('auth redirects recognize every language prefix', () => {
  assert.match(auth, /espanol\|english\|suomi\|deutsch\|italiano\|portugues/);
});
