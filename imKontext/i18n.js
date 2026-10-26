/* ═══════════════════════════════════════════════════════════════
   VOKABEL LAB imKontext — i18n.js
   Internationalization: UI language dictionaries + t() helper.
   Must be loaded before app.js and practice.js.
═══════════════════════════════════════════════════════════════ */

const I18N_STORAGE_KEY = 'imk_ui_lang';
const I18N_TARGET_KEY  = 'imk_target_lang';

const SUPPORTED_UI_LANGS    = ['es', 'en', 'de', 'fi', 'it', 'pt'];
const SUPPORTED_TARGET_LANGS = ['de', 'es', 'en', 'fi', 'it', 'pt'];

const LANG_NAMES = {
  de: { native: 'Deutsch',    flag: '🇩🇪', en: 'German',     es: 'alemán',     fi: 'saksa',      it: 'tedesco',     pt: 'alemão'    },
  es: { native: 'Español',    flag: '🇪🇸', en: 'Spanish',    es: 'español',    fi: 'espanja',    it: 'spagnolo',    pt: 'espanhol'  },
  en: { native: 'English',    flag: '🇬🇧', en: 'English',    es: 'inglés',     fi: 'englanti',   it: 'inglese',     pt: 'inglês'    },
  fi: { native: 'Suomi',      flag: '🇫🇮', en: 'Finnish',    es: 'finlandés',  fi: 'suomi',      it: 'finlandese',  pt: 'finlandês' },
  it: { native: 'Italiano',   flag: '🇮🇹', en: 'Italian',    es: 'italiano',   fi: 'italia',     it: 'italiano',    pt: 'italiano'  },
  pt: { native: 'Português',  flag: '🇧🇷', en: 'Portuguese', es: 'portugués',  fi: 'portugali',  it: 'portoghese',  pt: 'português' },
};

let _uiLang     = 'es';
let _targetLang = 'de';
let _nativeLang = null;
const I18N_NATIVE_KEY = 'imk_native_lang';

/* ── DICTIONARIES ───────────────────────────────────────────── */

const DICT = {};

DICT.es = {
  // Landing
  'landing.headline':        'Aprende {lang} con noticias reales',
  'landing.deck':            'Practica vocabulario real con textos de actualidad.',
  'landing.deck2':           'El método de <strong>Vokabel Lab imKontext</strong>.',
  'landing.kicker':          'Willkommen!',
  'landing.cta':             'Empieza ahora',
  'landing.activities':      'Flashcards · Test · Lückentext · Ordenar · Artículo',
  'landing.edition_label':   'Número de la semana',
  'landing.choose_language': 'Elige el idioma que quieres aprender',

  // Nav
  'nav.methodology':   'Metodología',
  'nav.contact':       'Contacto',
  'nav.legal':         'Legal',
  'nav.dashboard':     'Dashboard',

  // Language selector
  'lang_sel.ui_label':     'Idioma de la app',

  // Text selection (screen-textos)
  'textos.step':       'Paso 1 de 3',
  'textos.title':      'Elige un texto',
  'textos.subtitle':   'Selecciona el artículo sobre el que quieres practicar hoy. Si el tema se te queda corto, cambia el nivel antes de entrar.',
  'textos.search':     'Buscar texto',
  'textos.search_placeholder': 'Buscar texto...',
  'textos.search_help':'Filtra por título mientras exploras los textos disponibles.',
  'textos.back':       '← Volver',
  'textos.loading':    'Cargando textos…',
  'textos.error':      'No se pudieron cargar los textos. Comprueba tu conexión e inténtalo de nuevo.',
  'textos.empty':      'No se encontraron textos.',
  'textos.not_found':  'No se encontró el texto solicitado.',
  'textos.level_label':'Nivel preferido para la selección de texto',

  // Text detail (screen-content)
  'content.step':         'Paso 2 de 3 — Antes de empezar',
  'content.default_title':'Texto',
  'content.read_first':   'Lee el texto primero',
  'content.description':  'Este texto se carga directamente desde Supabase. Léelo con calma y vuelve cuando estés listo para los ejercicios.',
  'content.change_level': '¿Demasiado fácil? Cambia de nivel aquí:',
  'content.start_exercises':'Empezar ejercicios →',
  'content.share':        'Compartir ↗',
  'content.shared':       '¡Copiado! ✓',
  'content.reading_mode': 'Modo lectura ⤢',
  'content.exit_reading': 'Salir lectura ×',
  'content.finish_reading':'Terminar',
  'content.back_texts':   '← Textos',
  'content.loading_version':'Cargando la versión del texto para este nivel…',
  'content.empty_text':   'Este texto todavía no tiene contenido base guardado.',
  'content.empty_hint':   'Puedes continuar igualmente a los ejercicios si el vocabulario del nivel ya está cargado.',
  'content.freemium':     'Promoción activa: este contenido premium está desbloqueado gratis por tiempo limitado.',
  'content.premium_msg':  'Este texto es premium. Escríbenos para obtener acceso.',
  'content.premium_cta':  'Contactar →',

  // Vocab panel
  'vocab.meaning':     'Significado',
  'vocab.type':        'Tipo',
  'vocab.plural':      'Plural',
  'vocab.infinitive':  'Infinitivo',
  'vocab.example':     'Ejemplo',

  // Activity config (screen-activity)
  'activity.step':          'Paso 3 de 3 — Configura tu práctica',
  'activity.title':         'Configura tu práctica',
  'activity.back':          '← Texto',
  'activity.level':         'Nivel',
  'activity.level_desc':    'Los ejercicios se adaptarán al nivel de dificultad elegido.',
  'activity.type':          'Tipo de actividad',
  'activity.type_desc':     'Elige una o deja en blanco para practicar con todos los formatos.',
  'activity.start':         'Empezar práctica 🚀',
  'activity.loading':       'Cargando…',
  'activity.saved_progress':'Tienes progreso guardado:',
  'activity.words_pending': '{n} palabras pendientes',
  'activity.continue':      '¿Continuar?',
  'activity.reset':         'Reiniciar progreso',

  // Activity modes
  'mode.ordenar':     'Ordenar frases',
  'mode.test':        'Test',
  'mode.flashcards':  'Flashcards',
  'mode.articulo':    'Artículo',
  'mode.lueckentext': 'Lückentext',

  // Mode descriptions
  'mode_desc.ordenar':     'Ordenarás frases en el orden correcto.',
  'mode_desc.test':        'Elegirás la traducción correcta entre 4 opciones.',
  'mode_desc.flashcards':  'Verás la palabra y decidirás si la sabes o no.',
  'mode_desc.articulo':    'Elegirás el artículo correcto (der/die/das).',
  'mode_desc.lueckentext': 'Completarás huecos en frases con 4 opciones.',

  // Mode hints
  'hint.none':     'Sin filtro: practicarás con todos los formatos.',
  'hint.multiple': 'Alternando: {modes}.',

  // Progress panel
  'progress.title':         'Progreso {level}',
  'progress.tracking':      'Seguimiento',
  'progress.pct':           '{pct}% completado',
  'progress.words_done':    '{done} / {total} palabras practicadas',
  'progress.words_in_level':'{total} palabras en nivel {level}',
  'progress.zero_pct':      '0% completado',
  'progress.zero_words':    '0 / {total} palabras practicadas',

  // Level status
  'level.selected':          'Nivel {level} seleccionado. Cargando vocabulario disponible…',
  'level.unavailable':       'El nivel {level} no está disponible para este texto.',
  'level.no_version':        'No se ha encontrado una versión {level} para este texto.',
  'level.vocab_count':       '{count} palabras de vocabulario disponibles para el nivel {level}.',
  'level.no_vocab':          'No hay vocabulario cargado para el nivel {level}.',

  // Exercise
  'exercise.translation':     'Traducción: {word}',
  'exercise.show_translation': 'Ver traducción',
  'exercise.hide_translation': 'Ocultar traducción',
  'exercise.show_context':     'Mostrar traducción',
  'exercise.hide_context':     'Ocultar traducción',
  'exercise.hint':             '💡 Tipp',
  'exercise.hide_hint':        'Ocultar tipp',
  'exercise.dont_know':        'No la sé',
  'exercise.correct':          '✓ ¡Correcto!',
  'exercise.wrong':            '✗ Era: "{answer}"',
  'exercise.next_in':          'Siguiente en',
  'exercise.order_words':      'Ordena las palabras:',
  'exercise.word_bank':        'Banco de palabras — clica para añadir',
  'exercise.your_sentence':    'Tu frase',
  'exercise.finish_test':      'Terminar test',
  'exercise.back':             '← Atrás',
  'exercise.next':             'Siguiente →',
  'exercise.example':          'Ejemplo',
  'exercise.badge_ordenar':    'Ordenar',
  'exercise.badge_articulo':   'Artículo',

  // Flashcard
  'flashcard.yes':   'Sí',
  'flashcard.no':    'No la sé',

  // Results
  'result.score_label':   'Puntuación final',
  'result.great':         '¡Sehr gut! 🎉',
  'result.good':          '¡Gut gemacht! 👍',
  'result.keep_going':    'Sigue practicando 💪',
  'result.correct':       'Correctas',
  'result.wrong':         'Errores',
  'result.words':         'Palabras',
  'result.review_errors': 'Repasar solo errores ({n})',
  'result.retry':         'Volver a intentarlo',
  'result.back_menu':     'Volver al menú principal',
  'result.exit':          'Finalizar / salir',

  // Dashboard
  'dashboard.title':       'Dashboard',
  'dashboard.subtitle':    'Tu progreso',
  'dashboard.back':        '← Volver',
  'dashboard.empty':       'Todavía no tienes sesiones registradas. ¡Empieza a practicar para ver tu progreso aquí!',
  'dashboard.go_texts':    'Ir a los textos →',
  'dashboard.by_text':     'Progreso por texto',
  'dashboard.reset_label': 'Reiniciar progreso',

  // Loading
  'loading.preparing':  'Preparando tus ejercicios...',
  'loading.words': [
    { target: 'der Bahnhof',      native: 'la estación de tren' },
    { target: 'die Straßenbahn',  native: 'el tranvía' },
    { target: 'das Rathaus',      native: 'el ayuntamiento' },
    { target: 'die Ampel',        native: 'el semáforo' },
  ],

  // Vokabel World
  'world.back_planetarium': 'Volver al planetario',
  'world.back_world':       'Volver a Vokabel World',

  // SEO
  'seo.home_title':        'imKontext | Lee en {lang} y aprende vocabulario real',
  'seo.home_desc':         'Lee textos auténticos en {lang} y aprende vocabulario en contexto. Ejercicios por niveles A2, B1, B2 y C1 basados en artículos reales.',
  'seo.textos_title':      'imKontext | Elige un texto para practicar {lang}',
  'seo.textos_desc':       'Explora textos reales en {lang} y elige el artículo que quieres leer y practicar hoy.',
  'seo.text_detail_desc':  'Lee y practica vocabulario de {lang} en contexto con "{title}". Nivel {level} en imKontext.',

  // Categories
  'cat.tecnologia':    'Tecnología',
  'cat.sociedad':      'Sociedad',
  'cat.deporte':       'Deporte',
  'cat.movilidad':     'Movilidad',
  'cat.medioambiente': 'Medioambiente',
  'cat.salud':         'Salud',
  'cat.educacion':     'Educación',
  'cat.trabajo':       'Trabajo',
  'cat.ciencia':       'Ciencia',
  'cat.cultura':       'Cultura',
  'cat.internacional': 'Internacional',
  'cat.politica':      'Política',
  'cat.economia':      'Economía',

  // Misc
  'misc.close':  'Cerrar',
  'misc.copy_link': 'Copia este enlace:',
};

