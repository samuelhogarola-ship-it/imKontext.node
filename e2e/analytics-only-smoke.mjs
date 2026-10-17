import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import vm from 'node:vm';
import test from 'node:test';

const asset = 'imKontext/shared';
const core = readFileSync(asset + '/google-analytics-core.js', 'utf8');
const umami = readFileSync(asset + '/umami-analytics.js', 'utf8');
const config = JSON.parse(readFileSync('imKontext/umami-config.json', 'utf8'));

async function run(entries) {
  const scripts = [];
  const pending = [];
  const requests = [];
  const window = { location: { href: 'https://example.com/', pathname: '/' } };
  const document = {
    readyState: 'complete',
    createElement: () => ({ dataset: {} }),
    querySelector: selector => scripts.find(s =>
      (selector.includes('data-umami-tracker') && s.dataset.umamiTracker) ||
      (selector.includes('data-umami-bootstrap') && s.dataset.umamiBootstrap)) || null,
    head: { appendChild(s) {
      scripts.push(s);
      if (s.src.endsWith('/umami-analytics.js')) pending.push(umami);
    } },
  };
  const context = vm.createContext({ window, document, console, fetch: async url => {
    requests.push(url);
    return { ok: true, json: async () => config };
  } });
  for (const source of entries) vm.runInContext(source, context);
  const legacy = window.GoogleAnalyticsCore;
  if (legacy) {
    legacy.init({ measurementId: 'G-LEGACY123' });
    legacy.grantConsent();
    legacy.revokeConsent();
    legacy.trackEvent('click');
    legacy.trackPageview('/app');
  }
  while (pending.length) vm.runInContext(pending.shift(), context);
  await window.ImKontextUmami?.ready;
  return { scripts, requests, window };
}

test('cached pages and consent callbacks load only Umami', async () => {
  const result = await run([core, core]);
  assert.deepEqual(result.scripts.filter(s => s.src.startsWith('https:')).map(s => s.src),
    ['https://analytics.187.124.55.36.sslip.io/script.js']);
  assert.equal(result.scripts.find(s => s.dataset.websiteId)?.dataset.websiteId, config.websiteId);
  assert.equal(result.window.gtag, undefined);
  assert.equal(result.window.dataLayer, undefined);
});

test('mixed and repeated entries fetch configuration once', async () => {
  const result = await run([umami, umami, core]);
  assert.deepEqual(result.requests, ['/umami-config.json']);
  assert.equal(result.scripts.filter(s => s.dataset.umamiTracker).length, 1);
});
