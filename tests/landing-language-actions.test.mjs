import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const root = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const index = fs.readFileSync(path.join(root, 'imKontext/index.html'), 'utf8');
const app = fs.readFileSync(path.join(root, 'imKontext/app.js'), 'utf8');

test('landing offers a language world and two compact infinitive actions', () => {
  assert.match(index, /id="landing-language-world"/);
  for (const slug of ['english', 'suomi', 'espanol', 'deutsch', 'italiano', 'portugues']) {
    assert.match(index, new RegExp(`href="/${slug}"`));
  }
  assert.match(index, /id="btn-login"/);
  assert.match(index, /id="btn-entrar"/);
  assert.match(index, />Iniciar sesión</);
  assert.match(index, />Empezar ahora</);
});

test('landing actions use the existing auth control and prefixed text route', () => {
  assert.match(app, /btn-login/);
  assert.match(app, /auth-header-btn/);
  assert.match(app, /withLanguagePath\('\/textos'\)/);
});