DICT.en = {
  'landing.headline':        'Learn {lang} with real news',
  'landing.deck':            'Practice real vocabulary with current texts.',
  'landing.deck2':           'The <strong>Vokabel Lab imKontext</strong> method.',
  'landing.kicker':          'Welcome!',
  'landing.cta':             'Start now',
  'landing.activities':      'Flashcards · Test · Fill-in · Reorder · Article',
  'landing.edition_label':   'Issue of the week',
  'landing.choose_language': 'Choose the language you want to learn',

  'nav.methodology':   'Methodology',
  'nav.contact':       'Contact',
  'nav.legal':         'Legal',
  'nav.dashboard':     'Dashboard',

  'lang_sel.ui_label':     'App language',

  'textos.step':       'Step 1 of 3',
  'textos.title':      'Choose a text',
  'textos.subtitle':   'Select the article you want to practice with today. If the topic is too easy, change the level before you start.',
  'textos.search':     'Search texts',
  'textos.search_placeholder': 'Search texts...',
  'textos.search_help':'Filter by title as you browse the available texts.',
  'textos.back':       '← Back',
  'textos.loading':    'Loading texts…',
  'textos.error':      'Could not load texts. Check your connection and try again.',
  'textos.empty':      'No texts found.',
  'textos.not_found':  'The requested text was not found.',
  'textos.level_label':'Preferred level for text selection',

  'content.step':         'Step 2 of 3 — Before you start',
  'content.default_title':'Text',
  'content.read_first':   'Read the text first',
  'content.description':  'This text is loaded directly from the database. Read it carefully and come back when you are ready for the exercises.',
  'content.change_level': 'Too easy? Change the level here:',
  'content.start_exercises':'Start exercises →',
  'content.share':        'Share ↗',
  'content.shared':       'Copied! ✓',
  'content.reading_mode': 'Reading mode ⤢',
  'content.exit_reading': 'Exit reading ×',
  'content.finish_reading':'Finish',
  'content.back_texts':   '← Texts',
  'content.loading_version':'Loading the text version for this level…',
  'content.empty_text':   'This text does not have base content saved yet.',
  'content.empty_hint':   'You can still continue to the exercises if the vocabulary for this level is already loaded.',
  'content.freemium':     'Active promotion: this premium content is unlocked for free for a limited time.',
  'content.premium_msg':  'This text is premium. Contact us for access.',
  'content.premium_cta':  'Contact →',

  'vocab.meaning':     'Meaning',
  'vocab.type':        'Type',
  'vocab.plural':      'Plural',
  'vocab.infinitive':  'Infinitive',
  'vocab.example':     'Example',

  'activity.step':          'Step 3 of 3 — Configure your practice',
  'activity.title':         'Configure your practice',
  'activity.back':          '← Text',
  'activity.level':         'Level',
  'activity.level_desc':    'Exercises will adapt to the chosen difficulty level.',
  'activity.type':          'Activity type',
  'activity.type_desc':     'Choose one or leave blank to practice with all formats.',
  'activity.start':         'Start practice 🚀',
  'activity.loading':       'Loading…',
  'activity.saved_progress':'You have saved progress:',
  'activity.words_pending': '{n} words pending',
  'activity.continue':      'Continue?',
  'activity.reset':         'Reset progress',

  'mode.ordenar':     'Reorder sentences',
  'mode.test':        'Test',
  'mode.flashcards':  'Flashcards',
  'mode.articulo':    'Article',
  'mode.lueckentext': 'Fill in the blank',

  'mode_desc.ordenar':     'You will put sentences in the correct order.',
  'mode_desc.test':        'You will choose the correct translation from 4 options.',
  'mode_desc.flashcards':  'You will see the word and decide if you know it.',
  'mode_desc.articulo':    'You will choose the correct article (der/die/das).',
  'mode_desc.lueckentext': 'You will fill in blanks in sentences with 4 options.',

  'hint.none':     'No filter: you will practice with all formats.',
  'hint.multiple': 'Alternating: {modes}.',

  'progress.title':         'Progress {level}',
  'progress.tracking':      'Tracking',
  'progress.pct':           '{pct}% completed',
  'progress.words_done':    '{done} / {total} words practised',
  'progress.words_in_level':'{total} words at level {level}',
  'progress.zero_pct':      '0% completed',
  'progress.zero_words':    '0 / {total} words practised',

  'level.selected':          'Level {level} selected. Loading available vocabulary…',
  'level.unavailable':       'Level {level} is not available for this text.',
  'level.no_version':        'No {level} version found for this text.',
  'level.vocab_count':       '{count} vocabulary words available for level {level}.',
  'level.no_vocab':          'No vocabulary loaded for level {level}.',

  'exercise.translation':     'Translation: {word}',
  'exercise.show_translation': 'Show translation',
  'exercise.hide_translation': 'Hide translation',
  'exercise.show_context':     'Show translation',
  'exercise.hide_context':     'Hide translation',
  'exercise.hint':             '💡 Hint',
  'exercise.hide_hint':        'Hide hint',
  'exercise.dont_know':        'I don\'t know',
  'exercise.correct':          '✓ Correct!',
  'exercise.wrong':            '✗ It was: "{answer}"',
  'exercise.next_in':          'Next in',
  'exercise.order_words':      'Reorder the words:',
  'exercise.word_bank':        'Word bank — click to add',
  'exercise.your_sentence':    'Your sentence',
  'exercise.finish_test':      'Finish test',
  'exercise.back':             '← Back',
  'exercise.next':             'Next →',
  'exercise.example':          'Example',
  'exercise.badge_ordenar':    'Reorder',
  'exercise.badge_articulo':   'Article',

  'flashcard.yes':   'Yes',
  'flashcard.no':    'I don\'t know',

  'result.score_label':   'Final score',
  'result.great':         'Excellent! 🎉',
  'result.good':          'Well done! 👍',
  'result.keep_going':    'Keep practising 💪',
  'result.correct':       'Correct',
  'result.wrong':         'Mistakes',
  'result.words':         'Words',
  'result.review_errors': 'Review mistakes only ({n})',
  'result.retry':         'Try again',
  'result.back_menu':     'Back to main menu',
  'result.exit':          'Finish / exit',

  'dashboard.title':       'Dashboard',
  'dashboard.subtitle':    'Your progress',
  'dashboard.back':        '← Back',
  'dashboard.empty':       'You have no sessions recorded yet. Start practising to see your progress here!',
  'dashboard.go_texts':    'Go to texts →',
  'dashboard.by_text':     'Progress by text',
  'dashboard.reset_label': 'Reset progress',

  'loading.preparing':  'Preparing your exercises...',
  'loading.words': [
    { target: 'der Bahnhof',      native: 'the train station' },
    { target: 'die Straßenbahn',  native: 'the tram' },
    { target: 'das Rathaus',      native: 'the town hall' },
    { target: 'die Ampel',        native: 'the traffic light' },
  ],

  'world.back_planetarium': 'Back to planetarium',
  'world.back_world':       'Back to Vokabel World',

  'seo.home_title':        'imKontext | Read in {lang} and learn real vocabulary',
  'seo.home_desc':         'Read authentic texts in {lang} and learn vocabulary in context. Exercises by levels A2, B1, B2 and C1 based on real articles.',
  'seo.textos_title':      'imKontext | Choose a text to practise {lang}',
  'seo.textos_desc':       'Explore real texts in {lang} and choose the article you want to read and practise today.',
  'seo.text_detail_desc':  'Read and practise {lang} vocabulary in context with "{title}". Level {level} on imKontext.',

  'cat.tecnologia':    'Technology',
  'cat.sociedad':      'Society',
  'cat.deporte':       'Sport',
  'cat.movilidad':     'Mobility',
  'cat.medioambiente': 'Environment',
  'cat.salud':         'Health',
  'cat.educacion':     'Education',
  'cat.trabajo':       'Work',
  'cat.ciencia':       'Science',
  'cat.cultura':       'Culture',
  'cat.internacional': 'International',
  'cat.politica':      'Politics',
  'cat.economia':      'Economy',

  'misc.close':  'Close',
  'misc.copy_link': 'Copy this link:',
};

