/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — auth-ui.js
   Login/signup modal + header user state display.
   Depends on: auth.js (must be loaded first)
═══════════════════════════════════════════════════════════════ */

(function () {
  const $ = id => document.getElementById(id);

  /* ── HEADER AUTH BUTTON ─────────────────────────────────────── */
  function updateHeaderAuth(user) {
    const btn = $('auth-header-btn');
    const userInfo = $('auth-user-info');
    const userEmail = $('auth-user-email');
    const logoutBtn = $('auth-logout-btn');

    if (!btn || !userInfo) return;

    if (user) {
      btn.style.display = 'none';
      userInfo.style.display = 'flex';
      userEmail.textContent = user.email || 'Usuario';
      logoutBtn.onclick = async () => {
        try {
          await authLogout();
        } catch (e) {
          console.error('Logout error:', e);
        }
      };
    } else {
      btn.style.display = '';
      userInfo.style.display = 'none';
      userEmail.textContent = '';
    }
  }

  /* ── MODAL LOGIC ────────────────────────────────────────────── */
  let currentMode = 'login'; // 'login' | 'signup'

  function openAuthModal() {
    const modal = $('auth-modal');
    if (!modal) return;
    modal.removeAttribute('aria-hidden');
    modal.classList.add('is-open');
    setMode('login');
    clearForm();
    $('auth-email')?.focus();
  }

  function closeAuthModal() {
    const modal = $('auth-modal');
    if (!modal) return;
    if (document.activeElement && modal.contains(document.activeElement)) {
      document.activeElement.blur();
    }
    modal.setAttribute('aria-hidden', 'true');
    modal.classList.remove('is-open');
    clearForm();
  }

  function setMode(mode) {
    currentMode = mode;
    const title = $('auth-modal-title');
    const submitBtn = $('auth-submit-btn');
    const toggleText = $('auth-toggle-text');
    const toggleLink = $('auth-toggle-link');

    if (mode === 'login') {
      title.textContent = 'Iniciar sesión';
      submitBtn.textContent = 'Entrar';
      toggleText.textContent = '¿No tienes cuenta? ';
      toggleLink.textContent = 'Regístrate';
    } else {
      title.textContent = 'Crear cuenta';
      submitBtn.textContent = 'Registrarme';
      toggleText.textContent = '¿Ya tienes cuenta? ';
      toggleLink.textContent = 'Inicia sesión';
    }
    clearForm();
  }

  function clearForm() {
    const email = $('auth-email');
    const pass = $('auth-password');
    const msg = $('auth-error-msg');
    const success = $('auth-success-msg');
    if (email) email.value = '';
    if (pass) pass.value = '';
    if (msg) { msg.textContent = ''; msg.style.display = 'none'; }
    if (success) { success.textContent = ''; success.style.display = 'none'; }
  }

  function showError(text) {
    const msg = $('auth-error-msg');
    if (!msg) return;
    msg.textContent = text;
    msg.style.display = 'block';
    $('auth-success-msg').style.display = 'none';
  }

  function showSuccess(text) {
    const msg = $('auth-success-msg');
    if (!msg) return;
    msg.textContent = text;
    msg.style.display = 'block';
    $('auth-error-msg').style.display = 'none';
  }

  async function handleSubmit(e) {
    e.preventDefault();
    const email = $('auth-email')?.value.trim();
    const password = $('auth-password')?.value;
    const submitBtn = $('auth-submit-btn');

    if (!email || !password) {
      showError('Introduce email y contraseña.');
      return;
    }

    if (password.length < 6) {
      showError('La contraseña debe tener al menos 6 caracteres.');
      return;
    }

    submitBtn.disabled = true;
    submitBtn.textContent = 'Cargando...';

    try {
      if (currentMode === 'login') {
        await authLogin(email, password);
        closeAuthModal();
      } else {
        const data = await authSignUp(email, password);
        if (data.user && !data.session) {
          showSuccess('¡Cuenta creada! Revisa tu email para confirmar tu cuenta.');
        } else {
          closeAuthModal();
        }
      }
    } catch (err) {
      const messages = {
        'Invalid login credentials': 'Email o contraseña incorrectos.',
        'User already registered': 'Este email ya está registrado.',
        'Email not confirmed': 'Confirma tu email antes de iniciar sesión.',
      };
      showError(messages[err.message] || err.message || 'Error inesperado.');
    } finally {
      submitBtn.disabled = false;
      submitBtn.textContent = currentMode === 'login' ? 'Entrar' : 'Registrarme';
    }
  }

  /* ── WIRE UP EVENTS ─────────────────────────────────────────── */
  function init() {
    $('auth-header-btn')?.addEventListener('click', openAuthModal);
    $('auth-modal-close')?.addEventListener('click', closeAuthModal);
    $('auth-toggle-link')?.addEventListener('click', (e) => {
      e.preventDefault();
      setMode(currentMode === 'login' ? 'signup' : 'login');
    });
    $('auth-form')?.addEventListener('submit', handleSubmit);

    // Close on backdrop click
    $('auth-modal')?.addEventListener('click', (e) => {
      if (e.target.id === 'auth-modal') closeAuthModal();
    });

    // Close on Escape
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && $('auth-modal')?.classList.contains('is-open')) {
        closeAuthModal();
      }
    });

    // Listen to auth state changes
    onAuthChange(updateHeaderAuth);

    // Set initial state
    updateHeaderAuth(getCurrentUser());
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
