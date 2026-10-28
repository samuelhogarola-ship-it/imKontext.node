/**
 * AuthCore — Supabase Auth para Vokabel Lab (vanilla JS)
 * Inyecta UI de login/usuario en uno o varios contenedores.
 * Depende de: window.supabase (CDN, cargado con defer antes que este script)
 *
 * CLAVES (seguras para el frontend):
 *   SUPABASE_ANON_KEY tiene prefijo sb_publishable_ — es la clave pública de Supabase.
 *   Nunca usar SERVICE_ROLE_KEY aquí.
 *
 * REDIRECT URLs que deben estar en Supabase → Authentication → URL Configuration:
 *   Site URL:           https://www.vokabellab.com/
 *   Additional redirects:
 *     http://localhost:3000/
 *     http://localhost:3000/**
 *     https://www.vokabellab.com/
 *     https://www.vokabellab.com/**
 *
 *   redirectTo en signInWithOAuth / signInWithOtp apunta a window.location.origin + '/'.
 *   resetPasswordForEmail apunta a window.location.origin + '/?auth=recovery'.
 *   El SDK detecta el token (?code= o #access_token=) al inicializar en esa página.
 *   No se usa /auth/callback — no añadir esa ruta al whitelist salvo que cambie la config.
 */
(function () {
  'use strict';

  const SUPABASE_URL = 'https://fvhxbbhxucwawypfzikf.supabase.co';
  // Clave pública (publishable) — segura en el frontend:
  const SUPABASE_ANON_KEY = 'sb_publishable_ON0w4HzhRgdCvUoxL5ogSg_sRnHIe9T';

  let _client = null;
  let _containers = [];
  let _authMode = 'login';
  let _recoveryEmail = '';
  let _authSubscription = null;
  let _installListenerBound = false;
  const POST_AUTH_DESTINATION_KEY = 'imkontext_post_auth_destination';

  function getAuthCallbackUrl(destination) {
    const next = destination && destination.startsWith('/') && !destination.startsWith('//') ? destination : '/';
    return window.location.origin + '/auth/callback?next=' + encodeURIComponent(next);
  }

  function getPostAuthDestination() {
    const pathname = window.location.pathname || '/';
    const languagePrefix = /^\/(espanol|english|suomi)(?:\/|$)/.exec(pathname)?.[0].replace(/\/$/, '') || '';
    const fallback = '/';
    try {
      const saved = window.sessionStorage?.getItem(POST_AUTH_DESTINATION_KEY);
      if (!saved || !saved.startsWith('/') || saved.startsWith('//')) return fallback;
      const url = new URL(saved, window.location.origin);
      if (url.origin !== window.location.origin || !/^\/(?:auth\/callback)?$/.test(url.pathname) && url.pathname !== '/') return fallback;
      return url.pathname + url.search + url.hash;
    } catch (_) {
      return fallback;
    }
  }

  function rememberPostAuthDestination() {
    const pathname = window.location.pathname || '/';
    const languagePrefix = /^\/(espanol|english|suomi)(?:\/|$)/.exec(pathname)?.[0].replace(/\/$/, '') || '';
    const destination = '/' + (window.location.search || '') + (window.location.hash || '');
    try {
      window.sessionStorage?.setItem(POST_AUTH_DESTINATION_KEY, destination);
    } catch (_) {}
    return destination;
  }

  function getClient() {
    if (!_client) {
      if (!window.supabase) {
        // CDN falló o cargó tarde — la app legacy sigue funcionando sin auth.
        console.warn('[AuthCore] window.supabase no disponible. El CDN pudo haber fallado.');
        return null;
      }
      _client = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
        auth: {
          // detectSessionInUrl: true (default) — necesario para leer ?code= tras OAuth
          // persistSession: true (default) — mantiene sesión en localStorage
        }
      });
    }
    return _client;
  }

  function escHtml(str) {
    return String(str).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  }

  function getLang() {
    const Lab = window.VokabelLab || {};
    const supported = ['es', 'en', 'de', 'fi'];
    if (supported.includes(Lab.lang)) return Lab.lang;
    try {
      const stored = localStorage.getItem('vokabellab_lang');
      return supported.includes(stored) ? stored : 'es';
    } catch (_) {
      return 'es';
    }
  }

  function authText() {
    const translations = {
      en: {
          intro: 'Save your progress in the cloud and access it from any device. By signing in you accept our <a href="/legal#terminos" class="auth-link" target="_blank">Terms</a> and <a href="/legal#privacidad" class="auth-link" target="_blank">Privacy Policy</a>. We store your email and practice statistics. You can delete your account whenever you want.',
          google: 'Continue with Google',
          or: 'or',
          passwordAccess: 'Password access',
          password: 'Password',
          passwordPlaceholder: 'Your password',
          signInPassword: 'Sign in',
          forgotPassword: 'Forgot your password?',
          magicAccess: 'Magic link',
          newPassword: 'New password',
          newPasswordPlaceholder: 'At least 6 characters',
          repeatPassword: 'Repeat password',
          savePassword: 'Save password',
          recoverTitle: 'Recover your password',
          recoverCopy: 'Enter your email and we will send you a secure link to create a new password.',
          sendRecovery: 'Send recovery link',
          recoverySent: 'We sent a recovery link to <strong>{email}</strong>.',
          updatePasswordTitle: 'Create your new password',
          updatePasswordCopy: 'Choose a secure password to access Vokabel Lab from now on.',
          passwordUpdated: 'Password updated. You are signed in.',
          passwordTooShort: 'Use at least 6 characters.',
          passwordMismatch: 'Passwords do not match.',
          backToLogin: 'Back to login',
          email: 'Email address',
          emailPlaceholder: 'you@email.com',
          consent: 'I have read and accept the <a href="/legal#terminos" class="auth-link" target="_blank">Terms</a> and <a href="/legal#privacidad" class="auth-link" target="_blank">Privacy Policy</a>',
          sendLink: 'Send access link',
          hint: 'No password — you will receive a link by email.',
          checkEmail: 'Check your email',
          sentBody: 'We sent a link to <strong>{email}</strong>.<br>Click it to sign in.',
          otherEmail: 'Use another email',
          signOut: 'Sign out',
          deleteAccount: 'Request account deletion',
          deleteTitle: 'Delete your account?',
          deleteBody: 'Your email and all Vokabel Lab data will be deleted. This action cannot be undone.',
          confirmDelete: 'Yes, delete',
          cancel: 'Cancel',
          deleting: 'Deleting…',
          sending: 'Sending…',
          googleError: 'Error connecting with Google: ',
          passwordError: 'Error signing in: ',
          recoveryError: 'Error sending recovery email: ',
          updatePasswordError: 'Error updating password: ',
          acceptTermsError: 'You must accept the terms to continue.',
          validEmailError: 'Enter a valid email address.',
          signedOut: 'Signed out',
          deleteInstructions: 'To fully delete your account and data, write to <a href="mailto:vokabellab@pm.me?subject=Account%20deletion%20request" class="auth-link">vokabellab@pm.me</a>. We will process the request within the applicable legal deadlines.',
          appTitle: 'App',
          appInstalled: 'Installed on this device',
          appReady: 'Ready to install',
          appBrowser: 'Available in browser',
          appInstalledBody: 'Vokabel Lab is already installed. Open it from your home screen.',
          appReadyBody: 'Install Vokabel Lab on Android for faster access and app-like practice.',
          appBrowserBody: 'If the install prompt does not appear, open Chrome menu and tap “Add to Home screen”.',
          appInstall: 'Download app',
          appTest: 'Test download link',
          appCopy: 'Copy link',
          appPreviewSession: 'Daily session',
          appPreviewWords: '10 words ready'
        },
      es: {
          intro: 'Guarda tu progreso en la nube y accede desde cualquier dispositivo. Al entrar aceptas nuestros <a href="/legal#terminos" class="auth-link" target="_blank">Términos</a> y <a href="/legal#privacidad" class="auth-link" target="_blank">Política de privacidad</a>. Guardamos tu email y estadísticas de práctica. Puedes eliminar tu cuenta cuando quieras.',
          google: 'Continuar con Google',
          or: 'o',
          passwordAccess: 'Acceso con contraseña',
          password: 'Contraseña',
          passwordPlaceholder: 'Tu contraseña',
          signInPassword: 'Entrar',
          forgotPassword: '¿Has olvidado la contraseña?',
          magicAccess: 'Enlace mágico',
          newPassword: 'Nueva contraseña',
          newPasswordPlaceholder: 'Mínimo 6 caracteres',
          repeatPassword: 'Repetir contraseña',
          savePassword: 'Guardar contraseña',
          recoverTitle: 'Recupera tu contraseña',
          recoverCopy: 'Escribe tu correo y te enviaremos un enlace seguro para crear una contraseña nueva.',
          sendRecovery: 'Enviar enlace de recuperación',
          recoverySent: 'Enviamos un enlace de recuperación a <strong>{email}</strong>.',
          updatePasswordTitle: 'Crea tu nueva contraseña',
          updatePasswordCopy: 'Elige una contraseña segura para entrar en Vokabel Lab a partir de ahora.',
          passwordUpdated: 'Contraseña actualizada. Sesión iniciada.',
          passwordTooShort: 'Usa al menos 6 caracteres.',
          passwordMismatch: 'Las contraseñas no coinciden.',
          backToLogin: 'Volver al login',
          email: 'Correo electrónico',
          emailPlaceholder: 'tu@correo.com',
          consent: 'He leído y acepto los <a href="/legal#terminos" class="auth-link" target="_blank">Términos</a> y la <a href="/legal#privacidad" class="auth-link" target="_blank">Política de privacidad</a>',
          sendLink: 'Enviar enlace de acceso',
          hint: 'Sin contraseña — recibirás un enlace en tu correo.',
          checkEmail: 'Revisa tu correo',
          sentBody: 'Enviamos un enlace a <strong>{email}</strong>.<br>Haz clic en él para entrar.',
          otherEmail: 'Usar otro correo',
          signOut: 'Cerrar sesión',
          deleteAccount: 'Solicitar eliminación de cuenta',
          deleteTitle: '¿Eliminar tu cuenta?',
          deleteBody: 'Se borrarán tu email y todos tus datos de Vokabel Lab. Esta acción no se puede deshacer.',
          confirmDelete: 'Sí, eliminar',
          cancel: 'Cancelar',
          deleting: 'Eliminando…',
          sending: 'Enviando…',
          googleError: 'Error al conectar con Google: ',
          passwordError: 'Error al entrar: ',
          recoveryError: 'Error al enviar recuperación: ',
          updatePasswordError: 'Error al actualizar contraseña: ',
          acceptTermsError: 'Debes aceptar los términos para continuar.',
          validEmailError: 'Introduce un correo válido.',
          signedOut: 'Sesión cerrada',
          deleteInstructions: 'Para eliminar completamente tu cuenta y datos, escríbenos a <a href="mailto:vokabellab@pm.me?subject=Solicitud%20eliminaci%C3%B3n%20de%20cuenta" class="auth-link">vokabellab@pm.me</a>. Tramitaremos la solicitud conforme a los plazos legales aplicables.',
          appTitle: 'App',
          appInstalled: 'Instalada en este dispositivo',
          appReady: 'Lista para descargar',
          appBrowser: 'Disponible en navegador',
          appInstalledBody: 'Vokabel Lab ya está instalada. Ábrela desde tu pantalla de inicio.',
          appReadyBody: 'Descarga Vokabel Lab en Android para entrar más rápido y practicar como en una app.',
          appBrowserBody: 'Si no aparece el aviso, abre el menú de Chrome y pulsa “Añadir a pantalla de inicio”.',
          appInstall: 'Descargar app',
          appTest: 'Probar descarga',
          appCopy: 'Copiar enlace',
          appPreviewSession: 'Sesión diaria',
          appPreviewWords: '10 palabras listas'
        },
      de: {
        "intro": "Speichere deinen Fortschritt in der Cloud und greife von jedem Gerät darauf zu. Mit der Anmeldung akzeptierst du unsere <a href=\"/legal#terminos\" class=\"auth-link\" target=\"_blank\">Nutzungsbedingungen</a> und <a href=\"/legal#privacidad\" class=\"auth-link\" target=\"_blank\">Datenschutzerklärung</a>. Wir speichern deine E-Mail-Adresse und Übungsstatistiken. Du kannst dein Konto jederzeit löschen.",
        "google": "Mit Google fortfahren",
        "or": "oder",
        "passwordAccess": "Mit Passwort anmelden",
        "password": "Passwort",
        "passwordPlaceholder": "Dein Passwort",
        "signInPassword": "Anmelden",
        "forgotPassword": "Passwort vergessen?",
        "magicAccess": "Anmeldelink",
        "newPassword": "Neues Passwort",
        "newPasswordPlaceholder": "Mindestens 6 Zeichen",
        "repeatPassword": "Passwort wiederholen",
        "savePassword": "Passwort speichern",
        "recoverTitle": "Passwort zurücksetzen",
        "recoverCopy": "Gib deine E-Mail-Adresse ein. Wir senden dir einen sicheren Link, um ein neues Passwort festzulegen.",
        "sendRecovery": "Link zum Zurücksetzen senden",
        "recoverySent": "Wir haben einen Link zum Zurücksetzen an <strong>{email}</strong> gesendet.",
        "updatePasswordTitle": "Neues Passwort festlegen",
        "updatePasswordCopy": "Wähle ein sicheres Passwort für die Anmeldung bei Vokabel Lab.",
        "passwordUpdated": "Passwort aktualisiert. Du bist angemeldet.",
        "passwordTooShort": "Verwende mindestens 6 Zeichen.",
        "passwordMismatch": "Die Passwörter stimmen nicht überein.",
        "backToLogin": "Zurück zur Anmeldung",
        "email": "E-Mail-Adresse",
        "emailPlaceholder": "du@beispiel.de",
        "consent": "Ich habe die <a href=\"/legal#terminos\" class=\"auth-link\" target=\"_blank\">Nutzungsbedingungen</a> und die <a href=\"/legal#privacidad\" class=\"auth-link\" target=\"_blank\">Datenschutzerklärung</a> gelesen und akzeptiere sie.",
        "sendLink": "Anmeldelink senden",
        "hint": "Ohne Passwort: Du erhältst einen Link per E-Mail.",
        "checkEmail": "Prüfe dein E-Mail-Postfach",
        "sentBody": "Wir haben einen Link an <strong>{email}</strong> gesendet.<br>Klicke darauf, um dich anzumelden.",
        "otherEmail": "Andere E-Mail-Adresse verwenden",
        "signOut": "Abmelden",
        "deleteAccount": "Kontolöschung beantragen",
        "deleteTitle": "Konto löschen?",
        "deleteBody": "Deine E-Mail-Adresse und alle Vokabel-Lab-Daten werden gelöscht. Diese Aktion kann nicht rückgängig gemacht werden.",
        "confirmDelete": "Ja, löschen",
        "cancel": "Abbrechen",
        "deleting": "Wird gelöscht…",
        "sending": "Wird gesendet…",
        "googleError": "Fehler bei der Verbindung mit Google: ",
        "passwordError": "Fehler bei der Anmeldung: ",
        "recoveryError": "Fehler beim Senden der E-Mail zum Zurücksetzen: ",
        "updatePasswordError": "Fehler beim Aktualisieren des Passworts: ",
        "acceptTermsError": "Akzeptiere die Nutzungsbedingungen, um fortzufahren.",
        "validEmailError": "Gib eine gültige E-Mail-Adresse ein.",
        "signedOut": "Abgemeldet",
        "deleteInstructions": "Um dein Konto und deine Daten vollständig zu löschen, schreibe an <a href=\"mailto:vokabellab@pm.me?subject=Account%20deletion%20request\" class=\"auth-link\">vokabellab@pm.me</a>. Wir bearbeiten deine Anfrage innerhalb der geltenden gesetzlichen Fristen.",
        "appTitle": "App",
        "appInstalled": "Auf diesem Gerät installiert",
        "appReady": "Bereit zur Installation",
        "appBrowser": "Im Browser verfügbar",
        "appInstalledBody": "Vokabel Lab ist bereits installiert. Öffne die App über deinen Startbildschirm.",
        "appReadyBody": "Installiere Vokabel Lab auf Android, um schneller darauf zuzugreifen und in der App zu üben.",
        "appBrowserBody": "Falls kein Installationshinweis erscheint, öffne das Chrome-Menü und tippe auf „Zum Startbildschirm hinzufügen“.",
        "appInstall": "App herunterladen",
        "appTest": "Download-Link testen",
        "appCopy": "Link kopieren",
        "appPreviewSession": "Tägliche Übung",
        "appPreviewWords": "10 Wörter bereit"
},
      fi: {
        "intro": "Tallenna edistymisesi pilveen ja käytä sitä millä tahansa laitteella. Kirjautumalla hyväksyt <a href=\"/legal#terminos\" class=\"auth-link\" target=\"_blank\">käyttöehtomme</a> ja <a href=\"/legal#privacidad\" class=\"auth-link\" target=\"_blank\">tietosuojakäytäntömme</a>. Tallennamme sähköpostiosoitteesi ja harjoittelutilastosi. Voit poistaa tilisi milloin tahansa.",
        "google": "Jatka Googlella",
        "or": "tai",
        "passwordAccess": "Kirjaudu salasanalla",
        "password": "Salasana",
        "passwordPlaceholder": "Salasanasi",
        "signInPassword": "Kirjaudu sisään",
        "forgotPassword": "Unohditko salasanasi?",
        "magicAccess": "Kirjautumislinkki",
        "newPassword": "Uusi salasana",
        "newPasswordPlaceholder": "Vähintään 6 merkkiä",
        "repeatPassword": "Toista salasana",
        "savePassword": "Tallenna salasana",
        "recoverTitle": "Palauta salasana",
        "recoverCopy": "Anna sähköpostiosoitteesi, niin lähetämme turvallisen linkin uuden salasanan luomiseen.",
        "sendRecovery": "Lähetä palautuslinkki",
        "recoverySent": "Lähetimme palautuslinkin osoitteeseen <strong>{email}</strong>.",
        "updatePasswordTitle": "Luo uusi salasana",
        "updatePasswordCopy": "Valitse turvallinen salasana Vokabel Labiin kirjautumista varten.",
        "passwordUpdated": "Salasana päivitetty. Olet kirjautunut sisään.",
        "passwordTooShort": "Käytä vähintään 6 merkkiä.",
        "passwordMismatch": "Salasanat eivät täsmää.",
        "backToLogin": "Takaisin kirjautumiseen",
        "email": "Sähköpostiosoite",
        "emailPlaceholder": "sinä@esimerkki.fi",
        "consent": "Olen lukenut ja hyväksyn <a href=\"/legal#terminos\" class=\"auth-link\" target=\"_blank\">käyttöehdot</a> ja <a href=\"/legal#privacidad\" class=\"auth-link\" target=\"_blank\">tietosuojakäytännön</a>.",
        "sendLink": "Lähetä kirjautumislinkki",
        "hint": "Ei salasanaa: saat linkin sähköpostiisi.",
        "checkEmail": "Tarkista sähköpostisi",
        "sentBody": "Lähetimme linkin osoitteeseen <strong>{email}</strong>.<br>Kirjaudu sisään napsauttamalla linkkiä.",
        "otherEmail": "Käytä toista sähköpostiosoitetta",
        "signOut": "Kirjaudu ulos",
        "deleteAccount": "Pyydä tilin poistamista",
        "deleteTitle": "Poistetaanko tilisi?",
        "deleteBody": "Sähköpostiosoitteesi ja kaikki Vokabel Lab -tietosi poistetaan. Tätä toimintoa ei voi kumota.",
        "confirmDelete": "Kyllä, poista",
        "cancel": "Peruuta",
        "deleting": "Poistetaan…",
        "sending": "Lähetetään…",
        "googleError": "Virhe Google-yhteydessä: ",
        "passwordError": "Virhe kirjautumisessa: ",
        "recoveryError": "Virhe palautusviestin lähetyksessä: ",
        "updatePasswordError": "Virhe salasanan päivityksessä: ",
        "acceptTermsError": "Hyväksy käyttöehdot jatkaaksesi.",
        "validEmailError": "Anna kelvollinen sähköpostiosoite.",
        "signedOut": "Kirjauduttu ulos",
        "deleteInstructions": "Voit pyytää tilisi ja tietojesi täydellistä poistamista lähettämällä viestin osoitteeseen <a href=\"mailto:vokabellab@pm.me?subject=Account%20deletion%20request\" class=\"auth-link\">vokabellab@pm.me</a>. Käsittelemme pyynnön sovellettavien lakisääteisten määräaikojen kuluessa.",
        "appTitle": "Sovellus",
        "appInstalled": "Asennettu tälle laitteelle",
        "appReady": "Valmis asennettavaksi",
        "appBrowser": "Käytettävissä selaimessa",
        "appInstalledBody": "Vokabel Lab on jo asennettu. Avaa se aloitusnäytöltä.",
        "appReadyBody": "Asenna Vokabel Lab Androidille, niin pääset harjoittelemaan nopeammin sovelluksessa.",
        "appBrowserBody": "Jos asennuskehotetta ei näy, avaa Chromen valikko ja valitse ”Lisää aloitusnäyttöön”.",
        "appInstall": "Lataa sovellus",
        "appTest": "Testaa latauslinkki",
        "appCopy": "Kopioi linkki",
        "appPreviewSession": "Päivittäinen harjoitus",
        "appPreviewWords": "10 sanaa valmiina"
}
    };
    return translations[getLang()];
  }

  function getInstallState() {
    if (window.VokabelLabInstall && typeof window.VokabelLabInstall.getState === 'function') {
      return window.VokabelLabInstall.getState();
    }
    return {
      standalone: window.matchMedia?.('(display-mode: standalone)').matches || window.navigator.standalone === true,
      canInstall: false
    };
  }

  function getProfileAppMarkup() {
    const copy = authText();
    const installState = getInstallState();
    const state = installState.standalone ? 'installed' : (installState.canInstall ? 'ready' : 'browser');
    const label = installState.standalone ? copy.appInstalled : (installState.canInstall ? copy.appReady : copy.appBrowser);
    const body = installState.standalone ? copy.appInstalledBody : (installState.canInstall ? copy.appReadyBody : copy.appBrowserBody);

    return `
      <section class="auth-app-card" id="profileInstallCard" data-install-state="${state}">
        <div class="auth-app-media">
          <div class="install-preview" aria-hidden="true">
            <div class="install-preview-logo">
              <img src="/logo-small.webp" alt="" width="68" height="102" loading="lazy" decoding="async">
            </div>
            <div class="install-preview-panel">
              <span class="install-preview-pill">Vokabel Lab</span>
              <strong>${copy.appPreviewSession}</strong>
              <span>${copy.appPreviewWords}</span>
              <div class="install-preview-progress"><span></span></div>
            </div>
          </div>
        </div>
        <div class="auth-app-head">
          <span class="auth-app-kicker">${copy.appTitle}</span>
          <span class="auth-app-state">${label}</span>
        </div>
        <p>${body}</p>
        <div class="auth-app-actions">
          ${installState.standalone ? '' : `<button class="auth-btn auth-btn--primary auth-app-install" id="profileInstallBtn" type="button">${copy.appInstall}</button>`}
          <button class="auth-btn auth-btn--ghost auth-app-test" id="profileInstallTestBtn" type="button">${copy.appTest}</button>
          <button class="auth-btn auth-btn--ghost auth-app-copy" id="profileInstallCopyBtn" type="button">${copy.appCopy}</button>
        </div>
      </section>
    `;
  }

  function bindProfileAppCard(el) {
    const installBtn = el.querySelector('#profileInstallBtn');
    const testBtn = el.querySelector('#profileInstallTestBtn');
    const copyBtn = el.querySelector('#profileInstallCopyBtn');

    if (installBtn) {
      installBtn.addEventListener('click', () => {
        if (window.VokabelLabInstall && typeof window.VokabelLabInstall.prompt === 'function') {
          window.VokabelLabInstall.prompt();
        }
      });
    }
    if (testBtn) {
      testBtn.addEventListener('click', () => {
        if (window.VokabelLabInstall && typeof window.VokabelLabInstall.openTest === 'function') {
          window.VokabelLabInstall.openTest();
        }
      });
    }
    if (copyBtn) {
      copyBtn.addEventListener('click', () => {
        if (window.VokabelLabInstall && typeof window.VokabelLabInstall.copyLink === 'function') {
          window.VokabelLabInstall.copyLink();
        }
      });
    }
  }

  // ── Render helpers — cada uno opera sobre un contenedor específico ──────────

  function renderLoginInto(el) {
    const copy = authText();
    el.innerHTML = `
      <div class="auth-panel auth-panel--login">

        <button class="auth-btn auth-btn--google" type="button">
          <svg class="auth-google-icon" viewBox="0 0 18 18" aria-hidden="true">
            <path d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844c-.209 1.125-.843 2.078-1.796 2.717v2.258h2.908c1.702-1.567 2.684-3.874 2.684-6.615z" fill="#4285F4"/>
            <path d="M9 18c2.43 0 4.467-.806 5.956-2.18l-2.908-2.259c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.584-5.036-3.711H.957v2.332A8.997 8.997 0 0 0 9 18z" fill="#34A853"/>
            <path d="M3.964 10.71A5.41 5.41 0 0 1 3.682 9c0-.593.102-1.17.282-1.71V4.958H.957A8.996 8.996 0 0 0 0 9c0 1.452.348 2.827.957 4.042l3.007-2.332z" fill="#FBBC05"/>
            <path d="M9 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.463.891 11.426 0 9 0A8.997 8.997 0 0 0 .957 4.958L3.964 7.29C4.672 5.163 6.656 3.58 9 3.58z" fill="#EA4335"/>
          </svg>
          ${copy.google}
        </button>

        <div class="auth-divider"><span>${copy.or}</span></div>

        <form class="auth-password-form" novalidate>
          <label class="auth-label">${copy.email}</label>
          <input class="auth-input" type="email" aria-label="${copy.email}" placeholder="${copy.emailPlaceholder}" autocomplete="email" required>
          <label class="auth-label">${copy.password}</label>
          <input class="auth-input" type="password" aria-label="${copy.password}" placeholder="${copy.passwordPlaceholder}" autocomplete="current-password" required>
          <button class="auth-btn auth-btn--primary" type="submit">${copy.signInPassword}</button>
        </form>
        <button class="auth-btn auth-btn--ghost auth-btn--recover" type="button">${copy.forgotPassword}</button>
        <details class="auth-alternative"><summary>${copy.magicAccess}</summary>
        <form class="auth-otp-form" novalidate>
          <label class="auth-label">${copy.email}</label>
          <input
            class="auth-input"
            type="email"
            placeholder="${copy.emailPlaceholder}"
            autocomplete="email"
            required
          />
          <label class="auth-consent">
            <input class="auth-consent-check" type="checkbox" required>
            <span>${copy.consent}</span>
          </label>
          <button class="auth-btn auth-btn--primary" type="submit">
            ${copy.sendLink}
          </button>
        </form>

        <p class="auth-hint">${copy.hint}</p>

        </details>

        <div class="auth-message" aria-live="polite"></div>
        <p class="auth-what-is-this">${copy.intro}</p>
      </div>
    `;

    el.querySelector('.auth-btn--google').addEventListener('click', signInWithGoogle);
    el.querySelector('.auth-otp-form').addEventListener('submit', (e) => handleOtpSubmit(e, el));
    el.querySelector('.auth-password-form').addEventListener('submit', (e) => handlePasswordSubmit(e, el));
    el.querySelector('.auth-btn--recover').addEventListener('click', () => renderRecoveryInto(el));
  }

  function renderRecoveryInto(el) {
    const copy = authText();
    el.innerHTML = `
      <div class="auth-panel auth-panel--recover">
        <p class="auth-sent-title">${copy.recoverTitle}</p>
        <p class="auth-sent-body">${copy.recoverCopy}</p>
        <form class="auth-recovery-form" novalidate>
          <label class="auth-label">${copy.email}</label>
          <input class="auth-input" type="email" placeholder="${copy.emailPlaceholder}" autocomplete="email" value="${escHtml(_recoveryEmail)}" required>
          <button class="auth-btn auth-btn--primary" type="submit">${copy.sendRecovery}</button>
        </form>
        <button class="auth-btn auth-btn--ghost auth-btn--login-return" type="button">${copy.backToLogin}</button>
        <div class="auth-message" aria-live="polite"></div>
      </div>
    `;

    el.querySelector('.auth-recovery-form').addEventListener('submit', (e) => handleRecoverySubmit(e, el));
    el.querySelector('.auth-btn--login-return').addEventListener('click', () => {
      _authMode = 'login';
      renderLoginInto(el);
    });
  }

  function renderRecoverySentInto(el, email) {
    const copy = authText();
    el.innerHTML = `
      <div class="auth-panel auth-panel--sent">
        <div class="auth-sent-icon" aria-hidden="true">✉</div>
        <p class="auth-sent-title">${copy.checkEmail}</p>
        <p class="auth-sent-body">${copy.recoverySent.replace('{email}', escHtml(email))}</p>
        <button class="auth-btn auth-btn--ghost" type="button">${copy.backToLogin}</button>
      </div>
    `;
    el.querySelector('.auth-btn--ghost').addEventListener('click', () => {
      _authMode = 'login';
      renderLoginInto(el);
    });
  }

  function renderPasswordUpdateInto(el) {
    const copy = authText();
    el.innerHTML = `
      <div class="auth-panel auth-panel--password-update">
        <p class="auth-sent-title">${copy.updatePasswordTitle}</p>
        <p class="auth-sent-body">${copy.updatePasswordCopy}</p>
        <form class="auth-update-password-form" novalidate>
          <label class="auth-label">${copy.newPassword}</label>
          <input class="auth-input" type="password" placeholder="${copy.newPasswordPlaceholder}" autocomplete="new-password" required>
          <label class="auth-label">${copy.repeatPassword}</label>
          <input class="auth-input" type="password" placeholder="${copy.repeatPassword}" autocomplete="new-password" required>
          <button class="auth-btn auth-btn--primary" type="submit">${copy.savePassword}</button>
        </form>
        <div class="auth-message" aria-live="polite"></div>
      </div>
    `;

    el.querySelector('.auth-update-password-form').addEventListener('submit', (e) => handlePasswordUpdateSubmit(e, el));
  }

  function renderOtpSentInto(el, email) {
    const copy = authText();
    el.innerHTML = `
      <div class="auth-panel auth-panel--sent">
        <div class="auth-sent-icon" aria-hidden="true">✉️</div>
        <p class="auth-sent-title">${copy.checkEmail}</p>
        <p class="auth-sent-body">${copy.sentBody.replace('{email}', escHtml(email))}</p>
        <button class="auth-btn auth-btn--ghost" type="button">${copy.otherEmail}</button>
      </div>
    `;
    el.querySelector('.auth-btn--ghost').addEventListener('click', renderAll);
  }

  function renderUserInto(el, user) {
    const copy = authText();
    const email = user.email || '';
    const avatar = user.user_metadata?.avatar_url;
    el.innerHTML = `
      <div class="auth-panel auth-panel--user">
        ${avatar ? `<img class="auth-avatar" src="${escHtml(avatar)}" alt="Avatar" width="36" height="36">` : ''}
        <span class="auth-user-email">${escHtml(email)}</span>
        ${getProfileAppMarkup()}
        <div class="auth-user-actions">
          <button class="auth-btn auth-btn--ghost auth-btn--signout" type="button">${copy.signOut}</button>
          <button class="auth-btn auth-btn--danger-ghost auth-btn--delete" type="button">${copy.deleteAccount}</button>
        </div>
      </div>
    `;
    bindProfileAppCard(el);
    el.querySelector('.auth-btn--signout').addEventListener('click', signOut);
    el.querySelector('.auth-btn--delete').addEventListener('click', () => handleDeleteAccount(el));
  }

  function renderDeleteConfirmInto(el) {
    const copy = authText();
    el.innerHTML = `
      <div class="auth-panel auth-panel--delete-confirm">
        <p class="auth-delete-title">${copy.deleteTitle}</p>
        <p class="auth-delete-body">${copy.deleteBody}</p>
        <div class="auth-user-actions">
          <button class="auth-btn auth-btn--danger" type="button" data-action="confirm-delete">${copy.confirmDelete}</button>
          <button class="auth-btn auth-btn--ghost" type="button" data-action="cancel-delete">${copy.cancel}</button>
        </div>
        <div class="auth-message" aria-live="polite"></div>
      </div>
    `;
    el.querySelector('[data-action="confirm-delete"]').addEventListener('click', () => executeDeleteAccount(el));
    el.querySelector('[data-action="cancel-delete"]').addEventListener('click', () => {
      const client = getClient();
      client?.auth.getSession().then(({ data: { session } }) => {
        if (session?.user) renderUserInto(el, session.user);
        else renderLoginInto(el);
      });
    });
  }

  // Renders all containers to the login state
  function renderAll() {
    _containers.forEach(el => {
      if (_authMode === 'recovery') renderPasswordUpdateInto(el);
      else renderLoginInto(el);
    });
  }

  function renderAllUser(user) {
    _containers.forEach(el => renderUserInto(el, user));
  }

  // ── Auth actions ────────────────────────────────────────────────────────────

  function handleDeleteAccount(el) {
    renderDeleteConfirmInto(el);
  }

  async function executeDeleteAccount(el) {
    const client = getClient();
    if (!client) return;
    const btn = el.querySelector('[data-action="confirm-delete"]');
    const msg = el.querySelector('.auth-message');
    const copy = authText();
    if (btn) { btn.disabled = true; btn.textContent = copy.deleting; }

    // Supabase no expone delete-user desde el cliente con anon key — se hace via RPC o Edge Function.
    // Por ahora: cerramos sesión + mostramos instrucción para contacto manual.
    // TODO: añadir Edge Function /api/delete-account cuando esté disponible.
    const { error } = await client.auth.signOut();
    if (error) {
      if (msg) { msg.textContent = 'Error: ' + error.message; msg.className = 'auth-message auth-message--error'; }
      if (btn) { btn.disabled = false; btn.textContent = copy.confirmDelete; }
      return;
    }
    // Tras cerrar sesión mostramos confirmación con instrucciones de contacto
    el.innerHTML = `
      <div class="auth-panel auth-panel--deleted">
        <p class="auth-delete-title">${copy.signedOut}</p>
        <p class="auth-delete-body">${copy.deleteInstructions}</p>
      </div>
    `;
  }

  async function signInWithGoogle() {
    const client = getClient();
    if (!client) return;
    rememberPostAuthDestination();
    const { error } = await client.auth.signInWithOAuth({
      provider: 'google',
      options: { redirectTo: getAuthCallbackUrl(getPostAuthDestination()) }
    });
    if (error) {
      const copy = authText();
      _containers.forEach(el => {
        const msg = el.querySelector('.auth-message');
        if (msg) { msg.textContent = copy.googleError + error.message; msg.className = 'auth-message auth-message--error'; }
      });
    }
  }

  async function handlePasswordSubmit(e, sourceEl) {
    e.preventDefault();
    const client = getClient();
    if (!client) return;
    const copy = authText();
    const msg = sourceEl.querySelector('.auth-message');
    const inputs = sourceEl.querySelectorAll('.auth-password-form .auth-input');
    const email = inputs[0]?.value?.trim();
    const password = inputs[1]?.value || '';

    if (!email) {
      if (msg) { msg.textContent = copy.validEmailError; msg.className = 'auth-message auth-message--error'; }
      return;
    }
    if (password.length < 6) {
      if (msg) { msg.textContent = copy.passwordTooShort; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    const btn = sourceEl.querySelector('.auth-password-form .auth-btn--primary');
    if (btn) { btn.disabled = true; btn.textContent = copy.sending; }

    const { error } = await client.auth.signInWithPassword({ email, password });
    if (error) {
      if (btn) { btn.disabled = false; btn.textContent = copy.signInPassword; }
      if (msg) { msg.textContent = copy.passwordError + error.message; msg.className = 'auth-message auth-message--error'; }
    }
  }

  async function handleRecoverySubmit(e, sourceEl) {
    e.preventDefault();
    const client = getClient();
    if (!client) return;
    const copy = authText();
    const msg = sourceEl.querySelector('.auth-message');
    const input = sourceEl.querySelector('.auth-recovery-form .auth-input[type="email"]');
    const email = input?.value?.trim();

    if (!email) {
      if (msg) { msg.textContent = copy.validEmailError; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    _recoveryEmail = email;
    const btn = sourceEl.querySelector('.auth-recovery-form .auth-btn--primary');
    if (btn) { btn.disabled = true; btn.textContent = copy.sending; }

    const { error } = await client.auth.resetPasswordForEmail(email, {
      redirectTo: getAuthCallbackUrl('/?auth=recovery')
    });

    if (error) {
      if (btn) { btn.disabled = false; btn.textContent = copy.sendRecovery; }
      if (msg) { msg.textContent = copy.recoveryError + error.message; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    _containers.forEach(el => renderRecoverySentInto(el, email));
  }

  async function handlePasswordUpdateSubmit(e, sourceEl) {
    e.preventDefault();
    const client = getClient();
    if (!client) return;
    const copy = authText();
    const msg = sourceEl.querySelector('.auth-message');
    const inputs = sourceEl.querySelectorAll('.auth-update-password-form .auth-input');
    const password = inputs[0]?.value || '';
    const repeat = inputs[1]?.value || '';

    if (password.length < 6) {
      if (msg) { msg.textContent = copy.passwordTooShort; msg.className = 'auth-message auth-message--error'; }
      return;
    }
    if (password !== repeat) {
      if (msg) { msg.textContent = copy.passwordMismatch; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    const btn = sourceEl.querySelector('.auth-update-password-form .auth-btn--primary');
    if (btn) { btn.disabled = true; btn.textContent = copy.sending; }

    const { error } = await client.auth.updateUser({ password });
    if (error) {
      if (btn) { btn.disabled = false; btn.textContent = copy.savePassword; }
      if (msg) { msg.textContent = copy.updatePasswordError + error.message; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    _authMode = 'login';
    if (window.history && window.location.search.includes('auth=recovery')) {
      window.history.replaceState({}, document.title, window.location.pathname || '/');
    }
    if (msg) { msg.textContent = copy.passwordUpdated; msg.className = 'auth-message auth-message--ok'; }
    refresh();
  }

  async function handleOtpSubmit(e, sourceEl) {
    e.preventDefault();
    const client = getClient();
    if (!client) return;
    const msg = sourceEl.querySelector('.auth-message');
    const copy = authText();

    const checkbox = sourceEl.querySelector('.auth-consent-check');
    if (checkbox && !checkbox.checked) {
      if (msg) { msg.textContent = copy.acceptTermsError; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    const input = sourceEl.querySelector('.auth-otp-form .auth-input[type="email"]');
    const email = input?.value?.trim();
    if (!email) {
      if (msg) { msg.textContent = copy.validEmailError; msg.className = 'auth-message auth-message--error'; }
      return;
    }

    const btn = sourceEl.querySelector('.auth-otp-form .auth-btn--primary');
    if (btn) { btn.disabled = true; btn.textContent = copy.sending; }

    rememberPostAuthDestination();
    const { error } = await client.auth.signInWithOtp({
      email,
      options: { emailRedirectTo: getAuthCallbackUrl(getPostAuthDestination()) }
    });

    if (error) {
      if (btn) { btn.disabled = false; btn.textContent = copy.sendLink; }
      const msg = sourceEl.querySelector('.auth-message');
      if (msg) { msg.textContent = 'Error: ' + error.message; msg.className = 'auth-message auth-message--error'; }
    } else {
      // Show sent state in ALL containers
      _containers.forEach(el => renderOtpSentInto(el, email));
    }
  }

  async function signOut() {
    const client = getClient();
    if (!client) return;
    await client.auth.signOut();
    // onAuthStateChange triggers renderAll automatically
  }

  // ── Lab.user sync ───────────────────────────────────────────────────────────

  async function updateLabUser(session) {
    const Lab = window.VokabelLab;
    if (!Lab) return;
    if (session?.user) {
      Lab.user = {
        status: 'authenticated',
        role: 'user',
        id: session.user.id,
        email: session.user.email,
        name: session.user.user_metadata?.full_name || session.user.email,
        avatarUrl: session.user.user_metadata?.avatar_url || ''
      };
      if (Lab.config?.features) Lab.config.features.auth = true;
      try {
        const client = getClient();
        if (client) {
          const { data: profile } = await client
            .from('profiles')
            .select('preferred_lang')
            .eq('id', session.user.id)
            .single();
          window.VokabelLabI18n?.applyProfileLanguage(profile?.preferred_lang);
        }
      } catch (_) {}
    } else {
      Lab.user = { status: 'guest', role: 'guest' };
    }
    window.dispatchEvent(new CustomEvent('vokabellab:auth-change', { detail: { authenticated: Boolean(session?.user) } }));
  }

  async function refresh() {
    const client = getClient();
    if (!client) return;
    const { data: { session } } = await client.auth.getSession();
    if (_authMode === 'recovery') {
      _containers.forEach(el => renderPasswordUpdateInto(el));
    } else if (session?.user) {
      renderAllUser(session.user);
    } else {
      renderAll();
    }
  }

  function ensureAuthListeners(client) {
    if (!_authSubscription) {
      const result = client.auth.onAuthStateChange((event, session) => {
        if (event === 'PASSWORD_RECOVERY') {
          _authMode = 'recovery';
        }
        updateLabUser(session);
        if (_authMode === 'recovery') {
          _containers.forEach(el => renderPasswordUpdateInto(el));
        } else if (session?.user) {
          renderAllUser(session.user);
        } else {
          renderAll();
        }
      });
      _authSubscription = result?.data?.subscription || true;
    }

    if (!_installListenerBound) {
      window.addEventListener('vokabellab:install-state-change', refresh);
      _installListenerBound = true;
    }
  }

  // ── Init ────────────────────────────────────────────────────────────────────

  async function init(containerIds = ['dashboardAuthCard']) {
    const client = getClient();
    if (!client) return;

    if (new URLSearchParams(window.location.search).get('auth') === 'recovery') {
      _authMode = 'recovery';
    }

    // OAuth PKCE can complete before the dashboard/profile containers exist.
    ensureAuthListeners(client);

    const ids = Array.isArray(containerIds) ? containerIds : [containerIds];
    _containers = ids.map(id => document.getElementById(id)).filter(Boolean);
    if (_containers.length === 0) return;

    // Render initial state
    const { data: { session } } = await client.auth.getSession();
    updateLabUser(session);
    if (_authMode === 'recovery') {
      _containers.forEach(el => renderPasswordUpdateInto(el));
    } else if (session?.user) {
      renderAllUser(session.user);
    } else {
      renderAll();
    }
  }

  // ── Exportar ────────────────────────────────────────────────────────────────

  window.AuthCore = { init, signOut, getClient, refresh, getPostAuthDestination, rememberPostAuthDestination };
})();