DICT.de = {
  'landing.headline':        'Lerne {lang} mit echten Nachrichten',
  'landing.deck':            'Übe echten Wortschatz mit aktuellen Texten.',
  'landing.deck2':           'Die Methode von <strong>Vokabel Lab imKontext</strong>.',
  'landing.kicker':          'Willkommen!',
  'landing.cta':             'Jetzt starten',
  'landing.activities':      'Flashcards · Test · Lückentext · Sortieren · Artikel',
  'landing.edition_label':   'Ausgabe der Woche',
  'landing.choose_language': 'Wähle die Sprache, die du lernen möchtest',

  'nav.methodology':   'Methodik',
  'nav.contact':       'Kontakt',
  'nav.legal':         'Impressum',
  'nav.dashboard':     'Dashboard',

  'lang_sel.ui_label':     'App-Sprache',

  'textos.step':       'Schritt 1 von 3',
  'textos.title':      'Wähle einen Text',
  'textos.subtitle':   'Wähle den Artikel, mit dem du heute üben möchtest. Wenn das Thema zu leicht ist, ändere das Niveau.',
  'textos.search':     'Text suchen',
  'textos.search_placeholder': 'Text suchen...',
  'textos.search_help':'Filtere nach Titel, während du die verfügbaren Texte durchsuchst.',
  'textos.back':       '← Zurück',
  'textos.loading':    'Texte werden geladen…',
  'textos.error':      'Texte konnten nicht geladen werden. Überprüfe deine Verbindung und versuche es erneut.',
  'textos.empty':      'Keine Texte gefunden.',
  'textos.not_found':  'Der angeforderte Text wurde nicht gefunden.',
  'textos.level_label':'Bevorzugtes Niveau für die Textauswahl',

  'content.step':         'Schritt 2 von 3 — Bevor du anfängst',
  'content.default_title':'Text',
  'content.read_first':   'Lies den Text zuerst',
  'content.description':  'Dieser Text wird direkt aus der Datenbank geladen. Lies ihn in Ruhe und komm zurück, wenn du für die Übungen bereit bist.',
  'content.change_level': 'Zu einfach? Ändere hier das Niveau:',
  'content.start_exercises':'Übungen starten →',
  'content.share':        'Teilen ↗',
  'content.shared':       'Kopiert! ✓',
  'content.reading_mode': 'Lesemodus ⤢',
  'content.exit_reading': 'Lesemodus beenden ×',
  'content.finish_reading':'Beenden',
  'content.back_texts':   '← Texte',
  'content.loading_version':'Die Textversion für dieses Niveau wird geladen…',
  'content.empty_text':   'Dieser Text hat noch keinen gespeicherten Basisinhalt.',
  'content.empty_hint':   'Du kannst trotzdem mit den Übungen fortfahren, wenn der Wortschatz für dieses Niveau bereits geladen ist.',
  'content.freemium':     'Aktive Aktion: Dieser Premium-Inhalt ist für begrenzte Zeit kostenlos freigeschaltet.',
  'content.premium_msg':  'Dieser Text ist Premium. Kontaktiere uns für Zugang.',
  'content.premium_cta':  'Kontakt →',

  'vocab.meaning':     'Bedeutung',
  'vocab.type':        'Wortart',
  'vocab.plural':      'Plural',
  'vocab.infinitive':  'Infinitiv',
  'vocab.example':     'Beispiel',

  'activity.step':          'Schritt 3 von 3 — Konfiguriere deine Übung',
  'activity.title':         'Konfiguriere deine Übung',
  'activity.back':          '← Text',
  'activity.level':         'Niveau',
  'activity.level_desc':    'Die Übungen werden an das gewählte Schwierigkeitsniveau angepasst.',
  'activity.type':          'Übungsart',
  'activity.type_desc':     'Wähle eine oder lasse leer, um mit allen Formaten zu üben.',
  'activity.start':         'Übung starten 🚀',
  'activity.loading':       'Wird geladen…',
  'activity.saved_progress':'Du hast gespeicherten Fortschritt:',
  'activity.words_pending': '{n} Wörter ausstehend',
  'activity.continue':      'Fortfahren?',
  'activity.reset':         'Fortschritt zurücksetzen',

  'mode.ordenar':     'Sätze sortieren',
  'mode.test':        'Test',
  'mode.flashcards':  'Flashcards',
  'mode.articulo':    'Artikel',
  'mode.lueckentext': 'Lückentext',

  'mode_desc.ordenar':     'Du ordnest Sätze in die richtige Reihenfolge.',
  'mode_desc.test':        'Du wählst die richtige Übersetzung aus 4 Optionen.',
  'mode_desc.flashcards':  'Du siehst das Wort und entscheidest, ob du es weißt.',
  'mode_desc.articulo':    'Du wählst den richtigen Artikel (der/die/das).',
  'mode_desc.lueckentext': 'Du füllst Lücken in Sätzen mit 4 Optionen.',

  'hint.none':     'Kein Filter: Du übst mit allen Formaten.',
  'hint.multiple': 'Abwechselnd: {modes}.',

  'progress.title':         'Fortschritt {level}',
  'progress.tracking':      'Verfolgung',
  'progress.pct':           '{pct}% abgeschlossen',
  'progress.words_done':    '{done} / {total} Wörter geübt',
  'progress.words_in_level':'{total} Wörter auf Niveau {level}',
  'progress.zero_pct':      '0% abgeschlossen',
  'progress.zero_words':    '0 / {total} Wörter geübt',

  'level.selected':          'Niveau {level} ausgewählt. Verfügbarer Wortschatz wird geladen…',
  'level.unavailable':       'Niveau {level} ist für diesen Text nicht verfügbar.',
  'level.no_version':        'Keine Version {level} für diesen Text gefunden.',
  'level.vocab_count':       '{count} Wörter für Niveau {level} verfügbar.',
  'level.no_vocab':          'Kein Wortschatz für Niveau {level} geladen.',

  'exercise.translation':     'Übersetzung: {word}',
  'exercise.show_translation': 'Übersetzung anzeigen',
  'exercise.hide_translation': 'Übersetzung ausblenden',
  'exercise.show_context':     'Übersetzung anzeigen',
  'exercise.hide_context':     'Übersetzung ausblenden',
  'exercise.hint':             '💡 Tipp',
  'exercise.hide_hint':        'Tipp ausblenden',
  'exercise.dont_know':        'Weiß ich nicht',
  'exercise.correct':          '✓ Richtig!',
  'exercise.wrong':            '✗ Es war: "{answer}"',
  'exercise.next_in':          'Nächste in',
  'exercise.order_words':      'Ordne die Wörter:',
  'exercise.word_bank':        'Wortbank — klicke zum Hinzufügen',
  'exercise.your_sentence':    'Dein Satz',
  'exercise.finish_test':      'Test beenden',
  'exercise.back':             '← Zurück',
  'exercise.next':             'Weiter →',
  'exercise.example':          'Beispiel',
  'exercise.badge_ordenar':    'Ordnen',
  'exercise.badge_articulo':   'Artikel',

  'flashcard.yes':   'Ja',
  'flashcard.no':    'Weiß ich nicht',

  'result.score_label':   'Endergebnis',
  'result.great':         'Sehr gut! 🎉',
  'result.good':          'Gut gemacht! 👍',
  'result.keep_going':    'Weiter üben 💪',
  'result.correct':       'Richtig',
  'result.wrong':         'Fehler',
  'result.words':         'Wörter',
  'result.review_errors': 'Nur Fehler wiederholen ({n})',
  'result.retry':         'Nochmal versuchen',
  'result.back_menu':     'Zurück zum Hauptmenü',
  'result.exit':          'Beenden / Verlassen',

  'dashboard.title':       'Dashboard',
  'dashboard.subtitle':    'Dein Fortschritt',
  'dashboard.back':        '← Zurück',
  'dashboard.empty':       'Du hast noch keine Sitzungen. Beginne zu üben, um deinen Fortschritt hier zu sehen!',
  'dashboard.go_texts':    'Zu den Texten →',
  'dashboard.by_text':     'Fortschritt nach Text',
  'dashboard.reset_label': 'Fortschritt zurücksetzen',

  'loading.preparing':  'Deine Übungen werden vorbereitet...',
  'loading.words': [
    { target: 'der Bahnhof',      native: 'the train station' },
    { target: 'die Straßenbahn',  native: 'the tram' },
    { target: 'das Rathaus',      native: 'the town hall' },
    { target: 'die Ampel',        native: 'the traffic light' },
  ],

  'world.back_planetarium': 'Zurück zum Planetarium',
  'world.back_world':       'Zurück zu Vokabel World',

  'seo.home_title':        'imKontext | Lies auf {lang} und lerne echten Wortschatz',
  'seo.home_desc':         'Lies authentische Texte auf {lang} und lerne Wortschatz im Kontext. Übungen nach Niveaus A2, B1, B2 und C1 basierend auf echten Artikeln.',
  'seo.textos_title':      'imKontext | Wähle einen Text zum Üben von {lang}',
  'seo.textos_desc':       'Erkunde echte Texte auf {lang} und wähle den Artikel, den du heute lesen und üben möchtest.',
  'seo.text_detail_desc':  'Lies und übe {lang}-Wortschatz im Kontext mit „{title}". Niveau {level} auf imKontext.',

  'cat.tecnologia':    'Technologie',
  'cat.sociedad':      'Gesellschaft',
  'cat.deporte':       'Sport',
  'cat.movilidad':     'Mobilität',
  'cat.medioambiente': 'Umwelt',
  'cat.salud':         'Gesundheit',
  'cat.educacion':     'Bildung',
  'cat.trabajo':       'Arbeit',
  'cat.ciencia':       'Wissenschaft',
  'cat.cultura':       'Kultur',
  'cat.internacional': 'International',
  'cat.politica':      'Politik',
  'cat.economia':      'Wirtschaft',

  'misc.close':  'Schließen',
  'misc.copy_link': 'Link kopieren:',
};

