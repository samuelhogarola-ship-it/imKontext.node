-- ═══════════════════════════════════════════════════════════════
-- SEED: 50 German news texts with A2/B1/B2 versions + vocabulary
-- For imKontext vocabulary learning app
-- Run in Supabase SQL Editor
-- Uses DO $$ blocks — each text is independent (no global transaction)
-- Levels mapped: original A1→A2, A2→B1, B1→B2 (text_versions CHECK constraint)
-- Vocabulario uses ON CONFLICT for UNIQUE(german)
-- Links through vocabulary_meanings (not directly vocabulario→text_version_meanings)
-- ═══════════════════════════════════════════════════════════════

-- ── Text 1: Deutschland hat ein neues Bürgergeld (sociedad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Deutschland hat ein neues Bürgergeld', 'deutschland-hat-ein-neues-buergergeld', 'sociedad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland gibt es ein neues Bürgergeld. Es ist Geld vom Staat für Menschen ohne Arbeit. Das Bürgergeld ist jetzt 563 Euro im Monat. Viele Menschen brauchen dieses Geld zum Leben.

Die Regierung sagt: Das Geld hilft den Menschen. Aber manche Leute finden: 563 Euro ist zu wenig. Essen, Miete und Strom sind teuer.'),
    (_text_id, 'B1', 'Seit Januar gibt es in Deutschland ein neues Bürgergeld. Es ersetzt das alte Hartz IV. Erwachsene ohne Arbeit bekommen jetzt 563 Euro pro Monat. Für Kinder gibt es weniger Geld.

Die Regierung möchte mit dem Bürgergeld auch Weiterbildung fördern. Menschen sollen Kurse besuchen und einen neuen Beruf lernen können. Kritiker sagen aber, dass der Betrag zu niedrig ist, weil die Preise für Lebensmittel und Energie stark gestiegen sind.'),
    (_text_id, 'B2', 'Das neue Bürgergeld hat das bisherige Hartz-IV-System in Deutschland abgelöst. Alleinstehende Erwachsene erhalten nun 563 Euro monatlich – eine Erhöhung um zwölf Prozent gegenüber dem Vorjahr. Auch für Kinder und Jugendliche wurden die Sätze angepasst.

Ein wesentlicher Unterschied zum früheren System ist der stärkere Fokus auf Weiterbildung. Arbeitslose können bis zu drei Jahre lang Umschulungen absolvieren, ohne Sanktionen befürchten zu müssen. Außerdem wurde die Vermögensprüfung in den ersten Monaten gelockert.

Gewerkschaften begrüßen die Reform grundsätzlich, fordern aber eine regelmäßige Anpassung an die Inflation. Die Opposition hingegen warnt vor fehlenden Arbeitsanreizen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Bürgergeld', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la renta ciudadana', 'citizen''s income', 'Das Bürgergeld hilft Menschen ohne Arbeit.', 'La renta ciudadana ayuda a personas sin trabajo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Staat', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el estado', 'the state', 'Der Staat gibt Geld an arme Menschen.', 'El estado da dinero a personas pobres.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Arbeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el trabajo', 'work', 'Ich suche eine neue Arbeit.', 'Busco un nuevo trabajo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Miete', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el alquiler', 'rent', 'Die Miete ist sehr hoch in Berlin.', 'El alquiler es muy alto en Berlín.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Weiterbildung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la formación continua', 'further education', 'Die Weiterbildung hilft beim Berufswechsel.', 'La formación continua ayuda al cambio de profesión.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('ersetzen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'reemplazar', 'to replace', 'Das neue System ersetzt das alte.', 'El nuevo sistema reemplaza al antiguo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('teuer', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'caro', 'expensive', 'Das Essen ist sehr teuer geworden.', 'La comida se ha vuelto muy cara.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 2: Immer mehr Menschen leben allein (sociedad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Immer mehr Menschen in Deutschland leben allein', 'immer-mehr-menschen-leben-allein', 'sociedad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland leben viele Menschen allein. Fast 20 Millionen Menschen haben keine Familie zu Hause. Sie wohnen in einer Wohnung allein.

Besonders in großen Städten wie Berlin oder Hamburg leben viele Menschen allein. Junge Menschen und alte Menschen leben oft allein.'),
    (_text_id, 'B1', 'In Deutschland gibt es immer mehr Single-Haushalte. Fast 20 Millionen Menschen leben allein – das sind 40 Prozent aller Haushalte. Vor 30 Jahren waren es nur 25 Prozent.

In großen Städten ist die Zahl besonders hoch. In Berlin lebt mehr als die Hälfte der Einwohner allein. Gründe dafür sind: Menschen heiraten später, Paare trennen sich häufiger, und ältere Menschen leben nach dem Tod des Partners allein.'),
    (_text_id, 'B2', 'Laut dem Statistischen Bundesamt ist die Zahl der Einpersonenhaushalte in Deutschland auf einen Rekordwert gestiegen. Knapp 20 Millionen Menschen leben allein, was etwa 40 Prozent aller Haushalte ausmacht. Im internationalen Vergleich liegt Deutschland damit deutlich über dem EU-Durchschnitt.

Soziologen erklären diesen Trend mit mehreren Faktoren: der zunehmenden Individualisierung, dem späteren Heiratsalter, steigenden Scheidungsraten und der alternden Gesellschaft. Besonders in Universitätsstädten und Metropolen sind Ein-Personen-Haushalte die häufigste Wohnform.

Die Entwicklung hat auch wirtschaftliche Folgen: Der Bedarf an kleinen Wohnungen steigt, während die Pro-Kopf-Kosten für Energie und Miete höher ausfallen als in Mehrpersonenhaushalten.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('allein', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'solo/a', 'alone', 'Ich lebe allein in meiner Wohnung.', 'Vivo solo en mi piso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Haushalt', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el hogar', 'household', 'In meinem Haushalt leben drei Personen.', 'En mi hogar viven tres personas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('heiraten', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'casarse', 'to marry', 'Sie wollen im Sommer heiraten.', 'Quieren casarse en verano.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Scheidung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el divorcio', 'divorce', 'Die Zahl der Scheidungen steigt.', 'El número de divorcios aumenta.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Einwohner', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el habitante', 'inhabitant', 'Berlin hat 3,7 Millionen Einwohner.', 'Berlín tiene 3,7 millones de habitantes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('steigen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'subir, aumentar', 'to rise', 'Die Preise steigen jedes Jahr.', 'Los precios suben cada año.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Wohnung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el piso, el apartamento', 'apartment', 'Ich suche eine neue Wohnung.', 'Busco un nuevo piso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 3: Nachbarn helfen Nachbarn (sociedad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Nachbarn helfen Nachbarn', 'nachbarn-helfen-nachbarn', 'sociedad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In vielen Städten helfen Nachbarn anderen Nachbarn. Sie kaufen ein für alte Menschen. Sie bringen Essen oder helfen im Garten.

Das Projekt heißt „Nachbarschaftshilfe". Es gibt eine App dafür. Man kann dort schreiben, was man braucht. Ein Nachbar antwortet dann.'),
    (_text_id, 'B1', 'Nachbarschaftshilfe wird in Deutschland immer beliebter. Über eine App können Nachbarn sich gegenseitig unterstützen. Zum Beispiel: Eine alte Frau braucht Hilfe beim Einkaufen. Ein junger Nachbar macht das gern.

In Hamburg gibt es das Projekt „Nachbarschaft aktiv". Schon 5.000 Menschen machen mit. Sie helfen beim Einkaufen, bei Reparaturen oder passen auf Kinder auf. Das Projekt zeigt: Zusammen ist man weniger allein.'),
    (_text_id, 'B2', 'Die Nachbarschaftshilfe erlebt in Deutschland eine Renaissance. Digitale Plattformen wie nebenan.de verbinden Anwohner miteinander und erleichtern gegenseitige Unterstützung im Alltag. Bundesweit nutzen bereits über zwei Millionen Menschen solche Netzwerke.

Das Hamburger Modellprojekt „Nachbarschaft aktiv" gilt als besonders erfolgreich. Seit seiner Gründung vor drei Jahren haben sich dort über 5.000 Freiwillige registriert. Die Hilfeleistungen reichen von Einkaufsdiensten über Reparaturen bis hin zur Kinderbetreuung.

Sozialforscher betonen, dass solche Initiativen nicht nur praktische Hilfe bieten, sondern auch der zunehmenden Vereinsamung in Großstädten entgegenwirken. Besonders ältere Menschen profitieren von den regelmäßigen sozialen Kontakten.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Nachbar', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el vecino', 'neighbor', 'Mein Nachbar ist sehr nett.', 'Mi vecino es muy amable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('helfen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ayudar', 'to help', 'Ich helfe meiner Nachbarin beim Einkaufen.', 'Ayudo a mi vecina con la compra.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('einkaufen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'hacer la compra', 'to shop', 'Ich gehe jeden Samstag einkaufen.', 'Voy a hacer la compra cada sábado.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Hilfe', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la ayuda', 'help', 'Brauchst du Hilfe?', '¿Necesitas ayuda?', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Reparatur', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la reparación', 'repair', 'Die Reparatur war nicht teuer.', 'La reparación no fue cara.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Freiwillige', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el voluntario', 'volunteer', 'Viele Freiwillige helfen im Projekt.', 'Muchos voluntarios ayudan en el proyecto.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('unterstützen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'apoyar', 'to support', 'Wir unterstützen alte Menschen.', 'Apoyamos a las personas mayores.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 4: Ehrenamt ist in Deutschland sehr beliebt (sociedad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Ehrenamt ist in Deutschland sehr beliebt', 'ehrenamt-ist-in-deutschland-sehr-beliebt', 'sociedad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Menschen in Deutschland arbeiten freiwillig. Sie bekommen kein Geld dafür. Das heißt „Ehrenamt". Sie helfen zum Beispiel bei der Feuerwehr, im Sportverein oder im Altenheim.

30 Millionen Menschen in Deutschland haben ein Ehrenamt. Das sind sehr viele.'),
    (_text_id, 'B1', 'In Deutschland engagieren sich rund 30 Millionen Menschen ehrenamtlich. Das bedeutet: Sie arbeiten freiwillig und ohne Bezahlung. Typische Ehrenämter sind: Feuerwehr, Sportverein, Kirche oder Hilfe für Geflüchtete.

Besonders junge Menschen zwischen 16 und 30 Jahren sind aktiv. Viele helfen in Sportvereinen oder bei Umweltprojekten. Der Staat fördert das Ehrenamt mit Steuervorteilen. Auch Arbeitgeber geben manchmal frei für ehrenamtliche Arbeit.'),
    (_text_id, 'B2', 'Etwa 30 Millionen Menschen in Deutschland engagieren sich ehrenamtlich – das entspricht knapp 40 Prozent der Bevölkerung über 14 Jahren. Damit zählt Deutschland zu den Ländern mit der höchsten Freiwilligenquote in Europa.

Die beliebtesten Bereiche für ehrenamtliche Arbeit sind Sport und Bewegung, gefolgt von Kultur, Bildung und dem sozialen Bereich. Auffällig ist, dass die Bereitschaft zum Engagement in ländlichen Regionen höher liegt als in Großstädten.

Die Bundesregierung hat ein neues Förderprogramm aufgelegt, das ehrenamtliche Arbeit attraktiver machen soll. Dazu gehören verbesserte Versicherungsschutz, eine Erhöhung der Aufwandsentschädigung und eine Ehrenamtskarte, die Vergünstigungen in Kultur und Freizeit ermöglicht.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Ehrenamt', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el voluntariado', 'voluntary work', 'Mein Ehrenamt macht mir Spaß.', 'Mi voluntariado me gusta.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('freiwillig', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'voluntario', 'voluntary', 'Die Arbeit ist freiwillig.', 'El trabajo es voluntario.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Feuerwehr', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'los bomberos', 'fire brigade', 'Die Feuerwehr kommt schnell.', 'Los bomberos llegan rápido.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Verein', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la asociación, el club', 'club', 'Ich bin im Sportverein.', 'Estoy en el club deportivo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('engagieren (sich)', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'comprometerse', 'to get involved', 'Viele Jugendliche engagieren sich.', 'Muchos jóvenes se comprometen.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Bezahlung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la remuneración', 'payment', 'Es gibt keine Bezahlung dafür.', 'No hay remuneración por ello.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('fördern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'fomentar, promover', 'to promote', 'Der Staat fördert das Ehrenamt.', 'El estado fomenta el voluntariado.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 5: Kinder spielen zu wenig draußen (sociedad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Kinder spielen zu wenig draußen', 'kinder-spielen-zu-wenig-draussen', 'sociedad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Kinder in Deutschland spielen zu wenig draußen. Viele Kinder sitzen zu Hause und spielen mit dem Handy oder Computer. Ärzte sagen: Kinder sollen mehr draußen spielen.

Frische Luft und Bewegung sind wichtig für Kinder. Draußen spielen macht stark und gesund.'),
    (_text_id, 'B1', 'Eine Studie zeigt: Deutsche Kinder verbringen immer weniger Zeit draußen. Im Durchschnitt spielen Kinder nur noch 45 Minuten pro Tag im Freien. Vor 20 Jahren waren es noch zwei Stunden.

Der Hauptgrund sind Smartphones und Tablets. Kinder verbringen viel Zeit mit Spielen und Videos. Ärzte warnen: Bewegungsmangel führt zu Übergewicht und Konzentrationsproblemen. Viele Schulen reagieren und bieten jetzt mehr Sport und Outdoor-Aktivitäten an.'),
    (_text_id, 'B2', 'Laut einer aktuellen Studie der Universität Heidelberg verbringen Kinder in Deutschland durchschnittlich nur noch 45 Minuten täglich im Freien. Im Vergleich zu den Neunzigerjahren hat sich die Dauer damit mehr als halbiert. Gleichzeitig ist die tägliche Bildschirmzeit auf über drei Stunden angestiegen.

Kinderärzte schlagen Alarm: Der chronische Bewegungsmangel führe zu einer Zunahme von Übergewicht, Haltungsschäden und Aufmerksamkeitsdefiziten. Auch die soziale Entwicklung leide, da das gemeinsame Spielen im Freien wichtige Kompetenzen wie Teamfähigkeit und Konfliktlösung fördere.

Mehrere Bundesländer haben daraufhin Pilotprojekte gestartet, bei denen Unterricht teilweise ins Freie verlegt wird. In Skandinavien ist dieses Konzept als „Outdoor-Pädagogik" bereits seit Jahrzehnten etabliert.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('draußen', 'adverb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'fuera, afuera', 'outside', 'Die Kinder spielen draußen.', 'Los niños juegan fuera.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Bewegung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el movimiento, el ejercicio', 'exercise', 'Bewegung ist gut für Kinder.', 'El ejercicio es bueno para los niños.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Handy', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el móvil', 'mobile phone', 'Die Kinder spielen mit dem Handy.', 'Los niños juegan con el móvil.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('gesund', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'sano, saludable', 'healthy', 'Draußen spielen ist gesund.', 'Jugar fuera es saludable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Studie', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el estudio', 'study', 'Eine Studie zeigt das Problem.', 'Un estudio muestra el problema.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Bewegungsmangel', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la falta de ejercicio', 'lack of exercise', 'Bewegungsmangel ist ungesund.', 'La falta de ejercicio no es saludable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('spielen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'jugar', 'to play', 'Kinder sollen mehr draußen spielen.', 'Los niños deberían jugar más fuera.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 6: Roboter arbeiten in deutschen Restaurants (tecnologia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Roboter arbeiten jetzt in deutschen Restaurants', 'roboter-arbeiten-in-deutschen-restaurants', 'tecnologia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In einem Restaurant in München arbeitet ein Roboter. Der Roboter bringt das Essen zum Tisch. Er kann auch Getränke bringen.

Die Gäste finden den Roboter lustig. Der Roboter arbeitet schnell und macht keine Fehler. Er braucht keinen Urlaub.'),
    (_text_id, 'B1', 'Immer mehr Restaurants in Deutschland setzen Roboter ein. In München bringt ein Roboter namens „Bella" das Essen an die Tische. Er kann bis zu vier Teller gleichzeitig tragen.

Der Grund: Es gibt nicht genug Personal. Viele Restaurants finden keine Kellner mehr. Die Roboter kosten einmal 15.000 Euro und arbeiten dann ohne Pause. Aber sie können keine Bestellungen aufnehmen – das machen weiterhin Menschen.'),
    (_text_id, 'B2', 'Die Gastronomiebranche in Deutschland greift zunehmend auf Serviceroboter zurück, um dem akuten Personalmangel entgegenzuwirken. Allein in München, Frankfurt und Berlin sind mittlerweile über 300 Lieferroboter im Einsatz, die Speisen und Getränke an die Tische transportieren.

Der chinesische Hersteller Pudu Robotics verzeichnet in Deutschland einen Umsatzanstieg von 200 Prozent. Modelle wie „BellaBot" navigieren per Sensoren zwischen den Tischen und können bis zu vier Gerichte gleichzeitig ausliefern.

Gastronomen betonen jedoch, dass die Roboter das menschliche Personal nur ergänzen, nicht ersetzen. Bestellungen aufnehmen, Empfehlungen geben und auf individuelle Wünsche eingehen – das bleibt Aufgabe der menschlichen Kellner.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Roboter', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el robot', 'robot', 'Der Roboter bringt das Essen.', 'El robot trae la comida.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Restaurant', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el restaurante', 'restaurant', 'Wir gehen ins Restaurant essen.', 'Vamos al restaurante a comer.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Personal', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el personal', 'staff', 'Das Restaurant sucht neues Personal.', 'El restaurante busca nuevo personal.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Kellner', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el camarero', 'waiter', 'Der Kellner bringt die Rechnung.', 'El camarero trae la cuenta.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Bestellung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el pedido', 'order', 'Ihre Bestellung kommt sofort.', 'Su pedido viene enseguida.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('tragen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'llevar, cargar', 'to carry', 'Er trägt vier Teller gleichzeitig.', 'Lleva cuatro platos a la vez.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Gast', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el cliente, el huésped', 'guest', 'Die Gäste finden den Roboter lustig.', 'Los clientes encuentran gracioso al robot.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 7: Schüler lernen mit künstlicher Intelligenz (tecnologia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Schüler lernen jetzt mit künstlicher Intelligenz', 'schueler-lernen-mit-kuenstlicher-intelligenz', 'tecnologia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In vielen Schulen in Deutschland gibt es jetzt Computer mit KI. KI bedeutet „künstliche Intelligenz". Die Computer helfen den Schülern beim Lernen.

Die Schüler können Fragen stellen. Der Computer gibt Antworten. Die Lehrer finden das gut.'),
    (_text_id, 'B1', 'An immer mehr deutschen Schulen kommt künstliche Intelligenz zum Einsatz. Schüler nutzen KI-Programme zum Beispiel für Mathe-Aufgaben oder zum Schreiben von Texten. Das Programm erklärt Fehler und gibt Tipps.

Die Bildungsminister der Länder haben neue Regeln beschlossen. Schüler dürfen KI nutzen, aber sie müssen angeben, wenn ein Text von KI kommt. Bei Prüfungen ist KI verboten. Viele Lehrer sehen KI positiv – als Werkzeug, nicht als Ersatz.'),
    (_text_id, 'B2', 'Künstliche Intelligenz hält zunehmend Einzug in den deutschen Schulalltag. Eine Umfrage des Digitalverbands Bitkom ergab, dass bereits 42 Prozent der Schülerinnen und Schüler ab der achten Klasse regelmäßig KI-Tools für schulische Zwecke verwenden.

Die Kultusministerkonferenz hat daraufhin einheitliche Richtlinien verabschiedet: KI darf als Lernhilfe eingesetzt werden, muss aber stets als Quelle gekennzeichnet werden. Bei offiziellen Prüfungen und Klausuren bleibt die Nutzung untersagt.

Pädagogen sehen in der Technologie sowohl Chancen als auch Risiken. Einerseits ermöglicht KI personalisiertes Lernen und entlastet Lehrkräfte. Andererseits besteht die Gefahr, dass eigenständiges Denken und Recherchieren vernachlässigt werden.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die künstliche Intelligenz', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la inteligencia artificial', 'artificial intelligence', 'Künstliche Intelligenz verändert die Schule.', 'La inteligencia artificial cambia la escuela.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Schüler', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el alumno', 'student', 'Die Schüler lernen Deutsch.', 'Los alumnos aprenden alemán.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Prüfung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el examen', 'exam', 'Bei der Prüfung ist KI verboten.', 'En el examen, la IA está prohibida.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Werkzeug', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la herramienta', 'tool', 'KI ist ein nützliches Werkzeug.', 'La IA es una herramienta útil.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verboten', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'prohibido', 'forbidden', 'Handys sind im Unterricht verboten.', 'Los móviles están prohibidos en clase.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('nutzen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'utilizar', 'to use', 'Viele Schüler nutzen KI zum Lernen.', 'Muchos alumnos utilizan IA para aprender.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Fehler', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el error', 'mistake', 'Das Programm erklärt meine Fehler.', 'El programa explica mis errores.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 8: Neue App hilft beim Deutschlernen (tecnologia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Neue App hilft beim Deutschlernen', 'neue-app-hilft-beim-deutschlernen', 'tecnologia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Es gibt eine neue App für das Handy. Die App hilft Menschen, Deutsch zu lernen. Man kann jeden Tag zehn Minuten üben.

Die App hat Spiele, Wörter und Bilder. Sie ist kostenlos. Schon fünf Millionen Menschen benutzen die App.'),
    (_text_id, 'B1', 'Eine neue Sprach-App aus Berlin wird immer beliebter. Die App hilft Anfängern, Deutsch zu lernen. Man kann Wörter üben, Texte lesen und seine Aussprache verbessern.

Das Besondere: Die App passt sich an das Niveau des Nutzers an. Wer gut ist, bekommt schwierigere Aufgaben. Wer Fehler macht, wiederholt die Lektion. Schon fünf Millionen Menschen nutzen die App.'),
    (_text_id, 'B2', 'Das Berliner Start-up hinter der Sprachlern-App hat eine Finanzierungsrunde über 25 Millionen Euro abgeschlossen. Die App, die auf einem KI-basierten Lernalgorithmus basiert, hat inzwischen fünf Millionen aktive Nutzer in 30 Ländern.

Das Konzept unterscheidet sich von etablierten Konkurrenten: Die App analysiert die Fehler des Nutzers in Echtzeit und erstellt einen individuellen Lernplan. Besonders die Spracherkennung, die Aussprache bewerten und korrigieren kann, gilt als innovativ.

Das Goethe-Institut empfiehlt die App mittlerweile als Ergänzung zum Unterricht. Kritiker bemängeln allerdings, dass digitale Tools den persönlichen Kontakt mit Muttersprachlern nicht ersetzen können.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die App', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la app', 'app', 'Die App ist kostenlos.', 'La app es gratuita.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('üben', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'practicar', 'to practice', 'Ich übe jeden Tag Deutsch.', 'Practico alemán cada día.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Aussprache', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la pronunciación', 'pronunciation', 'Meine Aussprache wird besser.', 'Mi pronunciación mejora.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('kostenlos', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'gratuito', 'free of charge', 'Die App ist kostenlos.', 'La app es gratuita.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Anfänger', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el principiante', 'beginner', 'Die App ist gut für Anfänger.', 'La app es buena para principiantes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verbessern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'mejorar', 'to improve', 'Ich möchte mein Deutsch verbessern.', 'Quiero mejorar mi alemán.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('beliebt', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'popular', 'popular', 'Die App ist sehr beliebt.', 'La app es muy popular.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 9: Das intelligente Zuhause (tecnologia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Das intelligente Zuhause', 'das-intelligente-zuhause', 'tecnologia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In manchen Häusern ist alles intelligent. Das Licht geht allein an und aus. Die Heizung weiß, wann man nach Hause kommt.

Man kann alles mit dem Handy steuern. Das heißt „Smart Home". Es ist bequem, aber auch teuer.'),
    (_text_id, 'B1', 'Immer mehr Deutsche machen ihr Zuhause „smart". Mit Smart-Home-Technik kann man Licht, Heizung und Türen per Handy steuern. Ein Sprachassistent reagiert auf Befehle wie „Licht an!" oder „Heizung auf 22 Grad!".

Eine Umfrage zeigt: 35 Prozent der Deutschen nutzen bereits Smart-Home-Geräte. Am beliebtesten sind intelligente Lampen und Lautsprecher. Experten sagen: Smart Homes können auch Energie sparen, weil die Heizung sich automatisch reguliert.'),
    (_text_id, 'B2', 'Der Smart-Home-Markt in Deutschland wächst rasant. Laut einer Studie des Branchenverbands Bitkom nutzen bereits 35 Prozent der Bundesbürger mindestens ein Smart-Home-Gerät. Der Umsatz mit vernetzter Haustechnik stieg im vergangenen Jahr auf 6,5 Milliarden Euro.

Besonders gefragt sind intelligente Beleuchtungssysteme, Sprachassistenten und vernetzte Heizthermostate. Letztere können den Energieverbrauch um bis zu 25 Prozent senken, indem sie die Raumtemperatur automatisch an Anwesenheit und Tageszeit anpassen.

Datenschützer mahnen jedoch zur Vorsicht: Smart-Home-Geräte sammeln kontinuierlich Daten über das Verhalten der Bewohner. Sicherheitslücken könnten Hackern Zugang zu persönlichen Informationen verschaffen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Zuhause', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el hogar', 'home', 'Mein Zuhause ist gemütlich.', 'Mi hogar es acogedor.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Heizung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la calefacción', 'heating', 'Die Heizung ist auf 22 Grad.', 'La calefacción está a 22 grados.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('steuern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'controlar', 'to control', 'Man kann alles mit dem Handy steuern.', 'Se puede controlar todo con el móvil.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Licht', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la luz', 'light', 'Das Licht geht automatisch an.', 'La luz se enciende automáticamente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sparen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ahorrar', 'to save', 'Smart Homes können Energie sparen.', 'Las casas inteligentes pueden ahorrar energía.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Energie', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la energía', 'energy', 'Wir müssen Energie sparen.', 'Debemos ahorrar energía.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('bequem', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'cómodo', 'comfortable', 'Smart Homes sind bequem.', 'Las casas inteligentes son cómodas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 10: Elektroautos werden immer beliebter (tecnologia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Elektroautos werden immer beliebter', 'elektroautos-werden-immer-beliebter', 'tecnologia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Immer mehr Menschen in Deutschland kaufen ein Elektroauto. Ein Elektroauto fährt mit Strom, nicht mit Benzin. Das ist besser für die Umwelt.

Elektroautos sind leise und machen die Luft sauber. Aber sie sind noch teuer.'),
    (_text_id, 'B1', 'Elektroautos sind in Deutschland immer beliebter. Im letzten Jahr war jedes fünfte neue Auto ein Elektroauto. Die Autos fahren mit Strom und produzieren kein CO2.

Aber es gibt noch Probleme. Elektroautos sind teurer als normale Autos. Außerdem gibt es nicht genug Ladestationen. Auf dem Land muss man oft weit fahren, um das Auto zu laden. Die Regierung will deshalb bis 2030 eine Million Ladestationen bauen.'),
    (_text_id, 'B2', 'Der Absatz von Elektrofahrzeugen in Deutschland hat einen neuen Höchststand erreicht. Im vergangenen Jahr wurde jede fünfte Neuzulassung elektrisch angetrieben, was einem Anstieg von 30 Prozent gegenüber dem Vorjahr entspricht.

Trotz der positiven Entwicklung bestehen weiterhin Hindernisse für eine flächendeckende Elektromobilität. Die Anschaffungskosten liegen im Durchschnitt noch 8.000 Euro über denen vergleichbarer Verbrenner. Zudem verfügt Deutschland aktuell nur über rund 100.000 öffentliche Ladepunkte, während die Bundesregierung bis 2030 eine Million anstrebt.

Automobilexperten prognostizieren dennoch, dass spätestens ab 2028 Elektroautos im Gesamtkostenvergleich günstiger sein werden als Verbrenner, wenn man Wartung, Versicherung und Energiekosten berücksichtigt.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Elektroauto', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el coche eléctrico', 'electric car', 'Mein nächstes Auto wird ein Elektroauto.', 'Mi próximo coche será un coche eléctrico.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Strom', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la electricidad', 'electricity', 'Das Auto fährt mit Strom.', 'El coche funciona con electricidad.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Umwelt', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el medio ambiente', 'environment', 'Elektroautos sind gut für die Umwelt.', 'Los coches eléctricos son buenos para el medio ambiente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Ladestation', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la estación de carga', 'charging station', 'Wir brauchen mehr Ladestationen.', 'Necesitamos más estaciones de carga.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('laden', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'cargar', 'to charge', 'Ich muss mein Auto laden.', 'Tengo que cargar mi coche.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sauber', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'limpio', 'clean', 'Elektroautos machen die Luft sauber.', 'Los coches eléctricos hacen el aire limpio.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('leise', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'silencioso', 'quiet', 'Elektroautos sind sehr leise.', 'Los coches eléctricos son muy silenciosos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 11: Der erste Schnee kommt früh (medioambiente) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Der erste Schnee kommt früh dieses Jahr', 'der-erste-schnee-kommt-frueh', 'medioambiente', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Es schneit in Deutschland. Der erste Schnee ist da. In den Bergen gibt es viel Schnee. Kinder spielen draußen im Schnee.

Die Temperaturen sind kalt: minus fünf Grad. Autofahrer müssen vorsichtig sein. Die Straßen sind glatt.'),
    (_text_id, 'B1', 'Schon im Oktober hat es in Teilen Deutschlands geschneit. In Bayern und Sachsen fielen bis zu 20 Zentimeter Neuschnee. Das ist ungewöhnlich für diese Jahreszeit.

Viele Autofahrer waren nicht vorbereitet. Die Polizei meldete zahlreiche Unfälle auf glatten Straßen. Der Deutsche Wetterdienst warnt: In den kommenden Tagen bleibt es kalt. Winterreifen sind jetzt Pflicht.'),
    (_text_id, 'B2', 'Ein ungewöhnlich früher Wintereinbruch hat in weiten Teilen Deutschlands für Chaos gesorgt. In Bayern, Sachsen und Thüringen fielen bereits Mitte Oktober bis zu 30 Zentimeter Neuschnee – ein Rekord, der zuletzt vor 50 Jahren gebrochen wurde.

Der plötzliche Kälteeinbruch überraschte viele Autofahrer, die noch mit Sommerreifen unterwegs waren. Die Polizei registrierte allein in Bayern über 200 wetterbedingte Unfälle innerhalb von 24 Stunden.

Meteorologen führen den frühen Wintereinbruch auf eine arktische Kaltluftströmung zurück. Ob dies mit dem Klimawandel zusammenhängt, wird kontrovers diskutiert.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Schnee', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la nieve', 'snow', 'Der Schnee fällt seit heute Morgen.', 'La nieve cae desde esta mañana.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('schneien', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'nevar', 'to snow', 'Es schneit schon den ganzen Tag.', 'Nieva durante todo el día.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('glatt', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'resbaladizo', 'slippery', 'Die Straßen sind glatt und gefährlich.', 'Las calles están resbaladizas y peligrosas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('vorsichtig', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'prudente, cuidadoso', 'careful', 'Sei vorsichtig auf der Straße!', '¡Ten cuidado en la calle!', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Unfall', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el accidente', 'accident', 'Es gab einen Unfall auf der Autobahn.', 'Hubo un accidente en la autopista.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Winterreifen', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el neumático de invierno', 'winter tire', 'Im Winter braucht man Winterreifen.', 'En invierno se necesitan neumáticos de invierno.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Temperatur', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la temperatura', 'temperature', 'Die Temperatur ist minus fünf Grad.', 'La temperatura es de menos cinco grados.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 12: Städte pflanzen mehr Bäume (medioambiente) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Städte pflanzen mehr Bäume', 'staedte-pflanzen-mehr-baeume', 'medioambiente', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Städte in Deutschland pflanzen neue Bäume. Bäume sind wichtig. Sie machen die Luft sauber und geben Schatten.

Im Sommer ist es in Städten sehr heiß. Bäume helfen, die Städte kühler zu machen. Berlin pflanzt jedes Jahr 5.000 neue Bäume.'),
    (_text_id, 'B1', 'Deutsche Städte pflanzen so viele Bäume wie nie zuvor. Berlin hat letztes Jahr 5.000 neue Bäume gepflanzt. München plant sogar 10.000 Bäume bis 2027.

Bäume sind für Städte sehr wichtig. Sie filtern die Luft, spenden Schatten und kühlen die Umgebung. Bei Hitzewellen können Straßen ohne Bäume bis zu 10 Grad heißer sein als Straßen mit Bäumen. Bürger können Baumpatenschaften übernehmen und einen Baum in ihrer Straße gießen.'),
    (_text_id, 'B2', 'Angesichts zunehmender Hitzeperioden investieren deutsche Großstädte massiv in ihre Grünflächen. Berlin, München und Hamburg haben zusammen über 20.000 Neupflanzungen für die kommenden zwei Jahre angekündigt. Damit reagieren die Kommunen auf den Verlust von geschätzt 500.000 Stadtbäumen durch Dürre und Borkenkäfer in den letzten fünf Jahren.

Wissenschaftler betonen die vielfältigen Vorteile urbaner Begrünung: Bäume filtern Feinstaub aus der Luft, senken die Umgebungstemperatur um bis zu 10 Grad und tragen zur psychischen Gesundheit der Bewohner bei.

Ein innovatives Konzept sind sogenannte „Tiny Forests" – dicht bepflanzte Miniwälder auf bisher versiegelten Flächen. Die erste Anlage dieser Art wurde in Hamburg eröffnet und soll als Modell für weitere Städte dienen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Baum', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el árbol', 'tree', 'Der Baum ist sehr alt.', 'El árbol es muy viejo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('pflanzen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'plantar', 'to plant', 'Wir pflanzen einen Baum im Garten.', 'Plantamos un árbol en el jardín.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Schatten', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la sombra', 'shade', 'Im Schatten ist es kühler.', 'A la sombra hace más fresco.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Luft', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el aire', 'air', 'Die Luft in der Stadt ist schmutzig.', 'El aire en la ciudad está sucio.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('heiß', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'caliente, caluroso', 'hot', 'Im Sommer ist es sehr heiß.', 'En verano hace mucho calor.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('kühl', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'fresco', 'cool', 'Im Schatten ist es kühl.', 'A la sombra hace fresco.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('gießen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'regar', 'to water', 'Im Sommer muss man Bäume gießen.', 'En verano hay que regar los árboles.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 13: Bienen brauchen unsere Hilfe (medioambiente) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Bienen brauchen unsere Hilfe', 'bienen-brauchen-unsere-hilfe', 'medioambiente', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Bienen sind sehr wichtig. Ohne Bienen gibt es kein Obst und kein Gemüse. Aber viele Bienen sterben.

In Deutschland gibt es ein Problem. Bienen finden nicht genug Blumen. Auch Pestizide sind schlecht für Bienen. Viele Menschen pflanzen jetzt Blumen für Bienen.'),
    (_text_id, 'B1', 'Die Bienenpopulation in Deutschland geht zurück. Imker berichten, dass im letzten Winter 20 Prozent ihrer Bienenvölker gestorben sind. Das ist ein großes Problem, denn Bienen bestäuben 80 Prozent aller Nutzpflanzen.

Die Hauptursachen sind der Einsatz von Pestiziden und der Verlust von Lebensräumen. Viele Felder haben keine Wildblumen mehr. Die Regierung hat ein Programm gestartet: Landwirte bekommen Geld, wenn sie Blühstreifen an ihren Feldern anlegen.'),
    (_text_id, 'B2', 'Das Bienensterben in Deutschland nimmt alarmierende Ausmaße an. Nach Angaben des Deutschen Imkerbunds haben die Winterverluste in den vergangenen Jahren durchschnittlich 20 Prozent betragen. Weltweit ist die Population von Wildbienenarten um fast 40 Prozent zurückgegangen.

Als Hauptursachen gelten der intensive Einsatz von Neonicotinoiden in der Landwirtschaft, der Verlust von Lebensräumen durch Monokulturen und die Ausbreitung der Varroamilbe. Die EU hat bereits den Einsatz bestimmter Pestizide im Freiland verboten.

Auf kommunaler Ebene setzen immer mehr Städte auf bienenfreundliche Maßnahmen: München hat öffentliche Grünflächen in Wildblumenwiesen umgewandelt, und Berlin fördert die Stadtimkerei mit kostenlosen Anfängerkursen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Biene', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la abeja', 'bee', 'Die Biene fliegt von Blume zu Blume.', 'La abeja vuela de flor en flor.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Blume', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la flor', 'flower', 'Im Garten wachsen viele Blumen.', 'En el jardín crecen muchas flores.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sterben', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'morir', 'to die', 'Viele Bienen sterben im Winter.', 'Muchas abejas mueren en invierno.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Obst', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la fruta', 'fruit', 'Ohne Bienen gibt es kein Obst.', 'Sin abejas no hay fruta.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Gemüse', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la verdura', 'vegetables', 'Gemüse ist gesund.', 'La verdura es saludable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Landwirt', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el agricultor', 'farmer', 'Der Landwirt pflegt seine Felder.', 'El agricultor cuida sus campos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('schützen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'proteger', 'to protect', 'Wir müssen die Bienen schützen.', 'Debemos proteger a las abejas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 14: Deutschland recycelt mehr als jedes andere Land (medioambiente) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Deutschland recycelt mehr als jedes andere Land', 'deutschland-recycelt-mehr-als-jedes-andere-land', 'medioambiente', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland trennt man den Müll. Es gibt verschiedene Tonnen: Gelb für Plastik, Blau für Papier, Braun für Essen und Schwarz für den Rest.

Deutsche recyceln sehr viel. Das ist gut für die Umwelt. Auch Flaschen kann man zurückbringen und bekommt Geld dafür.'),
    (_text_id, 'B1', 'Deutschland ist Weltmeister im Recycling. Fast 70 Prozent des Abfalls werden recycelt. Das ist mehr als in jedem anderen Land. Der Grund: In Deutschland gibt es strenge Regeln für Mülltrennung.

Jeder Haushalt hat verschiedene Tonnen: gelb für Verpackungen, blau für Papier, braun für Bioabfall und schwarz für Restmüll. Außerdem gibt es das Pfandsystem: Für Glasflaschen und Plastikflaschen bekommt man 8 bis 25 Cent zurück.'),
    (_text_id, 'B2', 'Deutschland belegt im internationalen Vergleich einen Spitzenplatz beim Recycling. Laut Eurostat werden fast 70 Prozent des Siedlungsabfalls wiederverwertet – der höchste Wert in der Europäischen Union. Zum Vergleich: Der EU-Durchschnitt liegt bei etwa 48 Prozent.

Grundlage dieses Erfolgs ist ein differenziertes Mülltrennsystem, das in den 1990er-Jahren eingeführt wurde. Das duale System mit dem Grünen Punkt verpflichtet Hersteller, Verpackungen zurückzunehmen und zu recyceln. Ergänzt wird dies durch das Pfandsystem für Einweg- und Mehrwegflaschen.

Kritiker weisen allerdings darauf hin, dass ein erheblicher Teil des vermeintlich recycelten Plastikmülls in der Vergangenheit exportiert wurde, ohne tatsächlich wiederverwertet zu werden. Seit China den Import von Plastikmüll verboten hat, steht Deutschland vor der Herausforderung, eigene Recyclingkapazitäten auszubauen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Müll', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la basura', 'waste', 'Bitte trenne deinen Müll!', '¡Por favor separa tu basura!', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('trennen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'separar', 'to separate', 'In Deutschland trennt man den Müll.', 'En Alemania se separa la basura.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Flasche', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la botella', 'bottle', 'Ich bringe die Flaschen zurück.', 'Devuelvo las botellas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Verpackung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el envase', 'packaging', 'Verpackungen kommen in die gelbe Tonne.', 'Los envases van al contenedor amarillo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Pfand', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la fianza, el depósito', 'deposit', 'Für die Flasche gibt es 25 Cent Pfand.', 'Por la botella hay 25 céntimos de depósito.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Tonne', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el contenedor', 'bin', 'Die gelbe Tonne ist für Plastik.', 'El contenedor amarillo es para plástico.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Umwelt', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el medio ambiente', 'environment', 'Recycling ist gut für die Umwelt.', 'Reciclar es bueno para el medio ambiente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 15: Solarenergie auf deutschen Dächern (medioambiente) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Solarenergie auf deutschen Dächern', 'solarenergie-auf-deutschen-daechern', 'medioambiente', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Auf vielen Häusern in Deutschland gibt es Solarzellen. Die Solarzellen machen Strom aus Sonnenlicht. Das ist gut für die Umwelt.

Immer mehr Familien haben Solarzellen auf dem Dach. So bezahlen sie weniger für Strom. Die Sonne ist kostenlos.'),
    (_text_id, 'B1', 'Deutschland setzt immer mehr auf Solarenergie. Im letzten Jahr wurden auf 500.000 Dächern neue Solarzellen installiert. Das ist ein Rekord. Besonders Familien nutzen Solarstrom, um Geld zu sparen.

Eine Solaranlage für ein normales Haus kostet etwa 10.000 Euro. Aber der Strom ist dann fast kostenlos. Nach acht Jahren hat man das Geld zurück. Die Regierung gibt auch Geld dazu: Bis zu 3.000 Euro Förderung sind möglich.'),
    (_text_id, 'B2', 'Die Solarenergiebranche in Deutschland verzeichnet ein Rekordjahr. Im vergangenen Jahr wurden Photovoltaikanlagen mit einer Gesamtleistung von 14 Gigawatt neu installiert – so viel wie nie zuvor. Damit deckt Solarstrom mittlerweile rund 12 Prozent des deutschen Strombedarfs.

Ein wesentlicher Treiber ist die staatliche Förderung: Hauseigentümer können Zuschüsse von bis zu 3.000 Euro für die Installation einer Dachanlage beantragen. Zusätzlich wurde die Einspeisevergütung für überschüssigen Solarstrom angehoben.

Ab 2025 gilt in mehreren Bundesländern eine Solarpflicht für Neubauten. Kritiker bemängeln allerdings die Abhängigkeit von chinesischen Solarmodulen: Über 80 Prozent der in Deutschland installierten Panels stammen aus chinesischer Produktion.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Solarenergie', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la energía solar', 'solar energy', 'Solarenergie ist umweltfreundlich.', 'La energía solar es ecológica.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Dach', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el tejado', 'roof', 'Auf dem Dach gibt es Solarzellen.', 'En el tejado hay paneles solares.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Sonne', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el sol', 'sun', 'Die Sonne scheint heute.', 'El sol brilla hoy.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Solarzelle', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la célula solar', 'solar cell', 'Solarzellen machen Strom aus Licht.', 'Las células solares producen electricidad de la luz.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('installieren', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'instalar', 'to install', 'Wir installieren Solarzellen auf dem Dach.', 'Instalamos paneles solares en el tejado.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Förderung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la subvención', 'subsidy', 'Die Förderung beträgt 3.000 Euro.', 'La subvención es de 3.000 euros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 16: Frauenfußball wird immer populärer (deporte) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Frauenfußball wird immer populärer', 'frauenfussball-wird-immer-populaerer', 'deporte', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Fußball ist nicht nur für Männer. Auch Frauen spielen Fußball. In Deutschland gibt es eine Frauen-Bundesliga. Die Spiele sind spannend.

Immer mehr Menschen schauen Frauenfußball im Fernsehen. Die deutschen Frauen spielen sehr gut.'),
    (_text_id, 'B1', 'Frauenfußball wird in Deutschland immer beliebter. Bei der letzten Weltmeisterschaft haben 12 Millionen Menschen die Spiele im Fernsehen gesehen. Das ist ein neuer Rekord.

Die Frauen-Bundesliga wächst schnell. Die Spielerinnen werden jetzt besser bezahlt als früher, aber sie verdienen immer noch viel weniger als die Männer. Viele Mädchen wollen jetzt auch Fußball spielen. Die Vereine melden 30 Prozent mehr Anmeldungen.'),
    (_text_id, 'B2', 'Der Frauenfußball in Deutschland erlebt einen beispiellosen Aufschwung. Die Einschaltquoten bei internationalen Turnieren haben sich in den letzten fünf Jahren verdreifacht, und die Frauen-Bundesliga verzeichnet steigende Zuschauerzahlen in den Stadien.

Ein Meilenstein war der neue TV-Vertrag, der die Frauen-Bundesliga erstmals in einem eigenen Paket vermarktet. Die durchschnittlichen Gehälter der Spielerinnen sind zwar gestiegen, liegen aber immer noch bei einem Bruchteil dessen, was männliche Profis verdienen.

Der DFB hat ein Förderprogramm mit 15 Millionen Euro aufgelegt, das den Mädchenfußball an Schulen stärken soll. Ziel ist es, bis 2030 die Zahl der registrierten Spielerinnen zu verdoppeln.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Fußball', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el fútbol', 'football', 'Fußball ist der beliebteste Sport.', 'El fútbol es el deporte más popular.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Spielerin', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la jugadora', 'female player', 'Die Spielerin schießt ein Tor.', 'La jugadora marca un gol.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Spiel', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el partido', 'game', 'Das Spiel war sehr spannend.', 'El partido fue muy emocionante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verdienen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ganar (dinero)', 'to earn', 'Die Spielerinnen verdienen weniger.', 'Las jugadoras ganan menos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Zuschauer', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el espectador', 'spectator', 'Es gab viele Zuschauer im Stadion.', 'Había muchos espectadores en el estadio.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('spannend', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'emocionante', 'exciting', 'Das Spiel war sehr spannend.', 'El partido fue muy emocionante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 17: Mehr Sport an deutschen Schulen (deporte) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Mehr Sport an deutschen Schulen', 'mehr-sport-an-deutschen-schulen', 'deporte', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'An deutschen Schulen gibt es jetzt mehr Sportunterricht. Kinder haben drei Stunden Sport pro Woche. Früher waren es nur zwei Stunden.

Die Kinder machen Gymnastik, spielen Fußball und laufen. Sport in der Schule macht Spaß und ist gesund.'),
    (_text_id, 'B1', 'Die Kultusminister der Bundesländer haben beschlossen: An allen deutschen Schulen soll es mehr Sportunterricht geben. Ab dem nächsten Schuljahr haben alle Klassen mindestens drei Stunden Sport pro Woche.

Der Grund: Viele Kinder bewegen sich zu wenig. 15 Prozent der Grundschüler sind übergewichtig. Mit mehr Sport sollen Kinder fitter und gesünder werden. Außerdem lernen sie im Sport Teamarbeit und Fairness.'),
    (_text_id, 'B2', 'Die Kultusministerkonferenz hat eine Erhöhung des Sportunterrichts an deutschen Schulen beschlossen. Ab dem kommenden Schuljahr sollen alle Schülerinnen und Schüler mindestens drei Wochenstunden Sport erhalten. Bisher lag der Durchschnitt bei nur 2,2 Stunden.

Die Entscheidung fällt vor dem Hintergrund alarmierender Gesundheitsdaten: Laut der KiGGS-Studie des Robert Koch-Instituts sind 15 Prozent der Grundschüler übergewichtig, und die motorischen Fähigkeiten haben sich im Vergleich zur Vorgängergeneration verschlechtert.

Die Umsetzung stellt die Länder vor praktische Herausforderungen: Es fehlen sowohl qualifizierte Sportlehrkräfte als auch geeignete Sportstätten. Der Deutsche Sportlehrerverband fordert daher ein begleitendes Investitionsprogramm für Turnhallen und Schwimmbäder.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Sportunterricht', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la clase de educacion física', 'physical education', 'Sportunterricht ist mein Lieblingsfach.', 'La educacion física es mi asignatura favorita.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Schule', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la escuela', 'school', 'Meine Schule hat eine große Turnhalle.', 'Mi escuela tiene un gimnasio grande.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Stunde', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la hora', 'hour', 'Wir haben drei Stunden Sport.', 'Tenemos tres horas de deporte.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('fit', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'en forma', 'fit', 'Sport macht fit und gesund.', 'El deporte pone en forma y sano.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Turnhalle', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el gimnasio', 'gymnasium', 'Wir spielen in der Turnhalle Basketball.', 'Jugamos al baloncesto en el gimnasio.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('laufen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'correr', 'to run', 'Die Kinder laufen auf dem Sportplatz.', 'Los niños corren en el campo deportivo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 18: Immer weniger Kinder können schwimmen (deporte) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Immer weniger Kinder können schwimmen', 'immer-weniger-kinder-koennen-schwimmen', 'deporte', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Kinder in Deutschland können nicht schwimmen. Das ist gefährlich. Jedes Jahr ertrinken Menschen in Seen und Flüssen.

Schwimmkurse sind wichtig. Aber es gibt zu wenig Schwimmbäder. Eltern müssen lange auf einen Platz im Schwimmkurs warten.'),
    (_text_id, 'B1', 'Eine alarmierende Studie zeigt: Jedes fünfte Kind in Deutschland kann nach der Grundschule nicht sicher schwimmen. Vor zehn Jahren war es nur jedes zehnte Kind.

Die Gründe sind vielfältig: Während der Pandemie fielen Schwimmkurse aus. Außerdem haben viele Städte Schwimmbäder geschlossen, weil sie zu teuer waren. Die Deutsche Lebens-Rettungs-Gesellschaft (DLRG) fordert mehr Investitionen in Schwimmbäder und Schwimmunterricht an Schulen.'),
    (_text_id, 'B2', 'Die Schwimmfähigkeit von Kindern in Deutschland hat sich dramatisch verschlechtert. Laut einer Forsa-Umfrage im Auftrag der DLRG kann jedes fünfte Kind am Ende der Grundschulzeit nicht sicher schwimmen. Vor der Pandemie lag diese Quote bei zehn Prozent.

Die Ursachen sind struktureller Natur: In den vergangenen 20 Jahren wurden bundesweit über 4.000 Schwimmbäder geschlossen, weil Kommunen die Betriebskosten nicht mehr tragen konnten. Gleichzeitig sind die Wartelisten für Schwimmkurse auf durchschnittlich sechs Monate angewachsen.

Die Bundesregierung hat ein Förderprogramm über 100 Millionen Euro aufgelegt, mit dem Kommunen marode Schwimmbäder sanieren und neue Lehrschwimmbecken bauen können. Experten bezweifeln jedoch, dass dies ausreicht, um den Rückstand aufzuholen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('schwimmen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'nadar', 'to swim', 'Mein Kind lernt schwimmen.', 'Mi hijo aprende a nadar.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Schwimmbad', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la piscina', 'swimming pool', 'Wir gehen ins Schwimmbad.', 'Vamos a la piscina.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('gefährlich', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'peligroso', 'dangerous', 'Nicht schwimmen können ist gefährlich.', 'No saber nadar es peligroso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Schwimmkurs', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el curso de natación', 'swimming course', 'Mein Kind macht einen Schwimmkurs.', 'Mi hijo hace un curso de natación.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('ertrinken', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ahogarse', 'to drown', 'Kinder können im Wasser ertrinken.', 'Los niños pueden ahogarse en el agua.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('warten', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'esperar', 'to wait', 'Wir warten seit sechs Monaten.', 'Llevamos seis meses esperando.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 19: Der Wanderboom in Deutschland (deporte) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Der Wanderboom in Deutschland', 'der-wanderboom-in-deutschland', 'deporte', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Wandern ist in Deutschland sehr beliebt. Millionen Menschen gehen am Wochenende wandern. Sie gehen in die Berge oder durch den Wald.

Wandern ist kostenlos und gesund. Man braucht nur gute Schuhe und etwas zu trinken. Die Natur ist wunderschön.'),
    (_text_id, 'B1', 'Wandern liegt voll im Trend. Seit der Corona-Pandemie wandern 20 Prozent mehr Menschen in Deutschland als vorher. Besonders junge Leute zwischen 20 und 30 haben das Wandern für sich entdeckt.

Deutschland hat über 300.000 Kilometer markierte Wanderwege. Besonders beliebt sind der Schwarzwald, die Sächsische Schweiz und der Harz. Apps wie Komoot helfen bei der Routenplanung. Auch „Geocaching" – eine Art Schatzsuche in der Natur – wird beim Wandern immer beliebter.'),
    (_text_id, 'B2', 'Deutschland erlebt einen regelrechten Wanderboom. Laut dem Deutschen Wanderverband sind 40 Millionen Deutsche regelmäßig zu Fuß in der Natur unterwegs – ein Anstieg von 20 Prozent seit Beginn der Pandemie. Besonders auffällig ist der Zuwachs in der Altersgruppe der 18- bis 35-Jährigen.

Das Land verfügt über ein Netz von rund 300.000 Kilometern markierten Wanderwegen. Zu den beliebtesten Regionen zählen der Schwarzwald, die Sächsische Schweiz und das Allgäu. Digitale Wanderführer und GPS-basierte Apps haben die Zugänglichkeit erheblich verbessert.

Die Tourismusbranche reagiert auf den Trend mit neuen Angeboten wie Wellness-Wanderungen, kulinarischen Wandertouren und barrierefreien Wegen. Umweltschützer mahnen jedoch, sensible Ökosysteme vor Überlastung zu schützen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('wandern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'hacer senderismo', 'to hike', 'Wir wandern am Wochenende.', 'Hacemos senderismo el fin de semana.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Wald', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el bosque', 'forest', 'Wir gehen durch den Wald.', 'Caminamos por el bosque.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Berg', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la montaña', 'mountain', 'Wir wandern auf den Berg.', 'Subimos a la montaña.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Wanderweg', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el sendero', 'hiking trail', 'Der Wanderweg ist gut markiert.', 'El sendero está bien señalizado.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Natur', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la naturaleza', 'nature', 'Die Natur ist wunderschön.', 'La naturaleza es preciosa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Schuh', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el zapato', 'shoe', 'Gute Schuhe sind beim Wandern wichtig.', 'Un buen calzado es importante para el senderismo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 20: Skifahren wird teurer (deporte) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Skifahren wird immer teurer', 'skifahren-wird-immer-teurer', 'deporte', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Deutsche fahren im Winter gern Ski. Aber Skifahren wird immer teurer. Ein Tag Skifahren kostet jetzt 60 Euro oder mehr.

Auch die Hotels in den Bergen sind teuer. Viele Familien können sich den Skiurlaub nicht mehr leisten.'),
    (_text_id, 'B1', 'Skifahren ist in Deutschland ein beliebter Wintersport. Aber die Preise steigen stark. Ein Tagesskipass kostet in den Alpen jetzt zwischen 60 und 75 Euro. Vor zehn Jahren waren es noch 40 Euro.

Dazu kommen die Kosten für Hotel, Ausrüstung und Essen. Eine Woche Skiurlaub kostet eine Familie mit zwei Kindern schnell 3.000 Euro. Immer mehr Deutsche fahren deshalb in günstigere Skigebiete in Tschechien oder Polen.'),
    (_text_id, 'B2', 'Der Wintersport in den Alpen wird zunehmend zum Luxusvergnügen. Die Preise für Tagesskipässe in österreichischen und deutschen Skigebieten sind in den letzten zehn Jahren um durchschnittlich 50 Prozent gestiegen. Spitzenreiter sind Premiumresorts, die bis zu 75 Euro pro Tag verlangen.

Gleichzeitig stellt der Klimawandel die Branche vor existenzielle Herausforderungen. Die Schneesicherheit nimmt ab, und künstliche Beschneiung ist energie- und kostenintensiv. Unterhalb von 1.500 Metern gelten viele Skigebiete mittelfristig als nicht mehr wirtschaftlich betreibbar.

Als Reaktion setzen einige Regionen auf alternative Winterangebote wie Schneeschuhwandern, Langlauf oder Winterwellness. Andere investieren in die Ganzjahresnutzung ihrer Infrastruktur, um die Abhängigkeit vom Skitourismus zu reduzieren.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('Ski fahren', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'esquiar', 'to ski', 'Wir fahren im Winter Ski.', 'Esquiamos en invierno.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Winter', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el invierno', 'winter', 'Im Winter ist es kalt.', 'En invierno hace frío.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Urlaub', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'las vacaciones', 'vacation', 'Im Winter machen wir Skiurlaub.', 'En invierno hacemos vacaciones de esquí.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Ausrüstung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el equipo', 'equipment', 'Skiausrüstung ist teuer.', 'El equipo de esquí es caro.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Preis', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el precio', 'price', 'Die Preise steigen jedes Jahr.', 'Los precios suben cada año.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sich leisten', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'permitirse', 'to afford', 'Viele können sich keinen Skiurlaub leisten.', 'Muchos no pueden permitirse vacaciones de esquí.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 21: Programmieren als neues Schulfach (educacion) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Programmieren als neues Schulfach', 'programmieren-als-neues-schulfach', 'educacion', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In manchen Schulen lernen Kinder jetzt Programmieren. Programmieren bedeutet: Man sagt dem Computer, was er tun soll. Die Kinder schreiben kleine Programme und Spiele.

Das Fach ist neu und die Kinder finden es toll. Sie lernen mit Spielen und bunten Blöcken.'),
    (_text_id, 'B1', 'An immer mehr deutschen Schulen wird Programmieren unterrichtet. Schüler ab der fünften Klasse lernen, wie Computer funktionieren und wie man einfache Programme schreibt. In einigen Bundesländern ist Informatik schon Pflichtfach.

Die Kinder lernen mit speziellen Programmen wie „Scratch", die bunt und spielerisch sind. Später arbeiten sie mit richtigen Programmiersprachen. Experten sagen: Programmieren ist so wichtig wie Lesen und Schreiben.'),
    (_text_id, 'B2', 'Die Einführung von Informatik als Pflichtfach an deutschen Schulen schreitet voran. Bereits sechs Bundesländer haben Informatik als verbindliches Unterrichtsfach ab der fünften Klasse eingeführt. Weitere Länder planen die Einführung zum kommenden Schuljahr.

Der Lehrplan umfasst grundlegende Programmierkonzepte, algorithmisches Denken und den verantwortungsvollen Umgang mit digitalen Medien. In der Unterstufe arbeiten die Schüler mit visuellen Programmierumgebungen wie Scratch, bevor sie in der Mittelstufe textbasierte Sprachen wie Python erlernen.

Die größte Herausforderung bleibt die Versorgung mit qualifizierten Lehrkräften. Laut einer Studie der Bertelsmann-Stiftung fehlen deutschlandweit rund 20.000 Informatiklehrer. Quereinsteiger aus der IT-Branche sollen die Lücke teilweise schließen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('programmieren', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'programar', 'to program', 'Kinder lernen programmieren.', 'Los niños aprenden a programar.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Computer', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el ordenador', 'computer', 'Jedes Kind hat einen Computer.', 'Cada niño tiene un ordenador.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Fach', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la asignatura', 'subject', 'Informatik ist ein neues Fach.', 'Informática es una nueva asignatura.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('lernen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'aprender', 'to learn', 'Die Kinder lernen schnell.', 'Los niños aprenden rápido.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Programm', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el programa', 'program', 'Die Kinder schreiben ein Programm.', 'Los niños escriben un programa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Pflichtfach', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la asignatura obligatoria', 'compulsory subject', 'Informatik ist jetzt Pflichtfach.', 'Informática es ahora asignatura obligatoria.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 22: Austauschschüler in Deutschland (educacion) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Austauschschüler in Deutschland', 'austauschschueler-in-deutschland', 'educacion', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Jedes Jahr kommen viele Schüler aus anderen Ländern nach Deutschland. Sie leben bei einer deutschen Familie und gehen in eine deutsche Schule. Das nennt man „Schüleraustausch".

Die Schüler lernen Deutsch und finden neue Freunde. Es ist aufregend, in einem anderen Land zu leben.'),
    (_text_id, 'B1', 'Jedes Jahr kommen etwa 15.000 Austauschschüler nach Deutschland. Sie leben für ein halbes oder ganzes Jahr bei einer Gastfamilie und besuchen eine deutsche Schule. Die meisten kommen aus den USA, China und Brasilien.

Der Schüleraustausch ist eine besondere Erfahrung. Die Schüler lernen nicht nur Deutsch, sondern auch die deutsche Kultur kennen. Viele sagen, dass der Austausch ihr Leben verändert hat. Auch deutsche Schüler gehen ins Ausland – besonders nach Frankreich, England und die USA.'),
    (_text_id, 'B2', 'Deutschland ist nach den USA das beliebteste Zielland für Austauschschüler weltweit. Jährlich verbringen rund 15.000 internationale Jugendliche ein Semester oder Schuljahr an deutschen Schulen, wobei die größten Kontingente aus den USA, China und Lateinamerika stammen.

Die Austauschorganisationen berichten von einer steigenden Nachfrage nach Programmen, die über den klassischen Schüleraustausch hinausgehen. Beliebt sind insbesondere kürzere Aufenthalte von sechs bis acht Wochen sowie berufsorientierte Programme, bei denen Jugendliche neben dem Schulbesuch Praktika in Betrieben absolvieren.

Studien belegen, dass ehemalige Austauschschüler überdurchschnittlich häufig interkulturelle Berufe ergreifen und höhere Fremdsprachenkompetenzen aufweisen. Die Bundesregierung fördert den Austausch über den Pädagogischen Austauschdienst mit jährlich 50 Millionen Euro.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Austausch', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el intercambio', 'exchange', 'Der Schüleraustausch dauert ein Jahr.', 'El intercambio escolar dura un año.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Gastfamilie', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la familia de acogida', 'host family', 'Meine Gastfamilie ist sehr nett.', 'Mi familia de acogida es muy amable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Ausland', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el extranjero', 'abroad', 'Ich möchte ins Ausland gehen.', 'Quiero irme al extranjero.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Erfahrung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la experiencia', 'experience', 'Es war eine tolle Erfahrung.', 'Fue una experiencia genial.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('kennenlernen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'conocer', 'to get to know', 'Ich lerne die Kultur kennen.', 'Conozco la cultura.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('aufregend', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'emocionante', 'exciting', 'Das Leben im Ausland ist aufregend.', 'La vida en el extranjero es emocionante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 23: Der Kindergarten wird kostenlos (educacion) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Der Kindergarten wird kostenlos', 'der-kindergarten-wird-kostenlos', 'educacion', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In manchen Bundesländern ist der Kindergarten jetzt kostenlos. Eltern müssen kein Geld mehr bezahlen. Das hilft besonders Familien mit wenig Geld.

Im Kindergarten lernen Kinder spielen, malen und mit anderen Kindern zusammen sein. Es gibt Erzieher, die sich um die Kinder kümmern.'),
    (_text_id, 'B1', 'Immer mehr Bundesländer machen den Kindergarten kostenlos. In Berlin, Hamburg und Niedersachsen zahlen Eltern schon nichts mehr. Andere Länder planen das gleiche.

Bisher kostet ein Kindergartenplatz zwischen 0 und 400 Euro im Monat – je nach Bundesland und Einkommen. Besonders Familien mit niedrigem Einkommen profitieren von der neuen Regelung. Experten sagen: Frühe Bildung ist wichtig für die Entwicklung der Kinder.'),
    (_text_id, 'B2', 'Die Debatte um einen kostenfreien Kindergarten für alle hat in Deutschland neuen Schwung bekommen. Bislang haben fünf Bundesländer die Elternbeiträge für die Kindertagesbetreuung vollständig abgeschafft, weitere drei planen entsprechende Reformen.

Die Kosten für einen Kita-Platz variieren stark: Während Eltern in Berlin nichts zahlen, können die Beiträge in Bayern bis zu 400 Euro monatlich betragen. Bildungsforscher kritisieren diese Ungleichheit als sozial ungerecht, da frühkindliche Bildung nachweislich den späteren Bildungserfolg beeinflusst.

Die Finanzierung des kostenfreien Kindergartens ist allerdings umstritten. Kommunen warnen vor einer Überlastung der Kassen und fordern eine stärkere Beteiligung des Bundes. Gleichzeitig fehlen bundesweit rund 400.000 Betreuungsplätze und 100.000 Fachkräfte.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Kindergarten', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la guardería', 'kindergarten', 'Mein Kind geht in den Kindergarten.', 'Mi hijo va a la guardería.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Erzieher', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el educador', 'educator', 'Die Erzieher sind sehr geduldig.', 'Los educadores son muy pacientes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('bezahlen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'pagar', 'to pay', 'Eltern müssen nichts bezahlen.', 'Los padres no tienen que pagar nada.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Bildung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la educacion', 'education', 'Frühe Bildung ist wichtig.', 'La educacion temprana es importante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Kind', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el niño, la niña', 'child', 'Die Kinder spielen im Kindergarten.', 'Los niños juegan en la guardería.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Entwicklung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el desarrollo', 'development', 'Die Entwicklung von Kindern ist wichtig.', 'El desarrollo de los niños es importante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 24: Integrationskurse für Deutsch (educacion) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Integrationskurse: Deutsch lernen für ein neues Leben', 'integrationskurse-deutsch-lernen', 'educacion', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Menschen kommen nach Deutschland und müssen Deutsch lernen. Sie besuchen einen Integrationskurs. Im Kurs lernen sie Deutsch sprechen, lesen und schreiben.

Der Kurs dauert sechs Monate. Man lernt auch über das Leben in Deutschland: Regeln, Kultur und Geschichte.'),
    (_text_id, 'B1', 'Jedes Jahr besuchen Hunderttausende Menschen in Deutschland einen Integrationskurs. Der Kurs besteht aus 600 Stunden Deutschunterricht und 100 Stunden Orientierungskurs. Im Orientierungskurs lernt man über das deutsche Rechtssystem, die Geschichte und die Kultur.

Die Kurse sind für Geflüchtete und andere Zuwanderer. Sie kosten 2,29 Euro pro Stunde, aber viele Teilnehmer zahlen nichts, weil der Staat die Kosten übernimmt. Am Ende gibt es eine Prüfung. Wer besteht, hat bessere Chancen auf dem Arbeitsmarkt.'),
    (_text_id, 'B2', 'Die Integrationskurse des Bundesamts für Migration und Flüchtlinge stellen das zentrale Instrument der sprachlichen Integration in Deutschland dar. Jährlich nehmen über 400.000 Personen an den Kursen teil, die einen 600-stündigen Sprachkurs auf dem Niveau B1 sowie einen 100-stündigen Orientierungskurs umfassen.

Die Erfolgsquote der Abschlussprüfung liegt derzeit bei 60 Prozent. Kritiker bemängeln, dass die Kursqualität stark schwankt und die Lehrkräfte unterbezahlt sind. Das Bundesamt hat daraufhin die Anforderungen an Kursträger verschärft und die Vergütung der Lehrkräfte angehoben.

Neuere Forschungen zeigen, dass der Spracherwerb erheblich vom sozialen Umfeld abhängt. Teilnehmer, die neben dem Kurs regelmäßige Kontakte zu Muttersprachlern pflegen, erreichen deutlich bessere Ergebnisse.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Kurs', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el curso', 'course', 'Ich besuche einen Deutschkurs.', 'Asisto a un curso de alemán.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Sprache', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el idioma', 'language', 'Deutsch ist eine schwierige Sprache.', 'El alemán es un idioma difícil.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Kultur', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la cultura', 'culture', 'Ich lerne die deutsche Kultur kennen.', 'Conozco la cultura alemana.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Geschichte', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la historia', 'history', 'Wir lernen über die deutsche Geschichte.', 'Aprendemos sobre la historia alemana.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('bestehen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'aprobar', 'to pass', 'Ich möchte die Prüfung bestehen.', 'Quiero aprobar el examen.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Teilnehmer', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el participante', 'participant', 'Es gibt 20 Teilnehmer im Kurs.', 'Hay 20 participantes en el curso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 25: Digitale Schulbücher ersetzen Papier (educacion) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Digitale Schulbücher ersetzen Papier', 'digitale-schulbuecher-ersetzen-papier', 'educacion', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In manchen Schulen gibt es keine Bücher aus Papier mehr. Die Schüler haben Tablets. Alle Bücher sind auf dem Tablet.

Die Tablets sind leichter als viele Bücher. Die Schüler finden es gut. Aber manche Lehrer mögen noch Bücher aus Papier.'),
    (_text_id, 'B1', 'An immer mehr Schulen in Deutschland werden Tablets statt Schulbücher benutzt. Die Schüler bekommen ein Tablet und alle Bücher sind digital. Die schwere Schultasche gehört dann der Vergangenheit an.

Die Vorteile sind klar: Tablets sind leichter, die Inhalte können aktualisiert werden und es gibt interaktive Übungen. Ein Problem: Nicht alle Familien haben zu Hause gutes Internet. Außerdem sind die Tablets teuer – zwischen 300 und 500 Euro pro Stück.'),
    (_text_id, 'B2', 'Die Digitalisierung des Schulunterrichts macht in Deutschland Fortschritte. Rund 30 Prozent der weiterführenden Schulen haben mittlerweile auf digitale Lehrwerke umgestellt oder planen dies für das kommende Schuljahr. Große Schulbuchverlage bieten ihre gesamten Reihen inzwischen parallel in digitaler Form an.

Die Vorteile digitaler Lehrmittel liegen auf der Hand: Sie können fortlaufend aktualisiert werden, bieten interaktive Elemente wie Videos und Simulationen und reduzieren das Gewicht der Schultasche erheblich. Studien zeigen zudem, dass multimediale Inhalte den Lernerfolg in bestimmten Fächern steigern können.

Kritiker verweisen auf die digitale Kluft: Nicht alle Schüler verfügen zu Hause über geeignete Geräte und eine stabile Internetverbindung. Bildungsforscher warnen außerdem davor, dass das Lesen langer Texte am Bildschirm zu oberflächlicherem Verständnis führen kann.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Schulbuch', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el libro de texto', 'textbook', 'Das Schulbuch ist sehr dick.', 'El libro de texto es muy grueso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Tablet', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la tableta', 'tablet', 'Die Schüler arbeiten mit Tablets.', 'Los alumnos trabajan con tabletas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('digital', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'digital', 'digital', 'Digitale Bücher sind leichter.', 'Los libros digitales son más ligeros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('leicht', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ligero', 'light', 'Das Tablet ist leicht.', 'La tableta es ligera.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Übung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el ejercicio', 'exercise', 'Die digitalen Übungen machen Spaß.', 'Los ejercicios digitales son divertidos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Internet', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'internet', 'internet', 'Zu Hause braucht man gutes Internet.', 'En casa se necesita buen internet.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 26: Energiepreise steigen stark (economia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Energiepreise steigen stark', 'energiepreise-steigen-stark', 'economia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Strom und Gas sind in Deutschland teurer geworden. Viele Familien müssen jetzt mehr für Energie bezahlen. Das ist ein Problem, besonders für Familien mit wenig Geld.

Die Regierung hilft: Es gibt 300 Euro extra für jeden. Aber viele Menschen sagen: Das ist nicht genug.'),
    (_text_id, 'B1', 'Die Energiepreise in Deutschland sind in den letzten zwei Jahren stark gestiegen. Strom kostet jetzt im Durchschnitt 40 Cent pro Kilowattstunde. Gas ist 50 Prozent teurer als vor zwei Jahren.

Die Bundesregierung hat mehrere Entlastungspakete beschlossen. Dazu gehören eine Gaspreisbremse, ein Strompreisdeckel und Einmalzahlungen für Bürger. Trotzdem müssen viele Haushalte sparen: weniger heizen, kürzer duschen, Licht ausmachen.'),
    (_text_id, 'B2', 'Die Energiekrise hat die deutschen Verbraucher hart getroffen. Die Strompreise lagen im Jahresdurchschnitt bei 40 Cent pro Kilowattstunde und damit rund 60 Prozent über dem Niveau von vor drei Jahren. Auch die Gaskosten haben sich für viele Haushalte nahezu verdoppelt.

Um die Belastung abzufedern, hat die Bundesregierung Entlastungsmaßnahmen im Gesamtvolumen von über 200 Milliarden Euro beschlossen. Kernelemente waren die Strom- und Gaspreisbremse, die die Kosten für einen Grundverbrauch deckelte.

Langfristig soll der beschleunigte Ausbau erneuerbarer Energien die Abhängigkeit von fossilen Brennstoffen reduzieren und die Preise stabilisieren. Energieexperten prognostizieren allerdings, dass die Preise frühestens in drei Jahren wieder auf das Vorkrisenniveau sinken werden.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Preis', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el precio', 'price', 'Die Preise steigen stark.', 'Los precios suben mucho.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Strom', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la electricidad', 'electricity', 'Strom ist teuer geworden.', 'La electricidad se ha encarecido.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Gas', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el gas', 'gas', 'Wir heizen mit Gas.', 'Calentamos con gas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('heizen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'calentar, calefaccionar', 'to heat', 'Im Winter müssen wir heizen.', 'En invierno tenemos que calentar.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sparen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ahorrar', 'to save', 'Wir müssen Energie sparen.', 'Debemos ahorrar energía.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('bezahlen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'pagar', 'to pay', 'Ich muss mehr für Strom bezahlen.', 'Tengo que pagar más por electricidad.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 27: Wohnungen in der Stadt sind knapp (economia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Wohnungen in der Stadt sind knapp', 'wohnungen-in-der-stadt-sind-knapp', 'economia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In großen Städten gibt es nicht genug Wohnungen. Viele Menschen suchen eine Wohnung, aber sie finden keine. Die Mieten sind sehr hoch.

In Berlin kostet eine kleine Wohnung 800 Euro im Monat. In München sogar 1.200 Euro. Das ist für viele zu viel Geld.'),
    (_text_id, 'B1', 'Der Wohnungsmarkt in Deutschland ist angespannt. In Städten wie Berlin, München und Hamburg fehlen Hunderttausende Wohnungen. Die durchschnittliche Miete für eine Zwei-Zimmer-Wohnung liegt in München bei 1.200 Euro kalt.

Das Problem: Es wird zu wenig gebaut. Im letzten Jahr wurden nur 250.000 neue Wohnungen fertiggestellt. Geplant waren 400.000. Gründe sind hohe Baukosten, Mangel an Handwerkern und komplizierte Genehmigungsverfahren.'),
    (_text_id, 'B2', 'Die Wohnungsnot in deutschen Großstädten verschärft sich weiter. Laut dem Institut der deutschen Wirtschaft fehlen bundesweit rund 700.000 Wohnungen, wobei die Lücke in Ballungsräumen am größten ist. In München liegt die durchschnittliche Angebotsmiete für Neuvermietungen bei über 20 Euro pro Quadratmeter.

Die Bundesregierung hatte das Ziel von 400.000 neuen Wohnungen pro Jahr ausgegeben, verfehlt dieses Ziel jedoch deutlich. Im vergangenen Jahr wurden lediglich 250.000 Wohneinheiten fertiggestellt – ein Rückgang von 15 Prozent gegenüber dem Vorjahr.

Als Ursachen gelten die gestiegenen Baukosten, der Fachkräftemangel im Baugewerbe und langwierige Genehmigungsverfahren. Mieterschutzverbände fordern eine Verschärfung der Mietpreisbremse und die Enteignung großer Wohnungskonzerne nach dem Berliner Vorbild.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Wohnung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el piso, el apartamento', 'apartment', 'Ich suche eine Wohnung in Berlin.', 'Busco un piso en Berlín.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Miete', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el alquiler', 'rent', 'Die Miete ist zu hoch.', 'El alquiler es demasiado alto.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('suchen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'buscar', 'to search', 'Wir suchen eine neue Wohnung.', 'Buscamos un nuevo piso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('bauen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'construir', 'to build', 'Die Stadt muss mehr Wohnungen bauen.', 'La ciudad debe construir más pisos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Quadratmeter', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el metro cuadrado', 'square meter', 'Die Miete kostet 20 Euro pro Quadratmeter.', 'El alquiler cuesta 20 euros por metro cuadrado.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('knapp', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'escaso', 'scarce', 'Wohnungen sind in Berlin knapp.', 'Los pisos escasean en Berlín.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 28: Minijobs sind bei Studenten beliebt (economia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Minijobs sind bei Studenten beliebt', 'minijobs-sind-bei-studenten-beliebt', 'economia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Studenten in Deutschland haben einen Minijob. Ein Minijob bringt maximal 520 Euro im Monat. Man zahlt keine Steuern.

Studenten arbeiten zum Beispiel in Cafés, Supermärkten oder als Nachhilfelehrer. Das Geld hilft beim Studium.'),
    (_text_id, 'B1', 'Fast zwei Drittel aller Studierenden in Deutschland arbeiten neben dem Studium. Am beliebtesten sind Minijobs, bei denen man bis zu 520 Euro im Monat verdient, ohne Steuern zu zahlen.

Typische Studentenjobs sind Kellnern, Nachhilfe geben, im Einzelhandel arbeiten oder als Werkstudent in einer Firma. Viele Arbeitgeber schätzen Studenten als flexible Mitarbeiter. Aber Experten warnen: Zu viel Arbeit neben dem Studium kann den Abschluss verzögern.'),
    (_text_id, 'B2', 'Rund 65 Prozent der Studierenden in Deutschland gehen einer Erwerbstätigkeit nach, um ihr Studium zu finanzieren. Die populärste Beschäftigungsform ist der Minijob auf 520-Euro-Basis, der von der Einkommensteuer befreit ist.

Seit der Anhebung der Minijob-Grenze von 450 auf 520 Euro ist die Zahl der geringfügig Beschäftigten unter Studierenden nochmals gestiegen. Besonders gefragt sind Tätigkeiten in der Gastronomie, im Einzelhandel und in der Nachhilfe.

Arbeitsmarktforscher weisen auf ein Dilemma hin: Einerseits sammeln arbeitende Studierende wertvolle Berufserfahrung, andererseits zeigen Statistiken, dass diejenigen, die mehr als 20 Stunden pro Woche arbeiten, signifikant längere Studienzeiten haben.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Minijob', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el miniempleo', 'mini job', 'Mein Minijob ist im Café.', 'Mi miniempleo es en una cafetería.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Student', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el estudiante', 'student', 'Viele Studenten haben einen Job.', 'Muchos estudiantes tienen un trabajo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Steuer', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el impuesto', 'tax', 'Beim Minijob zahlt man keine Steuern.', 'En el miniempleo no se pagan impuestos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verdienen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'ganar (dinero)', 'to earn', 'Ich verdiene 520 Euro im Monat.', 'Gano 520 euros al mes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Studium', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'los estudios', 'studies', 'Das Studium kostet viel Geld.', 'Los estudios cuestan mucho dinero.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Arbeitgeber', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el empleador', 'employer', 'Mein Arbeitgeber ist sehr nett.', 'Mi empleador es muy amable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 29: Start-ups boomen in Berlin (economia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Start-ups boomen in Berlin', 'start-ups-boomen-in-berlin', 'economia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Berlin ist die Start-up-Hauptstadt von Deutschland. Viele junge Menschen gründen dort Firmen. Sie haben neue Ideen und wollen etwas Neues machen.

Start-ups machen zum Beispiel Apps, Websites oder neue Technologie. Manche werden sehr groß und erfolgreich.'),
    (_text_id, 'B1', 'Berlin ist Europas drittgrößter Standort für Start-ups. Jedes Jahr werden dort über 500 neue Unternehmen gegründet. Besonders beliebt sind die Bereiche Technologie, E-Commerce und Nachhaltigkeit.

Was Berlin attraktiv macht: Die Mieten für Büros sind günstiger als in London oder Paris. Außerdem gibt es viele internationale Fachkräfte. Die Regierung unterstützt Gründer mit Förderprogrammen und günstigen Krediten. Bekannte Berliner Start-ups sind zum Beispiel Delivery Hero und N26.'),
    (_text_id, 'B2', 'Berlin hat sich als einer der führenden Start-up-Standorte Europas etabliert. Im vergangenen Jahr wurden in der Hauptstadt über 500 neue Technologieunternehmen gegründet, die zusammen Wagniskapital in Höhe von 5,3 Milliarden Euro einwarben.

Das Berliner Ökosystem profitiert von mehreren Standortfaktoren: vergleichsweise niedrige Büro- und Lebenshaltungskosten, ein großer Pool internationaler Fachkräfte und eine lebendige Gründerkultur. Der Senat fördert Start-ups zudem mit dem Programm „Berlin Startup Stipendium", das Gründern ein Jahr lang monatlich 2.000 Euro zur Verfügung stellt.

Herausforderungen bleiben der Fachkräftemangel in der IT und die im internationalen Vergleich restriktive Regulierung. Branchenverbände fordern eine vereinfachte Visavergabe für ausländische Fachkräfte und eine steuerliche Besserstellung von Mitarbeiter-Beteiligungen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Unternehmen', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la empresa', 'company', 'Ich gründe ein Unternehmen.', 'Fundo una empresa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('gründen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'fundar', 'to found', 'Viele junge Menschen gründen Firmen.', 'Muchos jóvenes fundan empresas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Idee', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la idea', 'idea', 'Sie hat eine tolle Idee für eine App.', 'Tiene una idea genial para una app.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('erfolgreich', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'exitoso', 'successful', 'Das Start-up ist sehr erfolgreich.', 'La start-up es muy exitosa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Gründer', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el fundador', 'founder', 'Der Gründer kommt aus Berlin.', 'El fundador viene de Berlín.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('unterstützen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'apoyar', 'to support', 'Die Regierung unterstützt Gründer.', 'El gobierno apoya a los fundadores.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 30: Weihnachtsmärkte bringen Milliarden (economia) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Weihnachtsmärkte bringen Milliarden', 'weihnachtsmaerkte-bringen-milliarden', 'economia', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Im Dezember gibt es in Deutschland viele Weihnachtsmärkte. Die Menschen trinken Glühwein und essen Bratwurst. Sie kaufen Geschenke und Weihnachtsschmuck.

Die Weihnachtsmärkte sind sehr schön. Es gibt Lichter, Musik und den Geruch von Zimt und Lebkuchen.'),
    (_text_id, 'B1', 'Weihnachtsmärkte gehören zu den beliebtesten Traditionen in Deutschland. Jedes Jahr besuchen rund 160 Millionen Menschen die mehr als 2.500 Weihnachtsmärkte im Land. Die bekanntesten sind in Nürnberg, Dresden und Köln.

Die Märkte sind auch wirtschaftlich wichtig. Die Besucher geben insgesamt fünf Milliarden Euro aus – für Glühwein, Bratwurst, Süßigkeiten und Geschenke. Für viele kleine Händler und Schausteller ist die Weihnachtszeit die wichtigste Saison des Jahres.'),
    (_text_id, 'B2', 'Die deutschen Weihnachtsmärkte haben sich zu einem bedeutenden Wirtschaftsfaktor entwickelt. Mit einem geschätzten Gesamtumsatz von fünf Milliarden Euro und rund 160 Millionen Besuchern jährlich zählen sie zu den umsatzstärksten Veranstaltungen des Einzelhandels.

Die über 2.500 Weihnachtsmärkte ziehen zudem Millionen internationaler Touristen an. Der Nürnberger Christkindlesmarkt, der Dresdner Striezelmarkt und der Kölner Weihnachtsmarkt gehören zu den bekanntesten weltweit. Städte wie Rothenburg ob der Tauber vermarkten ihre historischen Altstädte als „Weihnachtswunderland" für asiatische und amerikanische Reisegruppen.

Die steigenden Energiekosten stellen die Veranstalter jedoch vor Herausforderungen. Mehrere Städte haben angekündigt, die Beleuchtung zu reduzieren und auf LED-Technik umzustellen, um Kosten und Klimabilanz zu verbessern.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Weihnachtsmarkt', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el mercadillo navideño', 'Christmas market', 'Ich liebe den Weihnachtsmarkt.', 'Me encanta el mercadillo navideño.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Glühwein', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el vino caliente', 'mulled wine', 'Auf dem Weihnachtsmarkt trinke ich Glühwein.', 'En el mercadillo navideño bebo vino caliente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Geschenk', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el regalo', 'gift', 'Ich kaufe Geschenke für meine Familie.', 'Compro regalos para mi familia.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Tradition', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la tradición', 'tradition', 'Weihnachtsmärkte sind eine Tradition.', 'Los mercadillos navideños son una tradición.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Besucher', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el visitante', 'visitor', 'Es gibt viele Besucher.', 'Hay muchos visitantes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('kaufen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'comprar', 'to buy', 'Ich kaufe einen Lebkuchen.', 'Compro un pan de jengibre.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 31: Homeoffice bleibt beliebt (trabajo) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Homeoffice bleibt beliebt', 'homeoffice-bleibt-beliebt', 'trabajo', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Menschen in Deutschland arbeiten von zu Hause. Das heißt „Homeoffice". Sie brauchen nur einen Computer und Internet.

Homeoffice hat Vorteile: Man fährt nicht zur Arbeit und hat mehr Zeit. Aber manchmal ist es auch einsam.'),
    (_text_id, 'B1', 'Seit der Corona-Pandemie arbeiten viele Deutsche im Homeoffice. Eine Studie zeigt: 25 Prozent der Beschäftigten arbeiten mindestens teilweise von zu Hause. Vor der Pandemie waren es nur 5 Prozent.

Viele Arbeitnehmer wollen das Homeoffice behalten. Sie schätzen die Flexibilität und sparen Zeit durch den Wegfall des Pendelns. Aber nicht alle Chefs sind begeistert: Manche fürchten, dass die Teamarbeit leidet. Ein Kompromiss sind hybride Modelle – drei Tage im Büro, zwei zu Hause.'),
    (_text_id, 'B2', 'Das Homeoffice hat sich in der deutschen Arbeitswelt dauerhaft etabliert. Laut dem ifo-Institut arbeiten derzeit 25 Prozent aller Beschäftigten mindestens einen Tag pro Woche von zu Hause – fünfmal so viele wie vor der Pandemie.

Die Mehrheit der Unternehmen hat inzwischen hybride Arbeitsmodelle eingeführt, die Büro- und Heimarbeit kombinieren. Das gängigste Modell sind drei Bürotage und zwei Homeoffice-Tage. Studien zeigen, dass diese Regelung sowohl die Zufriedenheit der Mitarbeiter als auch die Produktivität steigert.

Diskutiert wird aktuell ein gesetzliches Recht auf Homeoffice. Während Gewerkschaften und Teile der SPD dies befürworten, lehnen Arbeitgeberverbände einen Rechtsanspruch ab und plädieren für betriebliche Vereinbarungen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Homeoffice', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el teletrabajo', 'home office', 'Ich arbeite heute im Homeoffice.', 'Hoy trabajo desde casa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('arbeiten', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'trabajar', 'to work', 'Ich arbeite von zu Hause.', 'Trabajo desde casa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Computer', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el ordenador', 'computer', 'Ich brauche meinen Computer für die Arbeit.', 'Necesito mi ordenador para el trabajo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Flexibilität', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la flexibilidad', 'flexibility', 'Homeoffice bietet viel Flexibilität.', 'El teletrabajo ofrece mucha flexibilidad.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Büro', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la oficina', 'office', 'Drei Tage bin ich im Büro.', 'Tres días estoy en la oficina.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Zeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el tiempo', 'time', 'Ich spare viel Zeit.', 'Ahorro mucho tiempo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 32: Die Vier-Tage-Woche kommt (trabajo) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Die Vier-Tage-Woche kommt', 'die-vier-tage-woche-kommt', 'trabajo', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In manchen Firmen arbeitet man nur vier Tage in der Woche. Freitag ist frei. Die Mitarbeiter sind glücklich.

Vier Tage arbeiten und drei Tage frei – das klingt gut. Manche Firmen sagen: Die Mitarbeiter arbeiten besser, wenn sie mehr Freizeit haben.'),
    (_text_id, 'B1', 'Die Vier-Tage-Woche wird in Deutschland getestet. 50 Unternehmen nehmen an einem Pilotprojekt teil. Die Mitarbeiter arbeiten von Montag bis Donnerstag und haben am Freitag frei. Das Gehalt bleibt gleich.

Die ersten Ergebnisse sind positiv: Die Mitarbeiter sind zufriedener, weniger krank und genauso produktiv. Aber nicht alle Branchen können das umsetzen – im Krankenhaus oder im Supermarkt zum Beispiel ist das schwierig.'),
    (_text_id, 'B2', 'Die Vier-Tage-Woche gewinnt in Deutschland an Dynamik. Ein Pilotprojekt mit 50 teilnehmenden Unternehmen hat vielversprechende Zwischenergebnisse geliefert: Die Produktivität blieb stabil, die Krankheitstage sanken um 20 Prozent und die Mitarbeiterzufriedenheit stieg deutlich an.

Das Modell sieht vor, dass die Wochenarbeitszeit bei vollem Lohnausgleich von 40 auf 32 Stunden reduziert wird. In Großbritannien und Island haben ähnliche Versuche bereits Erfolge gezeigt und zu dauerhaften Einführungen geführt.

Skeptiker aus der Wirtschaft warnen vor Wettbewerbsnachteilen und steigenden Personalkosten. Besonders in Branchen mit Schichtarbeit oder Kundenkontakt sei eine Umsetzung kaum möglich. Befürworter entgegnen, dass der Fachkräftemangel Unternehmen ohnehin zwinge, attraktivere Arbeitsbedingungen zu schaffen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Woche', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la semana', 'week', 'Ich arbeite vier Tage pro Woche.', 'Trabajo cuatro días por semana.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Mitarbeiter', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el empleado', 'employee', 'Die Mitarbeiter sind zufrieden.', 'Los empleados están satisfechos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Gehalt', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el sueldo', 'salary', 'Das Gehalt bleibt gleich.', 'El sueldo sigue igual.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('zufrieden', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'satisfecho', 'satisfied', 'Die Mitarbeiter sind zufrieden.', 'Los empleados están satisfechos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('frei', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'libre', 'free', 'Am Freitag bin ich frei.', 'El viernes estoy libre.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Freizeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el tiempo libre', 'free time', 'Mehr Freizeit macht glücklich.', 'Más tiempo libre hace feliz.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 33: Ausbildung statt Studium (trabajo) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Ausbildung statt Studium', 'ausbildung-statt-studium', 'trabajo', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Nicht alle jungen Menschen in Deutschland gehen zur Universität. Viele machen eine Ausbildung. In der Ausbildung lernt man einen Beruf. Man arbeitet in einer Firma und geht zur Berufsschule.

Die Ausbildung dauert drei Jahre. Danach hat man einen Beruf und kann arbeiten.'),
    (_text_id, 'B1', 'In Deutschland gibt es ein besonderes System: die duale Ausbildung. Junge Menschen lernen gleichzeitig in einer Firma und in der Berufsschule. Es gibt über 300 verschiedene Ausbildungsberufe, zum Beispiel Bäcker, Mechaniker oder Krankenpfleger.

Die Ausbildung dauert zwei bis drei Jahre. Während der Ausbildung bekommt man ein Gehalt – zwischen 800 und 1.200 Euro im Monat. Experten sagen: Eine gute Ausbildung ist genauso wertvoll wie ein Studium. Viele Firmen suchen dringend Auszubildende.'),
    (_text_id, 'B2', 'Das duale Ausbildungssystem gilt international als Vorzeigemodell und wird von zahlreichen Ländern kopiert. In Deutschland beginnen jährlich rund 500.000 Jugendliche eine berufliche Ausbildung, bei der sie praktische Erfahrung im Betrieb mit theoretischem Unterricht an der Berufsschule verbinden.

Dennoch steht das System vor Herausforderungen: Seit Jahren sinkt die Zahl der Ausbildungsverträge, weil immer mehr Schulabgänger ein Hochschulstudium bevorzugen. Gleichzeitig bleiben 70.000 Ausbildungsplätze unbesetzt, vor allem im Handwerk, in der Gastronomie und in der Pflege.

Um die berufliche Ausbildung attraktiver zu machen, hat die Bundesregierung die Mindestausbildungsvergütung auf 620 Euro im ersten Lehrjahr angehoben und ermöglicht es Auszubildenden, einen Teil ihrer Ausbildung im Ausland zu absolvieren.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Ausbildung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la formación profesional', 'apprenticeship', 'Ich mache eine Ausbildung als Koch.', 'Hago una formación profesional como cocinero.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Beruf', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la profesión', 'profession', 'Koch ist ein schöner Beruf.', 'Cocinero es una bonita profesión.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Firma', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la empresa', 'company', 'Ich arbeite in einer großen Firma.', 'Trabajo en una gran empresa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Berufsschule', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la escuela de formación profesional', 'vocational school', 'Ich gehe zur Berufsschule.', 'Voy a la escuela de formación profesional.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Auszubildende', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el aprendiz', 'apprentice', 'Wir haben drei Auszubildende.', 'Tenemos tres aprendices.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('dauern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'durar', 'to last', 'Die Ausbildung dauert drei Jahre.', 'La formación dura tres años.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 34: Berufswechsel mit 40 (trabajo) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Berufswechsel mit 40', 'berufswechsel-mit-40', 'trabajo', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Manche Menschen wechseln ihren Beruf, wenn sie älter sind. Sie sind 40 oder 50 Jahre alt und lernen etwas Neues. Das ist mutig, aber es funktioniert oft gut.

Zum Beispiel: Eine Lehrerin wird Programmiererin. Oder ein Banker wird Koch. Für einen neuen Beruf ist es nie zu spät.'),
    (_text_id, 'B1', 'Immer mehr Deutsche wagen den Berufswechsel in der Lebensmitte. Eine Umfrage zeigt: 30 Prozent der über 40-Jährigen denken über einen neuen Beruf nach. Die Gründe sind verschieden: mangelnde Zufriedenheit, gesundheitliche Probleme oder der Wunsch nach mehr Sinn.

Umschulungen helfen beim Wechsel. Die Agentur für Arbeit bezahlt viele Kurse. Besonders gefragt sind Berufe im IT-Bereich, in der Pflege und im Handwerk. Experten sagen: Ein Berufswechsel ist keine Niederlage, sondern eine Chance.'),
    (_text_id, 'B2', 'Der Berufswechsel in der Lebensmitte wird in Deutschland zunehmend zur Normalität. Laut einer Studie des Karrierenetzwerks XING erwägen 30 Prozent der Beschäftigten über 40 einen grundlegenden Berufswechsel. Die häufigsten Auslöser sind Unzufriedenheit, Burnout-Erfahrungen und der Wunsch nach sinnstiftender Tätigkeit.

Die Bundesagentur für Arbeit unterstützt Berufswechsler durch finanzierte Umschulungen und Bildungsgutscheine. Besonders nachgefragt sind Umschulungen in den Bereichen IT, Pflege und erneuerbare Energien – allesamt Branchen mit Fachkräftemangel.

Arbeitspsychologen betonen, dass ein Quereinstieg durchaus Vorteile bieten kann: Die Lebenserfahrung und die im früheren Beruf erworbenen Soft Skills werden von vielen Arbeitgebern geschätzt. Entscheidend sei eine realistische Planung und die Bereitschaft, vorübergehend finanzielle Einbußen hinzunehmen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Berufswechsel', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el cambio de profesión', 'career change', 'Ein Berufswechsel ist manchmal nötig.', 'Un cambio de profesión a veces es necesario.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('wechseln', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'cambiar', 'to change', 'Sie wechselt ihren Beruf.', 'Ella cambia de profesión.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('mutig', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'valiente', 'brave', 'Ein Berufswechsel ist mutig.', 'Un cambio de profesión es valiente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Chance', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la oportunidad', 'opportunity', 'Ein Wechsel ist eine Chance.', 'Un cambio es una oportunidad.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Umschulung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la recualificación', 'retraining', 'Die Umschulung dauert zwei Jahre.', 'La recualificación dura dos años.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Zufriedenheit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la satisfacción', 'satisfaction', 'Die Zufriedenheit ist wichtiger als Geld.', 'La satisfacción es más importante que el dinero.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 35: Der Mindestlohn steigt (trabajo) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Der Mindestlohn steigt', 'der-mindestlohn-steigt', 'trabajo', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland gibt es einen Mindestlohn. Das ist das Minimum, was ein Arbeiter pro Stunde bekommt. Der Mindestlohn ist jetzt 12,41 Euro pro Stunde.

Manche Menschen finden: Das ist zu wenig. Andere sagen: Wenn der Mindestlohn steigt, werden Sachen teurer.'),
    (_text_id, 'B1', 'Der gesetzliche Mindestlohn in Deutschland ist auf 12,41 Euro pro Stunde gestiegen. Etwa sechs Millionen Beschäftigte profitieren davon. Vor allem Frauen und Beschäftigte in Ostdeutschland bekommen durch die Erhöhung mehr Geld.

Die Gewerkschaften fordern einen Mindestlohn von 15 Euro. Sie argumentieren, dass man mit 12,41 Euro in teuren Städten kaum leben kann. Arbeitgeber warnen hingegen, dass ein zu hoher Mindestlohn kleine Firmen in Schwierigkeiten bringen kann.'),
    (_text_id, 'B2', 'Die Mindestlohnkommission hat eine Anhebung des gesetzlichen Mindestlohns auf 12,41 Euro pro Stunde beschlossen. Von der Erhöhung profitieren rund sechs Millionen Beschäftigte, vorwiegend im Einzelhandel, in der Gastronomie und in der Gebäudereinigung.

Die politische Debatte um die Höhe des Mindestlohns hält an. Gewerkschaften und Sozialverbände fordern eine Anhebung auf 15 Euro, um Vollzeitbeschäftigten ein existenzsicherndes Einkommen zu ermöglichen. Die Mindestlohnkommission orientiert sich hingegen an der Tarifentwicklung und warnt vor negativen Beschäftigungseffekten.

Ökonomen sind sich über die Auswirkungen des Mindestlohns uneins. Während einige Studien einen moderaten Rückgang geringfügiger Beschäftigung zeigen, hat die Einführung des Mindestlohns 2015 entgegen vieler Prognosen nicht zu einem signifikanten Anstieg der Arbeitslosigkeit geführt.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Mindestlohn', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el salario mínimo', 'minimum wage', 'Der Mindestlohn beträgt 12,41 Euro.', 'El salario mínimo es de 12,41 euros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Stunde', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la hora', 'hour', 'Er verdient 12 Euro pro Stunde.', 'Gana 12 euros por hora.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Gewerkschaft', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el sindicato', 'trade union', 'Die Gewerkschaft fordert mehr Geld.', 'El sindicato exige más dinero.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Erhöhung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el aumento', 'increase', 'Die Erhöhung hilft vielen Menschen.', 'El aumento ayuda a muchas personas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('fordern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'exigir', 'to demand', 'Die Gewerkschaften fordern 15 Euro.', 'Los sindicatos exigen 15 euros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Beschäftigte', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el trabajador, el empleado', 'employee', 'Sechs Millionen Beschäftigte profitieren.', 'Seis millones de empleados se benefician.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 36: Kinder essen zu viel Zucker (salud) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Kinder in Deutschland essen zu viel Zucker', 'kinder-essen-zu-viel-zucker', 'salud', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Kinder in Deutschland essen zu viel Zucker. Sie trinken süße Getränke und essen Süßigkeiten. Das ist nicht gesund.

Ärzte sagen: Kinder sollen weniger Zucker essen. Obst und Gemüse sind besser. Eltern sollen aufpassen, was die Kinder essen.'),
    (_text_id, 'B1', 'Eine neue Studie zeigt: Kinder in Deutschland essen doppelt so viel Zucker wie empfohlen. Besonders Limonade, Schokolade und Kekse sind beliebt. Im Durchschnitt essen Kinder 60 Gramm Zucker am Tag – empfohlen sind nur 25 Gramm.

Ärzte warnen vor den Folgen: Übergewicht, schlechte Zähne und Diabetes. Experten fordern ein Werbeverbot für Süßigkeiten in Kindersendungen. Auch in Schulen soll es gesünderes Essen geben.'),
    (_text_id, 'B2', 'Der Konsum von Zucker bei Kindern und Jugendlichen in Deutschland liegt laut einer aktuellen Studie der Universität Bonn weit über den Empfehlungen der Weltgesundheitsorganisation. Sechs- bis Zwölfjährige nehmen durchschnittlich 60 Gramm freien Zucker pro Tag zu sich – die WHO empfiehlt maximal 25 Gramm.

Besonders problematisch sind gesüßte Getränke, die allein fast ein Drittel der täglichen Zuckerzufuhr ausmachen. Langfristig erhöht ein hoher Zuckerkonsum das Risiko für Übergewicht, Typ-2-Diabetes und Karies erheblich.

Der Bundesgesundheitsminister plant daher eine Zuckersteuer auf Softdrinks nach dem Vorbild Großbritanniens. Die Lebensmittelindustrie lehnt dies ab und verweist auf freiwillige Reduktionsprogramme.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Zucker', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el azúcar', 'sugar', 'Zu viel Zucker ist ungesund.', 'Demasiado azúcar no es saludable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Süßigkeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el dulce, la golosina', 'sweets', 'Kinder lieben Süßigkeiten.', 'Los niños adoran las golosinas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Übergewicht', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el sobrepeso', 'overweight', 'Übergewicht ist ein Problem.', 'El sobrepeso es un problema.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('empfehlen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'recomendar', 'to recommend', 'Ärzte empfehlen weniger Zucker.', 'Los médicos recomiendan menos azúcar.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Getränk', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la bebida', 'drink', 'Süße Getränke haben viel Zucker.', 'Las bebidas dulces tienen mucho azúcar.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Arzt', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el médico', 'doctor', 'Der Arzt sagt: weniger Zucker.', 'El médico dice: menos azúcar.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 37: Psychische Gesundheit bei Jugendlichen (salud) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Psychische Gesundheit bei Jugendlichen', 'psychische-gesundheit-bei-jugendlichen', 'salud', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Jugendliche in Deutschland fühlen sich gestresst. Die Schule, soziale Medien und die Zukunft machen Sorgen. Manche sind traurig oder haben Angst.

Es ist wichtig, über seine Gefühle zu sprechen. Es gibt Hilfe für Jugendliche: Man kann zum Beispiel anrufen und mit jemandem sprechen.'),
    (_text_id, 'B1', 'Die psychische Gesundheit von Jugendlichen hat sich in Deutschland verschlechtert. Laut einer Studie leidet jeder fünfte Jugendliche an Angstzuständen oder Depressionen. Besonders nach der Corona-Pandemie sind die Zahlen gestiegen.

Experten sehen mehrere Ursachen: Leistungsdruck in der Schule, Cybermobbing und übermäßige Nutzung sozialer Medien. Aber es gibt auch gute Nachrichten: Es wird mehr über das Thema gesprochen. Schulen bieten jetzt Beratung an, und die Kinder- und Jugendtelefon-Hotline bekommt mehr Anrufe.'),
    (_text_id, 'B2', 'Die psychische Gesundheit von Kindern und Jugendlichen in Deutschland gibt zunehmend Anlass zur Sorge. Laut der COPSY-Studie des Universitätsklinikums Hamburg-Eppendorf zeigen 23 Prozent der Kinder und Jugendlichen psychische Auffälligkeiten – ein deutlicher Anstieg gegenüber der Vor-Pandemie-Zeit.

Als Hauptbelastungsfaktoren identifizieren Psychologen den zunehmenden Leistungsdruck, die Auswirkungen sozialer Medien auf das Selbstbild und die Verunsicherung durch globale Krisen wie Klimawandel und geopolitische Konflikte.

Die Bundesregierung hat ein Aktionsprogramm für psychische Gesundheit mit einem Budget von 100 Millionen Euro aufgelegt. Geplant sind unter anderem niedrigschwellige Beratungsangebote an Schulen, eine Verbesserung der psychotherapeutischen Versorgung und Präventionsprogramme ab dem Grundschulalter.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Gesundheit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la salud', 'health', 'Gesundheit ist das Wichtigste.', 'La salud es lo más importante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Angst', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el miedo, la ansiedad', 'fear, anxiety', 'Manche Jugendliche haben Angst.', 'Algunos jóvenes tienen miedo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('traurig', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'triste', 'sad', 'Manchmal bin ich traurig.', 'A veces estoy triste.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sprechen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'hablar', 'to speak', 'Es ist wichtig, über Gefühle zu sprechen.', 'Es importante hablar sobre los sentimientos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Gefühl', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el sentimiento', 'feeling', 'Jedes Gefühl ist wichtig.', 'Cada sentimiento es importante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Stress', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el estrés', 'stress', 'Schule macht manchmal Stress.', 'La escuela a veces causa estrés.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 38: Krankenhäuser brauchen mehr Personal (salud) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Krankenhäuser brauchen mehr Personal', 'krankenhaeuser-brauchen-mehr-personal', 'salud', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In deutschen Krankenhäusern fehlen Pfleger und Ärzte. Die Arbeit ist schwer und die Bezahlung ist nicht gut genug. Viele Pfleger hören auf.

Die Patienten müssen manchmal lange warten. Die Regierung will mehr Geld für Krankenhäuser ausgeben.'),
    (_text_id, 'B1', 'Deutsche Krankenhäuser haben ein großes Problem: Es fehlen über 100.000 Pflegekräfte. Die Arbeit in der Pflege ist körperlich und psychisch anstrengend. Viele Pflegekräfte arbeiten in Teilzeit oder verlassen den Beruf ganz.

Um neue Mitarbeiter zu finden, bieten Krankenhäuser jetzt höhere Gehälter und bessere Arbeitsbedingungen an. Auch Pflegekräfte aus dem Ausland werden angeworben, besonders aus den Philippinen und Mexiko. Ein neues Gesetz soll außerdem die Zahl der Pflegekräfte pro Patient festlegen.'),
    (_text_id, 'B2', 'Der Pflegenotstand in deutschen Krankenhäusern hat sich zu einer strukturellen Krise ausgewachsen. Nach Berechnungen des Deutschen Pflegerats fehlen aktuell über 100.000 Pflegefachkräfte in der stationären Versorgung. Prognosen zufolge könnte sich diese Lücke bis 2035 auf 500.000 vergrößern.

Die Ursachen sind vielschichtig: unterdurchschnittliche Vergütung im internationalen Vergleich, hohe Arbeitsbelastung durch Personalmangel und fehlende Karriereperspektiven. Eine bundesweite Befragung ergab, dass 35 Prozent der Pflegekräfte einen Berufsausstieg in Betracht ziehen.

Die Bundesregierung hat ein Maßnahmenpaket verabschiedet, das eine verbindliche Personalbemessung in Krankenhäusern, eine tarifliche Mindestbezahlung von 18 Euro pro Stunde und vereinfachte Anerkennungsverfahren für ausländische Pflegekräfte vorsieht.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Krankenhaus', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el hospital', 'hospital', 'Ich war im Krankenhaus.', 'Estuve en el hospital.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Pfleger', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el enfermero', 'nurse', 'Der Pfleger hilft dem Patienten.', 'El enfermero ayuda al paciente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Patient', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el paciente', 'patient', 'Der Patient wartet auf den Arzt.', 'El paciente espera al médico.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Pflege', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la enfermería, los cuidados', 'nursing care', 'In der Pflege fehlen viele Fachkräfte.', 'En la enfermería faltan muchos profesionales.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('anstrengend', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'agotador', 'exhausting', 'Die Arbeit im Krankenhaus ist anstrengend.', 'El trabajo en el hospital es agotador.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('fehlen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'faltar', 'to be missing', 'Es fehlen 100.000 Pflegekräfte.', 'Faltan 100.000 enfermeros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 39: Die Grippewelle kommt früher (salud) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Die Grippewelle kommt früher als erwartet', 'die-grippewelle-kommt-frueher', 'salud', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Menschen in Deutschland sind krank. Sie haben Grippe. Die Grippe kommt dieses Jahr sehr früh – schon im Oktober.

Die Symptome sind: Fieber, Kopfschmerzen und Husten. Ärzte empfehlen: zu Hause bleiben und viel trinken. Man kann sich auch impfen lassen.'),
    (_text_id, 'B1', 'Die Grippewelle hat Deutschland dieses Jahr besonders früh erreicht. Bereits im Oktober meldeten Ärzte einen starken Anstieg der Grippefälle. Normalerweise beginnt die Grippesaison erst im Januar.

Das Robert Koch-Institut empfiehlt die Grippeimpfung für alle Menschen über 60, Schwangere und Menschen mit chronischen Krankheiten. Die Impfung ist kostenlos und beim Hausarzt erhältlich. Außerdem helfen einfache Maßnahmen: Hände waschen, in die Armbeuge niesen und zu Hause bleiben, wenn man krank ist.'),
    (_text_id, 'B2', 'Die Influenzasaison hat in Deutschland ungewöhnlich früh begonnen. Bereits Mitte Oktober registrierte das Robert Koch-Institut einen sprunghaften Anstieg der laborbestätigten Grippefälle. Experten führen den frühen Beginn auf einen neuen Virusstamm zurück, gegen den in der Bevölkerung noch wenig Immunität besteht.

Die Auswirkungen auf das Gesundheitssystem sind bereits spürbar: Hausarztpraxen berichten von überfüllten Wartezimmern, und in einigen Kliniken wurden planbare Operationen verschoben, um Kapazitäten für Grippepatienten freizuhalten.

Das RKI hat seine Impfempfehlung erweitert und rät nun auch Beschäftigten im Gesundheitswesen und in Gemeinschaftseinrichtungen ausdrücklich zur Impfung. Die Impfquote in der Risikogruppe der über 60-Jährigen liegt mit 43 Prozent allerdings deutlich unter der WHO-Zielmarke von 75 Prozent.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Grippe', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la gripe', 'flu', 'Ich habe die Grippe.', 'Tengo la gripe.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('krank', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'enfermo', 'sick', 'Viele Menschen sind krank.', 'Muchas personas están enfermas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Fieber', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la fiebre', 'fever', 'Ich habe 39 Grad Fieber.', 'Tengo 39 grados de fiebre.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('impfen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'vacunar', 'to vaccinate', 'Ich lasse mich gegen Grippe impfen.', 'Me vacuno contra la gripe.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Husten', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la tos', 'cough', 'Ich habe starken Husten.', 'Tengo mucha tos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Kopfschmerzen', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el dolor de cabeza', 'headache', 'Ich habe Kopfschmerzen.', 'Tengo dolor de cabeza.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 40: Gesundes Essen in der Schulkantine (salud) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Gesundes Essen in der Schulkantine', 'gesundes-essen-in-der-schulkantine', 'salud', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In vielen Schulen gibt es eine Kantine. Dort essen die Schüler zu Mittag. Jetzt soll das Essen gesünder werden: mehr Gemüse und weniger Fleisch.

Manche Kinder mögen kein Gemüse. Aber die Köche machen das Essen lecker. Es gibt zum Beispiel Gemüsepfanne mit Reis.'),
    (_text_id, 'B1', 'Die Bundesregierung will das Essen in Schulkantinen gesünder machen. Ein neues Gesetz sieht vor, dass jeden Tag Obst und Gemüse angeboten werden müssen. Außerdem soll es nur noch einmal pro Woche Fleisch geben.

Viele Schulkantinen bieten bisher ungesundes Essen an: Pommes, Pizza und Schnitzel sind am beliebtesten. Die neuen Regeln sollen das ändern. Ein Mittagessen soll maximal 4,50 Euro kosten. Für Familien mit wenig Geld ist es kostenlos.'),
    (_text_id, 'B2', 'Die Qualität des Schulessens steht in Deutschland auf dem Prüfstand. Eine Studie der Deutschen Gesellschaft für Ernährung hat ergeben, dass nur 30 Prozent der Schulkantinen den offiziellen Qualitätsstandards für Schulverpflegung entsprechen.

Die Bundesregierung hat daraufhin ein Qualitätsprogramm für Schulverpflegung beschlossen. Die Richtlinien sehen unter anderem täglich frisches Obst und Gemüse, maximal einmal wöchentlich Fleisch und den Verzicht auf stark verarbeitete Lebensmittel vor. Ein Mittagessen soll dabei nicht mehr als 4,50 Euro kosten.

Ernährungswissenschaftler begrüßen die Initiative, warnen aber vor Umsetzungsproblemen: Viele Schulküchen seien personell und technisch nicht für die Zubereitung frischer Mahlzeiten ausgestattet. Zudem sei eine begleitende Ernährungsbildung im Unterricht notwendig, damit Kinder gesunde Ernährung auch zu Hause fortsetzen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Essen', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la comida', 'food', 'Das Essen in der Kantine ist gut.', 'La comida en la cantina es buena.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Kantine', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la cantina, el comedor', 'canteen', 'In der Kantine essen wir zu Mittag.', 'En la cantina comemos al mediodía.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Gemüse', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la verdura', 'vegetables', 'Gemüse ist gesund.', 'La verdura es saludable.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Fleisch', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la carne', 'meat', 'Es soll weniger Fleisch geben.', 'Debe haber menos carne.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('lecker', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'rico, delicioso', 'tasty', 'Die Gemüsepfanne ist lecker.', 'El salteado de verduras está rico.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Mittagessen', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el almuerzo', 'lunch', 'Das Mittagessen kostet 4,50 Euro.', 'El almuerzo cuesta 4,50 euros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 41: Mit dem Zug durch Europa reisen (internacional) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Mit dem Zug durch Europa reisen', 'mit-dem-zug-durch-europa-reisen', 'internacional', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Deutsche reisen gern mit dem Zug. Der Zug fährt nach Paris, Amsterdam oder Wien. Man muss nicht fliegen.

Reisen mit dem Zug ist bequem. Man kann lesen, schlafen oder aus dem Fenster schauen. Es ist auch besser für die Umwelt.'),
    (_text_id, 'B1', 'Reisen mit dem Zug wird in Europa immer einfacher. Neue Nachtzüge verbinden Berlin mit Paris, Wien und Kopenhagen. Man schläft im Zug und wacht in einer anderen Stadt auf.

Das Deutschlandticket für 49 Euro pro Monat macht auch Zugreisen in Deutschland sehr günstig. Für europäische Strecken gibt es den Interrail-Pass. Besonders junge Leute reisen damit quer durch Europa. Fliegen wird wegen der CO2-Steuer teurer, der Zug dagegen attraktiver.'),
    (_text_id, 'B2', 'Der Bahnverkehr in Europa erlebt eine Renaissance. Insbesondere Nachtzugverbindungen, die in den 2000er-Jahren vielfach eingestellt wurden, kehren zurück. Die Österreichischen Bundesbahnen betreiben mit ihren „Nightjet"-Zügen mittlerweile ein europaweites Netz, das Städte wie Berlin, Paris, Rom und Barcelona verbindet.

Ein wesentlicher Treiber ist das wachsende Umweltbewusstsein: Bahnreisen verursachen pro Personenkilometer nur ein Zehntel der CO2-Emissionen eines Fluges. Politisch wird dies durch höhere Flugsteuern und Subventionen für den Schienenverkehr unterstützt.

Das im Vorjahr eingeführte Deutschlandticket hat zudem den Nahverkehr revolutioniert. Mit 49 Euro pro Monat können Reisende alle Regionalzüge und öffentlichen Verkehrsmittel in ganz Deutschland nutzen. Eine Ausweitung auf den europäischen Fernverkehr wird diskutiert.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Zug', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el tren', 'train', 'Wir fahren mit dem Zug nach Paris.', 'Vamos en tren a París.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('reisen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'viajar', 'to travel', 'Ich reise gern mit dem Zug.', 'Me gusta viajar en tren.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('fliegen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'volar', 'to fly', 'Fliegen ist schlecht für die Umwelt.', 'Volar es malo para el medio ambiente.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('bequem', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'cómodo', 'comfortable', 'Der Zug ist sehr bequem.', 'El tren es muy cómodo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Reise', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el viaje', 'trip', 'Die Reise nach Wien dauert acht Stunden.', 'El viaje a Viena dura ocho horas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Ticket', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el billete', 'ticket', 'Das Ticket kostet 49 Euro.', 'El billete cuesta 49 euros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 42: Deutsche Touristen im Ausland (internacional) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Deutsche Touristen reisen am liebsten nach Spanien', 'deutsche-touristen-reisen-nach-spanien', 'internacional', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Deutsche reisen sehr gern. Ihr Lieblingsziel ist Spanien. Mallorca ist besonders beliebt. Dort ist es warm und es gibt schöne Strände.

Auch Italien, die Türkei und Griechenland sind beliebt. Im Sommer fliegen Millionen Deutsche in den Urlaub.'),
    (_text_id, 'B1', 'Die Deutschen sind Reiseweltmeister. Kein anderes Land in Europa gibt so viel Geld für Urlaub aus. Das beliebteste Reiseziel ist seit Jahren Spanien – besonders Mallorca, die Kanaren und die Costa Brava.

80 Millionen Reisen ins Ausland machten die Deutschen im letzten Jahr. Im Durchschnitt gibt jeder Deutsche über 1.000 Euro pro Urlaubsreise aus. Ein Trend: Immer mehr Menschen buchen nachhaltige Reisen – zum Beispiel mit dem Zug statt dem Flugzeug.'),
    (_text_id, 'B2', 'Deutschland ist der größte Reisemarkt Europas. Im vergangenen Jahr unternahmen die Bundesbürger über 80 Millionen Auslandsreisen mit einem Gesamtvolumen von 73 Milliarden Euro. Unangefochtenes Lieblingsziel bleibt Spanien, gefolgt von Italien, der Türkei und Griechenland.

Ein wachsender Trend ist der nachhaltige Tourismus: 40 Prozent der Deutschen geben an, bei der Reiseplanung auf den ökologischen Fußabdruck zu achten. Dies spiegelt sich in der steigenden Nachfrage nach Bahnreisen, CO2-Kompensation und regionalen Erlebnissen wider.

Die Reisebranche steht gleichzeitig vor strukturellen Veränderungen: Buchungsplattformen verdrängen klassische Reisebüros, Kurzzeitreisen und Städtetrips nehmen zu, und die durchschnittliche Aufenthaltsdauer sinkt. Arbeitszeitmodelle wie die Vier-Tage-Woche könnten jedoch zu mehr verlängerten Wochenendreisen führen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Tourist', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el turista', 'tourist', 'Viele Touristen besuchen Mallorca.', 'Muchos turistas visitan Mallorca.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Strand', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la playa', 'beach', 'Der Strand ist wunderschön.', 'La playa es preciosa.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Urlaub', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'las vacaciones', 'vacation', 'Im Sommer mache ich Urlaub.', 'En verano hago vacaciones.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('warm', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'cálido', 'warm', 'In Spanien ist es warm.', 'En España hace calor.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('buchen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'reservar', 'to book', 'Ich buche einen Flug nach Spanien.', 'Reservo un vuelo a España.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Reiseziel', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el destino de viaje', 'travel destination', 'Spanien ist das beliebteste Reiseziel.', 'España es el destino de viaje más popular.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 43: Kulturfestivals bringen Menschen zusammen (internacional) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Kulturfestivals bringen Menschen zusammen', 'kulturfestivals-bringen-menschen-zusammen', 'internacional', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland gibt es viele Kulturfestivals. Dort gibt es Musik, Tanz und Essen aus vielen Ländern. Menschen aus verschiedenen Kulturen kommen zusammen.

Das „Karneval der Kulturen" in Berlin ist sehr bekannt. Zwei Millionen Menschen feiern zusammen. Es gibt Musik aus Afrika, Asien und Lateinamerika.'),
    (_text_id, 'B1', 'Deutschland feiert seine kulturelle Vielfalt mit zahlreichen Festivals. Das größte ist der „Karneval der Kulturen" in Berlin, der jedes Jahr im Mai stattfindet. Zwei Millionen Besucher erleben Musik, Tanz und Essen aus über 70 Ländern.

Auch in anderen Städten gibt es interkulturelle Feste: das Japanfest in Düsseldorf, das Afrikanische Kulturfest in Frankfurt oder die Türkisch-Deutschen Kulturtage in Köln. Diese Veranstaltungen fördern das Verständnis zwischen den Kulturen. Gleichzeitig können Einwanderer ihre Traditionen zeigen und bewahren.'),
    (_text_id, 'B2', 'Interkulturelle Festivals haben sich in Deutschland zu bedeutenden gesellschaftlichen Ereignissen entwickelt. Der Berliner „Karneval der Kulturen" lockt mit seinem viertägigen Straßenfest und dem Umzug jährlich zwei Millionen Besucher an und gilt als größtes multikulturelles Fest Europas.

Die Veranstaltungen spiegeln die demographische Realität wider: In Deutschland haben 28 Prozent der Bevölkerung einen Migrationshintergrund. Kulturfestivals bieten Räume, in denen verschiedene Traditionen sichtbar werden und interkulturellen Dialog ermöglichen.

Kulturwissenschaftler betonen die integrative Wirkung solcher Veranstaltungen. Studien zeigen, dass regelmäßiger kultureller Austausch Vorurteile abbaut und das Zusammengehörigkeitsgefühl stärkt. Kommunen investieren daher zunehmend in interkulturelle Projekte als Teil ihrer Integrationsstrategie.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Festival', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el festival', 'festival', 'Das Festival findet im Mai statt.', 'El festival tiene lugar en mayo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Kultur', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la cultura', 'culture', 'Es gibt Kultur aus vielen Ländern.', 'Hay cultura de muchos países.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Musik', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la música', 'music', 'Die Musik ist aus Afrika.', 'La música es de África.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('feiern', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'celebrar', 'to celebrate', 'Zwei Millionen Menschen feiern zusammen.', 'Dos millones de personas celebran juntas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Vielfalt', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la diversidad', 'diversity', 'Deutschland feiert seine Vielfalt.', 'Alemania celebra su diversidad.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('zusammen', 'adverb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'juntos', 'together', 'Alle feiern zusammen.', 'Todos celebran juntos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 44: Partnerstädte verbinden Länder (internacional) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Partnerstädte verbinden Länder', 'partnerstaedte-verbinden-laender', 'internacional', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele deutsche Städte haben eine Partnerstadt in einem anderen Land. Berlin und Los Angeles sind Partnerstädte. Hamburg und Chicago auch.

Die Städte besuchen sich und machen Projekte zusammen. Schüler reisen in die Partnerstadt. Das hilft, andere Kulturen zu verstehen.'),
    (_text_id, 'B1', 'Deutsche Städte pflegen Partnerschaften mit Städten in aller Welt. Insgesamt gibt es über 6.000 solcher Verbindungen. Die älteste ist die Partnerschaft zwischen Mainz und Dijon in Frankreich seit 1958.

Partnerstädte organisieren Schüleraustausche, Kulturprojekte und wirtschaftliche Zusammenarbeit. Nach dem Zweiten Weltkrieg waren Städtepartnerschaften besonders wichtig für die Versöhnung mit Frankreich und Polen.

Heute gibt es auch neue Formen: Klimapartnerschaften mit Städten in Entwicklungsländern, bei denen deutsche Städte ihr Wissen über Klimaschutz teilen.'),
    (_text_id, 'B2', 'Das Netzwerk kommunaler Partnerschaften ist ein oft unterschätztes Instrument der internationalen Zusammenarbeit. Deutsche Städte und Gemeinden unterhalten über 6.000 Partnerschaften mit Städten in mehr als 70 Ländern und bilden damit eines der dichtesten Städtepartnerschaftsnetze weltweit.

Die Ursprünge gehen auf die Nachkriegszeit zurück, als deutsch-französische Partnerschaften zur Aussöhnung zwischen den ehemaligen Kriegsgegnern beitrugen. Die Partnerschaft zwischen Mainz und Dijon aus dem Jahr 1958 gilt als Pionierprojekt.

In den vergangenen Jahren hat sich das Konzept weiterentwickelt: Klimapartnerschaften mit Städten im Globalen Süden gewinnen an Bedeutung. Dabei tauschen die Partner Expertise im Bereich erneuerbarer Energien, Wassermanagement und nachhaltiger Stadtplanung aus. Der Deutsche Städtetag fördert solche Kooperationen mit einem jährlichen Budget von zehn Millionen Euro.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Partnerstadt', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la ciudad hermanada', 'twin city', 'Berlin und Los Angeles sind Partnerstädte.', 'Berlín y Los Ángeles son ciudades hermanadas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verbinden', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'conectar, unir', 'to connect', 'Partnerstädte verbinden Länder.', 'Las ciudades hermanadas conectan países.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Land', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el país', 'country', 'Deutschland hat Partnerstädte in vielen Ländern.', 'Alemania tiene ciudades hermanadas en muchos países.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('besuchen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'visitar', 'to visit', 'Schüler besuchen die Partnerstadt.', 'Los alumnos visitan la ciudad hermanada.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verstehen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'entender, comprender', 'to understand', 'Wir verstehen andere Kulturen besser.', 'Entendemos mejor otras culturas.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Zusammenarbeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la cooperación', 'cooperation', 'Die Zusammenarbeit ist wichtig.', 'La cooperación es importante.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 45: Integration von Geflüchteten (internacional) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Integration von Geflüchteten in Deutschland', 'integration-von-gefluechteten', 'internacional', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Geflüchtete leben in Deutschland. Sie kommen aus Ländern mit Krieg. In Deutschland sind sie sicher. Sie lernen Deutsch und suchen Arbeit.

Viele Deutsche helfen den Geflüchteten. Sie unterrichten Deutsch oder helfen bei Behördengängen. Integration braucht Zeit.'),
    (_text_id, 'B1', 'In Deutschland leben über eine Million Geflüchtete, die seit 2015 gekommen sind. Die meisten kommen aus Syrien, Afghanistan und der Ukraine. Integration ist ein langer Prozess: Deutsch lernen, eine Wohnung finden, Arbeit suchen und die Kultur verstehen.

Die Fortschritte sind sichtbar: Über die Hälfte der Geflüchteten, die seit 2015 in Deutschland sind, hat inzwischen einen Job. Viele arbeiten in der Pflege, in der Gastronomie oder im Handwerk. Kinder besuchen die Schule und lernen schnell Deutsch.'),
    (_text_id, 'B2', 'Die Integration der seit 2015 nach Deutschland gekommenen Geflüchteten zeigt differenzierte Ergebnisse. Laut dem Institut für Arbeitsmarkt- und Berufsforschung sind über 55 Prozent der Geflüchteten im erwerbsfähigen Alter mittlerweile in Beschäftigung – ein Wert, der über den Prognosen liegt.

Besonders erfolgreich verläuft die Integration auf dem Arbeitsmarkt in Branchen mit Fachkräftemangel. Im Handwerk, in der Pflege und in der Logistik haben Geflüchtete eine wichtige Rolle übernommen. Herausforderungen bestehen weiterhin bei der Anerkennung ausländischer Qualifikationen und beim Zugang zu höher qualifizierten Berufen.

Die gesellschaftliche Integration verläuft uneinheitlich: Während in Städten das Zusammenleben weitgehend funktioniert, berichten ländliche Gemeinden von größeren Herausforderungen. Sprachkenntnisse, Wohnraumsituation und soziale Netzwerke sind die entscheidenden Faktoren für gelingende Integration.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Geflüchtete', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el refugiado', 'refugee', 'Viele Geflüchtete lernen Deutsch.', 'Muchos refugiados aprenden alemán.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Integration', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la integración', 'integration', 'Integration braucht Zeit.', 'La integración necesita tiempo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Krieg', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la guerra', 'war', 'Sie fliehen vor dem Krieg.', 'Huyen de la guerra.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sicher', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'seguro', 'safe', 'In Deutschland sind sie sicher.', 'En Alemania están seguros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Behörde', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la oficina pública, la autoridad', 'authority', 'Ich gehe zur Behörde.', 'Voy a la oficina pública.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Fortschritt', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el progreso', 'progress', 'Es gibt große Fortschritte.', 'Hay grandes progresos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 46: Fahrradfahren wird in Städten immer beliebter (movilidad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Fahrradfahren wird in Städten immer beliebter', 'fahrradfahren-wird-in-staedten-beliebter', 'movilidad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Viele Menschen in Deutschland fahren Fahrrad. In Städten wie Berlin und München gibt es neue Fahrradwege. Fahrradfahren ist gesund und gut für die Umwelt.

Immer mehr Menschen kaufen ein Fahrrad. E-Bikes sind besonders beliebt. Man kann damit schnell und ohne Mühe fahren.'),
    (_text_id, 'B1', 'Fahrradfahren boomt in Deutschland. Im letzten Jahr wurden 4,6 Millionen Fahrräder verkauft. Besonders E-Bikes sind beliebt – jedes dritte verkaufte Rad hat einen Motor.

Die Städte bauen immer mehr Radwege. Berlin plant 100 Kilometer neue Radwege bis 2027. In Kopenhagen fahren schon mehr Menschen mit dem Rad als mit dem Auto – das ist das Vorbild für viele deutsche Städte. Problem: Es gibt noch zu wenig sichere Abstellplätze.'),
    (_text_id, 'B2', 'Der Fahrradboom in Deutschland hält an: Im vergangenen Jahr wurden 4,6 Millionen Räder verkauft, davon über ein Drittel E-Bikes mit einem Durchschnittspreis von 2.800 Euro. Der Gesamtumsatz der Fahrradbranche erreichte einen Rekordwert von 16 Milliarden Euro.

Berlin, München und Hamburg investieren massiv in den Ausbau der Radinfrastruktur. Berlin allein plant bis 2027 rund 100 Kilometer geschützte Radwege. Das Vorbild sind Städte wie Kopenhagen und Amsterdam, wo das Fahrrad das meistgenutzte Verkehrsmittel ist.

Dennoch bleiben Herausforderungen: Die Diebstahlrate liegt bei über 200.000 Rädern jährlich, sichere Abstellanlagen fehlen vielerorts, und auf gemischten Verkehrsflächen kommt es regelmäßig zu Konflikten zwischen Radfahrern und Autofahrern.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Fahrrad', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la bicicleta', 'bicycle', 'Ich fahre mit dem Fahrrad zur Arbeit.', 'Voy en bicicleta al trabajo.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Radweg', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el carril bici', 'bike lane', 'Die Stadt baut neue Radwege.', 'La ciudad construye nuevos carriles bici.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Verkehrsmittel', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el medio de transporte', 'means of transport', 'Das Fahrrad ist ein beliebtes Verkehrsmittel.', 'La bicicleta es un medio de transporte popular.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('stehlen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'robar', 'to steal', 'Mein Fahrrad wurde gestohlen.', 'Me robaron la bicicleta.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('verkaufen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'vender', 'to sell', 'Es werden viele E-Bikes verkauft.', 'Se venden muchas e-bikes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Abstellplatz', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el aparcamiento para bicis', 'parking space', 'Es fehlen sichere Abstellplätze.', 'Faltan aparcamientos seguros.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 47: Das 49-Euro-Ticket für den Nahverkehr (movilidad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Das 49-Euro-Ticket für den Nahverkehr', 'das-49-euro-ticket-fuer-den-nahverkehr', 'movilidad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland gibt es ein neues Ticket. Es heißt „Deutschlandticket". Es kostet 49 Euro im Monat. Damit kann man alle Busse und Züge im Nahverkehr in ganz Deutschland benutzen.

Das Ticket ist sehr günstig. Viele Menschen benutzen es jeden Tag.'),
    (_text_id, 'B1', 'Das Deutschlandticket ist ein großer Erfolg. Für 49 Euro im Monat können Fahrgäste alle Busse, Straßenbahnen und Regionalzüge in ganz Deutschland nutzen. Schon über zehn Millionen Menschen haben das Ticket.

Das Ticket hat viele Vorteile: Es ist einfach – man braucht nur ein Ticket für alles. Es spart Geld – vorher haben viele Monatstickets 80 Euro oder mehr gekostet. Und es hilft der Umwelt, weil mehr Menschen den Bus statt das Auto nehmen.'),
    (_text_id, 'B2', 'Das Deutschlandticket für 49 Euro monatlich hat den öffentlichen Nahverkehr in Deutschland grundlegend verändert. Seit seiner Einführung haben über zehn Millionen Abonnenten das Angebot angenommen, und die Fahrgastzahlen im ÖPNV sind um 15 Prozent gestiegen.

Eine begleitende Studie des Verkehrsministeriums zeigt, dass rund elf Prozent der Ticketinhaber tatsächlich ihr Auto häufiger stehen lassen. Die jährliche CO2-Einsparung wird auf 1,3 Millionen Tonnen geschätzt.

Die Finanzierung des Tickets bleibt allerdings ein Streitpunkt zwischen Bund und Ländern. Die jährlichen Kosten belaufen sich auf etwa drei Milliarden Euro, wobei die Aufteilung regelmäßig neu verhandelt werden muss. Kritiker fordern außerdem Investitionen in die Infrastruktur, da das erhöhte Fahrgastaufkommen viele Strecken an ihre Kapazitätsgrenzen bringt.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Nahverkehr', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el transporte público local', 'local public transport', 'Der Nahverkehr ist gut in Berlin.', 'El transporte público local es bueno en Berlín.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Bus', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el autobús', 'bus', 'Ich fahre mit dem Bus zur Schule.', 'Voy en autobús a la escuela.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Straßenbahn', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el tranvía', 'tram', 'Die Straßenbahn fährt alle zehn Minuten.', 'El tranvía pasa cada diez minutos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Fahrgast', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el pasajero', 'passenger', 'Es gibt mehr Fahrgäste als früher.', 'Hay más pasajeros que antes.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('günstig', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'barato, económico', 'affordable', 'Das Ticket ist sehr günstig.', 'El billete es muy económico.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('benutzen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'usar, utilizar', 'to use', 'Viele Menschen benutzen das Ticket.', 'Muchas personas usan el billete.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 48: Carsharing in deutschen Städten (movilidad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Carsharing in deutschen Städten', 'carsharing-in-deutschen-staedten', 'movilidad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In Deutschland kann man sich ein Auto teilen. Das heißt „Carsharing". Man bucht ein Auto mit dem Handy. Man fährt damit und stellt es wieder ab.

Carsharing ist praktisch: Man braucht kein eigenes Auto. Man bezahlt nur, wenn man fährt.'),
    (_text_id, 'B1', 'Immer mehr Deutsche nutzen Carsharing statt ein eigenes Auto zu kaufen. In großen Städten wie Berlin, München und Hamburg stehen Tausende Carsharing-Autos bereit. Per App findet man das nächste freie Auto und bucht es in Sekunden.

Die Vorteile liegen auf der Hand: Man spart die Kosten für Versicherung, Parkplatz und Reparaturen. Außerdem brauchen weniger Autos weniger Parkplätze in der Stadt. Studien zeigen: Ein Carsharing-Auto ersetzt bis zu zehn private Autos.'),
    (_text_id, 'B2', 'Der Carsharing-Markt in Deutschland wächst stetig. Mittlerweile sind über 4,5 Millionen Nutzer bei Anbietern wie SHARE NOW, Miles oder stadtmobil registriert. In Großstädten stehen Zehntausende Fahrzeuge bereit, die per App gebucht und nach der Fahrt an einem beliebigen Ort abgestellt werden können.

Kommunen fördern Carsharing aktiv, da es einen Beitrag zur Verkehrswende leistet. Studien des Bundesverkehrsministeriums belegen, dass ein Carsharing-Fahrzeug zwischen vier und zehn private Pkw ersetzt und damit Parkraum und Emissionen reduziert.

Allerdings konzentriert sich das Angebot bisher auf Innenstadtbereiche. In Vororten und ländlichen Regionen ist Carsharing wirtschaftlich oft nicht rentabel. Genossenschaftliche Modelle, bei denen Gemeinden eigene Carsharing-Flotten betreiben, könnten diese Lücke schließen.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('das Auto', 'noun', 'das')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el coche', 'car', 'Ich brauche kein eigenes Auto.', 'No necesito un coche propio.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('teilen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'compartir', 'to share', 'Wir teilen uns ein Auto.', 'Compartimos un coche.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('buchen', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'reservar', 'to book', 'Ich buche das Auto per App.', 'Reservo el coche por la app.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Parkplatz', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el aparcamiento', 'parking space', 'Es gibt nicht genug Parkplätze.', 'No hay suficientes aparcamientos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('praktisch', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'práctico', 'practical', 'Carsharing ist sehr praktisch.', 'El carsharing es muy práctico.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Versicherung', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el seguro', 'insurance', 'Die Versicherung für ein Auto ist teuer.', 'El seguro de un coche es caro.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 49: E-Scooter in der Stadt (movilidad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('E-Scooter in der Stadt: praktisch oder gefährlich?', 'e-scooter-in-der-stadt', 'movilidad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'In vielen Städten gibt es E-Scooter. Man kann sie mit dem Handy mieten. Dann fährt man damit durch die Stadt.

E-Scooter sind schnell und machen Spaß. Aber es gibt auch Probleme: Manche Leute fahren zu schnell. Und viele E-Scooter liegen auf dem Gehweg.'),
    (_text_id, 'B1', 'E-Scooter gehören inzwischen zum Stadtbild in Deutschland. In Berlin, München und Köln stehen Tausende der elektrischen Roller bereit. Per App kann man sie mieten – eine Fahrt kostet zwischen einem und drei Euro.

Aber E-Scooter sind auch umstritten. Fußgänger ärgern sich über Roller, die auf Gehwegen liegen. Die Unfallzahlen sind hoch: Über 8.000 E-Scooter-Unfälle gab es im letzten Jahr. Besonders gefährlich ist das Fahren nach dem Alkoholkonsum. Manche Städte haben deshalb Geschwindigkeitslimits eingeführt.'),
    (_text_id, 'B2', 'Seit der Legalisierung von E-Scootern im Jahr 2019 hat sich der Markt rasant entwickelt. Anbieter wie Tier, Lime und Bolt betreiben in deutschen Großstädten Flotten von jeweils mehreren Tausend Fahrzeugen. Rund 30 Millionen Fahrten wurden im vergangenen Jahr registriert.

Die Unfallstatistik gibt allerdings Anlass zur Sorge: Über 8.000 E-Scooter-Unfälle wurden polizeilich erfasst, wobei Alkoholeinfluss und fehlende Erfahrung als Hauptursachen gelten. Die Bundesanstalt für Straßenwesen empfiehlt daher eine Helmpflicht und eine Absenkung der Promillegrenze.

Städte ringen um eine Balance zwischen Innovation und Ordnung. Hamburg und Düsseldorf haben feste Parkzonen eingeführt und die Zahl der zugelassenen Roller begrenzt. Umweltschützer kritisieren zudem die kurze Lebensdauer der Geräte und den hohen Wartungsaufwand, der die ökologische Bilanz verschlechtert.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der E-Scooter', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el patinete eléctrico', 'e-scooter', 'E-Scooter sind in der Stadt beliebt.', 'Los patinetes eléctricos son populares en la ciudad.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('mieten', 'verb', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'alquilar', 'to rent', 'Ich miete einen E-Scooter per App.', 'Alquilo un patinete eléctrico por la app.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Gehweg', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la acera', 'sidewalk', 'E-Scooter liegen auf dem Gehweg.', 'Los patinetes están tirados en la acera.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('gefährlich', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'peligroso', 'dangerous', 'Zu schnell fahren ist gefährlich.', 'Ir demasiado rápido es peligroso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Unfall', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el accidente', 'accident', 'Es gibt viele E-Scooter-Unfälle.', 'Hay muchos accidentes con patinetes eléctricos.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Geschwindigkeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la velocidad', 'speed', 'Die Geschwindigkeit ist begrenzt.', 'La velocidad está limitada.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

-- ── Text 50: Tempo 30 in der ganzen Stadt (movilidad) ──
DO $$
DECLARE
  _text_id int;
  _tv_ids int[];
  _lemma_id int;
  _meaning_id int;
BEGIN
  INSERT INTO texts (title, slug, categoria, access_status, published_at)
  VALUES ('Tempo 30 in der ganzen Stadt', 'tempo-30-in-der-ganzen-stadt', 'movilidad', 'premium', NOW())
  RETURNING id INTO _text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES
    (_text_id, 'A2', 'Manche Städte in Deutschland wollen Tempo 30 überall. Das bedeutet: Autos dürfen nur 30 Kilometer pro Stunde fahren. Das ist langsamer als heute.

Die Stadt sagt: Tempo 30 ist sicherer. Es gibt weniger Unfälle. Und die Luft wird besser. Aber Autofahrer sind nicht begeistert.'),
    (_text_id, 'B1', 'Immer mehr deutsche Städte führen Tempo 30 auf ihren Straßen ein. Berlin, Hamburg und München haben große Tempo-30-Zonen. Manche Städte wollen sogar Tempo 30 als Standard für alle Straßen – nicht nur in Wohngebieten.

Die Argumente dafür: Bei Tempo 30 sinkt das Unfallrisiko deutlich. Die Chance, einen Unfall zu überleben, ist bei 30 km/h doppelt so hoch wie bei 50 km/h. Außerdem gibt es weniger Lärm und Abgase.

Autofahrer und die Industrie sind dagegen. Sie sagen: Tempo 30 macht den Verkehr langsamer und verursacht Staus.'),
    (_text_id, 'B2', 'Die Debatte um flächendeckendes Tempo 30 in deutschen Innenstädten hat an Schärfe gewonnen. Eine Bürgerinitiative hat über 100.000 Unterschriften gesammelt, um Tempo 30 als Regelgeschwindigkeit innerorts einzuführen. Bisher gilt innerorts grundsätzlich Tempo 50, wobei Kommunen auf einzelnen Straßen Tempo 30 anordnen können.

Die wissenschaftliche Evidenz ist eindeutig: Bei Tempo 30 sinkt die Zahl der tödlichen Fußgängerunfälle um bis zu 40 Prozent. Der Bremsweg halbiert sich gegenüber Tempo 50. Zudem reduziert sich der Straßenlärm um drei Dezibel, was einer subjektiven Halbierung der Lautstärke entspricht.

Die rechtliche Umsetzung scheitert bisher an der Straßenverkehrsordnung, die den Kommunen nur eingeschränkte Befugnisse einräumt. Das Bundesverkehrsministerium arbeitet an einer Reform, die Städten mehr Handlungsspielraum geben soll. Paris, Brüssel und Barcelona haben Tempo 30 bereits flächendeckend eingeführt.');

  SELECT array_agg(id ORDER BY id) INTO _tv_ids FROM text_versions WHERE text_id = _text_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Geschwindigkeit', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la velocidad', 'speed', 'Die Geschwindigkeit ist 30 km/h.', 'La velocidad es 30 km/h.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('die Straße', 'noun', 'die')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'la calle', 'street', 'In dieser Straße gilt Tempo 30.', 'En esta calle el límite es 30 km/h.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('langsam', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'lento', 'slow', 'Tempo 30 ist langsamer als Tempo 50.', 'Tempo 30 es más lento que Tempo 50.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('sicher', 'adjective', NULL)
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'seguro', 'safe', 'Tempo 30 macht die Stadt sicherer.', 'Tempo 30 hace la ciudad más segura.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Lärm', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el ruido', 'noise', 'Tempo 30 reduziert den Lärm.', 'Tempo 30 reduce el ruido.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

  INSERT INTO vocabulario (german, word_type, article)
  VALUES ('der Verkehr', 'noun', 'der')
  ON CONFLICT (german) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO _lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, english, example, example_es, level, source, is_active)
  VALUES (_lemma_id, 'el tráfico', 'traffic', 'Der Verkehr in der Stadt ist laut.', 'El tráfico en la ciudad es ruidoso.', 'A2', 'seed', true)
  RETURNING id INTO _meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  SELECT unnest(_tv_ids), _meaning_id;

END $$;

