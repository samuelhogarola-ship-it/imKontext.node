import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import vm from 'node:vm';

const source = readFileSync(new URL('../imKontext/shared/auth-core.js', import.meta.url), 'utf8');

function loadAuthCore(href, savedDestination = null) {
  const storage = new Map();
  if (savedDestination !== null) storage.set('vokabellab_post_auth_destination', savedDestination);
  const location = new URL(href);
  const window = {
    location,
    sessionStorage: {
      getItem(key) { return storage.get(key) ?? null; },
      setItem(key, value) { storage.set(key, value); }
    }
  };
  vm.runInNewContext(source, { window, URL, URLSearchParams, console });
  return window.AuthCore;
}

const production = loadAuthCore(
  'https://www.imkontext.vokabellab.com/?code=provider-secret#access_token=secret',
  '/dashboard?code=stale#access_token=stale'
);
assert.equal(production.getPostAuthDestination(), '/dashboard');
assert.equal(production.getAuthRedirectUrl(), 'https://www.imkontext.vokabellab.com/dashboard');

const local = loadAuthCore('http://127.0.0.1:3000/espanol/textos', '//evil.example/callback');
assert.equal(local.getPostAuthDestination(), '/espanol/dashboard');
assert.equal(local.getAuthRedirectUrl(), 'http://127.0.0.1:3000/espanol/dashboard');

const copiedToSamuelCoach = loadAuthCore('https://www.samuelcoachdealeman.com/dashboard');
assert.throws(() => copiedToSamuelCoach.getAuthRedirectUrl(), /disabled on this origin/i);

assert.doesNotMatch(source, /redirectTo:\s*window\.location\.origin/);
assert.doesNotMatch(source, /emailRedirectTo:\s*window\.location\.origin/);

console.log('imkontext auth return ok');