DICT.fi = {
  'landing.headline':        'Opi {lang} oikeilla uutisilla',
  'landing.deck':            'Harjoittele oikeaa sanastoa ajankohtaisilla teksteillä.',
  'landing.deck2':           '<strong>Vokabel Lab imKontext</strong> -menetelmä.',
  'landing.kicker':          'Tervetuloa!',
  'landing.cta':             'Aloita nyt',
  'landing.activities':      'Flashcards · Testi · Täytä aukot · Järjestä · Artikkeli',
  'landing.edition_label':   'Viikon numero',
  'landing.choose_language': 'Valitse kieli, jota haluat oppia',

  'nav.methodology':   'Metodologia',
  'nav.contact':       'Yhteystiedot',
  'nav.legal':         'Lainopillinen',
  'nav.dashboard':     'Hallintapaneeli',

  'lang_sel.ui_label':     'Sovelluksen kieli',

  'textos.step':       'Vaihe 1/3',
  'textos.title':      'Valitse teksti',
  'textos.subtitle':   'Valitse artikkeli, jota haluat harjoitella tänään. Jos aihe on liian helppo, vaihda tasoa ennen aloittamista.',
  'textos.search':     'Hae tekstejä',
  'textos.search_placeholder': 'Hae tekstejä...',
  'textos.search_help':'Suodata otsikon mukaan selatessasi tekstejä.',
  'textos.back':       '← Takaisin',
  'textos.loading':    'Ladataan tekstejä…',
  'textos.error':      'Tekstejä ei voitu ladata. Tarkista yhteys ja yritä uudelleen.',
  'textos.empty':      'Tekstejä ei löytynyt.',
  'textos.not_found':  'Pyydettyä tekstiä ei löytynyt.',
  'textos.level_label':'Haluttu taso tekstin valintaan',

  'content.step':         'Vaihe 2/3 — Ennen aloittamista',
  'content.default_title':'Teksti',
  'content.read_first':   'Lue teksti ensin',
  'content.description':  'Tämä teksti ladataan suoraan tietokannasta. Lue se rauhassa ja palaa, kun olet valmis harjoituksiin.',
  'content.change_level': 'Liian helppo? Vaihda taso tästä:',
  'content.start_exercises':'Aloita harjoitukset →',
  'content.share':        'Jaa ↗',
  'content.shared':       'Kopioitu! ✓',
  'content.reading_mode': 'Lukutila ⤢',
  'content.exit_reading': 'Poistu lukutilasta ×',
  'content.finish_reading':'Lopeta',
  'content.back_texts':   '← Tekstit',
  'content.loading_version':'Ladataan tekstiversiota tälle tasolle…',
  'content.empty_text':   'Tällä tekstillä ei ole vielä tallennettua perussisältöä.',
  'content.empty_hint':   'Voit silti jatkaa harjoituksiin, jos tämän tason sanasto on jo ladattu.',
  'content.freemium':     'Aktiivinen kampanja: tämä premium-sisältö on avattu ilmaiseksi rajoitetun ajan.',
  'content.premium_msg':  'Tämä teksti on premium. Ota yhteyttä saadaksesi pääsyn.',
  'content.premium_cta':  'Ota yhteyttä →',

  'vocab.meaning':     'Merkitys',
  'vocab.type':        'Tyyppi',
  'vocab.plural':      'Monikko',
  'vocab.infinitive':  'Infinitiivi',
  'vocab.example':     'Esimerkki',

  'activity.step':          'Vaihe 3/3 — Määritä harjoituksesi',
  'activity.title':         'Määritä harjoituksesi',
  'activity.back':          '← Teksti',
  'activity.level':         'Taso',
  'activity.level_desc':    'Harjoitukset mukautuvat valittuun vaikeustasoon.',
  'activity.type':          'Harjoitustyyppi',
  'activity.type_desc':     'Valitse yksi tai jätä tyhjäksi harjoitellaksesi kaikilla muodoilla.',
  'activity.start':         'Aloita harjoitus 🚀',
  'activity.loading':       'Ladataan…',
  'activity.saved_progress':'Sinulla on tallennettua edistymistä:',
  'activity.words_pending': '{n} sanaa odottaa',
  'activity.continue':      'Jatketaanko?',
  'activity.reset':         'Nollaa edistyminen',

  'mode.ordenar':     'Järjestä lauseet',
  'mode.test':        'Testi',
  'mode.flashcards':  'Flashcards',
  'mode.articulo':    'Artikkeli',
  'mode.lueckentext': 'Täytä aukot',

  'mode_desc.ordenar':     'Järjestät lauseet oikeaan järjestykseen.',
  'mode_desc.test':        'Valitset oikean käännöksen neljästä vaihtoehdosta.',
  'mode_desc.flashcards':  'Näet sanan ja päätät, osaatko sen.',
  'mode_desc.articulo':    'Valitset oikean artikkelin (der/die/das).',
  'mode_desc.lueckentext': 'Täytät aukkoja lauseissa neljällä vaihtoehdolla.',

  'hint.none':     'Ei suodatinta: harjoittelet kaikilla muodoilla.',
  'hint.multiple': 'Vuorotellen: {modes}.',

  'progress.title':         'Edistyminen {level}',
  'progress.tracking':      'Seuranta',
  'progress.pct':           '{pct}% valmis',
  'progress.words_done':    '{done} / {total} sanaa harjoiteltu',
  'progress.words_in_level':'{total} sanaa tasolla {level}',
  'progress.zero_pct':      '0% valmis',
  'progress.zero_words':    '0 / {total} sanaa harjoiteltu',

  'level.selected':          'Taso {level} valittu. Ladataan saatavilla olevaa sanastoa…',
  'level.unavailable':       'Taso {level} ei ole saatavilla tälle tekstille.',
  'level.no_version':        'Versiota {level} ei löytynyt tälle tekstille.',
  'level.vocab_count':       '{count} sanaa saatavilla tasolle {level}.',
  'level.no_vocab':          'Sanastoa ei ladattu tasolle {level}.',

  'exercise.translation':     'Käännös: {word}',
  'exercise.show_translation': 'Näytä käännös',
  'exercise.hide_translation': 'Piilota käännös',
  'exercise.show_context':     'Näytä käännös',
  'exercise.hide_context':     'Piilota käännös',
  'exercise.hint':             '💡 Vihje',
  'exercise.hide_hint':        'Piilota vihje',
  'exercise.dont_know':        'En tiedä',
  'exercise.correct':          '✓ Oikein!',
  'exercise.wrong':            '✗ Se oli: "{answer}"',
  'exercise.next_in':          'Seuraava',
  'exercise.order_words':      'Järjestä sanat:',
  'exercise.word_bank':        'Sanapankki — klikkaa lisätäksesi',
  'exercise.your_sentence':    'Sinun lauseesi',
  'exercise.finish_test':      'Lopeta testi',
  'exercise.back':             '← Takaisin',
  'exercise.next':             'Seuraava →',
  'exercise.example':          'Esimerkki',
  'exercise.badge_ordenar':    'Järjestä',
  'exercise.badge_articulo':   'Artikkeli',

  'flashcard.yes':   'Kyllä',
  'flashcard.no':    'En tiedä',

  'result.score_label':   'Lopputulos',
  'result.great':         'Erinomaista! 🎉',
  'result.good':          'Hyvin tehty! 👍',
  'result.keep_going':    'Jatka harjoittelua 💪',
  'result.correct':       'Oikein',
  'result.wrong':         'Virheet',
  'result.words':         'Sanat',
  'result.review_errors': 'Kertaa vain virheet ({n})',
  'result.retry':         'Yritä uudelleen',
  'result.back_menu':     'Takaisin päävalikkoon',
  'result.exit':          'Lopeta / poistu',

  'dashboard.title':       'Hallintapaneeli',
  'dashboard.subtitle':    'Edistymisesi',
  'dashboard.back':        '← Takaisin',
  'dashboard.empty':       'Sinulla ei ole vielä istuntoja. Aloita harjoittelu nähdäksesi edistymisesi täällä!',
  'dashboard.go_texts':    'Siirry teksteihin →',
  'dashboard.by_text':     'Edistyminen tekstin mukaan',
  'dashboard.reset_label': 'Nollaa edistyminen',

  'loading.preparing':  'Valmistellaan harjoituksiasi...',
  'loading.words': [
    { target: 'der Bahnhof',      native: 'rautatieasema' },
    { target: 'die Straßenbahn',  native: 'raitiovaunu' },
    { target: 'das Rathaus',      native: 'kaupungintalo' },
    { target: 'die Ampel',        native: 'liikennevalo' },
  ],

  'world.back_planetarium': 'Takaisin planetaarioon',
  'world.back_world':       'Takaisin Vokabel Worldiin',

  'seo.home_title':        'imKontext | Lue {lang} ja opi oikeaa sanastoa',
  'seo.home_desc':         'Lue aitoja tekstejä {lang} ja opi sanastoa kontekstissa. Harjoituksia tasoilla A2, B1, B2 ja C1 oikeiden artikkelien pohjalta.',
  'seo.textos_title':      'imKontext | Valitse teksti harjoitellaksesi kieltä {lang}',
  'seo.textos_desc':       'Tutki oikeita tekstejä {lang} ja valitse artikkeli, jota haluat lukea ja harjoitella tänään.',
  'seo.text_detail_desc':  'Lue ja harjoittele {lang}-sanastoa kontekstissa: „{title}". Taso {level} imKontext-palvelussa.',

  'cat.tecnologia':    'Teknologia',
  'cat.sociedad':      'Yhteiskunta',
  'cat.deporte':       'Urheilu',
  'cat.movilidad':     'Liikkuvuus',
  'cat.medioambiente': 'Ympäristö',
  'cat.salud':         'Terveys',
  'cat.educacion':     'Koulutus',
  'cat.trabajo':       'Työ',
  'cat.ciencia':       'Tiede',
  'cat.cultura':       'Kulttuuri',
  'cat.internacional': 'Kansainvälinen',
  'cat.politica':      'Politiikka',
  'cat.economia':      'Talous',

  'misc.close':  'Sulje',
  'misc.copy_link': 'Kopioi tämä linkki:',
};

