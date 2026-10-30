import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';

const page = readFileSync(new URL('../imKontext/index.html', import.meta.url), 'utf8');
const app = readFileSync(new URL('../imKontext/app.js', import.meta.url), 'utf8');
const auth = readFileSync(new URL('../imKontext/shared/auth-core.js', import.meta.url), 'utf8');

assert.match(page, /id="auth-container"/);
assert.match(page, /@supabase\/supabase-js@2/);
assert.match(page, /shared\/auth-core\.js/);
assert.doesNotMatch(page, /auth-callback\.js/);
assert.doesNotMatch(page, /learning-context-bridge\.js/);

assert.match(auth, /provider: 'google'/);
assert.match(auth, /signInWithOtp/);
assert.match(auth, /options: \{ redirectTo: window\.location\.origin \+ getPostAuthDestination\(\) \}/);
assert.match(auth, /options: \{ emailRedirectTo: window\.location\.origin \+ getPostAuthDestination\(\) \}/);
assert.doesNotMatch(auth, /getAuthCallbackUrl/);

assert.match(app, /pathname === '\/dashboard'/);
assert.match(app, /history\.pushState\(\{ screen: 'dashboard', targetLang: getTargetLang\(\) \}, '', withLanguagePath\('\/dashboard'\)\)/);

console.log('imkontext-auth-login-contract-ok');
