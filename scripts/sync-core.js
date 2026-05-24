/**
 * sync-core.js — copy shared modules from the LAB-WORLD core repo
 * into imKontext/shared/ before deploy.
 *
 * Run: npm run sync-core
 *
 * Assumes the core repo lives at ../core relative to this project root.
 * On Hostinger: run this script as part of the deploy step before npm start.
 */
import { copyFileSync, mkdirSync } from 'fs';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT   = resolve(__dirname, '..');
const CORE   = resolve(ROOT, '../core');
const SHARED = resolve(ROOT, 'imKontext/shared');

mkdirSync(SHARED, { recursive: true });

const files = [
  // JS modules: core/src → imKontext/shared
  { src: 'src/practice-core.js',        dest: 'practice-core.js' },
  { src: 'src/result-view-core.js',     dest: 'result-view-core.js' },
  { src: 'src/cookie-banner-core.js',   dest: 'cookie-banner-core.js' },
  // CSS: core/styles → imKontext/shared
  { src: 'styles/cookie-banner-core.css', dest: 'cookie-banner-core.css' },
];

for (const { src, dest } of files) {
  const from = resolve(CORE, src);
  const to   = resolve(SHARED, dest);
  copyFileSync(from, to);
  console.log(`  ✓  ${src} → shared/${dest}`);
}

console.log('\nSync complete.');