DICT.it = {
  'landing.headline':        'Impara {lang} con notizie reali',
  'landing.deck':            'Pratica il vocabolario reale con testi di attualità.',
  'landing.deck2':           'Il metodo di <strong>Vokabel Lab imKontext</strong>.',
  'landing.kicker':          'Benvenuto!',
  'landing.cta':             'Inizia ora',
  'landing.activities':      'Flashcards · Test · Riempi · Riordina · Articolo',
  'landing.edition_label':   'Numero della settimana',
  'landing.choose_language': 'Scegli la lingua che vuoi imparare',

  'nav.methodology':   'Metodologia',
  'nav.contact':       'Contatto',
  'nav.legal':         'Note legali',
  'nav.dashboard':     'Dashboard',

  'lang_sel.ui_label':     'Lingua dell\'app',

  'textos.step':       'Passo 1 di 3',
  'textos.title':      'Scegli un testo',
  'textos.subtitle':   'Seleziona l\'articolo su cui vuoi esercitarti oggi. Se l\'argomento è troppo facile, cambia il livello prima di iniziare.',
  'textos.search':     'Cerca testo',
  'textos.search_placeholder': 'Cerca testo...',
  'textos.search_help':'Filtra per titolo mentre esplori i testi disponibili.',
  'textos.back':       '← Indietro',
  'textos.loading':    'Caricamento testi…',
  'textos.error':      'Impossibile caricare i testi. Controlla la connessione e riprova.',
  'textos.empty':      'Nessun testo trovato.',
  'textos.not_found':  'Il testo richiesto non è stato trovato.',
  'textos.level_label':'Livello preferito per la selezione del testo',

  'content.step':         'Passo 2 di 3 — Prima di iniziare',
  'content.default_title':'Testo',
  'content.read_first':   'Leggi prima il testo',
  'content.description':  'Questo testo viene caricato direttamente dal database. Leggilo con calma e torna quando sei pronto per gli esercizi.',
  'content.change_level': 'Troppo facile? Cambia il livello qui:',
  'content.start_exercises':'Inizia esercizi →',
  'content.share':        'Condividi ↗',
  'content.shared':       'Copiato! ✓',
  'content.reading_mode': 'Modalità lettura ⤢',
  'content.exit_reading': 'Esci dalla lettura ×',
  'content.finish_reading':'Termina',
  'content.back_texts':   '← Testi',
  'content.loading_version':'Caricamento della versione del testo per questo livello…',
  'content.empty_text':   'Questo testo non ha ancora contenuto base salvato.',
  'content.empty_hint':   'Puoi comunque continuare con gli esercizi se il vocabolario per questo livello è già caricato.',
  'content.freemium':     'Promozione attiva: questo contenuto premium è sbloccato gratuitamente per un tempo limitato.',
  'content.premium_msg':  'Questo testo è premium. Contattaci per ottenere l\'accesso.',
  'content.premium_cta':  'Contatta →',

  'vocab.meaning':     'Significato',
  'vocab.type':        'Tipo',
  'vocab.plural':      'Plurale',
  'vocab.infinitive':  'Infinito',
  'vocab.example':     'Esempio',

  'activity.step':          'Passo 3 di 3 — Configura la tua pratica',
  'activity.title':         'Configura la tua pratica',
  'activity.back':          '← Testo',
  'activity.level':         'Livello',
  'activity.level_desc':    'Gli esercizi si adatteranno al livello di difficoltà scelto.',
  'activity.type':          'Tipo di attività',
  'activity.type_desc':     'Scegli uno o lascia vuoto per esercitarti con tutti i formati.',
  'activity.start':         'Inizia pratica 🚀',
  'activity.loading':       'Caricamento…',
  'activity.saved_progress':'Hai un progresso salvato:',
  'activity.words_pending': '{n} parole in sospeso',
  'activity.continue':      'Continuare?',
  'activity.reset':         'Resetta progresso',

  'mode.ordenar':     'Riordina frasi',
  'mode.test':        'Test',
  'mode.flashcards':  'Flashcards',
  'mode.articulo':    'Articolo',
  'mode.lueckentext': 'Riempi gli spazi',

  'mode_desc.ordenar':     'Metterai le frasi nell\'ordine corretto.',
  'mode_desc.test':        'Sceglierai la traduzione corretta tra 4 opzioni.',
  'mode_desc.flashcards':  'Vedrai la parola e deciderai se la conosci.',
  'mode_desc.articulo':    'Sceglierai l\'articolo corretto (der/die/das).',
  'mode_desc.lueckentext': 'Riempirai gli spazi nelle frasi con 4 opzioni.',

  'hint.none':     'Nessun filtro: ti eserciterai con tutti i formati.',
  'hint.multiple': 'Alternando: {modes}.',

  'progress.title':         'Progresso {level}',
  'progress.tracking':      'Monitoraggio',
  'progress.pct':           '{pct}% completato',
  'progress.words_done':    '{done} / {total} parole esercitate',
  'progress.words_in_level':'{total} parole al livello {level}',
  'progress.zero_pct':      '0% completato',
  'progress.zero_words':    '0 / {total} parole esercitate',

  'level.selected':          'Livello {level} selezionato. Caricamento vocabolario disponibile…',
  'level.unavailable':       'Il livello {level} non è disponibile per questo testo.',
  'level.no_version':        'Nessuna versione {level} trovata per questo testo.',
  'level.vocab_count':       '{count} parole disponibili per il livello {level}.',
  'level.no_vocab':          'Nessun vocabolario caricato per il livello {level}.',

  'exercise.translation':     'Traduzione: {word}',
  'exercise.show_translation': 'Mostra traduzione',
  'exercise.hide_translation': 'Nascondi traduzione',
  'exercise.show_context':     'Mostra traduzione',
  'exercise.hide_context':     'Nascondi traduzione',
  'exercise.hint':             '💡 Suggerimento',
  'exercise.hide_hint':        'Nascondi suggerimento',
  'exercise.dont_know':        'Non lo so',
  'exercise.correct':          '✓ Corretto!',
  'exercise.wrong':            '✗ Era: "{answer}"',
  'exercise.next_in':          'Prossimo tra',
  'exercise.order_words':      'Ordina le parole:',
  'exercise.word_bank':        'Banca parole — clicca per aggiungere',
  'exercise.your_sentence':    'La tua frase',
  'exercise.finish_test':      'Termina test',
  'exercise.back':             '← Indietro',
  'exercise.next':             'Avanti →',
  'exercise.example':          'Esempio',
  'exercise.badge_ordenar':    'Riordina',
  'exercise.badge_articulo':   'Articolo',

  'flashcard.yes':   'Sì',
  'flashcard.no':    'Non lo so',

  'result.score_label':   'Punteggio finale',
  'result.great':         'Eccellente! 🎉',
  'result.good':          'Ben fatto! 👍',
  'result.keep_going':    'Continua a esercitarti 💪',
  'result.correct':       'Corrette',
  'result.wrong':         'Errori',
  'result.words':         'Parole',
  'result.review_errors': 'Rivedi solo errori ({n})',
  'result.retry':         'Riprova',
  'result.back_menu':     'Torna al menu principale',
  'result.exit':          'Termina / esci',

  'dashboard.title':       'Dashboard',
  'dashboard.subtitle':    'Il tuo progresso',
  'dashboard.back':        '← Indietro',
  'dashboard.empty':       'Non hai ancora sessioni registrate. Inizia a esercitarti per vedere il tuo progresso qui!',
  'dashboard.go_texts':    'Vai ai testi →',
  'dashboard.by_text':     'Progresso per testo',
  'dashboard.reset_label': 'Resetta progresso',

  'loading.preparing':  'Preparazione dei tuoi esercizi...',
  'loading.words': [
    { target: 'der Bahnhof',      native: 'la stazione ferroviaria' },
    { target: 'die Straßenbahn',  native: 'il tram' },
    { target: 'das Rathaus',      native: 'il municipio' },
    { target: 'die Ampel',        native: 'il semaforo' },
  ],

  'world.back_planetarium': 'Torna al planetario',
  'world.back_world':       'Torna a Vokabel World',

  'seo.home_title':        'imKontext | Leggi in {lang} e impara vocabolario reale',
  'seo.home_desc':         'Leggi testi autentici in {lang} e impara vocabolario nel contesto. Esercizi per livelli A2, B1, B2 e C1 basati su articoli reali.',
  'seo.textos_title':      'imKontext | Scegli un testo per praticare {lang}',
  'seo.textos_desc':       'Esplora testi reali in {lang} e scegli l\'articolo che vuoi leggere e praticare oggi.',
  'seo.text_detail_desc':  'Leggi e pratica vocabolario di {lang} nel contesto con "{title}". Livello {level} su imKontext.',

  'cat.tecnologia':    'Tecnologia',
  'cat.sociedad':      'Società',
  'cat.deporte':       'Sport',
  'cat.movilidad':     'Mobilità',
  'cat.medioambiente': 'Ambiente',
  'cat.salud':         'Salute',
  'cat.educacion':     'Istruzione',
  'cat.trabajo':       'Lavoro',
  'cat.ciencia':       'Scienza',
  'cat.cultura':       'Cultura',
  'cat.internacional': 'Internazionale',
  'cat.politica':      'Politica',
  'cat.economia':      'Economia',

  'misc.close':  'Chiudi',
  'misc.copy_link': 'Copia questo link:',
};

