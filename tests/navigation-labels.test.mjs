import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const root = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const index = fs.readFileSync(path.join(root, 'imKontext/index.html'), 'utf8');
const styles = fs.readFileSync(path.join(root, 'imKontext/styles.css'), 'utf8');

test('navigation exposes the shared learning controls and normal footer destinations', () => {
  assert.match(index, /<button[^>]+id="nav-practice"[^>]*>Practicar<\/button>/);
  assert.match(index, /<button[^>]+id="nav-dashboard"[^>]*>Stats<\/button>/);
  assert.match(index, /<button[^>]+id="nav-profile"[^>]*>Perfil<\/button>/);
  assert.match(index, /<dialog[^>]+id="account-dialog"/);
  assert.match(index, /id="screen-profile"/);
  for (const id of ['footer-methodology', 'footer-contact', 'footer-legal']) {
    assert.match(index, new RegExp(`id="${id}"`));
  }
  assert.match(index, /data-i18n="nav\.methodology"/);
  assert.match(index, /data-i18n="nav\.contact"/);
  assert.match(index, /data-i18n="nav\.legal"/);
});

test('landing hero gives the fox/brand and language promise more visual weight', () => {
  assert.match(styles, /\.ln-fox-frame\s*\{[\s\S]*?aspect-ratio:\s*1\s*\/\s*1/);
  assert.match(styles, /\.ln-logo-img\s*\{[\s\S]*?object-position:\s*left\s+center/);
  assert.match(styles, /\.ln-portada-headline\s*\{[\s\S]*?font-size:\s*clamp\(2\.2rem/);
});
