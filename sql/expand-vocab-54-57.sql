-- Expand vocabulary for texts 54-57 (Klimakonferenz, KI-Modelle, Ronaldo, Mauerbau)
-- Each text needs ~15-20 more words to reach ~30 total

BEGIN;

-- ════════════════════════════════════════════════════════════════
-- TEXT 54: Klimakonferenz in der Mongolei (has 17, adding ~15 more)
-- Version IDs: A2=186, B1=187, B2=188
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- das Land
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Land', 'land', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el país', 'el país', 'Deutschland ist ein Land in Europa.', 'Alemania es un país en Europa.', 'country', 'maa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'country') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'maa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il paese') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o país') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el país', 'level', 'a2', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Problem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Problem', 'problem', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el problema', 'el problema', 'Wir müssen dieses Problem gemeinsam lösen.', 'Tenemos que resolver este problema juntos.', 'problem', 'ongelma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'problem') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'ongelma') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il problema') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o problema') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el problema', 'level', 'a2', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Erde
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Erde', 'erde', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la tierra', 'la tierra', 'Die Erde dreht sich um die Sonne.', 'La Tierra gira alrededor del Sol.', 'earth', 'maa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'earth') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'maa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la terra') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a terra') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la tierra', 'level', 'a2', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Wasser
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Wasser', 'wasser', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el agua', 'el agua', 'Sauberes Wasser ist lebenswichtig.', 'El agua limpia es vital.', 'water', 'vesi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'water') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'vesi') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''acqua') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a água') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el agua', 'level', 'a2', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Meer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Meer', 'meer', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el mar', 'el mar', 'Im Sommer fahren wir ans Meer.', 'En verano vamos al mar.', 'sea', 'meri')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'sea') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'meri') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il mare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o mar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el mar', 'level', 'a2', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Tier
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tier', 'tier', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el animal', 'el animal', 'Mein Lieblingstier ist der Hund.', 'Mi animal favorito es el perro.', 'animal', 'eläin')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'animal') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'eläin') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''animale') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o animal') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el animal', 'level', 'a2', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Heimat
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Heimat', 'heimat', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la patria', 'la patria', 'Meine Heimat ist im Süden Deutschlands.', 'Mi patria está en el sur de Alemania.', 'homeland', 'kotimaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'homeland') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kotimaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la patria') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a pátria') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la patria', 'level', 'b1', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Energie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Energie', 'energie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la energía', 'la energía', 'Solarenergie ist eine saubere Energie.', 'La energía solar es una energía limpia.', 'energy', 'energia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'energy') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'energia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''energia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a energia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la energía', 'level', 'b1', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Zukunft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zukunft', 'zukunft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el futuro', 'el futuro', 'In der Zukunft werden Autos elektrisch fahren.', 'En el futuro los coches serán eléctricos.', 'future', 'tulevaisuus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'future') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tulevaisuus') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il futuro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o futuro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el futuro', 'level', 'b1', 'category', 'environment')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- verändern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verändern', 'verändern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'cambiar', 'cambiar', 'Die Technologie verändert unser Leben.', 'La tecnología cambia nuestra vida.', 'to change', 'muuttaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to change') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'muuttaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'cambiare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'mudar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- steigen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('steigen', 'steigen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'subir', 'subir', 'Die Preise steigen jedes Jahr.', 'Los precios suben cada año.', 'to rise', 'nousta')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to rise') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'nousta') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'salire') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'subir') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- verlieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verlieren', 'verlieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'perder', 'perder', 'Ich möchte meinen Schlüssel nicht verlieren.', 'No quiero perder mi llave.', 'to lose', 'menettää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to lose') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'menettää') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'perdere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'perder') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- schützen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schützen', 'schützen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'proteger', 'proteger', 'Wir müssen die Natur schützen.', 'Tenemos que proteger la naturaleza.', 'to protect', 'suojella')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to protect') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'suojella') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'proteggere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'proteger') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- wichtig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wichtig', 'wichtig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'importante', 'importante', 'Bildung ist sehr wichtig für Kinder.', 'La educación es muy importante para los niños.', 'important', 'tärkeä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (186, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (187, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (188, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'important') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tärkeä') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'importante') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'importante') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 55: Neue KI-Modelle (has 10, adding ~20 more)
-- Version IDs: A2=189, B1=190, B2=191
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
  VALUES (v_lemma_id, 'el programa', 'el programa', 'Mit diesem Programm kann man Fotos bearbeiten.', 'Con este programa se pueden editar fotos.', 'program', 'ohjelma')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'program') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'ohjelma') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il programma') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o programa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el programa', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Schule
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Schule', 'schule', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la escuela', 'la escuela', 'Die Kinder gehen jeden Morgen in die Schule.', 'Los niños van a la escuela cada mañana.', 'school', 'koulu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'school') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'koulu') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la scuola') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a escola') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la escuela', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Sprache
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Sprache', 'sprache', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el idioma', 'el idioma', 'Deutsch ist eine schwierige Sprache.', 'El alemán es un idioma difícil.', 'language', 'kieli')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'language') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kieli') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la lingua') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o idioma') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el idioma', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Alltag
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Alltag', 'alltag', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la vida cotidiana', 'la vida cotidiana', 'Sport gehört zu meinem Alltag.', 'El deporte forma parte de mi vida cotidiana.', 'everyday life', 'arki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'everyday life') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'arki') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la vita quotidiana') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o cotidiano') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la vida cotidiana', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Schüler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Schüler', 'schüler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el alumno', 'el alumno', 'Der Schüler hat die Prüfung bestanden.', 'El alumno aprobó el examen.', 'student', 'oppilas')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'student') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'oppilas') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''alunno') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o aluno') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el alumno', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Musik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Musik', 'musik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la música', 'la música', 'Ich höre gern klassische Musik.', 'Me gusta escuchar música clásica.', 'music', 'musiikki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'music') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'musiikki') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la musica') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a música') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la música', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Gefahr
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Gefahr', 'gefahr', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el peligro', 'el peligro', 'Rauchen ist eine Gefahr für die Gesundheit.', 'Fumar es un peligro para la salud.', 'danger', 'vaara')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'danger') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'vaara') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il pericolo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o perigo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el peligro', 'level', 'b1', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Regel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regel', 'regel', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la regla', 'la regla', 'In der Schule gibt es strenge Regeln.', 'En la escuela hay reglas estrictas.', 'rule', 'sääntö')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'rule') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'sääntö') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la regola') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a regra') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la regla', 'level', 'a2', 'category', 'technology')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- lernen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lernen', 'lernen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'aprender', 'aprender', 'Ich lerne seit zwei Jahren Deutsch.', 'Llevo dos años aprendiendo alemán.', 'to learn', 'oppia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to learn') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'oppia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'imparare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'aprender') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- schreiben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schreiben', 'schreiben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'escribir', 'escribir', 'Kannst du mir eine E-Mail schreiben?', '¿Puedes escribirme un correo electrónico?', 'to write', 'kirjoittaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to write') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kirjoittaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'scrivere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'escrever') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- verstehen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verstehen', 'verstehen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'entender', 'entender', 'Ich verstehe nicht, was du meinst.', 'No entiendo lo que quieres decir.', 'to understand', 'ymmärtää')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to understand') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'ymmärtää') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'capire') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'entender') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- besser
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besser', 'besser', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'mejor', 'mejor', 'Heute fühle ich mich viel besser.', 'Hoy me siento mucho mejor.', 'better', 'parempi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (189, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (190, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (191, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'better') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'parempi') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'meglio') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'melhor') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 56: Ronaldo suspendiert (has 10, adding ~20 more)
-- Version IDs: A2=192, B1=193, B2=194
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- der Fußballspieler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fußballspieler', 'fußballspieler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el futbolista', 'el futbolista', 'Mein Sohn will Fußballspieler werden.', 'Mi hijo quiere ser futbolista.', 'football player', 'jalkapalloilija')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'football player') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'jalkapalloilija') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il calciatore') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o jogador de futebol') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el futbolista', 'level', 'a2', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Verband
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Verband', 'verband', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la federación', 'la federación', 'Der Verband organisiert die Meisterschaft.', 'La federación organiza el campeonato.', 'federation', 'liitto')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'federation') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'liitto') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la federazione') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a federação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la federación', 'level', 'b1', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- das Spiel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Spiel', 'spiel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el partido', 'el partido', 'Das Spiel beginnt um 20 Uhr.', 'El partido comienza a las 20 horas.', 'game', 'peli')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'game') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'peli') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la partita') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o jogo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el partido', 'level', 'a2', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Schiedsrichter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Schiedsrichter', 'schiedsrichter', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el árbitro', 'el árbitro', 'Der Schiedsrichter hat die rote Karte gezeigt.', 'El árbitro mostró la tarjeta roja.', 'referee', 'tuomari')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'referee') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tuomari') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''arbitro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o árbitro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el árbitro', 'level', 'b1', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Grund
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Grund', 'grund', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la razón', 'la razón', 'Was ist der Grund für deine Verspätung?', '¿Cuál es la razón de tu retraso?', 'reason', 'syy')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'reason') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'syy') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il motivo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a razão') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la razón', 'level', 'a2', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Strafe
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Strafe', 'strafe', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el castigo', 'el castigo', 'Die Strafe für zu schnelles Fahren ist hoch.', 'El castigo por conducir demasiado rápido es alto.', 'punishment', 'rangaistus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'punishment') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'rangaistus') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la punizione') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a punição') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el castigo', 'level', 'b1', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Mannschaft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Mannschaft', 'mannschaft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el equipo', 'el equipo', 'Unsere Mannschaft hat das Finale erreicht.', 'Nuestro equipo llegó a la final.', 'team', 'joukkue')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'team') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'joukkue') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la squadra') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a equipa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el equipo', 'level', 'a2', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- der Fan
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fan', 'fan', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el aficionado', 'el aficionado', 'Die Fans haben laut gejubelt.', 'Los aficionados celebraron con entusiasmo.', 'fan', 'fani')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'fan') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'fani') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il tifoso') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o adepto') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el aficionado', 'level', 'a2', 'category', 'sports')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- kritisieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kritisieren', 'kritisieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'criticar', 'criticar', 'Man sollte konstruktiv kritisieren.', 'Se debería criticar de forma constructiva.', 'to criticize', 'arvostella')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to criticize') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'arvostella') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'criticare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'criticar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- sperren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sperren', 'sperren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'suspender', 'suspender', 'Die Straße wurde wegen Bauarbeiten gesperrt.', 'La calle fue cerrada por obras.', 'to suspend', 'sulkea')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to suspend') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'sulkea') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'sospendere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'suspender') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- berühmt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('berühmt', 'berühmt', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'famoso', 'famoso', 'Berlin ist eine berühmte Stadt.', 'Berlín es una ciudad famosa.', 'famous', 'kuuluisa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'famous') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kuuluisa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'famoso') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'famoso') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- unfair
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('unfair', 'unfair', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'injusto', 'injusto', 'Das Ergebnis war unfair für beide Seiten.', 'El resultado fue injusto para ambas partes.', 'unfair', 'epäreilu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (192, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (193, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (194, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'unfair') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'epäreilu') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'ingiusto') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'injusto') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

END $$;

-- ════════════════════════════════════════════════════════════════
-- TEXT 57: 65 Jahre Mauerbau (has 10, adding ~20 more)
-- Version IDs: A2=195, B1=196, B2=197
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- die Mauer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Mauer', 'mauer', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el muro', 'el muro', 'Die alte Mauer um die Stadt ist 500 Jahre alt.', 'El viejo muro alrededor de la ciudad tiene 500 años.', 'wall', 'muuri')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'wall') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'muuri') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il muro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o muro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el muro', 'level', 'a2', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Familie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Familie', 'familie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la familia', 'la familia', 'Meine Familie lebt in München.', 'Mi familia vive en Múnich.', 'family', 'perhe')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'family') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'perhe') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la famiglia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a família') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la familia', 'level', 'a2', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Zeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zeit', 'zeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el tiempo', 'el tiempo', 'Die Zeit vergeht schnell, wenn man Spaß hat.', 'El tiempo pasa rápido cuando te diviertes.', 'time', 'aika')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'time') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'aika') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il tempo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o tempo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'el tiempo', 'level', 'a2', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Freiheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Freiheit', 'freiheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la libertad', 'la libertad', 'Die Freiheit der Presse ist ein Grundrecht.', 'La libertad de prensa es un derecho fundamental.', 'freedom', 'vapaus')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'freedom') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'vapaus') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la libertà') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a liberdade') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la libertad', 'level', 'b1', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Demokratie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Demokratie', 'demokratie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la democracia', 'la democracia', 'Die Demokratie braucht aktive Bürger.', 'La democracia necesita ciudadanos activos.', 'democracy', 'demokratia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'democracy') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'demokratia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la democrazia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a democracia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la democracia', 'level', 'b2', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Geschichte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Geschichte', 'geschichte', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la historia', 'la historia', 'In der Geschichte gibt es viele Wendepunkte.', 'En la historia hay muchos puntos de inflexión.', 'history', 'historia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'history') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'historia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la storia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a história') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la historia', 'level', 'a2', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- die Grenze
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Grenze', 'grenze', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la frontera', 'la frontera', 'Die Grenze zwischen den Ländern ist offen.', 'La frontera entre los países está abierta.', 'border', 'raja')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'border') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'raja') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il confine') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a fronteira') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, priority, metadata) VALUES ('der-die-das', v_lemma_id, true, 0, jsonb_build_object('translation', 'la frontera', 'level', 'b1', 'category', 'history')) ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- reisen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('reisen', 'reisen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'viajar', 'viajar', 'Im Sommer reise ich nach Spanien.', 'En verano viajo a España.', 'to travel', 'matkustaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to travel') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'matkustaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'viaggiare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'viajar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- fallen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('fallen', 'fallen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'caer', 'caer', 'Im Herbst fallen die Blätter von den Bäumen.', 'En otoño las hojas caen de los árboles.', 'to fall', 'pudota')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to fall') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'pudota') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'cadere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'cair') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- feiern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('feiern', 'feiern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'celebrar', 'celebrar', 'Wir feiern heute meinen Geburtstag.', 'Hoy celebramos mi cumpleaños.', 'to celebrate', 'juhlia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to celebrate') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'juhlia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'festeggiare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'celebrar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

  -- traurig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('traurig', 'traurig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'triste', 'triste', 'Der Film war sehr traurig.', 'La película fue muy triste.', 'sad', 'surullinen')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = COALESCE(EXCLUDED.example, vocabulary_meanings.example), example_es = COALESCE(EXCLUDED.example_es, vocabulary_meanings.example_es), english = COALESCE(EXCLUDED.english, vocabulary_meanings.english), fi = COALESCE(EXCLUDED.fi, vocabulary_meanings.fi)
  RETURNING id INTO v_meaning_id;
  INSERT INTO text_version_meanings VALUES (195, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (196, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings VALUES (197, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'sad') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'surullinen') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'triste') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'triste') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active, priority, metadata) VALUES ('vokabellab', v_meaning_id, true, 0, '{}') ON CONFLICT DO NOTHING;

END $$;

COMMIT;