DICT.pt = {
  'landing.headline':        'Aprenda {lang} com notícias reais',
  'landing.deck':            'Pratique vocabulário real com textos atuais.',
  'landing.deck2':           'O método do <strong>Vokabel Lab imKontext</strong>.',
  'landing.kicker':          'Bem-vindo!',
  'landing.cta':             'Comece agora',
  'landing.activities':      'Flashcards · Teste · Preencher · Ordenar · Artigo',
  'landing.edition_label':   'Número da semana',
  'landing.choose_language': 'Escolha o idioma que quer aprender',

  'nav.methodology':   'Metodologia',
  'nav.contact':       'Contato',
  'nav.legal':         'Legal',
  'nav.dashboard':     'Dashboard',

  'lang_sel.ui_label':     'Idioma do app',

  'textos.step':       'Passo 1 de 3',
  'textos.title':      'Escolha um texto',
  'textos.subtitle':   'Selecione o artigo com o qual deseja praticar hoje. Se o tema for fácil demais, mude o nível antes de começar.',
  'textos.search':     'Buscar texto',
  'textos.search_placeholder': 'Buscar texto...',
  'textos.search_help':'Filtre por título enquanto navega pelos textos disponíveis.',
  'textos.back':       '← Voltar',
  'textos.loading':    'Carregando textos…',
  'textos.error':      'Não foi possível carregar os textos. Verifique sua conexão e tente novamente.',
  'textos.empty':      'Nenhum texto encontrado.',
  'textos.not_found':  'O texto solicitado não foi encontrado.',
  'textos.level_label':'Nível preferido para a seleção de texto',

  'content.step':         'Passo 2 de 3 — Antes de começar',
  'content.default_title':'Texto',
  'content.read_first':   'Leia o texto primeiro',
  'content.description':  'Este texto é carregado diretamente do banco de dados. Leia com calma e volte quando estiver pronto para os exercícios.',
  'content.change_level': 'Muito fácil? Mude o nível aqui:',
  'content.start_exercises':'Começar exercícios →',
  'content.share':        'Compartilhar ↗',
  'content.shared':       'Copiado! ✓',
  'content.reading_mode': 'Modo leitura ⤢',
  'content.exit_reading': 'Sair da leitura ×',
  'content.finish_reading':'Terminar',
  'content.back_texts':   '← Textos',
  'content.loading_version':'Carregando a versão do texto para este nível…',
  'content.empty_text':   'Este texto ainda não tem conteúdo base salvo.',
  'content.empty_hint':   'Você pode continuar para os exercícios se o vocabulário deste nível já estiver carregado.',
  'content.freemium':     'Promoção ativa: este conteúdo premium está desbloqueado gratuitamente por tempo limitado.',
  'content.premium_msg':  'Este texto é premium. Entre em contato para obter acesso.',
  'content.premium_cta':  'Contato →',

  'vocab.meaning':     'Significado',
  'vocab.type':        'Tipo',
  'vocab.plural':      'Plural',
  'vocab.infinitive':  'Infinitivo',
  'vocab.example':     'Exemplo',

  'activity.step':          'Passo 3 de 3 — Configure sua prática',
  'activity.title':         'Configure sua prática',
  'activity.back':          '← Texto',
  'activity.level':         'Nível',
  'activity.level_desc':    'Os exercícios se adaptarão ao nível de dificuldade escolhido.',
  'activity.type':          'Tipo de atividade',
  'activity.type_desc':     'Escolha um ou deixe em branco para praticar com todos os formatos.',
  'activity.start':         'Começar prática 🚀',
  'activity.loading':       'Carregando…',
  'activity.saved_progress':'Você tem progresso salvo:',
  'activity.words_pending': '{n} palavras pendentes',
  'activity.continue':      'Continuar?',
  'activity.reset':         'Resetar progresso',

  'mode.ordenar':     'Ordenar frases',
  'mode.test':        'Teste',
  'mode.flashcards':  'Flashcards',
  'mode.articulo':    'Artigo',
  'mode.lueckentext': 'Preencher lacunas',

  'mode_desc.ordenar':     'Você ordenará frases na ordem correta.',
  'mode_desc.test':        'Você escolherá a tradução correta entre 4 opções.',
  'mode_desc.flashcards':  'Você verá a palavra e decidirá se a conhece.',
  'mode_desc.articulo':    'Você escolherá o artigo correto (der/die/das).',
  'mode_desc.lueckentext': 'Você preencherá lacunas em frases com 4 opções.',

  'hint.none':     'Sem filtro: você praticará com todos os formatos.',
  'hint.multiple': 'Alternando: {modes}.',

  'progress.title':         'Progresso {level}',
  'progress.tracking':      'Acompanhamento',
  'progress.pct':           '{pct}% concluído',
  'progress.words_done':    '{done} / {total} palavras praticadas',
  'progress.words_in_level':'{total} palavras no nível {level}',
  'progress.zero_pct':      '0% concluído',
  'progress.zero_words':    '0 / {total} palavras praticadas',

  'level.selected':          'Nível {level} selecionado. Carregando vocabulário disponível…',
  'level.unavailable':       'O nível {level} não está disponível para este texto.',
  'level.no_version':        'Nenhuma versão {level} encontrada para este texto.',
  'level.vocab_count':       '{count} palavras disponíveis para o nível {level}.',
  'level.no_vocab':          'Nenhum vocabulário carregado para o nível {level}.',

  'exercise.translation':     'Tradução: {word}',
  'exercise.show_translation': 'Ver tradução',
  'exercise.hide_translation': 'Ocultar tradução',
  'exercise.show_context':     'Mostrar tradução',
  'exercise.hide_context':     'Ocultar tradução',
  'exercise.hint':             '💡 Dica',
  'exercise.hide_hint':        'Ocultar dica',
  'exercise.dont_know':        'Não sei',
  'exercise.correct':          '✓ Correto!',
  'exercise.wrong':            '✗ Era: "{answer}"',
  'exercise.next_in':          'Próximo em',
  'exercise.order_words':      'Ordene as palavras:',
  'exercise.word_bank':        'Banco de palavras — clique para adicionar',
  'exercise.your_sentence':    'Sua frase',
  'exercise.finish_test':      'Terminar teste',
  'exercise.back':             '← Voltar',
  'exercise.next':             'Próximo →',
  'exercise.example':          'Exemplo',
  'exercise.badge_ordenar':    'Ordenar',
  'exercise.badge_articulo':   'Artigo',

  'flashcard.yes':   'Sim',
  'flashcard.no':    'Não sei',

  'result.score_label':   'Pontuação final',
  'result.great':         'Excelente! 🎉',
  'result.good':          'Muito bem! 👍',
  'result.keep_going':    'Continue praticando 💪',
  'result.correct':       'Corretas',
  'result.wrong':         'Erros',
  'result.words':         'Palavras',
  'result.review_errors': 'Revisar apenas erros ({n})',
  'result.retry':         'Tentar novamente',
  'result.back_menu':     'Voltar ao menu principal',
  'result.exit':          'Finalizar / sair',

  'dashboard.title':       'Dashboard',
  'dashboard.subtitle':    'Seu progresso',
  'dashboard.back':        '← Voltar',
  'dashboard.empty':       'Você ainda não tem sessões registradas. Comece a praticar para ver seu progresso aqui!',
  'dashboard.go_texts':    'Ir para os textos →',
  'dashboard.by_text':     'Progresso por texto',
  'dashboard.reset_label': 'Resetar progresso',

  'loading.preparing':  'Preparando seus exercícios...',
  'loading.words': [
    { target: 'der Bahnhof',      native: 'a estação de trem' },
    { target: 'die Straßenbahn',  native: 'o bonde' },
    { target: 'das Rathaus',      native: 'a prefeitura' },
    { target: 'die Ampel',        native: 'o semáforo' },
  ],

  'world.back_planetarium': 'Voltar ao planetário',
  'world.back_world':       'Voltar ao Vokabel World',

  'seo.home_title':        'imKontext | Leia em {lang} e aprenda vocabulário real',
  'seo.home_desc':         'Leia textos autênticos em {lang} e aprenda vocabulário no contexto. Exercícios por níveis A2, B1, B2 e C1 baseados em artigos reais.',
  'seo.textos_title':      'imKontext | Escolha um texto para praticar {lang}',
  'seo.textos_desc':       'Explore textos reais em {lang} e escolha o artigo que deseja ler e praticar hoje.',
  'seo.text_detail_desc':  'Leia e pratique vocabulário de {lang} no contexto com "{title}". Nível {level} no imKontext.',

  'cat.tecnologia':    'Tecnologia',
  'cat.sociedad':      'Sociedade',
  'cat.deporte':       'Esporte',
  'cat.movilidad':     'Mobilidade',
  'cat.medioambiente': 'Meio ambiente',
  'cat.salud':         'Saúde',
  'cat.educacion':     'Educação',
  'cat.trabajo':       'Trabalho',
  'cat.ciencia':       'Ciência',
  'cat.cultura':       'Cultura',
  'cat.internacional': 'Internacional',
  'cat.politica':      'Política',
  'cat.economia':      'Economia',

  'misc.close':  'Fechar',
  'misc.copy_link': 'Copie este link:',
};

