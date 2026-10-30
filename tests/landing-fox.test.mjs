import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const root = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const index = fs.readFileSync(path.join(root, 'imKontext/index.html'), 'utf8');
const styles = fs.readFileSync(path.join(root, 'imKontext/styles.css'), 'utf8');

test('landing gives the fox a dedicated visual frame and brand lockup', () => {
  assert.match(index, /class="[^"]*ln-fox-frame/);
  assert.match(index, /class="ln-brand-lockup"/);
  assert.match(styles, /\.ln-fox-frame/);
  assert.match(styles, /object-position:\s*left\s+center/);
});
