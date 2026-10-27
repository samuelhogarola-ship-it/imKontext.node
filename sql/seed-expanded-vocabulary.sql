-- imKontext: expanded vocabulary for 10 multilingual texts
-- Generated 2026-10-27
-- Adds ~25 more words per text with examples and translations

BEGIN;

-- ════════════════════════════════════════════════════════════════
-- TEXT 43: expanded vocabulary (25 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- das Programm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Programm', 'programm', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el programa', 'el programa', 'Dieses Programm hilft dir beim Sprachenlernen.', 'Este programa te ayuda a aprender idiomas.', 'program', 'ohjelma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'program')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ohjelma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il programma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o programa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el programa", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Intelligenz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Intelligenz', 'intelligenz', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la inteligencia', 'la inteligencia', 'Künstliche Intelligenz verändert unseren Alltag.', 'La inteligencia artificial cambia nuestra vida cotidiana.', 'intelligence', 'älykkyys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'intelligence')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'älykkyys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''intelligenza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a inteligência')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la inteligencia", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Arzt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Arzt', 'arzt', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el médico', 'el médico', 'Mein Arzt hat mir ein neues Medikament verschrieben.', 'Mi médico me recetó un nuevo medicamento.', 'doctor', 'lääkäri')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'doctor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lääkäri')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il medico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o médico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el médico", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Bild
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Bild', 'bild', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la imagen', 'la imagen', 'An der Wand hängt ein schönes Bild.', 'En la pared hay un cuadro bonito.', 'image', 'kuva')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'image')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuva')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''immagine')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a imagem')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la imagen", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Patient
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Patient', 'patient', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el paciente', 'el paciente', 'Der Patient wartet seit einer Stunde im Wartezimmer.', 'El paciente lleva una hora esperando en la sala de espera.', 'patient', 'potilas')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'patient')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'potilas')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il paziente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o paciente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el paciente", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- analysieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('analysieren', 'analysieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'analizar', 'analizar', 'Wir müssen die Ergebnisse genau analysieren.', 'Tenemos que analizar los resultados con detalle.', 'to analyze', 'analysoida')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to analyze')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'analysoida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'analizzare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'analisar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "analizar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Krankheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Krankheit', 'krankheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la enfermedad', 'la enfermedad', 'Diese Krankheit ist in tropischen Ländern weit verbreitet.', 'Esta enfermedad está muy extendida en los países tropicales.', 'disease', 'sairaus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'disease')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sairaus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la malattia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a doença')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la enfermedad", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Technik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Technik', 'technik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la técnica', 'la técnica', 'Die moderne Technik erleichtert viele Aufgaben.', 'La tecnología moderna facilita muchas tareas.', 'technology', 'tekniikka')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'technology')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tekniikka')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la tecnica')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a técnica')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la técnica", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- nützlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nützlich', 'nützlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'útil', 'útil', 'Dieses Wörterbuch ist sehr nützlich für Anfänger.', 'Este diccionario es muy útil para principiantes.', 'useful', 'hyödyllinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'useful')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hyödyllinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'utile')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'útil')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "útil", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Fehler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fehler', 'fehler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el error', 'el error', 'Jeder macht mal einen Fehler, das ist normal.', 'Todo el mundo comete errores, es normal.', 'mistake', 'virhe')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'mistake')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'virhe')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''errore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o erro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el error", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- ersetzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('ersetzen', 'ersetzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'sustituir', 'sustituir', 'Roboter können manche Arbeitsplätze ersetzen.', 'Los robots pueden sustituir algunos puestos de trabajo.', 'to replace', 'korvata')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to replace')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'korvata')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'sostituire')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'substituir')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "sustituir", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Entscheidung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Entscheidung', 'entscheidung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la decisión', 'la decisión', 'Das war eine schwierige Entscheidung für die Familie.', 'Fue una decisión difícil para la familia.', 'decision', 'päätös')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'decision')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'päätös')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la decisione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a decisão')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la decisión", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- vertrauen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('vertrauen', 'vertrauen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'confiar', 'confiar', 'Ich vertraue meiner besten Freundin in allen Dingen.', 'Confío en mi mejor amiga en todo.', 'to trust', 'luottaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to trust')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'luottaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'fidarsi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'confiar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "confiar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- helfen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('helfen', 'helfen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'ayudar', 'ayudar', 'Kannst du mir bitte bei den Hausaufgaben helfen?', '¿Puedes ayudarme con los deberes, por favor?', 'to help', 'auttaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to help')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'auttaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'aiutare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ajudar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "ayudar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- nutzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nutzen', 'nutzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'utilizar', 'utilizar', 'Viele Schüler nutzen das Internet für ihre Recherchen.', 'Muchos alumnos usan internet para sus investigaciones.', 'to use', 'käyttää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to use')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'käyttää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'utilizzare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'utilizar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "utilizar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- finden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('finden', 'finden', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'encontrar', 'encontrar', 'Ich kann meinen Schlüssel nicht finden.', 'No encuentro mi llave.', 'to find', 'löytää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to find')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'löytää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'trovare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'encontrar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "encontrar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schnell
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schnell', 'schnell', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'rápido', 'rápido', 'Der Zug ist schneller als das Auto.', 'El tren es más rápido que el coche.', 'fast', 'nopea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'fast')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'nopea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'veloce')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'rápido')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "rápido", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Arbeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Arbeit', 'arbeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el trabajo', 'el trabajo', 'Nach der Arbeit gehe ich immer ins Fitnessstudio.', 'Después del trabajo siempre voy al gimnasio.', 'work', 'työ')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'work')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'työ')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il lavoro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o trabalho')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el trabajo", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- weniger
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('weniger', 'weniger', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'menos', 'menos', 'Im Winter trinke ich weniger Wasser als im Sommer.', 'En invierno bebo menos agua que en verano.', 'less', 'vähemmän')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'less')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vähemmän')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'meno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'menos')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "menos", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- treffen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('treffen', 'treffen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'tomar (una decisión)', 'tomar (una decisión)', 'Wir treffen uns morgen um drei Uhr im Café.', 'Nos vemos mañana a las tres en el café.', 'to make (a decision)', 'tehdä (päätös)')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to make (a decision)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tehdä (päätös)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'prendere (una decisione)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'tomar (uma decisão)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "tomar (una decisión)", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- neu
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('neu', 'neu', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'nuevo', 'nuevo', 'Hast du schon das neue Restaurant in der Stadt probiert?', '¿Ya has probado el nuevo restaurante de la ciudad?', 'new', 'uusi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'new')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'uusi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'nuovo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'novo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "nuevo", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- lesen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lesen', 'lesen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'leer', 'leer', 'Mein Sohn liest jeden Abend vor dem Schlafen ein Buch.', 'Mi hijo lee un libro cada noche antes de dormir.', 'to read', 'lukea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to read')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lukea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'leggere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ler')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "leer", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Mensch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Mensch', 'mensch', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la persona', 'la persona', 'Jeder Mensch hat das Recht auf sauberes Wasser.', 'Toda persona tiene derecho al agua limpia.', 'person', 'ihminen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'person')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ihminen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la persona')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a pessoa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la persona", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- künstlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('künstlich', 'künstlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'artificial', 'artificial', 'Der See im Park ist künstlich angelegt worden.', 'El lago del parque fue creado de forma artificial.', 'artificial', 'keinotekoinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'artificial')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'keinotekoinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'artificiale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'artificial')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "artificial", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Beispiel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Beispiel', 'beispiel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el ejemplo', 'el ejemplo', 'Kannst du mir ein Beispiel geben?', '¿Puedes darme un ejemplo?', 'example', 'esimerkki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'example')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'esimerkki')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''esempio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o exemplo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el ejemplo", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 44: expanded vocabulary (24 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- der Sommer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Sommer', 'sommer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el verano', 'el verano', 'Letzten Sommer sind wir nach Griechenland geflogen.', 'El verano pasado volamos a Grecia.', 'summer', 'kesä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'summer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kesä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''estate')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o verão')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el verano", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- heiß
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('heiß', 'heiß', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'caliente', 'caliente', 'Vorsicht, der Kaffee ist noch sehr heiß!', '¡Cuidado, el café todavía está muy caliente!', 'hot', 'kuuma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'hot')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuuma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'caldo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'quente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "caliente", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Temperatur
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Temperatur', 'temperatur', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la temperatura', 'la temperatura', 'Die Temperatur im Klassenzimmer beträgt 22 Grad.', 'La temperatura en el aula es de 22 grados.', 'temperature', 'lämpötila')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'temperature')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lämpötila')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la temperatura')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a temperatura')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la temperatura", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- sterben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sterben', 'sterben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'morir', 'morir', 'Ohne Wasser können Pflanzen schnell sterben.', 'Sin agua, las plantas pueden morir rápidamente.', 'to die', 'kuolla')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to die')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuolla')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'morire')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'morrer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "morir", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Experte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Experte', 'experte', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el experto', 'el experto', 'Der Experte erklärt die Gefahren des Rauchens.', 'El experto explica los peligros del tabaco.', 'expert', 'asiantuntija')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'expert')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'asiantuntija')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''esperto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o especialista')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el experto", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Gefahr
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Gefahr', 'gefahr', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el peligro', 'el peligro', 'Im Straßenverkehr gibt es viele Gefahren.', 'En el tráfico hay muchos peligros.', 'danger', 'vaara')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'danger')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vaara')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il pericolo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o perigo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el peligro", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- besonders
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besonders', 'besonders', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'especialmente', 'especialmente', 'Dieses Gericht ist besonders lecker mit frischen Kräutern.', 'Este plato está especialmente rico con hierbas frescas.', 'especially', 'erityisesti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'especially')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'erityisesti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'particolarmente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'especialmente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "especialmente", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schlimm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schlimm', 'schlimm', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'grave', 'grave', 'Die Überschwemmung war die schlimmste seit Jahrzehnten.', 'La inundación fue la peor en décadas.', 'bad', 'paha')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'bad')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'paha')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'grave')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'grave')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "grave", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- extrem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('extrem', 'extrem', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'extremo', 'extremo', 'In der Wüste herrschen extreme Temperaturen.', 'En el desierto hay temperaturas extremas.', 'extreme', 'äärimmäinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'extreme')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'äärimmäinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'estremo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'extremo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "extremo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Hitze
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Hitze', 'hitze', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el calor', 'el calor', 'Bei dieser Hitze sollte man viel Wasser trinken.', 'Con este calor hay que beber mucha agua.', 'heat', 'helle')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'heat')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'helle')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il calore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o calor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el calor", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regierung', 'regierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die Regierung hat ein neues Gesetz verabschiedet.', 'El gobierno ha aprobado una nueva ley.', 'government', 'hallitus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'government')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hallitus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il governo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o governo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el gobierno", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Plan
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Plan', 'plan', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el plan', 'el plan', 'Wir brauchen einen guten Plan für das Projekt.', 'Necesitamos un buen plan para el proyecto.', 'plan', 'suunnitelma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'plan')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'suunnitelma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il piano')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o plano')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el plan", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schuld
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schuld', 'schuld', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'culpable', 'culpable', 'Wer ist schuld an dem Unfall?', '¿Quién tiene la culpa del accidente?', 'to blame', 'syyllinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to blame')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'syyllinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'colpevole')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'culpado')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "culpable", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Todesfall
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Todesfall', 'todesfall', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el fallecimiento', 'el fallecimiento', 'In der Familie gab es leider einen Todesfall.', 'Lamentablemente hubo un fallecimiento en la familia.', 'death', 'kuolemantapaus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'death')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuolemantapaus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il decesso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o falecimento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el fallecimiento", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- kühl
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kühl', 'kühl', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'fresco', 'fresco', 'Am Abend wird es draußen angenehm kühl.', 'Por la noche refresca agradablemente fuera.', 'cool', 'viileä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'cool')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'viileä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'fresco')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'fresco')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "fresco", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Raum
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Raum', 'raum', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la habitación', 'la habitación', 'In dem Raum stehen ein Tisch und vier Stühle.', 'En la habitación hay una mesa y cuatro sillas.', 'room', 'huone')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'room')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'huone')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la stanza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a sala')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la habitación", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Stadt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Stadt', 'stadt', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la ciudad', 'la ciudad', 'Berlin ist eine große und interessante Stadt.', 'Berlín es una ciudad grande e interesante.', 'city', 'kaupunki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'city')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kaupunki')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la città')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a cidade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la ciudad", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- brauchen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('brauchen', 'brauchen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'necesitar', 'necesitar', 'Für das Rezept brauchen wir drei Eier.', 'Para la receta necesitamos tres huevos.', 'to need', 'tarvita')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to need')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tarvita')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'aver bisogno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'precisar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "necesitar", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Drittel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Drittel', 'drittel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el tercio', 'el tercio', 'Ein Drittel der Bevölkerung lebt in Städten.', 'Un tercio de la población vive en ciudades.', 'third', 'kolmasosa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'third')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kolmasosa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il terzo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o terço')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el tercio", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- alt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('alt', 'alt', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'viejo', 'viejo', 'Mein Großvater ist 85 Jahre alt.', 'Mi abuelo tiene 85 años.', 'old', 'vanha')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'old')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vanha')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'vecchio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'velho')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "viejo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Jahr
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Jahr', 'jahr', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el año', 'el año', 'Nächstes Jahr will ich Japanisch lernen.', 'El año que viene quiero aprender japonés.', 'year', 'vuosi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'year')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vuosi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''anno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o ano')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el año", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Grad
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Grad', 'grad', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el grado', 'el grado', 'Heute sind es 25 Grad, perfekt für einen Ausflug.', 'Hoy hay 25 grados, perfecto para una excursión.', 'degree', 'aste')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'degree')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'aste')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il grado')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o grau')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el grado", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Tag
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Tag', 'tag', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el día', 'el día', 'Montag ist mein liebster Tag in der Woche.', 'El lunes es mi día favorito de la semana.', 'day', 'päivä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'day')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'päivä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il giorno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o dia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el día", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- besser
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besser', 'besser', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'mejor', 'mejor', 'Übung macht den Meister – du wirst immer besser.', 'La práctica hace al maestro, cada vez lo haces mejor.', 'better', 'parempi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'better')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'parempi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'migliore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'melhor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "mejor", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 45: expanded vocabulary (22 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- die Partei
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Partei', 'partei', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el partido', 'el partido', 'Die Partei hat einen neuen Vorsitzenden gewählt.', 'El partido ha elegido un nuevo presidente.', 'party (political)', 'puolue')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'party (political)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'puolue')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il partito')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o partido')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el partido", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- gewinnen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gewinnen', 'gewinnen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'ganar', 'ganar', 'Unsere Mannschaft hat das Spiel 3:1 gewonnen.', 'Nuestro equipo ganó el partido 3 a 1.', 'to win', 'voittaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to win')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'voittaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'vincere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ganhar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "ganar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Studentenbewegung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Studentenbewegung', 'studentenbewegung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el movimiento estudiantil', 'el movimiento estudiantil', 'Die Studentenbewegung der 1960er Jahre veränderte die Gesellschaft.', 'El movimiento estudiantil de los años 60 cambió la sociedad.', 'student movement', 'opiskelijaliike')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'student movement')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'opiskelijaliike')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il movimento studentesco')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o movimento estudantil')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el movimiento estudiantil", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- jung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('jung', 'jung', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'joven', 'joven', 'Die junge Frau arbeitet als Ingenieurin in München.', 'La joven trabaja como ingeniera en Múnich.', 'young', 'nuori')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'young')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'nuori')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'giovane')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'jovem')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "joven", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Präsident
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Präsident', 'präsident', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el presidente', 'el presidente', 'Der Präsident hielt eine wichtige Rede im Parlament.', 'El presidente pronunció un discurso importante en el parlamento.', 'president', 'presidentti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'president')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'presidentti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il presidente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o presidente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el presidente", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Macht
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Macht', 'macht', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el poder', 'el poder', 'Die Macht der Medien wird oft unterschätzt.', 'El poder de los medios a menudo se subestima.', 'power', 'valta')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'power')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'valta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il potere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o poder')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el poder", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- unzufrieden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('unzufrieden', 'unzufrieden', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'insatisfecho', 'insatisfecho', 'Viele Kunden waren unzufrieden mit dem Service.', 'Muchos clientes estaban insatisfechos con el servicio.', 'dissatisfied', 'tyytymätön')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'dissatisfied')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tyytymätön')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'insoddisfatto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'insatisfeito')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "insatisfecho", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- protestieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('protestieren', 'protestieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'protestar', 'protestar', 'Tausende Menschen protestierten gegen die neuen Gesetze.', 'Miles de personas protestaron contra las nuevas leyes.', 'to protest', 'protestoida')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to protest')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'protestoida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'protestare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'protestar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "protestar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Straße
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Straße', 'straße', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la calle', 'la calle', 'In unserer Straße gibt es viele alte Bäume.', 'En nuestra calle hay muchos árboles viejos.', 'street', 'katu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'street')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'katu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la strada')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a rua')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la calle", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Sieg
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Sieg', 'sieg', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la victoria', 'la victoria', 'Der Sieg war eine große Überraschung für alle.', 'La victoria fue una gran sorpresa para todos.', 'victory', 'voitto')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'victory')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'voitto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la vittoria')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a vitória')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la victoria", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- feiern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('feiern', 'feiern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'celebrar', 'celebrar', 'Wir feiern morgen den Geburtstag meiner Mutter.', 'Mañana celebramos el cumpleaños de mi madre.', 'to celebrate', 'juhlia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to celebrate')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'juhlia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'festeggiare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'celebrar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "celebrar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- zufrieden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zufrieden', 'zufrieden', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'satisfecho', 'satisfecho', 'Ich bin mit dem Ergebnis sehr zufrieden.', 'Estoy muy satisfecho con el resultado.', 'satisfied', 'tyytyväinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'satisfied')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tyytyväinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'soddisfatto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'satisfeito')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "satisfecho", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regierung', 'regierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die neue Regierung will die Steuern senken.', 'El nuevo gobierno quiere bajar los impuestos.', 'government', 'hallitus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'government')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hallitus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il governo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o governo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el gobierno", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- zusammenarbeiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zusammenarbeiten', 'zusammenarbeiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'colaborar', 'colaborar', 'Die beiden Firmen wollen in Zukunft enger zusammenarbeiten.', 'Las dos empresas quieren colaborar más estrechamente en el futuro.', 'to cooperate', 'tehdä yhteistyötä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to cooperate')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tehdä yhteistyötä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'collaborare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'colaborar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "colaborar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- historisch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('historisch', 'historisch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'histórico', 'histórico', 'Die Altstadt hat viele historische Gebäude.', 'El casco antiguo tiene muchos edificios históricos.', 'historic', 'historiallinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'historic')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'historiallinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'storico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'histórico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "histórico", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Moment
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Moment', 'moment', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el momento', 'el momento', 'Das war ein unvergesslicher Moment in meinem Leben.', 'Fue un momento inolvidable en mi vida.', 'moment', 'hetki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'moment')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hetki')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il momento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o momento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el momento", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Land
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Land', 'land', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el país', 'el país', 'Finnland ist ein Land mit vielen Seen.', 'Finlandia es un país con muchos lagos.', 'country', 'maa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'country')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'maa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il paese')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o país')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el país", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- wichtig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wichtig', 'wichtig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'importante', 'importante', 'Es ist wichtig, jeden Tag genug Wasser zu trinken.', 'Es importante beber suficiente agua cada día.', 'important', 'tärkeä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'important')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tärkeä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'importante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'importante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "importante", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Student
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Student', 'student', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el estudiante', 'el estudiante', 'Der Student bereitet sich auf die Prüfung vor.', 'El estudiante se prepara para el examen.', 'student', 'opiskelija')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'student')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'opiskelija')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'lo studente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o estudante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el estudiante", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- lange
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lange', 'lange', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'mucho tiempo', 'mucho tiempo', 'Ich habe lange auf den Bus gewartet.', 'Esperé mucho tiempo al autobús.', 'for a long time', 'pitkään')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'for a long time')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'pitkään')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'a lungo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'muito tempo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "mucho tiempo", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- wollen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wollen', 'wollen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'querer', 'querer', 'Die Kinder wollen heute ins Schwimmbad gehen.', 'Los niños quieren ir hoy a la piscina.', 'to want', 'haluta')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to want')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'haluta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'volere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'querer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "querer", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- eng
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('eng', 'eng', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'estrecho', 'estrecho', 'Die Gasse in der Altstadt ist sehr eng.', 'El callejón del casco viejo es muy estrecho.', 'close / narrow', 'tiivis')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'close / narrow')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tiivis')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'stretto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'estreito')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "estrecho", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 46: expanded vocabulary (23 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- die Firma
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Firma', 'firma', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la empresa', 'la empresa', 'Die Firma hat dieses Jahr 200 neue Mitarbeiter eingestellt.', 'La empresa ha contratado 200 empleados nuevos este año.', 'company', 'yritys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'company')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'yritys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''azienda')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a empresa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la empresa", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Börse
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Börse', 'börse', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la bolsa', 'la bolsa', 'Die Börse hat heute starke Verluste verzeichnet.', 'La bolsa ha registrado fuertes pérdidas hoy.', 'stock exchange', 'pörssi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'stock exchange')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'pörssi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la borsa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a bolsa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la bolsa", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Produkt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Produkt', 'produkt', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el producto', 'el producto', 'Das Produkt wird in über 30 Ländern verkauft.', 'El producto se vende en más de 30 países.', 'product', 'tuote')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'product')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tuote')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il prodotto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o produto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el producto", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- sprechen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sprechen', 'sprechen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'hablar', 'hablar', 'Sie spricht fünf Sprachen fließend.', 'Ella habla cinco idiomas con fluidez.', 'to speak', 'puhua')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to speak')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'puhua')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'parlare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'falar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "hablar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Geschichte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Geschichte', 'geschichte', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la historia', 'la historia', 'Die Geschichte Europas ist sehr komplex.', 'La historia de Europa es muy compleja.', 'history', 'historia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'history')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'historia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la storia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a história')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la historia", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Milliarde
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Milliarde', 'milliarde', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el mil millones', 'el mil millones', 'Auf der Erde leben fast acht Milliarden Menschen.', 'En la Tierra viven casi ocho mil millones de personas.', 'billion', 'miljardi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'billion')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'miljardi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il miliardo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o bilhão')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el mil millones", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- wert
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wert', 'wert', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'que vale', 'que vale', 'Das alte Gemälde ist mehrere Millionen Euro wert.', 'El cuadro antiguo vale varios millones de euros.', 'worth', 'arvoinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'worth')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'arvoinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'che vale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'que vale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "que vale", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- kaufen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kaufen', 'kaufen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'comprar', 'comprar', 'Ich möchte mir ein neues Fahrrad kaufen.', 'Quiero comprarme una bicicleta nueva.', 'to buy', 'ostaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to buy')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ostaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'comprare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'comprar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "comprar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Branche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Branche', 'branche', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el sector', 'el sector', 'Die Automobilbranche steckt im Wandel.', 'El sector automovilístico está en transformación.', 'industry', 'toimiala')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'industry')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'toimiala')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il settore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o setor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el sector", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- wachsen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wachsen', 'wachsen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'crecer', 'crecer', 'Die Wirtschaft ist im letzten Quartal stark gewachsen.', 'La economía creció con fuerza en el último trimestre.', 'to grow', 'kasvaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to grow')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kasvaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'crescere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'crescer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "crecer", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Kosten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Kosten', 'kosten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'los costes', 'los costes', 'Die Kosten für Energie sind in den letzten Monaten gestiegen.', 'Los costes de la energía han subido en los últimos meses.', 'costs', 'kustannukset')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'costs')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kustannukset')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'i costi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'os custos')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "los costes", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- hoch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('hoch', 'hoch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'alto', 'alto', 'Der Berg ist über 4.000 Meter hoch.', 'La montaña tiene más de 4.000 metros de altura.', 'high', 'korkea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'high')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'korkea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'alto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'alto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "alto", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- glauben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('glauben', 'glauben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'creer', 'creer', 'Ich glaube, morgen wird das Wetter besser.', 'Creo que mañana el tiempo será mejor.', 'to believe', 'uskoa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to believe')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'uskoa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'credere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'acreditar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "creer", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Zukunft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zukunft', 'zukunft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el futuro', 'el futuro', 'Niemand weiß, was die Zukunft bringt.', 'Nadie sabe qué deparará el futuro.', 'future', 'tulevaisuus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'future')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tulevaisuus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il futuro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o futuro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el futuro", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- stattfinden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('stattfinden', 'stattfinden', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'tener lugar', 'tener lugar', 'Das Konzert findet am Samstag im Park statt.', 'El concierto tiene lugar el sábado en el parque.', 'to take place', 'tapahtua')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to take place')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tapahtua')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'avere luogo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ter lugar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "tener lugar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- amerikanisch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('amerikanisch', 'amerikanisch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'estadounidense', 'estadounidense', 'Der amerikanische Film hat viele Preise gewonnen.', 'La película estadounidense ganó muchos premios.', 'American', 'amerikkalainen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'American')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'amerikkalainen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'americano')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'americano')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "estadounidense", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- bekannt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('bekannt', 'bekannt', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'conocido', 'conocido', 'München ist bekannt für sein Oktoberfest.', 'Múnich es conocido por su Oktoberfest.', 'well-known', 'tunnettu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'well-known')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tunnettu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'conosciuto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'conhecido')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "conocido", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- verdreifachen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verdreifachen', 'verdreifachen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'triplicar', 'triplicar', 'Die Zahl der Online-Bestellungen hat sich verdreifacht.', 'El número de pedidos en línea se ha triplicado.', 'to triple', 'kolminkertaistaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to triple')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kolminkertaistaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'triplicare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'triplicar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "triplicar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Entwicklung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Entwicklung', 'entwicklung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el desarrollo', 'el desarrollo', 'Die Entwicklung neuer Medikamente dauert viele Jahre.', 'El desarrollo de nuevos medicamentos lleva muchos años.', 'development', 'kehitys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'development')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kehitys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'lo sviluppo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o desenvolvimento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el desarrollo", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Anfang
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Anfang', 'anfang', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el principio', 'el principio', 'Am Anfang war der Kurs schwierig, aber jetzt verstehe ich alles.', 'Al principio el curso era difícil, pero ahora lo entiendo todo.', 'beginning', 'alku')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'beginning')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'alku')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''inizio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o início')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el principio", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- denken
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('denken', 'denken', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'pensar', 'pensar', 'Ich denke oft an meine Heimat.', 'Pienso a menudo en mi tierra.', 'to think', 'ajatella')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to think')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ajatella')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'pensare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'pensar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "pensar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- groß
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('groß', 'groß', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'grande', 'grande', 'Hamburg ist die zweitgrößte Stadt Deutschlands.', 'Hamburgo es la segunda ciudad más grande de Alemania.', 'big', 'suuri')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'big')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'suuri')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'grande')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'grande')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "grande", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Geld
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Geld', 'geld', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el dinero', 'el dinero', 'Für die Reise habe ich nicht genug Geld gespart.', 'No he ahorrado suficiente dinero para el viaje.', 'money', 'raha')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'money')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'raha')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il denaro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o dinheiro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el dinero", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 47: expanded vocabulary (23 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- der Bauer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Bauer', 'bauer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el agricultor', 'el agricultor', 'Der Bauer arbeitet jeden Tag auf dem Feld.', 'El agricultor trabaja cada día en el campo.', 'farmer', 'maanviljelijä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'farmer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'maanviljelijä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''agricoltore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o agricultor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el agricultor", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- krank
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('krank', 'krank', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'enfermo', 'enfermo', 'Meine Kollegin ist seit einer Woche krank.', 'Mi compañera lleva una semana enferma.', 'sick', 'sairas')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'sick')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sairas')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'malato')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'doente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "enfermo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Fieber
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Fieber', 'fieber', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la fiebre', 'la fiebre', 'Das Kind hat hohes Fieber und muss im Bett bleiben.', 'El niño tiene fiebre alta y debe quedarse en cama.', 'fever', 'kuume')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'fever')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuume')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la febbre')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a febre')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la fiebre", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Kopfschmerzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Kopfschmerzen', 'kopfschmerzen', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el dolor de cabeza', 'el dolor de cabeza', 'Ich habe starke Kopfschmerzen und nehme eine Tablette.', 'Tengo un fuerte dolor de cabeza y me tomo una pastilla.', 'headache', 'päänsärky')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'headache')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'päänsärky')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il mal di testa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a dor de cabeça')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el dolor de cabeza", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- untersuchen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('untersuchen', 'untersuchen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'examinar', 'examinar', 'Die Polizei untersucht den Vorfall seit gestern.', 'La policía investiga el incidente desde ayer.', 'to examine', 'tutkia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to examine')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tutkia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'esaminare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'examinar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "examinar", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Risiko
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Risiko', 'risiko', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el riesgo', 'el riesgo', 'Das Risiko einer Ansteckung ist hier sehr gering.', 'El riesgo de contagio aquí es muy bajo.', 'risk', 'riski')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'risk')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'riski')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il rischio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o risco')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el riesgo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Bevölkerung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Bevölkerung', 'bevölkerung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la población', 'la población', 'Die Bevölkerung der Stadt wächst seit zehn Jahren.', 'La población de la ciudad crece desde hace diez años.', 'population', 'väestö')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'population')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'väestö')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la popolazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a população')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la población", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- gering
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gering', 'gering', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'escaso', 'escaso', 'Die Chancen auf Schnee im Mai sind gering.', 'Las probabilidades de nieve en mayo son escasas.', 'low / slight', 'vähäinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'low / slight')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vähäinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'scarso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'baixo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "escaso", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- leicht
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('leicht', 'leicht', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'fácil', 'fácil', 'Die Aufgabe ist gar nicht so leicht, wie sie aussieht.', 'La tarea no es tan fácil como parece.', 'easy', 'helppo')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'easy')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'helppo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'facile')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'fácil')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "fácil", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- beobachten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('beobachten', 'beobachten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'observar', 'observar', 'Wir beobachten die Vögel vom Balkon aus.', 'Observamos los pájaros desde el balcón.', 'to observe', 'tarkkailla')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to observe')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tarkkailla')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'osservare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'observar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "observar", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Situation
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Situation', 'situation', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la situación', 'la situación', 'Die Situation auf dem Arbeitsmarkt hat sich verbessert.', 'La situación en el mercado laboral ha mejorado.', 'situation', 'tilanne')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'situation')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tilanne')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la situazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a situação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la situación", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- genau
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('genau', 'genau', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'exactamente', 'exactamente', 'Kannst du mir genau erklären, wie das funktioniert?', '¿Puedes explicarme exactamente cómo funciona?', 'exactly', 'tarkasti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'exactly')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tarkasti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'esattamente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'exatamente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "exactamente", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- sicher
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sicher', 'sicher', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'seguro', 'seguro', 'Bist du sicher, dass du den Schlüssel eingesteckt hast?', '¿Estás seguro de que has metido la llave?', 'sure / safe', 'varma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'sure / safe')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'varma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'sicuro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'seguro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "seguro", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- sich verbreiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich verbreiten', 'sich verbreiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'propagarse', 'propagarse', 'Die Nachricht hat sich schnell im Internet verbreitet.', 'La noticia se difundió rápidamente por internet.', 'to spread', 'levitä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to spread')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'levitä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'diffondersi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'espalhar-se')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "propagarse", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Tier
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tier', 'tier', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el animal', 'el animal', 'Im Zoo kann man viele exotische Tiere sehen.', 'En el zoo se pueden ver muchos animales exóticos.', 'animal', 'eläin')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'animal')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'eläin')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''animale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o animal')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el animal", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- normalerweise
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('normalerweise', 'normalerweise', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'normalmente', 'normalmente', 'Normalerweise stehe ich um sieben Uhr auf.', 'Normalmente me levanto a las siete.', 'normally', 'normaalisti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'normally')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'normaalisti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'normalmente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'normalmente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "normalmente", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Mann
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Mann', 'mann', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el hombre', 'el hombre', 'Der Mann im blauen Mantel ist mein Nachbar.', 'El hombre del abrigo azul es mi vecino.', 'man', 'mies')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'man')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'mies')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''uomo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o homem')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el hombre", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- vorkommen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('vorkommen', 'vorkommen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'ocurrir', 'ocurrir', 'Solche Fehler können überall vorkommen.', 'Estos errores pueden ocurrir en cualquier sitio.', 'to occur', 'esiintyä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to occur')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'esiintyä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'verificarsi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ocorrer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "ocurrir", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- weiter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('weiter', 'weiter', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'más allá', 'más allá', 'Geh einfach weiter geradeaus, dann findest du den Bahnhof.', 'Sigue recto y encontrarás la estación.', 'further', 'eteenpäin')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'further')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'eteenpäin')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'oltre')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'mais adiante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "más allá", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Fall
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fall', 'fall', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el caso', 'el caso', 'Die Polizei hat den Fall nach drei Monaten gelöst.', 'La policía resolvió el caso después de tres meses.', 'case', 'tapaus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'case')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tapaus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il caso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o caso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el caso", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- neu
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('neu', 'neu', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'nuevo', 'nuevo', 'Hast du die neue Folge der Serie schon gesehen?', '¿Ya has visto el nuevo episodio de la serie?', 'new', 'uusi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'new')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'uusi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'nuovo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'novo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "nuevo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- zum ersten Mal
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zum ersten Mal', 'zum ersten mal', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'por primera vez', 'por primera vez', 'Sie besucht zum ersten Mal ein anderes Land.', 'Visita otro país por primera vez.', 'for the first time', 'ensimmäistä kertaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'for the first time')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ensimmäistä kertaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'per la prima volta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'pela primeira vez')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "por primera vez", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- trotzdem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('trotzdem', 'trotzdem', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'sin embargo', 'sin embargo', 'Es regnet, aber wir gehen trotzdem spazieren.', 'Llueve, pero aun así salimos a pasear.', 'nevertheless', 'silti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'nevertheless')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'silti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'tuttavia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'mesmo assim')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "sin embargo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 48: expanded vocabulary (24 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- der Fehler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fehler', 'fehler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el error', 'el error', 'Der Lehrer hat einen Fehler in meiner Hausaufgabe gefunden.', 'El profesor encontró un error en mi tarea.', 'mistake', 'virhe')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'mistake')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'virhe')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''errore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o erro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el error", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- gefährlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gefährlich', 'gefährlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'peligroso', 'peligroso', 'Es ist gefährlich, nachts allein durch den Park zu gehen.', 'Es peligroso caminar solo por el parque de noche.', 'dangerous', 'vaarallinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'dangerous')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vaarallinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'pericoloso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'perigoso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "peligroso", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Hacker
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Hacker', 'hacker', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el hacker', 'el hacker', 'Der Hacker hat versucht, in das Netzwerk der Bank einzubrechen.', 'El hacker intentó entrar en la red del banco.', 'hacker', 'hakkeri')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'hacker')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hakkeri')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''hacker')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o hacker')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el hacker", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- stehlen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('stehlen', 'stehlen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'robar', 'robar', 'Jemand hat sein Fahrrad vor dem Supermarkt gestohlen.', 'Alguien robó su bicicleta delante del supermercado.', 'to steal', 'varastaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to steal')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'varastaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'rubare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'roubar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "robar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Daten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Daten', 'daten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'los datos', 'los datos', 'Die Firma speichert alle Daten in einer sicheren Cloud.', 'La empresa almacena todos los datos en una nube segura.', 'data', 'tiedot')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'data')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tiedot')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'i dati')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'os dados')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "los datos", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Suche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Suche', 'suche', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la búsqueda', 'la búsqueda', 'Die Suche nach einer neuen Wohnung dauert oft lange.', 'La búsqueda de un piso nuevo suele durar mucho.', 'search', 'etsintä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'search')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'etsintä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la ricerca')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a busca')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la búsqueda", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- finden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('finden', 'finden', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'encontrar', 'encontrar', 'Ich kann meine Schlüssel nicht finden.', 'No puedo encontrar mis llaves.', 'to find', 'löytää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to find')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'löytää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'trovare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'encontrar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "encontrar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Programmiersprache
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Programmiersprache', 'programmiersprache', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el lenguaje de programación', 'el lenguaje de programación', 'Python ist eine beliebte Programmiersprache für Anfänger.', 'Python es un lenguaje de programación popular para principiantes.', 'programming language', 'ohjelmointikieli')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'programming language')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ohjelmointikieli')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il linguaggio di programmazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a linguagem de programação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el lenguaje de programación", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Webseite
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Webseite', 'webseite', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la página web', 'la página web', 'Die Webseite der Universität hat alle wichtigen Informationen.', 'La página web de la universidad tiene toda la información importante.', 'website', 'verkkosivusto')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'website')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'verkkosivusto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il sito web')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o site')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la página web", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- benutzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('benutzen', 'benutzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'usar', 'usar', 'Meine Großmutter lernt, ein Smartphone zu benutzen.', 'Mi abuela está aprendiendo a usar un smartphone.', 'to use', 'käyttää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to use')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'käyttää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'usare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'usar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "usar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regierung', 'regierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die Regierung hat ein neues Gesetz zum Umweltschutz beschlossen.', 'El gobierno aprobó una nueva ley de protección medioambiental.', 'government', 'hallitus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'government')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hallitus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il governo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o governo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el gobierno", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Regel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regel', 'regel', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la regla', 'la regla', 'In der Schule gibt es viele Regeln, die man beachten muss.', 'En el colegio hay muchas reglas que hay que respetar.', 'rule', 'sääntö')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'rule')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sääntö')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la regola')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a regra')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la regla", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Sicherheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Sicherheit', 'sicherheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la seguridad', 'la seguridad', 'Die Sicherheit der Passagiere hat immer höchste Priorität.', 'La seguridad de los pasajeros siempre tiene la máxima prioridad.', 'security', 'turvallisuus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'security')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'turvallisuus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la sicurezza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a segurança')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la seguridad", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Software
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Software', 'software', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el software', 'el software', 'Die neue Software macht die Arbeit im Büro viel einfacher.', 'El nuevo software hace el trabajo en la oficina mucho más fácil.', 'software', 'ohjelmisto')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'software')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ohjelmisto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il software')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o software')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el software", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Experte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Experte', 'experte', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el experto', 'el experto', 'Der Experte hat den Schaden am Dach begutachtet.', 'El experto examinó los daños en el tejado.', 'expert', 'asiantuntija')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'expert')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'asiantuntija')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''esperto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o especialista')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el experto", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schnell
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schnell', 'schnell', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'rápido', 'rápido', 'Der Zug nach Berlin ist sehr schnell.', 'El tren a Berlín es muy rápido.', 'fast', 'nopea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'fast')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'nopea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'veloce')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'rápido')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "rápido", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Nutzer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Nutzer', 'nutzer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el usuario', 'el usuario', 'Die App hat schon über eine Million Nutzer weltweit.', 'La aplicación ya tiene más de un millón de usuarios en todo el mundo.', 'user', 'käyttäjä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'user')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'käyttäjä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''utente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o utilizador')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el usuario", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Internet
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Internet', 'internet', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el internet', 'el internet', 'Ohne Internet kann ich meine E-Mails nicht lesen.', 'Sin internet no puedo leer mis correos electrónicos.', 'internet', 'internet')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'internet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'internet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'internet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a internet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el internet", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- nutzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nutzen', 'nutzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'utilizar', 'utilizar', 'Viele Menschen nutzen öffentliche Verkehrsmittel für den Weg zur Arbeit.', 'Mucha gente utiliza el transporte público para ir al trabajo.', 'to use', 'hyödyntää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to use')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hyödyntää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'utilizzare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'utilizar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "utilizar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Problem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Problem', 'problem', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el problema', 'el problema', 'Wir haben ein Problem mit der Heizung in unserer Wohnung.', 'Tenemos un problema con la calefacción de nuestro piso.', 'problem', 'ongelma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'problem')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ongelma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il problema')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o problema')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el problema", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- ernst
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('ernst', 'ernst', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'grave', 'grave', 'Die Lage in der Region ist sehr ernst.', 'La situación en la región es muy grave.', 'serious', 'vakava')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'serious')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vakava')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'grave')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'grave')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "grave", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- helfen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('helfen', 'helfen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'ayudar', 'ayudar', 'Kannst du mir bitte beim Umzug helfen?', '¿Puedes ayudarme con la mudanza, por favor?', 'to help', 'auttaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to help')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'auttaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'aiutare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ajudar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "ayudar", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- künstlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('künstlich', 'künstlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'artificial', 'artificial', 'Die Blumen auf dem Tisch sehen echt aus, aber sie sind künstlich.', 'Las flores de la mesa parecen reales, pero son artificiales.', 'artificial', 'keinotekoinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'artificial')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'keinotekoinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'artificiale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'artificial')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "artificial", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Intelligenz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Intelligenz', 'intelligenz', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la inteligencia', 'la inteligencia', 'Emotionale Intelligenz ist im Berufsleben sehr wichtig.', 'La inteligencia emocional es muy importante en la vida profesional.', 'intelligence', 'älykkyys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'intelligence')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'älykkyys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''intelligenza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a inteligência')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la inteligencia", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 49: expanded vocabulary (23 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- die Firma
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Firma', 'firma', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la empresa', 'la empresa', 'Mein Vater arbeitet seit zwanzig Jahren in derselben Firma.', 'Mi padre lleva veinte años trabajando en la misma empresa.', 'company', 'yritys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'company')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'yritys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''azienda')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a empresa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la empresa", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Idee
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Idee', 'idee', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la idea', 'la idea', 'Das ist eine großartige Idee für unser nächstes Projekt!', '¡Es una idea genial para nuestro próximo proyecto!', 'idea', 'idea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'idea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'idea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''idea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a ideia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la idea", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Technologie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Technologie', 'technologie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la tecnología', 'la tecnología', 'Neue Technologien verändern die Art, wie wir kommunizieren.', 'Las nuevas tecnologías cambian la forma en que nos comunicamos.', 'technology', 'teknologia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'technology')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'teknologia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la tecnologia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a tecnologia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la tecnología", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die App
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die App', 'app', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la aplicación', 'la aplicación', 'Ich habe eine neue App zum Sprachenlernen heruntergeladen.', 'Me descargué una nueva aplicación para aprender idiomas.', 'app', 'sovellus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'app')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sovellus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''app')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o aplicativo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la aplicación", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- entstehen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('entstehen', 'entstehen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'surgir', 'surgir', 'In der Altstadt soll ein neuer Park entstehen.', 'En el casco antiguo se va a crear un nuevo parque.', 'to emerge', 'syntyä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to emerge')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'syntyä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'nascere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'surgir')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "surgir", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Geld
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Geld', 'geld', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el dinero', 'el dinero', 'Ich spare Geld für eine Reise nach Japan.', 'Ahorro dinero para un viaje a Japón.', 'money', 'raha')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'money')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'raha')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il denaro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o dinheiro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el dinero", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- bekommen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('bekommen', 'bekommen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'recibir', 'recibir', 'Zum Geburtstag habe ich ein neues Buch bekommen.', 'Por mi cumpleaños recibí un libro nuevo.', 'to receive', 'saada')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to receive')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'saada')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'ricevere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'receber')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "recibir", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Miete
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Miete', 'miete', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el alquiler', 'el alquiler', 'Die Miete für unsere Wohnung ist letztes Jahr gestiegen.', 'El alquiler de nuestro piso subió el año pasado.', 'rent', 'vuokra')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'rent')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vuokra')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''affitto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o aluguel')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el alquiler", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Büro
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Büro', 'büro', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la oficina', 'la oficina', 'In unserem Büro gibt es eine kleine Küche und einen Balkon.', 'En nuestra oficina hay una cocina pequeña y un balcón.', 'office', 'toimisto')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'office')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'toimisto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''ufficio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o escritório')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la oficina", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- teuer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('teuer', 'teuer', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'caro', 'caro', 'Das Restaurant war gut, aber ziemlich teuer.', 'El restaurante estaba bien, pero era bastante caro.', 'expensive', 'kallis')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'expensive')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kallis')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'costoso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'caro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "caro", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schwer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schwer', 'schwer', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'difícil', 'difícil', 'Die Prüfung war sehr schwer, aber ich habe bestanden.', 'El examen fue muy difícil, pero aprobé.', 'difficult', 'vaikea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'difficult')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vaikea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'difficile')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'difícil')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "difícil", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Mitarbeiter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Mitarbeiter', 'mitarbeiter', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el empleado', 'el empleado', 'Die Firma sucht neue Mitarbeiter für die Marketingabteilung.', 'La empresa busca nuevos empleados para el departamento de marketing.', 'employee', 'työntekijä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'employee')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'työntekijä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il dipendente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o funcionário')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el empleado", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- wachsen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wachsen', 'wachsen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'crecer', 'crecer', 'Die Stadt wächst jedes Jahr um tausend Einwohner.', 'La ciudad crece mil habitantes cada año.', 'to grow', 'kasvaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to grow')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kasvaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'crescere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'crescer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "crecer", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- arbeiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('arbeiten', 'arbeiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'trabajar', 'trabajar', 'Meine Schwester arbeitet als Ingenieurin bei Siemens.', 'Mi hermana trabaja como ingeniera en Siemens.', 'to work', 'työskennellä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to work')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'työskennellä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'lavorare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'trabalhar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "trabajar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- besonders
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besonders', 'besonders', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'especialmente', 'especialmente', 'Der Film war besonders spannend am Ende.', 'La película fue especialmente emocionante al final.', 'especially', 'erityisesti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'especially')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'erityisesti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'particolarmente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'especialmente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "especialmente", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- klein
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('klein', 'klein', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'pequeño', 'pequeño', 'Wir wohnen in einer kleinen Wohnung im Stadtzentrum.', 'Vivimos en un piso pequeño en el centro de la ciudad.', 'small', 'pieni')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'small')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'pieni')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'piccolo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'pequeno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "pequeño", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- neu
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('neu', 'neu', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'nuevo', 'nuevo', 'Hast du schon das neue Restaurant in der Altstadt ausprobiert?', '¿Ya probaste el restaurante nuevo del casco antiguo?', 'new', 'uusi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'new')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'uusi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'nuovo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'novo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "nuevo", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- geben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('geben', 'geben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'dar', 'dar', 'Können Sie mir bitte ein Glas Wasser geben?', '¿Puede darme un vaso de agua, por favor?', 'to give', 'antaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to give')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'antaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'dare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'dar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "dar", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Beispiel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Beispiel', 'beispiel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el ejemplo', 'el ejemplo', 'Können Sie mir bitte ein Beispiel geben?', '¿Puede darme un ejemplo, por favor?', 'example', 'esimerkki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'example')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'esimerkki')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''esempio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o exemplo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el ejemplo", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- gut
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gut', 'gut', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'bueno', 'bueno', 'Das Essen in der Kantine ist heute besonders gut.', 'La comida del comedor está especialmente buena hoy.', 'good', 'hyvä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'good')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hyvä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'buono')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'bom')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "bueno", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- trotzdem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('trotzdem', 'trotzdem', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'sin embargo', 'sin embargo', 'Es regnet, aber wir gehen trotzdem spazieren.', 'Llueve, pero aun así salimos a pasear.', 'nevertheless', 'silti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'nevertheless')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'silti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'tuttavia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'mesmo assim')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "sin embargo", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Szene
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Szene', 'szene', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la escena', 'la escena', 'Berlin hat eine lebendige Kulturszene mit vielen Theatern.', 'Berlín tiene una escena cultural vibrante con muchos teatros.', 'scene', 'skene')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'scene')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'skene')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la scena')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a cena')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la escena", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- immer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('immer', 'immer', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'siempre', 'siempre', 'Mein Großvater trinkt immer um drei Uhr Kaffee.', 'Mi abuelo siempre toma café a las tres.', 'always', 'aina')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'always')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'aina')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'sempre')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'sempre')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "siempre", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 50: expanded vocabulary (21 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- das Wetter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Wetter', 'wetter', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el tiempo', 'el tiempo', 'Das Wetter in Hamburg ist oft regnerisch und grau.', 'El tiempo en Hamburgo suele ser lluvioso y gris.', 'weather', 'sää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'weather')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il tempo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o tempo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el tiempo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Sturm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Sturm', 'sturm', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la tormenta', 'la tormenta', 'Der Sturm hat letzte Nacht viele Bäume umgeworfen.', 'La tormenta derribó muchos árboles anoche.', 'storm', 'myrsky')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'storm')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'myrsky')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la tempesta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a tempestade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la tormenta", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- zerstören
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zerstören', 'zerstören', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'destruir', 'destruir', 'Das Erdbeben hat viele Gebäude in der Stadt zerstört.', 'El terremoto destruyó muchos edificios de la ciudad.', 'to destroy', 'tuhota')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to destroy')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tuhota')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'distruggere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'destruir')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "destruir", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Haus
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Haus', 'haus', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la casa', 'la casa', 'Unsere Nachbarn haben ein schönes Haus mit Garten.', 'Nuestros vecinos tienen una casa bonita con jardín.', 'house', 'talo')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'house')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'talo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la casa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a casa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la casa", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Straße
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Straße', 'straße', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la calle', 'la calle', 'In unserer Straße gibt es viele kleine Geschäfte.', 'En nuestra calle hay muchas tiendas pequeñas.', 'street', 'katu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'street')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'katu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la strada')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a rua')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la calle", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- wichtig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wichtig', 'wichtig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'importante', 'importante', 'Es ist wichtig, jeden Tag genug Wasser zu trinken.', 'Es importante beber suficiente agua cada día.', 'important', 'tärkeä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'important')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tärkeä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'importante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'importante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "importante", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- vorhersagen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('vorhersagen', 'vorhersagen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'predecir', 'predecir', 'Niemand kann die Zukunft genau vorhersagen.', 'Nadie puede predecir el futuro con exactitud.', 'to predict', 'ennustaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to predict')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ennustaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'prevedere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'prever')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "predecir", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- analysieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('analysieren', 'analysieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'analizar', 'analizar', 'Die Wissenschaftler analysieren die Proben im Labor.', 'Los científicos analizan las muestras en el laboratorio.', 'to analyze', 'analysoida')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to analyze')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'analysoida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'analizzare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'analisar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "analizar", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Temperatur
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Temperatur', 'temperatur', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la temperatura', 'la temperatura', 'Im Winter sinkt die Temperatur oft unter null Grad.', 'En invierno la temperatura baja a menudo de cero grados.', 'temperature', 'lämpötila')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'temperature')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lämpötila')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la temperatura')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a temperatura')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la temperatura", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Wind
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Wind', 'wind', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el viento', 'el viento', 'An der Küste weht oft ein starker Wind.', 'En la costa suele soplar un viento fuerte.', 'wind', 'tuuli')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'wind')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tuuli')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il vento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o vento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el viento", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Wolke
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wolke', 'wolke', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la nube', 'la nube', 'Dunkle Wolken ziehen auf – es wird bald regnen.', 'Se acercan nubes oscuras, pronto lloverá.', 'cloud', 'pilvi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'cloud')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'pilvi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la nuvola')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a nuvem')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la nube", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Meteorologe
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Meteorologe', 'meteorologe', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el meteorólogo', 'el meteorólogo', 'Der Meteorologe erklärt im Fernsehen das Wetter für die Woche.', 'El meteorólogo explica en televisión el tiempo de la semana.', 'meteorologist', 'meteorologi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'meteorologist')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'meteorologi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il meteorologo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o meteorologista')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el meteorólogo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Technik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Technik', 'technik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la técnica', 'la técnica', 'Dank moderner Technik können wir überall arbeiten.', 'Gracias a la tecnología moderna podemos trabajar en cualquier sitio.', 'technology', 'tekniikka')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'technology')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tekniikka')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la tecnica')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a técnica')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la técnica", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- genau
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('genau', 'genau', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'preciso', 'preciso', 'Die Uhr ist sehr genau und geht keine Sekunde falsch.', 'El reloj es muy preciso y no se atrasa ni un segundo.', 'precise', 'tarkka')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'precise')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tarkka')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'preciso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'preciso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "preciso", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- früher
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('früher', 'früher', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'antes', 'antes', 'Früher gab es hier nur Felder, jetzt stehen überall Häuser.', 'Antes aquí solo había campos, ahora hay casas por todas partes.', 'before', 'ennen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'before')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ennen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'prima')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'antes')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "antes", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- sich vorbereiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich vorbereiten', 'sich vorbereiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'prepararse', 'prepararse', 'Ich muss mich auf die Prüfung nächste Woche vorbereiten.', 'Tengo que prepararme para el examen de la semana que viene.', 'to prepare', 'valmistautua')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to prepare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'valmistautua')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'prepararsi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'preparar-se')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "prepararse", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schlecht
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schlecht', 'schlecht', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'malo', 'malo', 'Bei schlechtem Wetter bleibe ich lieber zu Hause.', 'Con mal tiempo prefiero quedarme en casa.', 'bad', 'huono')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'bad')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'huono')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'cattivo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'mau')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "malo", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- manchmal
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('manchmal', 'manchmal', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'a veces', 'a veces', 'Manchmal gehe ich nach der Arbeit ins Schwimmbad.', 'A veces voy a la piscina después del trabajo.', 'sometimes', 'joskus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'sometimes')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'joskus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'a volte')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'às vezes')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "a veces", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- schauen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schauen', 'schauen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'mirar', 'mirar', 'Schau mal aus dem Fenster, es schneit!', '¡Mira por la ventana, está nevando!', 'to look', 'katsoa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to look')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'katsoa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'guardare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'olhar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "mirar", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- besser
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besser', 'besser', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'mejor', 'mejor', 'Nach dem Arztbesuch geht es mir schon viel besser.', 'Después de ir al médico ya me siento mucho mejor.', 'better', 'parempi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'better')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'parempi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'migliore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'melhor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "mejor", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Daten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Daten', 'daten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'los datos', 'los datos', 'Für die Anmeldung brauchen wir Ihre persönlichen Daten.', 'Para la inscripción necesitamos sus datos personales.', 'data', 'tiedot')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'data')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tiedot')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'i dati')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'os dados')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "los datos", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 51: expanded vocabulary (22 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- das Wochenende
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Wochenende', 'wochenende', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el fin de semana', 'el fin de semana', 'Am Wochenende fahren wir oft aufs Land.', 'Los fines de semana solemos ir al campo.', 'weekend', 'viikonloppu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'weekend')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'viikonloppu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il fine settimana')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o fim de semana')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el fin de semana", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- unzufrieden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('unzufrieden', 'unzufrieden', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'insatisfecho', 'insatisfecho', 'Der Kunde war unzufrieden mit dem Service im Hotel.', 'El cliente estaba insatisfecho con el servicio del hotel.', 'dissatisfied', 'tyytymätön')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'dissatisfied')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tyytymätön')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'insoddisfatto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'insatisfeito')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "insatisfecho", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Lohn
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Lohn', 'lohn', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el salario', 'el salario', 'Die Arbeiter fordern einen höheren Lohn.', 'Los trabajadores exigen un salario más alto.', 'wage', 'palkka')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'wage')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'palkka')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il salario')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o salário')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el salario", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Wohnung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wohnung', 'wohnung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el piso', 'el piso', 'Wir haben endlich eine bezahlbare Wohnung in der Stadt gefunden.', 'Por fin encontramos un piso asequible en la ciudad.', 'apartment', 'asunto')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'apartment')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'asunto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''appartamento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o apartamento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el piso", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- günstig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('günstig', 'günstig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'barato', 'barato', 'Im Supermarkt nebenan sind die Preise sehr günstig.', 'En el supermercado de al lado los precios son muy baratos.', 'affordable', 'edullinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'affordable')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'edullinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'economico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'barato')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "barato", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Leben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Leben', 'leben', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la vida', 'la vida', 'Das Leben auf dem Land ist ruhiger als in der Stadt.', 'La vida en el campo es más tranquila que en la ciudad.', 'life', 'elämä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'life')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'elämä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la vita')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a vida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la vida", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Essen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Essen', 'essen', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la comida', 'la comida', 'Das Essen in diesem Restaurant schmeckt ausgezeichnet.', 'La comida de este restaurante sabe excelente.', 'food', 'ruoka')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'food')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ruoka')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il cibo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a comida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la comida", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Strom
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Strom', 'strom', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la electricidad', 'la electricidad', 'Die Kosten für Strom sind im letzten Jahr stark gestiegen.', 'El coste de la electricidad ha subido mucho el último año.', 'electricity', 'sähkö')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'electricity')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sähkö')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''elettricità')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a eletricidade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la electricidad", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- kosten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kosten', 'kosten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'costar', 'costar', 'Wie viel kostet ein Kilo Äpfel auf dem Markt?', '¿Cuánto cuesta un kilo de manzanas en el mercado?', 'to cost', 'maksaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to cost')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'maksaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'costare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'custar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "costar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Demonstrant
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Demonstrant', 'demonstrant', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el manifestante', 'el manifestante', 'Die Demonstranten versammelten sich vor dem Rathaus.', 'Los manifestantes se reunieron frente al ayuntamiento.', 'protester', 'mielenosoittaja')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'protester')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'mielenosoittaja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il manifestante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o manifestante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el manifestante", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Schild
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Schild', 'schild', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el cartel', 'el cartel', 'Auf dem Schild stand: Bitte nicht betreten.', 'En el cartel ponía: Prohibido el paso.', 'sign', 'kyltti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'sign')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kyltti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il cartello')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o cartaz')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el cartel", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- rufen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('rufen', 'rufen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'gritar', 'gritar', 'Die Kinder rufen laut nach ihrer Mutter.', 'Los niños llaman a gritos a su madre.', 'to shout', 'huutaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to shout')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'huutaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'gridare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'gritar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "gritar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Parole
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Parole', 'parole', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el lema', 'el lema', 'Die Parole der Bewegung war auf vielen T-Shirts zu lesen.', 'El lema del movimiento se podía leer en muchas camisetas.', 'slogan', 'iskulause')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'slogan')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'iskulause')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'lo slogan')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o lema')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el lema", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- friedlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('friedlich', 'friedlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'pacífico', 'pacífico', 'Der Abend am See war wunderbar friedlich.', 'La tarde junto al lago fue maravillosamente tranquila.', 'peaceful', 'rauhallinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'peaceful')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'rauhallinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'pacifico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'pacífico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "pacífico", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Polizei
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Polizei', 'polizei', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la policía', 'la policía', 'Nach dem Unfall hat jemand sofort die Polizei gerufen.', 'Después del accidente alguien llamó a la policía de inmediato.', 'police', 'poliisi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'police')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'poliisi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la polizia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a polícia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la policía", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- aufrufen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('aufrufen', 'aufrufen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'convocar', 'convocar', 'Die Organisation rief alle Bürger zur Teilnahme auf.', 'La organización llamó a todos los ciudadanos a participar.', 'to call upon', 'kehottaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to call upon')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kehottaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'invitare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'convocar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "convocar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Politiker
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Politiker', 'politiker', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el político', 'el político', 'Die Politikerin hielt eine Rede vor dem Parlament.', 'La política pronunció un discurso ante el parlamento.', 'politician', 'poliitikko')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'politician')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'poliitikko')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il politico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o político')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el político", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- zuhören
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zuhören', 'zuhören', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'escuchar', 'escuchar', 'Bitte hör mir kurz zu, ich möchte dir etwas Wichtiges sagen.', 'Escúchame un momento, quiero decirte algo importante.', 'to listen', 'kuunnella')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to listen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuunnella')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'ascoltare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'escutar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "escuchar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Protest
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Protest', 'protest', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la protesta', 'la protesta', 'Der Protest gegen das neue Gesetz dauerte mehrere Wochen.', 'La protesta contra la nueva ley duró varias semanas.', 'protest', 'protesti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'protest')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'protesti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la protesta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o protesto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la protesta", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- tragen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('tragen', 'tragen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'llevar', 'llevar', 'Im Winter trage ich immer eine warme Mütze.', 'En invierno siempre llevo un gorro caliente.', 'to carry / to wear', 'kantaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to carry / to wear')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kantaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'portare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'carregar / usar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "llevar", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- größtenteils
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('größtenteils', 'größtenteils', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'en su mayoría', 'en su mayoría', 'Die Renovierung ist größtenteils abgeschlossen.', 'La renovación está en su mayor parte terminada.', 'mostly', 'suurimmaksi osaksi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'mostly')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'suurimmaksi osaksi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'per lo più')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'em grande parte')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "en su mayoría", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- gehen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gehen', 'gehen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'ir', 'ir', 'Wir gehen jeden Morgen zusammen zur Schule.', 'Vamos juntos al colegio todas las mañanas.', 'to go', 'mennä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to go')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'mennä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'andare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'ir')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "ir", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 52: expanded vocabulary (23 new words)
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- die Schule
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Schule', 'schule', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el colegio', 'el colegio', 'Mein Sohn geht auf eine Schule in der Nähe von unserem Haus.', 'Mi hijo va a un colegio cerca de nuestra casa.', 'school', 'koulu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'school')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'koulu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la scuola')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a escola')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el colegio", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Schüler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Schüler', 'schüler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el alumno', 'el alumno', 'Die Schüler bereiten sich auf die Abschlussprüfung vor.', 'Los alumnos se preparan para el examen final.', 'student', 'oppilas')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'student')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'oppilas')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''alunno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o aluno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el alumno", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- verändern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verändern', 'verändern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'cambiar', 'cambiar', 'Das Internet hat die Art, wie wir einkaufen, komplett verändert.', 'Internet ha cambiado completamente la forma en que compramos.', 'to change', 'muuttaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to change')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'muuttaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'cambiare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'mudar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "cambiar", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- lernen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lernen', 'lernen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'aprender', 'aprender', 'Ich lerne seit drei Monaten Klavier spielen.', 'Llevo tres meses aprendiendo a tocar el piano.', 'to learn', 'oppia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to learn')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'oppia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'imparare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'aprender')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "aprender", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Tablet
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tablet', 'tablet', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la tableta', 'la tableta', 'Die Kinder lesen ihre Schulbücher jetzt auf dem Tablet.', 'Los niños ahora leen sus libros de texto en la tableta.', 'tablet', 'tabletti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'tablet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tabletti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il tablet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o tablet')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la tableta", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Computer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Computer', 'computer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el ordenador', 'el ordenador', 'Mein alter Computer ist zu langsam für neue Programme.', 'Mi ordenador viejo es demasiado lento para programas nuevos.', 'computer', 'tietokone')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'computer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tietokone')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il computer')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o computador')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el ordenador", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Klassenzimmer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Klassenzimmer', 'klassenzimmer', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el aula', 'el aula', 'Das Klassenzimmer wurde frisch gestrichen und sieht hell aus.', 'El aula fue pintada de nuevo y se ve luminosa.', 'classroom', 'luokkahuone')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'classroom')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'luokkahuone')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''aula')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a sala de aula')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el aula", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- digital
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('digital', 'digital', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'digital', 'digital', 'Viele Zeitungen bieten jetzt auch digitale Ausgaben an.', 'Muchos periódicos ofrecen ahora también ediciones digitales.', 'digital', 'digitaalinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'digital')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'digitaalinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'digitale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'digital')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "digital", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Tafel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Tafel', 'tafel', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la pizarra', 'la pizarra', 'Der Lehrer schreibt die Hausaufgaben an die Tafel.', 'El profesor escribe los deberes en la pizarra.', 'board', 'taulu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'board')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'taulu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la lavagna')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o quadro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la pizarra", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Lehrer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Lehrer', 'lehrer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el profesor', 'el profesor', 'Unser Deutschlehrer kommt aus Österreich.', 'Nuestro profesor de alemán es de Austria.', 'teacher', 'opettaja')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'teacher')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'opettaja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''insegnante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o professor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el profesor", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Programm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Programm', 'programm', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el programa', 'el programa', 'Mit diesem Programm kann man Fotos bearbeiten.', 'Con este programa se pueden editar fotos.', 'program', 'ohjelma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'program')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ohjelma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il programma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o programa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el programa", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- erklären
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('erklären', 'erklären', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'explicar', 'explicar', 'Können Sie mir bitte den Weg zum Bahnhof erklären?', '¿Puede explicarme el camino a la estación, por favor?', 'to explain', 'selittää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to explain')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'selittää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'spiegare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'explicar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "explicar", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Grammatik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Grammatik', 'grammatik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la gramática', 'la gramática', 'Deutsche Grammatik hat viele Regeln und Ausnahmen.', 'La gramática alemana tiene muchas reglas y excepciones.', 'grammar', 'kielioppi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'grammar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kielioppi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la grammatica')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a gramática')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la gramática", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Tempo
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tempo', 'tempo', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el ritmo', 'el ritmo', 'Der Läufer hat ein beeindruckendes Tempo vorgelegt.', 'El corredor impuso un ritmo impresionante.', 'pace', 'tahti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'pace')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tahti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il ritmo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o ritmo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el ritmo", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- eigen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('eigen', 'eigen', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'propio', 'propio', 'Jedes Kind hat seinen eigenen Lernstil.', 'Cada niño tiene su propio estilo de aprendizaje.', 'own', 'oma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'own')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'oma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'proprio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'próprio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "propio", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Eltern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Eltern', 'eltern', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'los padres', 'los padres', 'Meine Eltern kommen nächste Woche zu Besuch.', 'Mis padres vienen de visita la semana que viene.', 'parents', 'vanhemmat')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'parents')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vanhemmat')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'i genitori')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'os pais')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "los padres", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- sich Sorgen machen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich Sorgen machen', 'sich sorgen machen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'preocuparse', 'preocuparse', 'Mach dir keine Sorgen, alles wird gut!', '¡No te preocupes, todo saldrá bien!', 'to worry', 'huolestua')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to worry')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'huolestua')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'preoccuparsi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'preocupar-se')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "preocuparse", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Kind
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Kind', 'kind', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el niño', 'el niño', 'Das Kind spielt jeden Tag im Garten nach der Schule.', 'El niño juega en el jardín todos los días después del colegio.', 'child', 'lapsi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'child')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lapsi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il bambino')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a criança')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el niño", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Zeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zeit', 'zeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el tiempo', 'el tiempo', 'Ich habe heute leider keine Zeit für ein Treffen.', 'Hoy, por desgracia, no tengo tiempo para una reunión.', 'time', 'aika')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'time')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'aika')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il tempo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o tempo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el tiempo", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Bildschirm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Bildschirm', 'bildschirm', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la pantalla', 'la pantalla', 'Der Bildschirm meines Laptops hat einen Kratzer.', 'La pantalla de mi portátil tiene un arañazo.', 'screen', 'näyttö')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'screen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'näyttö')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'lo schermo')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a tela')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la pantalla", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- verbringen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verbringen', 'verbringen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'pasar (tiempo)', 'pasar (tiempo)', 'Im Sommer verbringen wir unseren Urlaub am Meer.', 'En verano pasamos las vacaciones en la playa.', 'to spend (time)', 'viettää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to spend (time)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'viettää')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'trascorrere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'passar (tempo)')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "pasar (tiempo)", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Zukunft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zukunft', 'zukunft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el futuro', 'el futuro', 'Wir müssen schon jetzt an die Zukunft denken.', 'Tenemos que pensar en el futuro desde ahora.', 'future', 'tulevaisuus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'future')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tulevaisuus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il futuro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o futuro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el futuro", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- manche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('manche', 'manche', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'algunos', 'algunos', 'Manche Leute stehen jeden Tag um fünf Uhr morgens auf.', 'Algunas personas se levantan a las cinco de la mañana todos los días.', 'some', 'jotkut')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = COALESCE(EXCLUDED.example, vocabulary_meanings.example),
    example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es),
    english = COALESCE(EXCLUDED.english, vocabulary_meanings.english),
    fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id) ON CONFLICT DO NOTHING;

  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'some')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'jotkut')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'alcuni')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'alguns')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Bridge: VokabelLab + DerDieDas
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "algunos", "level": "a2", "category": "education"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;

-- ════════════════════════════════════════════════════════════════
-- Update existing entries missing examples/translations
-- ════════════════════════════════════════════════════════════════

COMMIT;

-- Verify density
SELECT tv.text_id, tv.level,
  count(tvm.meaning_id) as vocab_count,
  array_length(regexp_split_to_array(tv.content, '\s+'), 1) as word_count,
  round(count(tvm.meaning_id)::numeric / array_length(regexp_split_to_array(tv.content, '\s+'), 1) * 100, 1) as vocab_pct
FROM text_versions tv
JOIN text_version_meanings tvm ON tvm.text_version_id = tv.id
WHERE tv.text_id >= 43
GROUP BY tv.text_id, tv.level, tv.content
ORDER BY tv.text_id, tv.level;