/* ── API ────────────────────────────────────────────────────── */

function getUILang() { return _uiLang; }
function getTargetLang() { return _targetLang; }
function hasExplicitNativeLanguage() { return _nativeLang !== null; }
function getNativeLang() {
  if (_nativeLang && _nativeLang !== _targetLang) return _nativeLang;
  if (_targetLang !== 'de') return _targetLang === 'es' ? 'de' : 'es';
  if (_uiLang !== _targetLang) return _uiLang;
  return _targetLang === 'es' ? 'de' : 'es';
}
function setNativeLang(lang) {
  if (!SUPPORTED_UI_LANGS.includes(lang) || lang === _targetLang) return false;
  _nativeLang = lang;
  try { localStorage.setItem(I18N_NATIVE_KEY, lang); } catch {}
  return true;
}

function setUILang(lang) {
  if (!SUPPORTED_UI_LANGS.includes(lang)) return;
  _uiLang = lang;
  try { localStorage.setItem(I18N_STORAGE_KEY, lang); } catch {}
}

function setTargetLang(lang) {
  if (!SUPPORTED_TARGET_LANGS.includes(lang)) return;
  _targetLang = lang;
  try { localStorage.setItem(I18N_TARGET_KEY, lang); } catch {}
}

function getTargetLangName(inLang) {
  const entry = LANG_NAMES[_targetLang];
  if (!entry) return _targetLang;
  return entry[inLang || _uiLang] || entry.native;
}

