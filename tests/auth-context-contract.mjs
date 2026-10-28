import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';

const page = readFileSync(new URL('../imKontext/index.html', import.meta.url), 'utf8');
const auth = readFileSync(new URL('../imKontext/shared/auth-core.js', import.meta.url), 'utf8');
const callback = readFileSync(new URL('../imKontext/shared/auth-callback.js', import.meta.url), 'utf8');
const bridge = readFileSync(new URL('../imKontext/shared/learning-context-bridge.js', import.meta.url), 'utf8');

assert.match(page, /id="auth-container"/);
assert.match(page, /@supabase\/supabase-js@2/);
assert.match(page, /shared\/auth-core\.js/);
assert.match(page, /shared\/auth-callback\.js/);
assert.match(auth, /signInWithOAuth/);
assert.match(auth, /signInWithOtp/);
assert.match(auth, /auth\/callback/);
assert.match(callback, /verifyOtp/);
assert.match(callback, /exchangeCodeForSession/);
assert.match(bridge, /appId: 'imkontext'/);
assert.match(bridge, /learning_contexts/);
console.log('imkontext-auth-context-contract-ok');
