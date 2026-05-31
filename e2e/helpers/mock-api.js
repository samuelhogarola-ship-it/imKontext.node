import { readFileSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

const __dir = dirname(fileURLToPath(import.meta.url));
const load = name =>
  JSON.parse(readFileSync(join(__dir, `../fixtures/${name}.json`), 'utf-8'));

const TEXTS = load('texts');
const TEXT_VERSION = load('text-version');
const VOCABULARY = load('vocabulary');

export async function mockApi(page) {
  await page.route(
    url => url.pathname === '/api/texts',
    route => route.fulfill({ json: TEXTS })
  );
  await page.route(
    url => url.pathname === '/api/text-version-vocabulary-core',
    route => route.fulfill({ json: VOCABULARY })
  );
  await page.route(
    url => url.pathname === '/api/text-version',
    route => route.fulfill({ json: TEXT_VERSION })
  );
}
