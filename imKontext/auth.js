/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — auth.js
   Supabase Auth: signup, login, logout, session persistence.
   Loaded before app.js. Exposes global auth helpers.
═══════════════════════════════════════════════════════════════ */

const SUPABASE_URL = 'https://fvhxbbhxucwawypfzikf.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2aHhiYmh4dWN3YXd5cGZ6aWtmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyMzEzMzEsImV4cCI6MjA5MDgwNzMzMX0.LBSbe0SGXM5mGB9Ym6ljLUyI1Tug7yP9YNFlROE6kRE';

let _supabase = null;
let _currentUser = null;
let _authListeners = [];

function getSupabase() {
  if (!_supabase) {
    if (typeof window.supabase === 'undefined' || !window.supabase.createClient) {
      console.error('Supabase JS library not loaded');
      return null;
    }
    _supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  }
  return _supabase;
}

function onAuthChange(fn) {
  _authListeners.push(fn);
}

function notifyAuthListeners(user) {
  _authListeners.forEach(fn => { try { fn(user); } catch (e) { console.error(e); } });
}

function getCurrentUser() {
  return _currentUser;
}

function isLoggedIn() {
  return _currentUser !== null;
}

async function initAuth() {
  const sb = getSupabase();
  if (!sb) return;

  const { data: { session } } = await sb.auth.getSession();
  _currentUser = session?.user ?? null;
  notifyAuthListeners(_currentUser);

  sb.auth.onAuthStateChange((_event, session) => {
    _currentUser = session?.user ?? null;
    notifyAuthListeners(_currentUser);
  });
}

async function authSignUp(email, password) {
  const sb = getSupabase();
  if (!sb) throw new Error('Supabase no disponible');

  const { data, error } = await sb.auth.signUp({ email, password });
  if (error) throw error;
  return data;
}

async function authLogin(email, password) {
  const sb = getSupabase();
  if (!sb) throw new Error('Supabase no disponible');

  const { data, error } = await sb.auth.signInWithPassword({ email, password });
  if (error) throw error;
  return data;
}

async function authLogout() {
  const sb = getSupabase();
  if (!sb) return;

  const { error } = await sb.auth.signOut();
  if (error) throw error;
}

async function getAccessToken() {
  const sb = getSupabase();
  if (!sb) return null;

  const { data: { session } } = await sb.auth.getSession();
  return session?.access_token ?? null;
}
