import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import test from 'node:test';

const root = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');

test('Playwright workflows pin a supported Ubuntu runner', () => {
  for (const file of ['.github/workflows/playwright.yml', '.github/workflows/update-snapshots.yml']) {
    const workflow = fs.readFileSync(path.join(root, file), 'utf8');
    assert.match(workflow, /runs-on:\s*ubuntu-24\.04/, `${file} must avoid moving ubuntu-latest`);
    assert.doesNotMatch(workflow, /runs-on:\s*ubuntu-latest/);
  }
});