function t(key, params) {
  const dict = DICT[_uiLang] || DICT.es;
  let str = dict[key];
  if (str === undefined) str = DICT.es[key];
  if (str === undefined) return key;
  if (typeof str !== 'string') return str;

  if (params) {
    Object.keys(params).forEach(k => {
      str = str.replace(new RegExp(`\\{${k}\\}`, 'g'), params[k]);
    });
  }

  if (str.includes('{lang}')) {
    str = str.replace(/\{lang\}/g, getTargetLangName());
  }

  return str;
}

/* ── DYNAMIC FIELD ACCESSORS ─────────────────────────────────
   Map language codes to the Supabase column names that hold vocab data.
   Currently the DB has `german`/`spanish` + `example_sentence_de`/`example_sentence_es`.
   As more languages are added, extend these maps.
──────────────────────────────────────────────────────────────── */
const LANG_COL = { de: 'german', es: 'spanish', en: 'english', fi: 'finnish', it: 'italian', pt: 'portuguese' };
const LANG_EX_COL = { de: 'example_sentence_de', es: 'example_sentence_es', en: 'example_sentence_en', fi: 'example_sentence_fi', it: 'example_sentence_it', pt: 'example_sentence_pt' };

function getWordCol(lang)    { return LANG_COL[lang || _targetLang] || LANG_COL.de; }
function getExampleCol(lang) { return LANG_EX_COL[lang || _targetLang] || LANG_EX_COL.de; }

function getTargetWord(word)    { return word.target_word ?? word[getWordCol(_targetLang)] ?? ''; }
function getNativeWord(word)    { return word.native_word ?? word[getWordCol(getNativeLang())] ?? ''; }
function getTargetExample(word) { return word.target_example ?? word[getExampleCol(_targetLang)] ?? ''; }
function getNativeExample(word) { return word.native_example ?? word[getExampleCol(getNativeLang())] ?? ''; }

function getTargetWordCol()    { return getWordCol(_targetLang); }
function getNativeWordCol()    { return getWordCol(getNativeLang()); }
function getTargetExampleCol() { return getExampleCol(_targetLang); }
function getNativeExampleCol() { return getExampleCol(getNativeLang()); }

const ARTICLE_PATTERNS = {
  de: /^(der|die|das|den|dem|des|ein|eine|einen|einem|einer)\s+/i,
  es: /^(el|la|los|las|un|una|unos|unas)\s+/i,
  it: /^(?:(il|lo|la|i|gli|le|un|uno|una)\s+|l['’])/i,
  pt: /^(o|a|os|as|um|uma|uns|umas)\s+/i,
};

function stripArticle(word, lang) {
  const re = ARTICLE_PATTERNS[lang || _targetLang];
  return re ? word.replace(re, '') : word;
}

function initI18n() {
  try {
    const savedUI = localStorage.getItem(I18N_STORAGE_KEY);
    if (savedUI && SUPPORTED_UI_LANGS.includes(savedUI)) _uiLang = savedUI;
    const savedTarget = localStorage.getItem(I18N_TARGET_KEY);
    if (savedTarget && SUPPORTED_TARGET_LANGS.includes(savedTarget)) _targetLang = savedTarget;
    const savedNative = localStorage.getItem(I18N_NATIVE_KEY);
    if (savedNative && SUPPORTED_UI_LANGS.includes(savedNative)) _nativeLang = savedNative;
  } catch {}
}

function applyI18nToDOM() {
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.getAttribute('data-i18n');
    const val = t(key);
    if (typeof val === 'string') el.innerHTML = val;
  });
  document.querySelectorAll('[data-i18n-placeholder]').forEach(el => {
    el.placeholder = t(el.getAttribute('data-i18n-placeholder'));
  });
  document.querySelectorAll('[data-i18n-aria]').forEach(el => {
    el.setAttribute('aria-label', t(el.getAttribute('data-i18n-aria')));
  });
  document.documentElement.lang = _uiLang;
}

function getDateLocale() {
  const map = { es: 'es-ES', en: 'en-GB', de: 'de-DE', fi: 'fi-FI', it: 'it-IT', pt: 'pt-BR' };
  return map[_uiLang] || 'es-ES';
}

const LEARNING_LABELS = {
 es:['Idioma que aprendes','Traducciones de vocabulario','Contenido en preparación'],
 en:['Learning language','Vocabulary translations','Content in preparation'],
 de:['Lernsprache','Wortschatzübersetzungen','Inhalte in Vorbereitung'],
 fi:['Opiskeltava kieli','Sanaston käännökset','Sisältöä valmistellaan'],
 it:['Lingua da imparare','Traduzioni del vocabolario','Contenuti in preparazione'],
 pt:['Idioma de aprendizagem','Traduções do vocabulário','Conteúdo em preparação'],
};
Object.entries(LEARNING_LABELS).forEach(([lang,labels])=>Object.assign(DICT[lang],{'learning.target':labels[0],'learning.native':labels[1],'learning.pending':labels[2]}));
Object.entries({es:'No hay ejemplos compatibles con los ejercicios seleccionados. Elige otro modo.',en:'No examples support the selected exercises. Choose another mode.',de:'Keine Beispiele passen zu den gewählten Übungen. Wähle einen anderen Modus.',fi:'Valittuihin harjoituksiin ei ole sopivia esimerkkejä. Valitse toinen harjoitustapa.',it:'Non ci sono esempi adatti agli esercizi selezionati. Scegli un’altra modalità.',pt:'Não há exemplos compatíveis com os exercícios selecionados. Escolha outro modo.'}).forEach(([lang,value])=>DICT[lang]['activity.no_matching_exercises']=value);
initI18n();
