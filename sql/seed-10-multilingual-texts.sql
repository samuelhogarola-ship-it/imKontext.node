-- imKontext: 10 multilingual news texts seed
-- Generated 2026-10-26
-- German base content + ES/EN/FI/IT/PT localizations
-- Levels: A2, B1, B2

BEGIN;

-- ════════════════════════════════════════════════════════════════
-- Localization tables (IF NOT EXISTS — safe to run before or after Codex migration)
-- ════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS imk_text_localizations (
  text_id bigint NOT NULL REFERENCES texts(id) ON DELETE CASCADE,
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  title text,
  slug text,
  is_published boolean DEFAULT true,
  PRIMARY KEY (text_id, language)
);

CREATE TABLE IF NOT EXISTS imk_version_localizations (
  text_version_id bigint NOT NULL REFERENCES text_versions(id) ON DELETE CASCADE,
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  content text,
  is_published boolean DEFAULT true,
  PRIMARY KEY (text_version_id, language)
);

CREATE TABLE IF NOT EXISTS imk_meaning_localizations (
  meaning_id bigint NOT NULL REFERENCES vocabulary_meanings(id) ON DELETE CASCADE,
  language text NOT NULL CHECK (language IN ('es','en','fi','it','pt')),
  term text,
  example text,
  article text,
  word_type text,
  PRIMARY KEY (meaning_id, language)
);

-- Enable RLS on new tables
ALTER TABLE imk_text_localizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE imk_version_localizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE imk_meaning_localizations ENABLE ROW LEVEL SECURITY;

-- Read policies (anon + authenticated)
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'imk_text_localizations' AND policyname = 'anon_read_text_loc') THEN
    CREATE POLICY anon_read_text_loc ON imk_text_localizations FOR SELECT USING (true);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'imk_version_localizations' AND policyname = 'anon_read_version_loc') THEN
    CREATE POLICY anon_read_version_loc ON imk_version_localizations FOR SELECT USING (true);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'imk_meaning_localizations' AND policyname = 'anon_read_meaning_loc') THEN
    CREATE POLICY anon_read_meaning_loc ON imk_meaning_localizations FOR SELECT USING (true);
  END IF;
END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 1: KI hilft Ärzten in europäischen Krankenhäusern
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'KI hilft Ärzten in europäischen Krankenhäusern',
    'ki-hilft-aerzten-in-krankenhaeusern',
    'Künstliche Intelligenz im Gesundheitswesen',
    'tecnologia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'In vielen Krankenhäusern in Europa gibt es jetzt neue Computer-Programme. Diese Programme nutzen künstliche Intelligenz. Sie helfen Ärzten bei der Arbeit. Die KI kann Bilder von Patienten analysieren. Zum Beispiel kann sie Röntgenbilder lesen. So findet sie Krankheiten schneller als Menschen. In Deutschland nutzen schon 120 Krankenhäuser diese Technik. Die Ärzte sagen, die KI ist sehr nützlich. Sie macht weniger Fehler bei der Diagnose. Aber die KI ersetzt keine Ärzte. Die Ärzte treffen immer noch die Entscheidungen. Die Patienten finden das gut. Sie vertrauen ihren Ärzten und der neuen Technik.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Die Weltgesundheitsorganisation hat in einem neuen Bericht erklärt, dass Europa bei der Nutzung von künstlicher Intelligenz in Krankenhäusern aufholen muss. In den letzten zwei Jahren haben immer mehr Kliniken KI-Systeme eingeführt, die Ärzten bei der Diagnose von Krankheiten helfen. Diese Systeme können medizinische Bilder wie Röntgenaufnahmen und CT-Scans analysieren und Auffälligkeiten erkennen, die ein menschliches Auge manchmal übersieht. In Deutschland haben bereits 120 Krankenhäuser solche Programme installiert. Die Ergebnisse sind beeindruckend: Die Fehlerquote bei der Diagnose von Brustkrebs ist um 30 Prozent gesunken. Allerdings gibt es auch Bedenken. Datenschützer warnen davor, dass Patientendaten besser geschützt werden müssen. Außerdem befürchten manche Ärzte, dass sie sich zu sehr auf die Technik verlassen könnten. Die WHO empfiehlt deshalb, dass KI-Systeme immer nur als Unterstützung eingesetzt werden sollten und niemals die ärztliche Entscheidung ersetzen dürfen.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'In einem kürzlich veröffentlichten Bericht hat die Weltgesundheitsorganisation europäische Regierungen dazu aufgefordert, die Integration von künstlicher Intelligenz in das Gesundheitswesen erheblich zu beschleunigen. Obwohl die Technologie in einigen Ländern bereits vielversprechende Ergebnisse erzielt hat, hinkt Europa insgesamt hinter den USA und China hinterher, was die flächendeckende Einführung von KI-gestützten Diagnosesystemen betrifft.

In Deutschland haben mittlerweile 120 Krankenhäuser KI-Programme implementiert, die medizinische Bildgebung analysieren können. Die Software ist in der Lage, Röntgenaufnahmen, CT-Scans und MRT-Bilder auszuwerten und dabei Muster zu erkennen, die selbst erfahrenen Radiologen entgehen könnten. Eine Studie der Charité Berlin hat gezeigt, dass die Fehlerquote bei der Brustkrebsdiagnose durch den Einsatz von KI um 30 Prozent gesenkt werden konnte.

Dennoch wirft die zunehmende Digitalisierung der Medizin wichtige ethische Fragen auf. Datenschutzexperten betonen, dass die Verarbeitung sensibler Patientendaten durch KI-Systeme strengen Regulierungen unterliegen müsse. Es bestehe die Gefahr, dass bei unzureichendem Schutz persönliche Gesundheitsinformationen missbraucht werden könnten. Darüber hinaus warnen Mediziner vor einer möglichen Überabhängigkeit von algorithmischen Empfehlungen, die dazu führen könnte, dass ärztliche Intuition und klinische Erfahrung an Bedeutung verlieren.

Die WHO empfiehlt einen ausgewogenen Ansatz: KI solle als Werkzeug zur Unterstützung ärztlicher Entscheidungen dienen, ohne diese zu ersetzen. Gleichzeitig müssten Investitionen in die digitale Infrastruktur und die Ausbildung von medizinischem Personal vorangetrieben werden, um das volle Potenzial der Technologie ausschöpfen zu können.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'La IA ayuda a los médicos en hospitales europeos', 'ia-ayuda-medicos-hospitales', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'AI Helps Doctors in European Hospitals', 'ai-helps-doctors-hospitals', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Tekoäly auttaa lääkäreitä eurooppalaisissa sairaaloissa', 'tekoaly-auttaa-laakareita', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'L''IA aiuta i medici negli ospedali europei', 'ia-aiuta-medici-ospedali', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'IA ajuda médicos em hospitais europeus', 'ia-ajuda-medicos-hospitais', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'En muchos hospitales de Europa hay ahora nuevos programas de ordenador. Estos programas usan inteligencia artificial. Ayudan a los médicos en su trabajo. La IA puede analizar imágenes de pacientes. Por ejemplo, puede leer radiografías. Así encuentra enfermedades más rápido que las personas. En Alemania, ya 120 hospitales usan esta tecnología. Los médicos dicen que la IA es muy útil. Comete menos errores en el diagnóstico. Pero la IA no sustituye a los médicos. Los médicos siguen tomando las decisiones. Los pacientes están contentos. Confían en sus médicos y en la nueva tecnología.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'Many hospitals in Europe now have new computer programs. These programs use artificial intelligence. They help doctors with their work. The AI can analyze images from patients. For example, it can read X-rays. It finds diseases faster than people. In Germany, 120 hospitals already use this technology. The doctors say the AI is very useful. It makes fewer mistakes in diagnosis. But the AI does not replace doctors. The doctors still make the decisions. The patients like this. They trust their doctors and the new technology.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Monissa Euroopan sairaaloissa on nyt uusia tietokoneohjelmia. Nämä ohjelmat käyttävät tekoälyä. Ne auttavat lääkäreitä työssä. Tekoäly voi analysoida potilaiden kuvia. Se voi esimerkiksi lukea röntgenkuvia. Se löytää sairauksia nopeammin kuin ihmiset. Saksassa jo 120 sairaalaa käyttää tätä tekniikkaa. Lääkärit sanovat, että tekoäly on erittäin hyödyllinen. Se tekee vähemmän virheitä diagnoosissa. Mutta tekoäly ei korvaa lääkäreitä. Lääkärit tekevät edelleen päätökset. Potilaat pitävät tästä. He luottavat lääkäreihin ja uuteen tekniikkaan.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'In molti ospedali in Europa ci sono ora nuovi programmi informatici. Questi programmi usano l''intelligenza artificiale. Aiutano i medici nel loro lavoro. L''IA può analizzare le immagini dei pazienti. Per esempio, può leggere le radiografie. Così trova le malattie più velocemente delle persone. In Germania, 120 ospedali usano già questa tecnologia. I medici dicono che l''IA è molto utile. Fa meno errori nella diagnosi. Ma l''IA non sostituisce i medici. I medici prendono ancora le decisioni. I pazienti sono contenti. Si fidano dei medici e della nuova tecnologia.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'Em muitos hospitais na Europa existem agora novos programas de computador. Estes programas usam inteligência artificial. Ajudam os médicos no trabalho. A IA pode analisar imagens de pacientes. Por exemplo, pode ler radiografias. Assim encontra doenças mais rápido do que as pessoas. Na Alemanha, 120 hospitais já usam esta tecnologia. Os médicos dizem que a IA é muito útil. Comete menos erros no diagnóstico. Mas a IA não substitui os médicos. Os médicos continuam a tomar as decisões. Os pacientes gostam disto. Confiam nos médicos e na nova tecnologia.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'La Organización Mundial de la Salud ha declarado en un nuevo informe que Europa debe ponerse al día en el uso de inteligencia artificial en hospitales. En los últimos dos años, cada vez más clínicas han introducido sistemas de IA que ayudan a los médicos a diagnosticar enfermedades. Estos sistemas pueden analizar imágenes médicas como radiografías y tomografías, y detectar anomalías que el ojo humano a veces no ve. En Alemania, ya 120 hospitales han instalado estos programas. Los resultados son impresionantes: la tasa de error en el diagnóstico de cáncer de mama ha bajado un 30 por ciento. Sin embargo, también hay preocupaciones. Los defensores de la privacidad advierten de que los datos de los pacientes deben protegerse mejor. Además, algunos médicos temen depender demasiado de la tecnología. Por eso, la OMS recomienda que los sistemas de IA se utilicen siempre solo como apoyo y nunca sustituyan la decisión médica.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'The World Health Organization has stated in a new report that Europe needs to catch up in the use of artificial intelligence in hospitals. Over the past two years, more and more clinics have introduced AI systems that help doctors diagnose diseases. These systems can analyze medical images such as X-rays and CT scans, and detect abnormalities that the human eye sometimes misses. In Germany, 120 hospitals have already installed such programs. The results are impressive: the error rate in diagnosing breast cancer has dropped by 30 percent. However, there are also concerns. Privacy advocates warn that patient data needs better protection. Some doctors also fear becoming too dependent on the technology. The WHO therefore recommends that AI systems should always be used only as support and never replace medical decisions.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Maailman terveysjärjestö on uudessa raportissaan todennut, että Euroopan on kurottava kiinni tekoälyn käytössä sairaaloissa. Viimeisten kahden vuoden aikana yhä useammat klinikat ovat ottaneet käyttöön tekoälyjärjestelmiä, jotka auttavat lääkäreitä tautien diagnosoinnissa. Nämä järjestelmät voivat analysoida lääketieteellisiä kuvia, kuten röntgenkuvia ja tietokonetomografiakuvia, ja havaita poikkeavuuksia, joita ihmissilmä joskus ei huomaa. Saksassa jo 120 sairaalaa on asentanut tällaisia ohjelmia. Tulokset ovat vaikuttavia: rintasyövän diagnoosivirhe on laskenut 30 prosenttia. Huolenaiheitakin kuitenkin on. Tietosuojan puolustajat varoittavat, että potilastietoja on suojattava paremmin. Lisäksi osa lääkäreistä pelkää tulevansa liian riippuvaisiksi tekniikasta. WHO suositteleekin, että tekoälyjärjestelmiä käytettäisiin aina vain tukena eikä ne saisi koskaan korvata lääketieteellistä päätöksentekoa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'L''Organizzazione Mondiale della Sanità ha dichiarato in un nuovo rapporto che l''Europa deve recuperare terreno nell''uso dell''intelligenza artificiale negli ospedali. Negli ultimi due anni, sempre più cliniche hanno introdotto sistemi di IA che aiutano i medici a diagnosticare le malattie. Questi sistemi possono analizzare immagini mediche come radiografie e TAC, e rilevare anomalie che l''occhio umano a volte non nota. In Germania, 120 ospedali hanno già installato questi programmi. I risultati sono impressionanti: il tasso di errore nella diagnosi del cancro al seno è sceso del 30 per cento. Tuttavia, ci sono anche preoccupazioni. I difensori della privacy avvertono che i dati dei pazienti devono essere protetti meglio. Inoltre, alcuni medici temono di diventare troppo dipendenti dalla tecnologia. L''OMS raccomanda quindi che i sistemi di IA siano sempre usati solo come supporto e non sostituiscano mai le decisioni mediche.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'A Organização Mundial da Saúde declarou num novo relatório que a Europa precisa de recuperar o atraso no uso de inteligência artificial nos hospitais. Nos últimos dois anos, cada vez mais clínicas introduziram sistemas de IA que ajudam os médicos a diagnosticar doenças. Estes sistemas podem analisar imagens médicas como radiografias e tomografias, e detetar anomalias que o olho humano por vezes não vê. Na Alemanha, 120 hospitais já instalaram estes programas. Os resultados são impressionantes: a taxa de erro no diagnóstico de cancro da mama desceu 30 por cento. No entanto, também há preocupações. Os defensores da privacidade alertam que os dados dos pacientes precisam de melhor proteção. Alguns médicos também receiam tornar-se demasiado dependentes da tecnologia. A OMS recomenda por isso que os sistemas de IA sejam sempre usados apenas como apoio e nunca substituam as decisões médicas.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'En un informe publicado recientemente, la Organización Mundial de la Salud ha instado a los gobiernos europeos a acelerar considerablemente la integración de la inteligencia artificial en la sanidad. Aunque la tecnología ya ha arrojado resultados prometedores en algunos países, Europa va por detrás de Estados Unidos y China en lo que respecta a la implantación generalizada de sistemas de diagnóstico basados en IA.

En Alemania, 120 hospitales han implementado ya programas de IA capaces de analizar imágenes médicas. El software puede evaluar radiografías, tomografías y resonancias magnéticas, y reconocer patrones que incluso radiólogos experimentados podrían pasar por alto. Un estudio del hospital Charité de Berlín ha demostrado que el uso de IA redujo la tasa de error en el diagnóstico de cáncer de mama en un 30 por ciento.

No obstante, la creciente digitalización de la medicina plantea cuestiones éticas importantes. Los expertos en protección de datos subrayan que el tratamiento de información sensible de pacientes por parte de sistemas de IA debe estar sujeto a regulaciones estrictas. Existe el riesgo de que, sin la protección adecuada, se pueda hacer un uso indebido de los datos sanitarios personales. Además, profesionales médicos advierten de una posible dependencia excesiva de las recomendaciones algorítmicas, lo que podría provocar que la intuición clínica y la experiencia médica pierdan relevancia.

La OMS recomienda un enfoque equilibrado: la IA debe servir como herramienta de apoyo a las decisiones médicas sin sustituirlas. Al mismo tiempo, hay que impulsar las inversiones en infraestructura digital y en la formación del personal sanitario para poder aprovechar todo el potencial de la tecnología.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'In a recently published report, the World Health Organization has urged European governments to significantly accelerate the integration of artificial intelligence into healthcare. Although the technology has already yielded promising results in some countries, Europe as a whole lags behind the United States and China when it comes to the widespread adoption of AI-powered diagnostic systems.

In Germany, 120 hospitals have now implemented AI programs capable of analyzing medical imaging. The software can evaluate X-rays, CT scans, and MRI images, identifying patterns that even experienced radiologists might overlook. A study by Berlin''s Charité hospital demonstrated that the use of AI reduced the error rate in breast cancer diagnosis by 30 percent.

Nevertheless, the increasing digitalization of medicine raises important ethical questions. Data protection experts emphasize that the processing of sensitive patient data by AI systems must be subject to strict regulations. There is a risk that without adequate safeguards, personal health information could be misused. Furthermore, medical professionals warn of a potential over-reliance on algorithmic recommendations, which could lead to clinical intuition and medical experience losing their significance.

The WHO recommends a balanced approach: AI should serve as a tool to support medical decisions without replacing them. At the same time, investments in digital infrastructure and the training of medical personnel must be advanced in order to fully harness the technology''s potential.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Äskettäin julkaistussa raportissa Maailman terveysjärjestö on kehottanut Euroopan hallituksia nopeuttamaan merkittävästi tekoälyn integrointia terveydenhuoltoon. Vaikka teknologia on jo tuottanut lupaavia tuloksia joissakin maissa, Eurooppa on kokonaisuutena Yhdysvaltoja ja Kiinaa jäljessä tekoälypohjaisten diagnostiikkajärjestelmien laajamittaisessa käyttöönotossa.

Saksassa 120 sairaalaa on ottanut käyttöön tekoälyohjelmia, jotka pystyvät analysoimaan lääketieteellisiä kuvia. Ohjelmisto pystyy arvioimaan röntgenkuvia, tietokonetomografiakuvia ja magneettikuvia sekä tunnistamaan kaavoja, jotka saattaisivat jäädä kokeneilta radiologeiltakin huomaamatta. Berliinin Charité-sairaalan tutkimus on osoittanut, että tekoälyn käyttö vähensi rintasyövän diagnoosivirhettä 30 prosenttia.

Lääketieteen kasvava digitalisaatio herättää kuitenkin tärkeitä eettisiä kysymyksiä. Tietosuoja-asiantuntijat korostavat, että arkaluonteisten potilastietojen käsittelyn tekoälyjärjestelmissä on oltava tiukan sääntelyn alaista. On olemassa riski, että riittämättömällä suojauksella henkilökohtaisia terveystietoja voitaisiin käyttää väärin. Lisäksi lääketieteen ammattilaiset varoittavat mahdollisesta liiallisesta riippuvuudesta algoritmisiin suosituksiin, mikä voisi johtaa siihen, että kliininen intuitio ja lääketieteellinen kokemus menettävät merkitystään.

WHO suosittelee tasapainoista lähestymistapaa: tekoälyn tulisi toimia lääketieteellisten päätösten tueksi ilman, että se korvaa ne. Samalla investointeja digitaaliseen infrastruktuuriin ja terveydenhuoltohenkilöstön koulutukseen on edistettävä, jotta teknologian koko potentiaali voidaan hyödyntää.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'In un rapporto pubblicato di recente, l''Organizzazione Mondiale della Sanità ha esortato i governi europei ad accelerare significativamente l''integrazione dell''intelligenza artificiale nel sistema sanitario. Sebbene la tecnologia abbia già prodotto risultati promettenti in alcuni paesi, l''Europa nel complesso è in ritardo rispetto agli Stati Uniti e alla Cina per quanto riguarda l''adozione diffusa di sistemi diagnostici basati sull''IA.

In Germania, 120 ospedali hanno ormai implementato programmi di IA in grado di analizzare immagini mediche. Il software può valutare radiografie, TAC e risonanze magnetiche, identificando schemi che anche radiologi esperti potrebbero non notare. Uno studio dell''ospedale Charité di Berlino ha dimostrato che l''uso dell''IA ha ridotto del 30 per cento il tasso di errore nella diagnosi del cancro al seno.

Tuttavia, la crescente digitalizzazione della medicina solleva importanti questioni etiche. Gli esperti di protezione dei dati sottolineano che il trattamento di dati sensibili dei pazienti da parte dei sistemi di IA deve essere soggetto a regolamentazioni rigorose. Esiste il rischio che, senza adeguate tutele, le informazioni sanitarie personali possano essere utilizzate in modo improprio. Inoltre, i professionisti della medicina avvertono di una possibile eccessiva dipendenza dalle raccomandazioni algoritmiche, che potrebbe portare l''intuito clinico e l''esperienza medica a perdere la loro importanza.

L''OMS raccomanda un approccio equilibrato: l''IA dovrebbe servire come strumento di supporto alle decisioni mediche senza sostituirle. Allo stesso tempo, gli investimenti nell''infrastruttura digitale e nella formazione del personale sanitario devono essere potenziati per sfruttare appieno il potenziale della tecnologia.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'Num relatório publicado recentemente, a Organização Mundial da Saúde instou os governos europeus a acelerar significativamente a integração da inteligência artificial no sistema de saúde. Embora a tecnologia já tenha produzido resultados promissores em alguns países, a Europa no seu conjunto está atrás dos Estados Unidos e da China no que diz respeito à adoção generalizada de sistemas de diagnóstico baseados em IA.

Na Alemanha, 120 hospitais implementaram já programas de IA capazes de analisar imagens médicas. O software consegue avaliar radiografias, tomografias e ressonâncias magnéticas, identificando padrões que mesmo radiologistas experientes poderiam não detetar. Um estudo do hospital Charité de Berlim demonstrou que o uso de IA reduziu a taxa de erro no diagnóstico de cancro da mama em 30 por cento.

Contudo, a crescente digitalização da medicina levanta questões éticas importantes. Os especialistas em proteção de dados sublinham que o tratamento de dados sensíveis dos pacientes por sistemas de IA deve estar sujeito a regulamentações rigorosas. Existe o risco de que, sem proteção adequada, as informações pessoais de saúde possam ser utilizadas indevidamente. Além disso, profissionais médicos alertam para uma possível dependência excessiva de recomendações algorítmicas, o que poderia levar a que a intuição clínica e a experiência médica percam a sua importância.

A OMS recomenda uma abordagem equilibrada: a IA deve servir como ferramenta de apoio às decisões médicas sem as substituir. Ao mesmo tempo, os investimentos em infraestrutura digital e na formação do pessoal de saúde devem ser impulsionados para se poder aproveitar todo o potencial da tecnologia.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Diagnose
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Diagnose', 'diagnose', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el diagnóstico', 'el diagnóstico')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'diagnosis')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'diagnoosi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la diagnosi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o diagnóstico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: das Krankenhaus
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Krankenhaus', 'krankenhaus', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el hospital', 'el hospital')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'hospital')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sairaala')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''ospedale')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o hospital')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Röntgenaufnahme
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Röntgenaufnahme', 'röntgenaufnahme', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la radiografía', 'la radiografía')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'X-ray')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'röntgenkuva')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la radiografia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a radiografia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Datenschutz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Datenschutz', 'datenschutz', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la protección de datos', 'la protección de datos')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'data protection')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tietosuoja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la protezione dei dati')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a proteção de dados')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: erkennen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('erkennen', 'erkennen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'detectar', 'detectar')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to detect')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tunnistaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'rilevare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'detetar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Fehlerquote
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Fehlerquote', 'fehlerquote', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la tasa de error', 'la tasa de error')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'error rate')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'virheprosentti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il tasso di errore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a taxa de erro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: unterstützen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('unterstützen', 'unterstützen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'apoyar', 'apoyar')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to support')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tukea')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'supportare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'apoiar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 2: Rekordhitze in Europa fordert 50.000 Todesopfer
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Rekordhitze in Europa fordert 50.000 Todesopfer',
    'rekordhitze-europa-50000-tote',
    'Klimawandel und Hitzetote in Europa',
    'ciencia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'In diesem Sommer war es in Europa sehr heiß. Es war der heißeste Sommer seit vielen Jahren. Die Temperaturen waren über 40 Grad. Viele Menschen sind durch die Hitze gestorben. Experten sagen, dass fast 50.000 Menschen in Europa gestorben sind. Besonders alte Menschen waren in Gefahr. In Spanien, Italien und Griechenland war es am schlimmsten. Der Klimawandel ist schuld an der extremen Hitze. Zwei Drittel der Todesfälle kommen durch den Klimawandel. Die Regierungen müssen jetzt mehr tun. Sie brauchen bessere Pläne für heiße Tage. Zum Beispiel kühle Räume in Städten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Europa hat diesen Sommer die schlimmste Hitzewelle seit Beginn der Wetteraufzeichnungen erlebt. Laut einer neuen Studie sind fast 50.000 Menschen an den Folgen der extremen Temperaturen gestorben. Die Forscher haben herausgefunden, dass der Klimawandel für zwei Drittel dieser Todesfälle verantwortlich ist. Besonders betroffen waren die Mittelmeerländer Spanien, Italien und Griechenland, wo die Temperaturen wochenlang über 45 Grad lagen. Ältere Menschen und Personen mit Vorerkrankungen hatten das größte Risiko. Viele Krankenhäuser waren überlastet und konnten nicht alle Patienten aufnehmen. Die Studie zeigt auch, dass Städte besonders gefährlich sind, weil Beton und Asphalt die Hitze speichern. Experten fordern mehr Grünflächen in Städten und bessere Warnsysteme für die Bevölkerung. Außerdem brauchen europäische Länder konkrete Hitzeschutzpläne, die besonders gefährdete Gruppen schützen. Ohne entschlossenes Handeln gegen den Klimawandel werden solche Hitzewellen in Zukunft noch häufiger auftreten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Eine umfassende epidemiologische Studie, die von einem internationalen Forscherteam durchgeführt wurde, hat ergeben, dass die diesjährige Hitzewelle in Europa nahezu 50.000 Menschenleben gefordert hat. Besonders alarmierend ist die Erkenntnis, dass rund zwei Drittel dieser hitzebedinten Todesfälle unmittelbar auf den vom Menschen verursachten Klimawandel zurückzuführen sind.

Die Studie analysierte Mortalitätsdaten aus 35 europäischen Ländern und stellte fest, dass die Sterblichkeitsrate während der Sommermonate 2026 um 18 Prozent über dem langjährigen Durchschnitt lag. Die Mittelmeerregion war am stärksten betroffen: In Spanien wurden über 12.000 hitzebedingte Todesfälle registriert, gefolgt von Italien mit 9.500 und Griechenland mit 4.200. In mehreren Städten Südeuropas wurden Rekordtemperaturen von über 48 Grad Celsius gemessen.

Die Forscher betonen, dass der sogenannte urbane Wärmeinseleffekt die Situation in Großstädten erheblich verschärft hat. Versiegelte Flächen, mangelnde Durchlüftung und fehlende Begrünung führen dazu, dass sich Innenstädte nachts kaum abkühlen, was insbesondere für ältere und vorerkrankte Menschen lebensbedrohlich werden kann. Die nächtliche Hitzebelastung gilt als einer der entscheidenden Risikofaktoren, da sich der Körper ohne ausreichende Erholungsphasen nicht regenerieren kann.

Angesichts dieser Daten fordern Klimawissenschaftler ein grundlegendes Umdenken in der europäischen Klimapolitik. Neben der dringend notwendigen Reduktion von Treibhausgasemissionen müssten Städte systematisch umgebaut werden: mehr Grünflächen, reflektierende Oberflächen und ein verbessertes Frühwarnsystem könnten die Zahl der Hitzetoten künftig deutlich senken. Ohne solche Anpassungsmaßnahmen prognostizieren die Wissenschaftler, dass Europa bis 2040 regelmäßig Hitzewellen mit über 100.000 Todesopfern erleben könnte.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'Ola de calor récord en Europa causa 50.000 muertes', 'ola-calor-record-europa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'Record Heat Wave in Europe Claims 50,000 Lives', 'record-heat-wave-europe', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Ennätyshelleaalto Euroopassa vaatii 50 000 kuolonuhria', 'ennatyshelleaalto-euroopassa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'Ondata di calore record in Europa causa 50.000 vittime', 'ondata-calore-record-europa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'Onda de calor recorde na Europa causa 50.000 mortes', 'onda-calor-recorde-europa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'Este verano hizo mucho calor en Europa. Fue el verano más caluroso en muchos años. Las temperaturas superaron los 40 grados. Muchas personas murieron por el calor. Los expertos dicen que casi 50.000 personas murieron en Europa. Las personas mayores estaban en más peligro. En España, Italia y Grecia fue peor. El cambio climático es culpable del calor extremo. Dos tercios de las muertes se deben al cambio climático. Los gobiernos tienen que hacer más ahora. Necesitan mejores planes para los días de calor. Por ejemplo, espacios frescos en las ciudades.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'This summer was very hot in Europe. It was the hottest summer in many years. The temperatures were above 40 degrees. Many people died because of the heat. Experts say that almost 50,000 people died in Europe. Old people were in the most danger. In Spain, Italy, and Greece it was the worst. Climate change is to blame for the extreme heat. Two thirds of the deaths come from climate change. The governments must do more now. They need better plans for hot days. For example, cool spaces in cities.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Tänä kesänä Euroopassa oli erittäin kuumaa. Se oli kuumin kesä moneen vuoteen. Lämpötilat olivat yli 40 astetta. Monet ihmiset kuolivat kuumuuden takia. Asiantuntijat sanovat, että lähes 50 000 ihmistä kuoli Euroopassa. Erityisesti vanhat ihmiset olivat vaarassa. Espanjassa, Italiassa ja Kreikassa tilanne oli pahin. Ilmastonmuutos on syy äärimmäiseen kuumuuteen. Kaksi kolmasosaa kuolemista johtuu ilmastonmuutoksesta. Hallitusten täytyy nyt tehdä enemmän. Ne tarvitsevat parempia suunnitelmia kuumia päiviä varten. Esimerkiksi viileitä tiloja kaupungeissa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'Quest''estate in Europa ha fatto molto caldo. È stata l''estate più calda da molti anni. Le temperature hanno superato i 40 gradi. Molte persone sono morte a causa del caldo. Gli esperti dicono che quasi 50.000 persone sono morte in Europa. Le persone anziane erano più in pericolo. In Spagna, Italia e Grecia la situazione era peggiore. Il cambiamento climatico è la causa del caldo estremo. Due terzi delle morti sono dovuti al cambiamento climatico. I governi devono fare di più adesso. Hanno bisogno di piani migliori per i giorni caldi. Per esempio, spazi freschi nelle città.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'Este verão fez muito calor na Europa. Foi o verão mais quente em muitos anos. As temperaturas ultrapassaram os 40 graus. Muitas pessoas morreram por causa do calor. Os especialistas dizem que quase 50.000 pessoas morreram na Europa. As pessoas idosas estavam em maior perigo. Em Espanha, Itália e Grécia foi pior. As alterações climáticas são culpadas pelo calor extremo. Dois terços das mortes devem-se às alterações climáticas. Os governos têm de fazer mais agora. Precisam de melhores planos para os dias quentes. Por exemplo, espaços frescos nas cidades.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'Europa ha vivido este verano la peor ola de calor desde que se tienen registros meteorológicos. Según un nuevo estudio, casi 50.000 personas murieron a causa de las temperaturas extremas. Los investigadores han descubierto que el cambio climático es responsable de dos tercios de estas muertes. Los países mediterráneos como España, Italia y Grecia fueron los más afectados, con temperaturas por encima de 45 grados durante semanas. Las personas mayores y las que tenían enfermedades previas corrían el mayor riesgo. Muchos hospitales estaban saturados y no podían atender a todos los pacientes. El estudio también muestra que las ciudades son especialmente peligrosas porque el hormigón y el asfalto retienen el calor. Los expertos piden más zonas verdes en las ciudades y mejores sistemas de alerta para la población. Además, los países europeos necesitan planes concretos de protección contra el calor que protejan a los grupos más vulnerables. Sin una acción decidida contra el cambio climático, estas olas de calor serán aún más frecuentes en el futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'Europe has experienced its worst heat wave since weather records began this summer. According to a new study, almost 50,000 people died as a result of the extreme temperatures. Researchers have found that climate change is responsible for two thirds of these deaths. The Mediterranean countries of Spain, Italy, and Greece were especially affected, where temperatures remained above 45 degrees for weeks. Elderly people and those with pre-existing conditions were at the greatest risk. Many hospitals were overwhelmed and could not admit all patients. The study also shows that cities are particularly dangerous because concrete and asphalt store heat. Experts are calling for more green spaces in cities and better warning systems for the population. European countries also need concrete heat protection plans that safeguard the most vulnerable groups. Without decisive action against climate change, such heat waves will become even more frequent in the future.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Eurooppa on kokenut tänä kesänä pahimman helleaallon säähavaintojen alkamisen jälkeen. Uuden tutkimuksen mukaan lähes 50 000 ihmistä kuoli äärimmäisten lämpötilojen seurauksena. Tutkijat ovat todenneet, että ilmastonmuutos on vastuussa kahdesta kolmasosasta näistä kuolemista. Välimeren maat Espanja, Italia ja Kreikka kärsivät eniten, kun lämpötilat pysyivät yli 45 asteessa viikkoja. Ikääntyneillä ja perussairaita sairastavilla oli suurin riski. Monet sairaalat olivat ylikuormitettuja eivätkä pystyneet ottamaan vastaan kaikkia potilaita. Tutkimus osoittaa myös, että kaupungit ovat erityisen vaarallisia, koska betoni ja asfaltti varastoivat lämpöä. Asiantuntijat vaativat lisää viheralueita kaupunkeihin ja parempia varoitusjärjestelmiä väestölle. Euroopan maat tarvitsevat myös konkreettisia kuumuussuojasuunnitelmia, jotka suojelevat haavoittuvimpia ryhmiä. Ilman määrätietoisia toimia ilmastonmuutosta vastaan tällaiset helleaallot yleistyvät entisestään tulevaisuudessa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'Quest''estate l''Europa ha vissuto la peggiore ondata di calore da quando esistono le rilevazioni meteorologiche. Secondo un nuovo studio, quasi 50.000 persone sono morte a causa delle temperature estreme. I ricercatori hanno scoperto che il cambiamento climatico è responsabile di due terzi di questi decessi. I paesi mediterranei come Spagna, Italia e Grecia sono stati i più colpiti, con temperature superiori ai 45 gradi per settimane. Le persone anziane e quelle con patologie pregresse correvano il rischio maggiore. Molti ospedali erano sovraccarichi e non riuscivano ad accogliere tutti i pazienti. Lo studio mostra anche che le città sono particolarmente pericolose perché il cemento e l''asfalto trattengono il calore. Gli esperti chiedono più spazi verdi nelle città e migliori sistemi di allerta per la popolazione. I paesi europei hanno bisogno anche di piani concreti di protezione dal caldo che tutelino i gruppi più vulnerabili. Senza un''azione decisa contro il cambiamento climatico, queste ondate di calore diventeranno ancora più frequenti in futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'A Europa viveu este verão a pior onda de calor desde o início dos registos meteorológicos. Segundo um novo estudo, quase 50.000 pessoas morreram em consequência das temperaturas extremas. Os investigadores descobriram que as alterações climáticas são responsáveis por dois terços destas mortes. Os países mediterrânicos como Espanha, Itália e Grécia foram os mais afetados, com temperaturas acima dos 45 graus durante semanas. As pessoas idosas e as que tinham doenças prévias corriam o maior risco. Muitos hospitais estavam sobrelotados e não conseguiam receber todos os pacientes. O estudo mostra também que as cidades são particularmente perigosas porque o betão e o asfalto retêm o calor. Os especialistas pedem mais espaços verdes nas cidades e melhores sistemas de alerta para a população. Os países europeus precisam também de planos concretos de proteção contra o calor que protejam os grupos mais vulneráveis. Sem uma ação decidida contra as alterações climáticas, estas ondas de calor serão ainda mais frequentes no futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'Un amplio estudio epidemiológico realizado por un equipo internacional de investigadores ha revelado que la ola de calor de este año en Europa ha cobrado casi 50.000 vidas humanas. Resulta especialmente alarmante el hallazgo de que aproximadamente dos tercios de estas muertes por calor son directamente atribuibles al cambio climático provocado por el ser humano.

El estudio analizó datos de mortalidad de 35 países europeos y constató que la tasa de mortalidad durante los meses de verano de 2026 superó en un 18 por ciento la media histórica. La región mediterránea fue la más afectada: en España se registraron más de 12.000 muertes por calor, seguida de Italia con 9.500 y Grecia con 4.200. En varias ciudades del sur de Europa se midieron temperaturas récord superiores a los 48 grados centígrados.

Los investigadores subrayan que el llamado efecto isla de calor urbano ha agravado considerablemente la situación en las grandes ciudades. Las superficies impermeabilizadas, la falta de ventilación y la escasez de vegetación provocan que los centros urbanos apenas se enfríen durante la noche, lo que puede resultar potencialmente mortal para las personas mayores y con enfermedades previas. La exposición nocturna al calor se considera uno de los factores de riesgo determinantes, ya que el cuerpo no puede regenerarse sin fases de descanso suficientes.

Ante estos datos, los científicos del clima exigen un cambio de mentalidad fundamental en la política climática europea. Además de la reducción urgente de las emisiones de gases de efecto invernadero, las ciudades deben transformarse sistemáticamente: más zonas verdes, superficies reflectantes y un sistema de alerta temprana mejorado podrían reducir significativamente el número de muertes por calor en el futuro. Sin estas medidas de adaptación, los científicos pronostican que Europa podría experimentar regularmente olas de calor con más de 100.000 víctimas mortales para 2040.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'A comprehensive epidemiological study conducted by an international team of researchers has revealed that this year''s heat wave in Europe has claimed nearly 50,000 lives. Particularly alarming is the finding that approximately two thirds of these heat-related deaths are directly attributable to human-caused climate change.

The study analyzed mortality data from 35 European countries and found that the death rate during the summer months of 2026 exceeded the long-term average by 18 percent. The Mediterranean region was most severely affected: in Spain, over 12,000 heat-related deaths were recorded, followed by Italy with 9,500 and Greece with 4,200. In several cities across southern Europe, record temperatures exceeding 48 degrees Celsius were measured.

The researchers emphasize that the so-called urban heat island effect has significantly worsened conditions in major cities. Sealed surfaces, poor ventilation, and a lack of greenery mean that city centers barely cool down at night, which can become life-threatening particularly for elderly people and those with pre-existing conditions. Nighttime heat exposure is considered one of the critical risk factors, as the body cannot recover without sufficient cooling periods.

In light of these data, climate scientists are demanding a fundamental rethinking of European climate policy. Beyond the urgently needed reduction of greenhouse gas emissions, cities must be systematically redesigned: more green spaces, reflective surfaces, and improved early warning systems could significantly reduce the number of heat-related deaths in the future. Without such adaptation measures, scientists predict that by 2040, Europe could regularly experience heat waves claiming over 100,000 lives.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Kansainvälisen tutkijaryhmän tekemä laaja epidemiologinen tutkimus on paljastanut, että tämän vuoden helleaalto Euroopassa on vaatinut lähes 50 000 ihmishenkeä. Erityisen hälyttävää on havainto, että noin kaksi kolmasosaa näistä kuumuuteen liittyvistä kuolemista johtuu suoraan ihmisen aiheuttamasta ilmastonmuutoksesta.

Tutkimus analysoi kuolleisuustietoja 35 Euroopan maasta ja totesi, että kuolleisuus kesäkuukausina 2026 ylitti pitkän aikavälin keskiarvon 18 prosentilla. Välimeren alue kärsi eniten: Espanjassa kirjattiin yli 12 000 kuumuuteen liittyvää kuolemaa, Italian 9 500 ja Kreikan 4 200 seuratessa. Useissa Etelä-Euroopan kaupungeissa mitattiin ennätyslämpötiloja, jotka ylittivät 48 celsiusastetta.

Tutkijat korostavat, että niin sanottu kaupunkien lämpösaarekeilmiö on pahentanut tilannetta suurkaupungeissa merkittävästi. Päällystetyt pinnat, heikko tuuletus ja kasvillisuuden puute johtavat siihen, että kaupunkikeskustat tuskin viilenevät yöllä, mikä voi olla hengenvaarallista erityisesti ikääntyneille ja perussairaille. Yöaikaista kuumuusaltistusta pidetään yhtenä ratkaisevista riskitekijöistä, sillä elimistö ei pysty palautumaan ilman riittäviä lepoajanjaksoja.

Näiden tietojen valossa ilmastotutkijat vaativat perustavanlaatuista ajattelutavan muutosta Euroopan ilmastopolitiikassa. Kasvihuonekaasupäästöjen kiireellisesti tarvittavan vähentämisen lisäksi kaupunkeja on muokattava järjestelmällisesti: lisää viheralueita, heijastavat pinnat ja parannettu ennakkovaroitusjärjestelmä voisivat vähentää kuumuuskuolemien määrää merkittävästi tulevaisuudessa. Ilman tällaisia sopeutumistoimia tutkijat ennustavat, että vuoteen 2040 mennessä Eurooppa saattaa kokea säännöllisesti yli 100 000 kuolonuhria vaativia helleaaltoja.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Un ampio studio epidemiologico condotto da un team internazionale di ricercatori ha rivelato che l''ondata di calore di quest''anno in Europa ha causato quasi 50.000 vittime. È particolarmente allarmante la scoperta che circa due terzi di queste morti legate al caldo sono direttamente attribuibili al cambiamento climatico provocato dall''uomo.

Lo studio ha analizzato i dati sulla mortalità di 35 paesi europei e ha riscontrato che il tasso di mortalità durante i mesi estivi del 2026 ha superato la media storica del 18 per cento. La regione mediterranea è stata la più colpita: in Spagna sono state registrate oltre 12.000 morti per il caldo, seguita dall''Italia con 9.500 e dalla Grecia con 4.200. In diverse città dell''Europa meridionale sono state misurate temperature record superiori ai 48 gradi centigradi.

I ricercatori sottolineano che il cosiddetto effetto isola di calore urbano ha aggravato significativamente la situazione nelle grandi città. Le superfici impermeabilizzate, la scarsa ventilazione e la mancanza di verde fanno sì che i centri urbani non si raffreddino quasi per nulla durante la notte, il che può diventare potenzialmente letale soprattutto per gli anziani e le persone con patologie pregresse. L''esposizione notturna al caldo è considerata uno dei fattori di rischio determinanti, poiché il corpo non può rigenerarsi senza sufficienti periodi di recupero.

Alla luce di questi dati, gli scienziati del clima richiedono un ripensamento fondamentale della politica climatica europea. Oltre alla riduzione urgentemente necessaria delle emissioni di gas serra, le città devono essere riprogettate sistematicamente: più aree verdi, superfici riflettenti e un miglior sistema di allerta precoce potrebbero ridurre significativamente il numero di morti per il caldo in futuro. Senza tali misure di adattamento, gli scienziati prevedono che entro il 2040 l''Europa potrebbe vivere regolarmente ondate di calore con oltre 100.000 vittime.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'Um amplo estudo epidemiológico realizado por uma equipa internacional de investigadores revelou que a onda de calor deste ano na Europa causou quase 50.000 mortes. É particularmente alarmante a descoberta de que aproximadamente dois terços destas mortes relacionadas com o calor são diretamente atribuíveis às alterações climáticas causadas pelo ser humano.

O estudo analisou dados de mortalidade de 35 países europeus e constatou que a taxa de mortalidade durante os meses de verão de 2026 superou a média histórica em 18 por cento. A região mediterrânica foi a mais afetada: em Espanha foram registadas mais de 12.000 mortes por calor, seguida da Itália com 9.500 e da Grécia com 4.200. Em várias cidades do sul da Europa foram medidas temperaturas recorde superiores a 48 graus Celsius.

Os investigadores sublinham que o chamado efeito de ilha de calor urbano agravou significativamente a situação nas grandes cidades. As superfícies impermeabilizadas, a fraca ventilação e a falta de vegetação fazem com que os centros urbanos mal arrefeçam durante a noite, o que pode tornar-se potencialmente fatal, sobretudo para as pessoas idosas e com doenças prévias. A exposição noturna ao calor é considerada um dos fatores de risco determinantes, uma vez que o corpo não consegue recuperar sem períodos de descanso suficientes.

Perante estes dados, os cientistas climáticos exigem uma mudança fundamental de mentalidade na política climática europeia. Para além da redução urgente das emissões de gases com efeito de estufa, as cidades devem ser sistematicamente redesenhadas: mais espaços verdes, superfícies refletoras e um sistema de alerta precoce melhorado poderiam reduzir significativamente o número de mortes por calor no futuro. Sem estas medidas de adaptação, os cientistas preveem que até 2040 a Europa poderá sofrer regularmente ondas de calor com mais de 100.000 vítimas mortais.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Hitzewelle
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Hitzewelle', 'hitzewelle', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la ola de calor', 'la ola de calor')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'heat wave')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'helleaalto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''ondata di calore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a onda de calor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Klimawandel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Klimawandel', 'klimawandel', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el cambio climático', 'el cambio climático')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'climate change')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ilmastonmuutos')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il cambiamento climatico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'as alterações climáticas')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Sterblichkeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Sterblichkeit', 'sterblichkeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la mortalidad', 'la mortalidad')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'mortality')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuolleisuus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la mortalità')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a mortalidade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Grünfläche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Grünfläche', 'grünfläche', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la zona verde', 'la zona verde')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'green space')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'viheralue')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''area verde')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o espaço verde')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: gefährdet
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gefährdet', 'gefährdet', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'vulnerable', 'vulnerable')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'vulnerable')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'haavoittuva')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'vulnerabile')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'vulnerável')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: das Warnsystem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Warnsystem', 'warnsystem', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el sistema de alerta', 'el sistema de alerta')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'warning system')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'varoitusjärjestelmä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il sistema di allerta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o sistema de alerta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Treibhausgase
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Treibhausgase', 'treibhausgase', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'los gases de efecto invernadero', 'los gases de efecto invernadero')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'greenhouse gases')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kasvihuonekaasut')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'i gas serra')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'os gases com efeito de estufa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 3: Studentenbewegung gewinnt Wahl in Serbien
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Studentenbewegung gewinnt Wahl in Serbien',
    'studentenbewegung-gewinnt-wahl-serbien',
    'Politischer Wandel in Serbien',
    'politica',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'In Serbien gab es eine wichtige Wahl. Eine neue Partei hat gewonnen. Diese Partei kommt von einer Studentenbewegung. Viele junge Menschen haben sie unterstützt. Der alte Präsident war mehr als zehn Jahre an der Macht. Viele Serben waren unzufrieden mit ihm. Sie wollten mehr Demokratie und weniger Korruption. Die Studenten haben lange protestiert. Sie sind auf die Straßen gegangen. Jetzt haben sie die Wahl gewonnen. Die Menschen in Serbien feiern diesen Sieg. Europa ist auch zufrieden. Die neue Regierung will enger mit der EU zusammenarbeiten. Es ist ein historischer Moment für das Land.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Bei den Parlamentswahlen in Serbien hat eine von Studenten unterstützte Bewegung einen historischen Sieg errungen und damit mehr als ein Jahrzehnt populistischer Herrschaft beendet. Die Partei "Neues Serbien" gewann 42 Prozent der Stimmen und kann nun eine Koalitionsregierung bilden. Der bisherige Machthaber, der enge Beziehungen zu Moskau unterhielt, verlor zum ersten Mal seit 2012 eine Wahl. Die Protestbewegung hatte vor zwei Jahren an Universitäten begonnen, als Studenten gegen Korruption und mangelnde Pressefreiheit auf die Straße gingen. Tausende Demonstranten forderten demokratische Reformen und eine Annäherung an die Europäische Union. Trotz Einschüchterungsversuchen durch die Regierung wuchs die Bewegung stetig. Bei der Wahlnacht versammelten sich Zehntausende Menschen in den Straßen von Belgrad, um den Sieg zu feiern. Die EU-Kommission gratulierte der neuen Regierung und bot Unterstützung bei demokratischen Reformen an. Analysten bewerten den Machtwechsel als einen der bedeutendsten politischen Umbrüche in Südosteuropa der letzten Jahre.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'In einer Wahl, die von internationalen Beobachtern als Wendepunkt für die westliche Balkanregion bezeichnet wird, hat eine aus Studentenprotesten hervorgegangene politische Bewegung die Parlamentswahlen in Serbien gewonnen und damit eine Ära beendet, die von autoritärer Regierungsführung, Medienmanipulation und zunehmender Erosion demokratischer Institutionen geprägt war.

Die Partei "Neues Serbien", die erst vor 18 Monaten gegründet wurde, erzielte mit 42 Prozent der Stimmen ein Ergebnis, das weit über den Prognosen lag. Zusammen mit zwei kleineren pro-europäischen Parteien verfügt sie nun über eine komfortable Mehrheit im Parlament. Der bisherige Präsident, dessen Regierung enge Verbindungen zum Kreml pflegte und wiederholt für die Unterdrückung der Opposition kritisiert wurde, musste seine Niederlage eingestehen.

Die Wurzeln dieses politischen Umbruchs liegen in einer Protestbewegung, die 2024 an der Universität Belgrad ihren Anfang nahm. Auslöser waren Korruptionsskandale im Bildungswesen und die Einschränkung der Pressefreiheit. Was zunächst als studentischer Protest begann, entwickelte sich zu einer breiten gesellschaftlichen Bewegung, die Menschen aller Altersgruppen und sozialen Schichten vereinte. Die Demonstranten organisierten sich dezentral über soziale Medien und widerstanden systematischen Einschüchterungsversuchen durch staatlich kontrollierte Medien und Sicherheitskräfte.

Die Europäische Union hat den Wahlsieg enthusiastisch begrüßt. EU-Kommissionspräsidentin bezeichnete das Ergebnis als ermutigendes Signal für die gesamte Region und kündigte ein beschleunigtes Beitrittsverfahren an. Politikwissenschaftler weisen allerdings darauf hin, dass die neue Regierung vor enormen Herausforderungen steht: die Reform des Justizwesens, die Bekämpfung tief verwurzelter Korruptionsstrukturen und die wirtschaftliche Modernisierung des Landes erfordern nicht nur politischen Willen, sondern auch eine nachhaltige Unterstützung durch die Zivilgesellschaft, die den demokratischen Wandel erst möglich gemacht hat.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'Movimiento estudiantil gana las elecciones en Serbia', 'movimiento-estudiantil-elecciones-serbia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'Student Movement Wins Election in Serbia', 'student-movement-wins-election-serbia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Opiskelijaliike voittaa vaalit Serbiassa', 'opiskelijaliike-voittaa-vaalit-serbiassa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'Movimento studentesco vince le elezioni in Serbia', 'movimento-studentesco-elezioni-serbia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'Movimento estudantil vence eleições na Sérvia', 'movimento-estudantil-eleicoes-servia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'En Serbia hubo una elección importante. Un nuevo partido ganó. Este partido viene de un movimiento estudiantil. Muchos jóvenes lo apoyaron. El antiguo presidente llevaba más de diez años en el poder. Muchos serbios estaban descontentos con él. Querían más democracia y menos corrupción. Los estudiantes protestaron durante mucho tiempo. Salieron a las calles. Ahora han ganado las elecciones. La gente en Serbia celebra esta victoria. Europa también está satisfecha. El nuevo gobierno quiere trabajar más estrechamente con la UE. Es un momento histórico para el país.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'There was an important election in Serbia. A new party won. This party comes from a student movement. Many young people supported it. The old president was in power for more than ten years. Many Serbians were unhappy with him. They wanted more democracy and less corruption. The students protested for a long time. They went out on the streets. Now they have won the election. The people in Serbia celebrate this victory. Europe is also pleased. The new government wants to work more closely with the EU. It is a historic moment for the country.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Serbiassa oli tärkeät vaalit. Uusi puolue voitti. Tämä puolue syntyi opiskelijaliikkeestä. Monet nuoret tukivat sitä. Vanha presidentti oli ollut vallassa yli kymmenen vuotta. Monet serbit olivat tyytymättömiä häneen. He halusivat enemmän demokratiaa ja vähemmän korruptiota. Opiskelijat protestoivat pitkään. He menivät kaduille. Nyt he ovat voittaneet vaalit. Serbian kansa juhlii tätä voittoa. Eurooppakin on tyytyväinen. Uusi hallitus haluaa tehdä tiiviimmin yhteistyötä EU:n kanssa. Se on historiallinen hetki maalle.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'In Serbia c''è stata un''elezione importante. Un nuovo partito ha vinto. Questo partito viene da un movimento studentesco. Molti giovani lo hanno sostenuto. Il vecchio presidente era al potere da più di dieci anni. Molti serbi erano insoddisfatti di lui. Volevano più democrazia e meno corruzione. Gli studenti hanno protestato a lungo. Sono scesi in piazza. Ora hanno vinto le elezioni. La gente in Serbia festeggia questa vittoria. Anche l''Europa è soddisfatta. Il nuovo governo vuole collaborare più strettamente con l''UE. È un momento storico per il paese.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'Na Sérvia houve uma eleição importante. Um novo partido ganhou. Este partido vem de um movimento estudantil. Muitos jovens apoiaram-no. O antigo presidente estava no poder há mais de dez anos. Muitos sérvios estavam descontentes com ele. Queriam mais democracia e menos corrupção. Os estudantes protestaram durante muito tempo. Saíram às ruas. Agora ganharam as eleições. O povo na Sérvia celebra esta vitória. A Europa também está satisfeita. O novo governo quer trabalhar mais estreitamente com a UE. É um momento histórico para o país.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'En las elecciones parlamentarias de Serbia, un movimiento respaldado por estudiantes ha logrado una victoria histórica, poniendo fin a más de una década de gobierno populista. El partido "Nueva Serbia" obtuvo el 42 por ciento de los votos y ahora puede formar un gobierno de coalición. El gobernante anterior, que mantenía estrechas relaciones con Moscú, perdió unas elecciones por primera vez desde 2012. El movimiento de protesta había comenzado hace dos años en las universidades, cuando los estudiantes salieron a la calle contra la corrupción y la falta de libertad de prensa. Miles de manifestantes exigieron reformas democráticas y un acercamiento a la Unión Europea. A pesar de los intentos de intimidación del gobierno, el movimiento creció de forma constante. La noche electoral, decenas de miles de personas se congregaron en las calles de Belgrado para celebrar la victoria. La Comisión Europea felicitó al nuevo gobierno y ofreció apoyo para las reformas democráticas. Los analistas valoran el cambio de poder como uno de los cambios políticos más significativos en el sureste de Europa en los últimos años.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'In Serbia''s parliamentary elections, a student-backed movement has achieved a historic victory, ending more than a decade of populist rule. The "New Serbia" party won 42 percent of the vote and can now form a coalition government. The previous ruler, who maintained close ties with Moscow, lost an election for the first time since 2012. The protest movement had begun two years ago at universities, when students took to the streets against corruption and the lack of press freedom. Thousands of demonstrators demanded democratic reforms and closer ties with the European Union. Despite intimidation attempts by the government, the movement grew steadily. On election night, tens of thousands of people gathered in the streets of Belgrade to celebrate the victory. The EU Commission congratulated the new government and offered support for democratic reforms. Analysts regard the change of power as one of the most significant political shifts in southeastern Europe in recent years.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Serbian parlamenttivaaleissa opiskelijoiden tukema liike on saavuttanut historiallisen voiton ja päättänyt yli vuosikymmenen kestäneen populistisen hallinnon. "Uusi Serbia" -puolue sai 42 prosenttia äänistä ja voi nyt muodostaa koalitiohallituksen. Edellinen vallankäyttäjä, joka ylläpiti läheisiä suhteita Moskovaan, hävisi vaalit ensimmäistä kertaa vuoden 2012 jälkeen. Protestiliike oli alkanut kaksi vuotta sitten yliopistoissa, kun opiskelijat lähtivät kaduille korruptiota ja lehdistönvapauden puutetta vastaan. Tuhannet mielenosoittajat vaativat demokraattisia uudistuksia ja lähentymistä Euroopan unioniin. Hallituksen pelotteluyrityksistä huolimatta liike kasvoi tasaisesti. Vaaliyönä kymmenettuhannet ihmiset kokoontuivat Belgradin kaduille juhlimaan voittoa. EU-komissio onnitteli uutta hallitusta ja tarjosi tukea demokraattisille uudistuksille. Analyytikot pitävät vallanvaihdosta yhtenä Kaakkois-Euroopan merkittävimmistä poliittisista muutoksista viime vuosina.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'Nelle elezioni parlamentari in Serbia, un movimento sostenuto dagli studenti ha ottenuto una vittoria storica, ponendo fine a più di un decennio di governo populista. Il partito "Nuova Serbia" ha conquistato il 42 per cento dei voti e può ora formare un governo di coalizione. Il precedente leader, che manteneva stretti rapporti con Mosca, ha perso un''elezione per la prima volta dal 2012. Il movimento di protesta era iniziato due anni fa nelle università, quando gli studenti sono scesi in piazza contro la corruzione e la mancanza di libertà di stampa. Migliaia di manifestanti hanno chiesto riforme democratiche e un avvicinamento all''Unione Europea. Nonostante i tentativi di intimidazione da parte del governo, il movimento è cresciuto costantemente. La notte delle elezioni, decine di migliaia di persone si sono radunate per le strade di Belgrado per festeggiare la vittoria. La Commissione Europea ha congratulato il nuovo governo e offerto sostegno per le riforme democratiche. Gli analisti valutano il cambio di potere come uno dei cambiamenti politici più significativi nel sud-est dell''Europa degli ultimi anni.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'Nas eleições parlamentares na Sérvia, um movimento apoiado por estudantes alcançou uma vitória histórica, pondo fim a mais de uma década de governo populista. O partido "Nova Sérvia" obteve 42 por cento dos votos e pode agora formar um governo de coligação. O anterior governante, que mantinha relações próximas com Moscovo, perdeu uma eleição pela primeira vez desde 2012. O movimento de protesto tinha começado há dois anos nas universidades, quando os estudantes saíram à rua contra a corrupção e a falta de liberdade de imprensa. Milhares de manifestantes exigiram reformas democráticas e uma aproximação à União Europeia. Apesar das tentativas de intimidação por parte do governo, o movimento cresceu de forma constante. Na noite eleitoral, dezenas de milhares de pessoas reuniram-se nas ruas de Belgrado para celebrar a vitória. A Comissão Europeia felicitou o novo governo e ofereceu apoio para as reformas democráticas. Os analistas consideram a mudança de poder como uma das alterações políticas mais significativas no sudeste da Europa dos últimos anos.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'En unas elecciones que los observadores internacionales califican como un punto de inflexión para la región de los Balcanes occidentales, un movimiento político surgido de las protestas estudiantiles ha ganado las elecciones parlamentarias en Serbia, poniendo fin a una era marcada por el autoritarismo, la manipulación mediática y la erosión progresiva de las instituciones democráticas.

El partido "Nueva Serbia", fundado hace apenas 18 meses, obtuvo un 42 por ciento de los votos, un resultado muy por encima de las previsiones. Junto con dos partidos proeuropeos menores, dispone ahora de una mayoría cómoda en el parlamento. El presidente saliente, cuyo gobierno mantenía estrechos vínculos con el Kremlin y había sido criticado repetidamente por la represión de la oposición, tuvo que reconocer su derrota.

Las raíces de este cambio político se encuentran en un movimiento de protesta que comenzó en 2024 en la Universidad de Belgrado. Los detonantes fueron escándalos de corrupción en el sistema educativo y la restricción de la libertad de prensa. Lo que empezó como una protesta estudiantil se convirtió en un amplio movimiento social que unió a personas de todas las edades y clases sociales. Los manifestantes se organizaron de forma descentralizada a través de las redes sociales y resistieron los intentos sistemáticos de intimidación por parte de los medios controlados por el Estado y las fuerzas de seguridad.

La Unión Europea ha acogido con entusiasmo la victoria electoral. La presidenta de la Comisión Europea calificó el resultado como una señal alentadora para toda la región y anunció un procedimiento de adhesión acelerado. Los politólogos señalan, sin embargo, que el nuevo gobierno se enfrenta a desafíos enormes: la reforma del sistema judicial, la lucha contra las estructuras de corrupción profundamente arraigadas y la modernización económica del país requieren no solo voluntad política, sino también el apoyo sostenido de la sociedad civil que hizo posible el cambio democrático.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'In an election that international observers are calling a turning point for the western Balkans region, a political movement born from student protests has won Serbia''s parliamentary elections, ending an era characterized by authoritarian governance, media manipulation, and the progressive erosion of democratic institutions.

The "New Serbia" party, founded just 18 months ago, achieved 42 percent of the vote — a result far exceeding projections. Together with two smaller pro-European parties, it now holds a comfortable parliamentary majority. The outgoing president, whose government maintained close ties with the Kremlin and was repeatedly criticized for suppressing the opposition, was forced to concede defeat.

The roots of this political upheaval lie in a protest movement that began in 2024 at the University of Belgrade. The triggers were corruption scandals in the education system and restrictions on press freedom. What started as a student protest evolved into a broad social movement that united people of all ages and social classes. The demonstrators organized themselves in a decentralized manner through social media and withstood systematic intimidation by state-controlled media and security forces.

The European Union has enthusiastically welcomed the election victory. The EU Commission president described the result as an encouraging signal for the entire region and announced an accelerated accession process. Political scientists point out, however, that the new government faces enormous challenges: reforming the judiciary, combating deeply entrenched corruption structures, and modernizing the country''s economy require not only political will but also sustained support from the civil society that made the democratic transformation possible in the first place.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Vaaleissa, joita kansainväliset tarkkailijat kutsuvat käännekohdaksi Länsi-Balkanin alueelle, opiskelijaprotestista syntynyt poliittinen liike on voittanut Serbian parlamenttivaalit ja päättänyt aikakauden, jolle olivat ominaisia autoritaarinen hallinto, mediamanipulaatio ja demokraattisten instituutioiden asteittainen rapautuminen.

Vain 18 kuukautta sitten perustettu "Uusi Serbia" -puolue saavutti 42 prosenttia äänistä — tuloksen, joka ylitti ennusteet selvästi. Yhdessä kahden pienemmän EU-myönteisen puolueen kanssa sillä on nyt mukava enemmistö parlamentissa. Istuva presidentti, jonka hallitus ylläpiti läheisiä suhteita Kremliin ja jota arvosteltiin toistuvasti opposition tukahduttamisesta, joutui myöntämään tappionsa.

Tämän poliittisen mullistuksen juuret ovat protestiliikkeessä, joka alkoi vuonna 2024 Belgradin yliopistossa. Laukaisijana olivat koulutusjärjestelmän korruptioskandaalit ja lehdistönvapauden rajoittaminen. Opiskelijaprotestina alkanut liike kehittyi laajaksi yhteiskunnalliseksi liikkeeksi, joka yhdisti kaiken ikäisiä ja kaikista yhteiskuntaluokista olevia ihmisiä. Mielenosoittajat järjestäytyivät hajautetusti sosiaalisen median kautta ja kestivät valtiollisesti kontrolloitujen tiedotusvälineiden ja turvallisuusjoukkojen järjestelmällisiä pelotteluyrityksiä.

Euroopan unioni on ottanut vaalivoiton innostuneesti vastaan. EU-komission puheenjohtaja kuvaili tulosta rohkaisevana signaalina koko alueelle ja ilmoitti nopeutetusta liittymisprosessista. Politiikan tutkijat huomauttavat kuitenkin, että uusi hallitus kohtaa valtavia haasteita: oikeuslaitoksen uudistaminen, syvälle juurtuneiden korruptiorakenteiden torjunta ja maan talouden modernisointi vaativat poliittisen tahdon lisäksi myös kestävää tukea kansalaisyhteiskunnalta, joka teki demokraattisen muutoksen ylipäätään mahdolliseksi.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'In un''elezione che gli osservatori internazionali definiscono un punto di svolta per la regione dei Balcani occidentali, un movimento politico nato dalle proteste studentesche ha vinto le elezioni parlamentari in Serbia, mettendo fine a un''era caratterizzata da governance autoritaria, manipolazione dei media e progressiva erosione delle istituzioni democratiche.

Il partito "Nuova Serbia", fondato appena 18 mesi fa, ha ottenuto il 42 per cento dei voti, un risultato ben al di sopra delle previsioni. Insieme a due partiti minori filoeuropei, dispone ora di una comoda maggioranza parlamentare. Il presidente uscente, il cui governo manteneva stretti legami con il Cremlino ed era stato ripetutamente criticato per la repressione dell''opposizione, ha dovuto riconoscere la sconfitta.

Le radici di questo sconvolgimento politico risiedono in un movimento di protesta iniziato nel 2024 all''Università di Belgrado. A scatenarlo furono gli scandali di corruzione nel sistema educativo e le restrizioni alla libertà di stampa. Quello che era iniziato come una protesta studentesca si è trasformato in un ampio movimento sociale che ha unito persone di ogni età e classe sociale. I manifestanti si sono organizzati in modo decentralizzato attraverso i social media e hanno resistito ai tentativi sistematici di intimidazione da parte dei media controllati dallo Stato e delle forze di sicurezza.

L''Unione Europea ha accolto con entusiasmo la vittoria elettorale. La presidente della Commissione Europea ha descritto il risultato come un segnale incoraggiante per l''intera regione e ha annunciato un processo di adesione accelerato. I politologi fanno notare, tuttavia, che il nuovo governo si trova di fronte a sfide enormi: la riforma del sistema giudiziario, la lotta alle strutture di corruzione profondamente radicate e la modernizzazione economica del paese richiedono non solo volontà politica, ma anche un sostegno duraturo da parte della società civile che ha reso possibile la trasformazione democratica.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'Numa eleição que os observadores internacionais consideram um ponto de viragem para a região dos Balcãs ocidentais, um movimento político nascido dos protestos estudantis venceu as eleições parlamentares na Sérvia, pondo fim a uma era caracterizada pela governação autoritária, manipulação mediática e erosão progressiva das instituições democráticas.

O partido "Nova Sérvia", fundado há apenas 18 meses, obteve 42 por cento dos votos — um resultado muito acima das previsões. Juntamente com dois partidos pró-europeus mais pequenos, detém agora uma maioria parlamentar confortável. O presidente cessante, cujo governo mantinha relações próximas com o Kremlin e foi repetidamente criticado pela repressão da oposição, foi obrigado a reconhecer a derrota.

As raízes desta convulsão política encontram-se num movimento de protesto que começou em 2024 na Universidade de Belgrado. Os detonadores foram escândalos de corrupção no sistema educativo e as restrições à liberdade de imprensa. O que começou como um protesto estudantil evoluiu para um amplo movimento social que uniu pessoas de todas as idades e classes sociais. Os manifestantes organizaram-se de forma descentralizada através das redes sociais e resistiram às tentativas sistemáticas de intimidação por parte dos meios de comunicação controlados pelo Estado e das forças de segurança.

A União Europeia acolheu a vitória eleitoral com entusiasmo. A presidente da Comissão Europeia descreveu o resultado como um sinal encorajador para toda a região e anunciou um processo de adesão acelerado. Os politólogos salientam, contudo, que o novo governo enfrenta desafios enormes: a reforma do sistema judicial, o combate às estruturas de corrupção profundamente enraizadas e a modernização económica do país exigem não apenas vontade política, mas também o apoio sustentado da sociedade civil que tornou possível a transformação democrática.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Wahl
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wahl', 'wahl', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la elección', 'la elección')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'election')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vaalit')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''elezione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a eleição')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Korruption
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Korruption', 'korruption', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la corrupción', 'la corrupción')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'corruption')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'korruptio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la corruzione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a corrupção')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Pressefreiheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Pressefreiheit', 'pressefreiheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la libertad de prensa', 'la libertad de prensa')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'press freedom')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lehdistönvapaus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la libertà di stampa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a liberdade de imprensa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Machtwechsel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Machtwechsel', 'machtwechsel', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el cambio de poder', 'el cambio de poder')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'change of power')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vallanvaihdos')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il cambio di potere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a mudança de poder')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: protestieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('protestieren', 'protestieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'protestar', 'protestar')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
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

  -- Word: die Demokratie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Demokratie', 'demokratie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la democracia', 'la democracia')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'democracy')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'demokratia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la democrazia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a democracia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: autoritär
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('autoritär', 'autoritär', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'autoritario', 'autoritario')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'authoritarian')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'autoritaarinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'autoritario')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'autoritário')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 4: Anthropic plant einen der größten Börsengänge aller Zeiten
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Anthropic plant einen der größten Börsengänge aller Zeiten',
    'anthropic-boersengang',
    'Börsengänge in der KI-Branche',
    'economia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'Die amerikanische Firma Anthropic will an die Börse gehen. Anthropic macht künstliche Intelligenz. Ihr bekanntestes Produkt heißt Claude. Es ist ein Chatbot, der mit Menschen sprechen kann. Der Börsengang könnte einer der größten in der Geschichte sein. Experten denken, die Firma ist über 100 Milliarden Dollar wert. Viele Investoren wollen Aktien von Anthropic kaufen. Die KI-Branche wächst sehr schnell. Im letzten Jahr hat Anthropic seinen Umsatz verdreifacht. Aber die Firma macht noch keinen Gewinn. Die Kosten für KI-Entwicklung sind sehr hoch. Trotzdem glauben viele Menschen an die Zukunft von KI. Der Börsengang soll Anfang nächstes Jahr stattfinden.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Das KI-Unternehmen Anthropic hat offiziell Unterlagen für einen Börsengang eingereicht, der zu den größten in der Geschichte der Technologiebranche gehören könnte. Das Unternehmen, das den bekannten Chatbot Claude entwickelt hat, wird derzeit auf über 100 Milliarden Dollar bewertet. Im vergangenen Jahr hat Anthropic seinen Umsatz auf drei Milliarden Dollar verdreifacht, was das rasante Wachstum der KI-Branche widerspiegelt. Das Unternehmen wurde 2021 von ehemaligen Mitarbeitern eines anderen KI-Unternehmens gegründet und hat sich schnell zu einem der führenden Akteure in der Branche entwickelt. Trotz der beeindruckenden Einnahmen macht Anthropic noch keinen Gewinn, da die Kosten für die Entwicklung und den Betrieb großer Sprachmodelle enorm sind. Die Rechenzentren verbrauchen riesige Mengen an Strom und teurer Hardware. Investoren scheint das nicht zu stören. Sie setzen darauf, dass KI in den nächsten Jahren fast jeden Wirtschaftsbereich grundlegend verändern wird. Der Börsengang wird als Test dafür gesehen, wie viel Vertrauen der Markt tatsächlich in die Zukunft der KI-Technologie hat.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Das Unternehmen Anthropic, einer der führenden Entwickler von Systemen der künstlichen Intelligenz, hat bei der US-Börsenaufsicht SEC offiziell Unterlagen für einen Börsengang eingereicht, der nach Einschätzung von Analysten eine Bewertung von über 100 Milliarden Dollar erreichen und damit zu den größten Börsendebüts in der Geschichte der Technologiebranche gehören könnte.

Anthropic wurde 2021 von Dario und Daniela Amodei gegründet, die zuvor in leitenden Positionen bei einem konkurrierenden KI-Unternehmen tätig waren. Die Firma hat sich mit ihrem Chatbot Claude als einer der Hauptkonkurrenten im Bereich der generativen KI etabliert und im vergangenen Geschäftsjahr einen Umsatz von drei Milliarden Dollar erzielt, was einer Verdreifachung gegenüber dem Vorjahr entspricht.

Trotz dieses beeindruckenden Umsatzwachstums weist das Unternehmen weiterhin erhebliche Verluste aus. Die Entwicklung und der Betrieb großer Sprachmodelle erfordern massive Investitionen in Recheninfrastruktur, wobei einzelne Trainingsdurchläufe Kosten im dreistelligen Millionenbereich verursachen können. Hinzu kommen steigende Energiekosten für die Rechenzentren, deren Stromverbrauch mittlerweile dem kleiner Städte entspricht.

Der geplante Börsengang wird von Marktbeobachtern als Lackmustest für die Bewertung des gesamten KI-Sektors betrachtet. Skeptiker warnen vor einer möglichen Spekulationsblase, die an den Dotcom-Boom der späten 1990er Jahre erinnere. Sie argumentieren, dass die astronomischen Bewertungen von KI-Unternehmen nicht durch nachhaltige Geschäftsmodelle gedeckt seien und dass die Technologie ihren wahren wirtschaftlichen Nutzen erst noch unter Beweis stellen müsse.

Befürworter hingegen betonen, dass sich die KI-Branche grundlegend vom Dotcom-Zeitalter unterscheide, da die Technologie bereits in zahlreichen Branchen — von der Medizin über die Finanzwirtschaft bis hin zur Softwareentwicklung — nachweisbare Produktivitätssteigerungen ermögliche. Sie verweisen darauf, dass Unternehmenskunden bereit seien, erhebliche Summen für KI-Dienstleistungen zu zahlen, was die hohen Bewertungen letztlich rechtfertige.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'Anthropic planea una de las mayores salidas a bolsa de la historia', 'anthropic-salida-bolsa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'Anthropic Plans One of the Biggest IPOs Ever', 'anthropic-ipo', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Anthropic suunnittelee yhtä kaikkien aikojen suurimmista listautumisista', 'anthropic-listautuminen', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'Anthropic pianifica una delle più grandi IPO di sempre', 'anthropic-ipo', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'Anthropic planeia uma das maiores entradas em bolsa de sempre', 'anthropic-entrada-bolsa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'La empresa americana Anthropic quiere salir a bolsa. Anthropic hace inteligencia artificial. Su producto más conocido se llama Claude. Es un chatbot que puede hablar con personas. La salida a bolsa podría ser una de las más grandes de la historia. Los expertos creen que la empresa vale más de 100.000 millones de dólares. Muchos inversores quieren comprar acciones de Anthropic. El sector de la IA crece muy rápido. El año pasado Anthropic triplicó sus ingresos. Pero la empresa todavía no tiene beneficios. Los costes del desarrollo de IA son muy altos. Aun así, mucha gente cree en el futuro de la IA. La salida a bolsa será a principios del próximo año.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'The American company Anthropic wants to go public. Anthropic makes artificial intelligence. Its most famous product is called Claude. It is a chatbot that can talk with people. The IPO could be one of the biggest in history. Experts think the company is worth over 100 billion dollars. Many investors want to buy Anthropic shares. The AI industry is growing very fast. Last year Anthropic tripled its revenue. But the company does not make a profit yet. The costs for AI development are very high. Still, many people believe in the future of AI. The IPO should take place at the beginning of next year.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Yhdysvaltalainen yritys Anthropic haluaa listautua pörssiin. Anthropic tekee tekoälyä. Sen tunnetuin tuote on nimeltään Claude. Se on tekoälybotti, joka voi keskustella ihmisten kanssa. Listautuminen voi olla yksi historian suurimmista. Asiantuntijat arvioivat yrityksen olevan yli 100 miljardin dollarin arvoinen. Monet sijoittajat haluavat ostaa Anthropicin osakkeita. Tekoälyala kasvaa erittäin nopeasti. Viime vuonna Anthropic kolminkertaisti liikevaihtonsa. Mutta yritys ei vielä tuota voittoa. Tekoälyn kehittämisen kustannukset ovat erittäin korkeat. Silti monet ihmiset uskovat tekoälyn tulevaisuuteen. Listautumisen pitäisi tapahtua ensi vuoden alussa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'L''azienda americana Anthropic vuole quotarsi in borsa. Anthropic produce intelligenza artificiale. Il suo prodotto più famoso si chiama Claude. È un chatbot che può parlare con le persone. L''IPO potrebbe essere una delle più grandi della storia. Gli esperti pensano che l''azienda valga oltre 100 miliardi di dollari. Molti investitori vogliono comprare azioni di Anthropic. Il settore dell''IA cresce molto velocemente. L''anno scorso Anthropic ha triplicato il suo fatturato. Ma l''azienda non fa ancora profitti. I costi per lo sviluppo dell''IA sono molto alti. Comunque, molte persone credono nel futuro dell''IA. L''IPO dovrebbe avvenire all''inizio del prossimo anno.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'A empresa americana Anthropic quer entrar em bolsa. A Anthropic faz inteligência artificial. O seu produto mais famoso chama-se Claude. É um chatbot que pode falar com pessoas. A entrada em bolsa pode ser uma das maiores da história. Os especialistas pensam que a empresa vale mais de 100 mil milhões de dólares. Muitos investidores querem comprar ações da Anthropic. O setor da IA cresce muito rápido. No ano passado a Anthropic triplicou a sua receita. Mas a empresa ainda não tem lucro. Os custos do desenvolvimento de IA são muito altos. Ainda assim, muitas pessoas acreditam no futuro da IA. A entrada em bolsa deverá acontecer no início do próximo ano.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'La empresa de IA Anthropic ha presentado oficialmente los documentos para una salida a bolsa que podría ser una de las más grandes en la historia del sector tecnológico. La compañía, que desarrolló el conocido chatbot Claude, está valorada actualmente en más de 100.000 millones de dólares. El año pasado, Anthropic triplicó sus ingresos hasta los 3.000 millones de dólares, lo que refleja el rápido crecimiento del sector de la IA. La empresa fue fundada en 2021 por antiguos empleados de otra compañía de IA y se ha convertido rápidamente en uno de los actores principales del sector. A pesar de los impresionantes ingresos, Anthropic aún no tiene beneficios, ya que los costes de desarrollo y operación de grandes modelos de lenguaje son enormes. Los centros de datos consumen cantidades enormes de electricidad y hardware costoso. A los inversores no parece importarles. Apuestan a que la IA transformará fundamentalmente casi todos los sectores económicos en los próximos años. La salida a bolsa se ve como una prueba de cuánta confianza tiene realmente el mercado en el futuro de la tecnología de IA.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'The AI company Anthropic has officially filed documents for an initial public offering that could be one of the biggest in the history of the technology sector. The company, which developed the well-known chatbot Claude, is currently valued at over 100 billion dollars. Last year, Anthropic tripled its revenue to three billion dollars, reflecting the rapid growth of the AI industry. The company was founded in 2021 by former employees of another AI company and has quickly become one of the leading players in the industry. Despite its impressive revenue, Anthropic is not yet profitable, as the costs of developing and operating large language models are enormous. The data centers consume huge amounts of electricity and expensive hardware. Investors do not seem to mind. They are betting that AI will fundamentally transform nearly every sector of the economy in the coming years. The IPO is seen as a test of how much confidence the market actually has in the future of AI technology.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Tekoälyyhtiö Anthropic on virallisesti jättänyt asiakirjat pörssilistautumista varten, joka voi olla yksi teknologiasektorin historian suurimmista. Yhtiö, joka kehitti tunnetun Claude-tekoälybotin, on tällä hetkellä arvoltaan yli 100 miljardia dollaria. Viime vuonna Anthropic kolminkertaisti liikevaihtonsa kolmeen miljardiin dollariin, mikä heijastaa tekoälyalan nopeaa kasvua. Yhtiö perustettiin vuonna 2021 toisen tekoälyyhtiön entisten työntekijöiden toimesta, ja siitä on nopeasti tullut yksi alan johtavista toimijoista. Vaikuttavasta liikevaihdosta huolimatta Anthropic ei vielä tuota voittoa, sillä suurten kielimallien kehittämisen ja käytön kustannukset ovat valtavat. Datakeskukset kuluttavat suuria määriä sähköä ja kallista laitteistoa. Sijoittajia tämä ei näytä häiritsevän. He uskovat, että tekoäly muuttaa perustavanlaatuisesti lähes kaikkia talouden aloja tulevina vuosina. Listautumista pidetään testinä siitä, kuinka paljon luottamusta markkinoilla todella on tekoälyteknologian tulevaisuuteen.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'L''azienda di IA Anthropic ha ufficialmente depositato i documenti per un''offerta pubblica iniziale che potrebbe essere una delle più grandi nella storia del settore tecnologico. L''azienda, che ha sviluppato il noto chatbot Claude, è attualmente valutata oltre 100 miliardi di dollari. L''anno scorso, Anthropic ha triplicato il suo fatturato a tre miliardi di dollari, riflettendo la rapida crescita del settore dell''IA. L''azienda è stata fondata nel 2021 da ex dipendenti di un''altra azienda di IA e si è rapidamente affermata come uno dei principali attori del settore. Nonostante i ricavi impressionanti, Anthropic non è ancora redditizia, poiché i costi di sviluppo e funzionamento dei grandi modelli linguistici sono enormi. I centri dati consumano enormi quantità di elettricità e hardware costoso. Agli investitori non sembra importare. Scommettono che l''IA trasformerà radicalmente quasi ogni settore dell''economia nei prossimi anni. L''IPO è vista come un test di quanta fiducia il mercato abbia realmente nel futuro della tecnologia IA.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'A empresa de IA Anthropic apresentou oficialmente os documentos para uma oferta pública inicial que poderá ser uma das maiores da história do setor tecnológico. A empresa, que desenvolveu o conhecido chatbot Claude, está atualmente avaliada em mais de 100 mil milhões de dólares. No ano passado, a Anthropic triplicou a sua receita para três mil milhões de dólares, refletindo o rápido crescimento do setor da IA. A empresa foi fundada em 2021 por antigos funcionários de outra empresa de IA e rapidamente se tornou um dos principais intervenientes do setor. Apesar da receita impressionante, a Anthropic ainda não é rentável, pois os custos de desenvolvimento e operação de grandes modelos de linguagem são enormes. Os centros de dados consomem quantidades enormes de eletricidade e hardware dispendioso. Os investidores não parecem preocupar-se. Apostam que a IA transformará fundamentalmente quase todos os setores da economia nos próximos anos. A entrada em bolsa é vista como um teste da confiança real do mercado no futuro da tecnologia de IA.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'La empresa Anthropic, uno de los principales desarrolladores de sistemas de inteligencia artificial, ha presentado oficialmente ante la SEC, el regulador bursátil estadounidense, los documentos para una salida a bolsa que, según los analistas, podría alcanzar una valoración superior a los 100.000 millones de dólares, convirtiéndose así en uno de los mayores debuts bursátiles en la historia del sector tecnológico.

Anthropic fue fundada en 2021 por Dario y Daniela Amodei, que previamente ocupaban cargos directivos en una empresa de IA competidora. La compañía se ha establecido con su chatbot Claude como uno de los principales competidores en el ámbito de la IA generativa y facturó tres mil millones de dólares en el último ejercicio, lo que supone triplicar la cifra del año anterior.

A pesar de este impresionante crecimiento de los ingresos, la empresa sigue registrando pérdidas significativas. El desarrollo y la operación de grandes modelos de lenguaje requieren inversiones masivas en infraestructura de computación, con ciclos de entrenamiento individuales que pueden generar costes de cientos de millones. A esto se suman los crecientes gastos energéticos de los centros de datos, cuyo consumo eléctrico equivale ya al de pequeñas ciudades.

La salida a bolsa prevista es considerada por los observadores del mercado como una prueba de fuego para la valoración del conjunto del sector de la IA. Los escépticos advierten de una posible burbuja especulativa que recuerda al boom de las puntocom de finales de los años noventa. Argumentan que las astronómicas valoraciones de las empresas de IA no están respaldadas por modelos de negocio sostenibles y que la tecnología aún tiene que demostrar su verdadero valor económico.

Los defensores, por el contrario, subrayan que el sector de la IA se diferencia fundamentalmente de la era de las puntocom, ya que la tecnología ya posibilita aumentos demostrables de productividad en numerosos sectores, desde la medicina y las finanzas hasta el desarrollo de software. Señalan que los clientes empresariales están dispuestos a pagar sumas considerables por servicios de IA, lo que en última instancia justifica las elevadas valoraciones.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'Anthropic, one of the leading developers of artificial intelligence systems, has officially filed documents with the US Securities and Exchange Commission for an initial public offering that analysts estimate could reach a valuation of over 100 billion dollars, potentially making it one of the largest stock market debuts in the history of the technology sector.

Anthropic was founded in 2021 by Dario and Daniela Amodei, who previously held senior positions at a competing AI company. The firm has established itself with its chatbot Claude as one of the main competitors in the generative AI space and generated revenue of three billion dollars in the last fiscal year, representing a threefold increase over the previous year.

Despite this impressive revenue growth, the company continues to report significant losses. The development and operation of large language models require massive investments in computing infrastructure, with individual training runs potentially costing hundreds of millions. Added to this are rising energy costs for the data centers, whose power consumption now equals that of small cities.

The planned IPO is regarded by market observers as a litmus test for the valuation of the entire AI sector. Skeptics warn of a possible speculative bubble reminiscent of the dot-com boom of the late 1990s. They argue that the astronomical valuations of AI companies are not backed by sustainable business models and that the technology has yet to prove its true economic value.

Proponents, however, emphasize that the AI industry differs fundamentally from the dot-com era, as the technology is already enabling demonstrable productivity gains across numerous industries — from medicine and finance to software development. They point out that enterprise customers are willing to pay substantial sums for AI services, which ultimately justifies the high valuations.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Tekoälyjärjestelmien johtaviin kehittäjiin kuuluva Anthropic on virallisesti jättänyt Yhdysvaltain arvopaperimarkkinoita valvovalle SEC:lle asiakirjat pörssilistautumista varten, jonka analyytikot arvioivat voivan saavuttaa yli 100 miljardin dollarin arvon ja siten kuuluvan teknologiasektorin historian suurimpiin pörssidebyytteihin.

Anthropicin perustivat vuonna 2021 Dario ja Daniela Amodei, jotka toimivat aiemmin johtotehtävissä kilpailevassa tekoälyyrityksessä. Yhtiö on vakiinnuttanut asemansa Claude-tekoälybotillaan yhtenä generatiivisen tekoälyn pääkilpailijoista ja saavutti viimeisimmällä tilikaudella kolmen miljardin dollarin liikevaihdon, mikä on kolminkertainen edellisvuoteen verrattuna.

Vaikuttavasta liikevaihdon kasvusta huolimatta yhtiö tekee edelleen merkittäviä tappioita. Suurten kielimallien kehittäminen ja käyttö vaativat massiivisia investointeja laskentainfrastruktuuriin, ja yksittäiset koulutusajot voivat aiheuttaa satojen miljoonien kustannuksia. Lisäksi tulevat datakeskusten kasvavat energiakustannukset, joiden sähkönkulutus vastaa jo pienten kaupunkien kulutusta.

Suunniteltua listautumista pidetään markkinatarkkailijoiden keskuudessa lakmustestinä koko tekoälysektorin arvostukselle. Skeptikot varoittavat mahdollisesta spekulatiivisesta kuplasta, joka muistuttaa 1990-luvun lopun dotcom-buumia. Heidän mukaansa tekoälyyritysten tähtitieteelliset arvostukset eivät perustu kestäviin liiketoimintamalleihin ja teknologian on vielä todistettava todellinen taloudellinen arvonsa.

Puolestapuhujat korostavat kuitenkin, että tekoälyala eroaa perustavanlaatuisesti dotcom-aikakaudesta, sillä teknologia mahdollistaa jo todistettavasti tuottavuuden kasvua lukuisilla toimialoilla — lääketieteestä ja rahoituksesta ohjelmistokehitykseen. He huomauttavat, että yritysasiakkaat ovat valmiita maksamaan huomattavia summia tekoälypalveluista, mikä viime kädessä oikeuttaa korkeat arvostukset.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Anthropic, uno dei principali sviluppatori di sistemi di intelligenza artificiale, ha ufficialmente depositato presso la SEC, l''autorità di vigilanza borsistica statunitense, i documenti per un''offerta pubblica iniziale che, secondo gli analisti, potrebbe raggiungere una valutazione superiore ai 100 miliardi di dollari, diventando così uno dei più grandi debutti borsistici nella storia del settore tecnologico.

Anthropic è stata fondata nel 2021 da Dario e Daniela Amodei, che ricoprivano in precedenza posizioni dirigenziali presso un''azienda di IA concorrente. L''azienda si è affermata con il suo chatbot Claude come uno dei principali concorrenti nel campo dell''IA generativa e ha registrato un fatturato di tre miliardi di dollari nell''ultimo esercizio, il triplo rispetto all''anno precedente.

Nonostante questa impressionante crescita del fatturato, l''azienda continua a registrare perdite significative. Lo sviluppo e il funzionamento dei grandi modelli linguistici richiedono investimenti massicci in infrastruttura computazionale, con singoli cicli di addestramento che possono generare costi nell''ordine di centinaia di milioni. A ciò si aggiungono i crescenti costi energetici dei centri dati, il cui consumo elettrico equivale ormai a quello di piccole città.

L''IPO prevista è considerata dagli osservatori del mercato come un test decisivo per la valutazione dell''intero settore dell''IA. Gli scettici avvertono di una possibile bolla speculativa che ricorda il boom delle dot-com della fine degli anni Novanta. Sostengono che le valutazioni astronomiche delle aziende di IA non sono sostenute da modelli di business solidi e che la tecnologia deve ancora dimostrare il suo vero valore economico.

I sostenitori, al contrario, sottolineano che il settore dell''IA si distingue fondamentalmente dall''era delle dot-com, poiché la tecnologia consente già aumenti di produttività dimostrabili in numerosi settori — dalla medicina alla finanza fino allo sviluppo software. Evidenziano che i clienti aziendali sono disposti a pagare somme considerevoli per i servizi di IA, il che giustifica in ultima analisi le elevate valutazioni.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'A Anthropic, um dos principais desenvolvedores de sistemas de inteligência artificial, apresentou oficialmente à SEC, o regulador do mercado de valores norte-americano, os documentos para uma oferta pública inicial que, segundo os analistas, poderá atingir uma avaliação superior a 100 mil milhões de dólares, tornando-a potencialmente numa das maiores estreias em bolsa da história do setor tecnológico.

A Anthropic foi fundada em 2021 por Dario e Daniela Amodei, que ocupavam anteriormente cargos de direção numa empresa de IA concorrente. A empresa estabeleceu-se com o seu chatbot Claude como um dos principais concorrentes no domínio da IA generativa e gerou uma receita de três mil milhões de dólares no último exercício fiscal, o que representa o triplo do ano anterior.

Apesar deste impressionante crescimento da receita, a empresa continua a registar perdas significativas. O desenvolvimento e a operação de grandes modelos de linguagem requerem investimentos massivos em infraestrutura de computação, com ciclos de treino individuais que podem custar centenas de milhões. Acrescem os crescentes custos energéticos dos centros de dados, cujo consumo elétrico equivale já ao de pequenas cidades.

A entrada em bolsa prevista é considerada pelos observadores do mercado como um teste decisivo para a avaliação de todo o setor da IA. Os céticos alertam para uma possível bolha especulativa que recorda o boom das dotcom do final dos anos noventa. Argumentam que as avaliações astronómicas das empresas de IA não são sustentadas por modelos de negócio viáveis e que a tecnologia ainda tem de provar o seu verdadeiro valor económico.

Os defensores, por outro lado, sublinham que o setor da IA se distingue fundamentalmente da era das dotcom, uma vez que a tecnologia já permite ganhos de produtividade demonstráveis em numerosos setores — da medicina e finanças ao desenvolvimento de software. Assinalam que os clientes empresariais estão dispostos a pagar somas consideráveis por serviços de IA, o que em última análise justifica as elevadas avaliações.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: der Börsengang
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Börsengang', 'börsengang', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la salida a bolsa', 'la salida a bolsa')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'IPO')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'pörssilistautuminen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''IPO')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a entrada em bolsa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Umsatz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Umsatz', 'umsatz', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'los ingresos', 'los ingresos')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'revenue')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'liikevaihto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il fatturato')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a receita')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Gewinn
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Gewinn', 'gewinn', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el beneficio', 'el beneficio')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'profit')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'voitto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il profitto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o lucro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Bewertung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Bewertung', 'bewertung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la valoración', 'la valoración')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'valuation')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'arvostus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la valutazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a avaliação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Investor
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Investor', 'investor', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el inversor', 'el inversor')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'investor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sijoittaja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''investitore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o investidor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Aktie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Aktie', 'aktie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la acción', 'la acción')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'share')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'osake')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''azione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a ação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: das Rechenzentrum
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Rechenzentrum', 'rechenzentrum', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el centro de datos', 'el centro de datos')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'data center')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'datakeskus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il centro dati')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o centro de dados')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: nachhaltig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nachhaltig', 'nachhaltig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'sostenible', 'sostenible')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'sustainable')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kestävä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'sostenibile')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'sustentável')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 5: Erster Shamonda-Virus-Fall beim Menschen in Frankreich bestätigt
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Erster Shamonda-Virus-Fall beim Menschen in Frankreich bestätigt',
    'shamonda-virus-frankreich',
    'Neue Viruserkrankungen in Europa',
    'ciencia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'In Frankreich gibt es einen neuen Virus-Fall. Es ist das Shamonda-Virus. Normalerweise kommt dieses Virus nur bei Tieren vor. Aber jetzt hat sich zum ersten Mal ein Mensch angesteckt. Ein Bauer in Südfrankreich ist krank geworden. Er hatte Fieber und Kopfschmerzen. Die Ärzte haben ihn untersucht und das Virus gefunden. Der Mann ist jetzt im Krankenhaus, aber es geht ihm besser. Die Gesundheitsbehörden sagen, dass das Risiko für die Bevölkerung gering ist. Das Virus überträgt sich nicht leicht von Mensch zu Mensch. Trotzdem beobachten die Experten die Situation genau. Sie wollen sicher sein, dass sich das Virus nicht weiter verbreitet.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Die französischen Gesundheitsbehörden haben den ersten Fall einer Shamonda-Virus-Infektion beim Menschen bestätigt. Das Virus, das bisher nur bei Nutztieren wie Rindern und Schafen bekannt war, wurde bei einem 58-jährigen Landwirt in der Region Okzitanien nachgewiesen. Der Patient hatte zunächst grippeähnliche Symptome entwickelt, bevor Laboruntersuchungen den ungewöhnlichen Erreger identifizierten. Derzeit befindet er sich in stationärer Behandlung, sein Zustand wird als stabil beschrieben. Experten vermuten, dass die Übertragung durch Insektenstiche erfolgte, die normalerweise das Virus zwischen Tieren verbreiten. Die europäische Gesundheitsbehörde ECDC hat eine Risikoeinschätzung veröffentlicht, in der sie das Risiko für die allgemeine Bevölkerung als gering einstuft. Eine Übertragung von Mensch zu Mensch sei bisher nicht nachgewiesen worden. Dennoch haben mehrere europäische Länder ihre Überwachungssysteme verstärkt. In Frankreich wurde ein spezielles Team eingesetzt, das Kontaktpersonen des Patienten untersucht und die Insektenpopulation in der betroffenen Region beobachtet. Wissenschaftler betonen, dass solche Fälle von Tier-zu-Mensch-Übertragungen durch den Klimawandel zunehmen könnten, da wärmere Temperaturen die Verbreitung tropischer Insektenarten in Europa begünstigen.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Die französischen Gesundheitsbehörden haben den ersten weltweit dokumentierten Fall einer Shamonda-Virus-Infektion beim Menschen bestätigt und damit eine intensive wissenschaftliche Debatte über die zunehmende Gefahr zoonotischer Erkrankungen in Europa ausgelöst. Das Shamonda-Virus, ein Mitglied der Bunyavirales-Ordnung, war bisher ausschließlich als Erreger einer fieberhaften Erkrankung bei Wiederkäuern bekannt und wurde erstmals 1982 in Nigeria bei Rindern isoliert.

Bei dem Patienten handelt es sich um einen 58-jährigen Viehzüchter aus der Region Okzitanien, der zunächst mit hohem Fieber, starken Kopf- und Gliederschmerzen sowie einer ausgeprägten Erschöpfung in eine Klinik eingeliefert wurde. Nachdem herkömmliche diagnostische Verfahren keine eindeutige Ursache identifizieren konnten, ergab eine metagenomische Sequenzierung des Blutes den überraschenden Nachweis des Shamonda-Virus. Der Patient befindet sich derzeit in stationärer Behandlung und spricht gut auf eine supportive Therapie an.

Das Europäische Zentrum für die Prävention und die Kontrolle von Krankheiten hat das Risiko einer Ausbreitung in der Allgemeinbevölkerung vorläufig als gering eingestuft. Die bisherige Evidenz deutet darauf hin, dass das Virus durch Culicoides-Mücken — auch als Gnitzen bekannt — übertragen wird und eine direkte Übertragung von Mensch zu Mensch nach derzeitigem Kenntnisstand nicht stattfindet.

Dennoch hat der Fall unter Virologen erhebliche Besorgnis ausgelöst. Experten weisen darauf hin, dass der Übergang eines Tiervirus auf den Menschen — ein sogenanntes Spillover-Ereignis — stets das Potenzial birgt, sich zu einer ernsteren Bedrohung zu entwickeln, insbesondere wenn das Virus im menschlichen Wirt Mutationen durchläuft, die seine Übertragbarkeit verändern könnten. Die zunehmende Häufigkeit solcher Spillover-Ereignisse wird von der wissenschaftlichen Gemeinschaft mit dem Klimawandel in Verbindung gebracht: Steigende Temperaturen erweitern den Lebensraum tropischer Vektoren wie der Culicoides-Mücke nach Nordeuropa und erhöhen gleichzeitig die Kontaktfläche zwischen Mensch und Wildtier durch veränderte Landnutzung.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'Confirmado el primer caso de virus Shamonda en humanos en Francia', 'virus-shamonda-francia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'First Human Case of Shamonda Virus Confirmed in France', 'shamonda-virus-france', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Ensimmäinen shamondaviruksen tartunta ihmisessä vahvistettu Ranskassa', 'shamondavirus-ranskassa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'Primo caso di virus Shamonda nell''uomo confermato in Francia', 'virus-shamonda-francia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'Primeiro caso do vírus Shamonda em humanos confirmado em França', 'virus-shamonda-franca', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'En Francia hay un nuevo caso de virus. Es el virus Shamonda. Normalmente este virus solo aparece en animales. Pero ahora una persona se ha infectado por primera vez. Un granjero en el sur de Francia ha enfermado. Tenía fiebre y dolor de cabeza. Los médicos lo examinaron y encontraron el virus. El hombre está ahora en el hospital, pero se encuentra mejor. Las autoridades sanitarias dicen que el riesgo para la población es bajo. El virus no se transmite fácilmente de persona a persona. Aun así, los expertos vigilan la situación de cerca. Quieren estar seguros de que el virus no se propaga más.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'There is a new virus case in France. It is the Shamonda virus. Normally this virus only appears in animals. But now a person has been infected for the first time. A farmer in southern France got sick. He had fever and headaches. The doctors examined him and found the virus. The man is now in hospital, but he is getting better. The health authorities say the risk for the population is low. The virus does not spread easily from person to person. Still, experts are watching the situation closely. They want to make sure the virus does not spread further.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Ranskassa on uusi virustapaus. Kyseessä on shamondavirus. Normaalisti tämä virus esiintyy vain eläimissä. Mutta nyt ihminen on saanut tartunnan ensimmäistä kertaa. Maanviljelijä Etelä-Ranskassa sairastui. Hänellä oli kuumetta ja päänsärkyä. Lääkärit tutkivat hänet ja löysivät viruksen. Mies on nyt sairaalassa, mutta hänen vointinsa paranee. Terveysviranomaiset sanovat, että riski väestölle on pieni. Virus ei tartu helposti ihmisestä toiseen. Silti asiantuntijat seuraavat tilannetta tarkasti. He haluavat varmistaa, ettei virus leviä pidemmälle.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'In Francia c''è un nuovo caso di virus. È il virus Shamonda. Normalmente questo virus colpisce solo gli animali. Ma ora una persona si è infettata per la prima volta. Un agricoltore nel sud della Francia si è ammalato. Aveva febbre e mal di testa. I medici lo hanno esaminato e hanno trovato il virus. L''uomo è ora in ospedale, ma sta meglio. Le autorità sanitarie dicono che il rischio per la popolazione è basso. Il virus non si trasmette facilmente da persona a persona. Comunque, gli esperti osservano la situazione attentamente. Vogliono essere sicuri che il virus non si diffonda ulteriormente.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'Em França há um novo caso de vírus. É o vírus Shamonda. Normalmente este vírus só aparece em animais. Mas agora uma pessoa infetou-se pela primeira vez. Um agricultor no sul de França ficou doente. Tinha febre e dores de cabeça. Os médicos examinaram-no e encontraram o vírus. O homem está agora no hospital, mas está a melhorar. As autoridades de saúde dizem que o risco para a população é baixo. O vírus não se transmite facilmente de pessoa para pessoa. Mesmo assim, os especialistas vigiam a situação de perto. Querem ter a certeza de que o vírus não se propaga mais.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'Las autoridades sanitarias francesas han confirmado el primer caso de infección por el virus Shamonda en un ser humano. El virus, conocido hasta ahora solo en animales de granja como vacas y ovejas, fue detectado en un agricultor de 58 años de la región de Occitania. El paciente desarrolló inicialmente síntomas similares a los de la gripe antes de que los análisis de laboratorio identificaran el patógeno inusual. Actualmente se encuentra hospitalizado y su estado se describe como estable. Los expertos sospechan que la transmisión se produjo a través de picaduras de insectos que normalmente propagan el virus entre animales. El Centro Europeo para la Prevención y el Control de las Enfermedades ha publicado una evaluación de riesgo en la que clasifica el riesgo para la población general como bajo. No se ha demostrado hasta ahora una transmisión de persona a persona. Sin embargo, varios países europeos han reforzado sus sistemas de vigilancia. En Francia se ha desplegado un equipo especial que investiga los contactos del paciente y vigila la población de insectos en la región afectada. Los científicos subrayan que estos casos de transmisión de animales a humanos podrían aumentar debido al cambio climático, ya que las temperaturas más cálidas favorecen la propagación de especies de insectos tropicales en Europa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'French health authorities have confirmed the first case of a Shamonda virus infection in a human. The virus, previously known only in farm animals such as cattle and sheep, was detected in a 58-year-old farmer in the Occitanie region. The patient initially developed flu-like symptoms before laboratory tests identified the unusual pathogen. He is currently hospitalized and his condition is described as stable. Experts suspect that transmission occurred through insect bites that normally spread the virus between animals. The European Centre for Disease Prevention and Control has published a risk assessment classifying the risk to the general population as low. Human-to-human transmission has not been demonstrated so far. Nevertheless, several European countries have strengthened their surveillance systems. In France, a special team has been deployed to investigate the patient''s contacts and monitor the insect population in the affected region. Scientists emphasize that such animal-to-human transmissions could increase due to climate change, as warmer temperatures favor the spread of tropical insect species in Europe.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Ranskan terveysviranomaiset ovat vahvistaneet ensimmäisen shamondavirustartunnan ihmisessä. Virus, joka on aiemmin tunnettu vain tuotantoeläimissä kuten naudoissa ja lampaissa, todettiin 58-vuotiaalla maanviljelijällä Occitanian alueella. Potilaalle kehittyi aluksi flunssan kaltaisia oireita, ennen kuin laboratoriotutkimukset tunnistivat epätavallisen taudinaiheuttajan. Hän on parhaillaan sairaalahoidossa ja hänen tilansa kuvataan vakaaksi. Asiantuntijat epäilevät, että tartunta tapahtui hyönteisten pistosten kautta, jotka normaalisti levittävät virusta eläinten välillä. Euroopan tautienehkäisy- ja -valvontakeskus ECDC on julkaissut riskiarvion, jossa se luokittelee riskin yleisväestölle matalaksi. Tartuntaa ihmisestä toiseen ei ole toistaiseksi todettu. Silti useat Euroopan maat ovat tehostaneet valvontajärjestelmiään. Ranskassa on perustettu erityistiimi, joka tutkii potilaan kontakteja ja tarkkailee hyönteispopulaatiota alueella. Tutkijat korostavat, että tällaiset eläimistä ihmisiin tapahtuvat tartunnat saattavat lisääntyä ilmastonmuutoksen vuoksi, sillä lämpimämmät lämpötilat suosivat trooppisten hyönteislajien leviämistä Euroopassa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'Le autorità sanitarie francesi hanno confermato il primo caso di infezione da virus Shamonda nell''uomo. Il virus, finora noto solo negli animali da allevamento come bovini e ovini, è stato rilevato in un agricoltore di 58 anni nella regione dell''Occitania. Il paziente aveva inizialmente sviluppato sintomi simil-influenzali prima che le analisi di laboratorio identificassero il patogeno insolito. Attualmente è ricoverato in ospedale e le sue condizioni sono descritte come stabili. Gli esperti sospettano che la trasmissione sia avvenuta tramite punture di insetti che normalmente diffondono il virus tra gli animali. Il Centro europeo per la prevenzione e il controllo delle malattie ha pubblicato una valutazione del rischio in cui classifica il rischio per la popolazione generale come basso. La trasmissione da uomo a uomo non è stata finora dimostrata. Ciononostante, diversi paesi europei hanno rafforzato i loro sistemi di sorveglianza. In Francia è stato dispiegato un team speciale che indaga sui contatti del paziente e monitora la popolazione di insetti nella regione colpita. Gli scienziati sottolineano che questi casi di trasmissione animale-uomo potrebbero aumentare a causa del cambiamento climatico, poiché le temperature più calde favoriscono la diffusione di specie di insetti tropicali in Europa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'As autoridades de saúde francesas confirmaram o primeiro caso de infeção pelo vírus Shamonda num ser humano. O vírus, até agora conhecido apenas em animais de criação como bovinos e ovinos, foi detetado num agricultor de 58 anos na região da Occitânia. O paciente desenvolveu inicialmente sintomas semelhantes aos da gripe antes de as análises laboratoriais identificarem o agente patogénico invulgar. Encontra-se atualmente hospitalizado e o seu estado é descrito como estável. Os especialistas suspeitam que a transmissão ocorreu através de picadas de insetos que normalmente propagam o vírus entre animais. O Centro Europeu de Prevenção e Controlo das Doenças publicou uma avaliação de risco na qual classifica o risco para a população geral como baixo. A transmissão de pessoa para pessoa não foi até agora demonstrada. Ainda assim, vários países europeus reforçaram os seus sistemas de vigilância. Em França foi destacada uma equipa especial que investiga os contactos do paciente e monitoriza a população de insetos na região afetada. Os cientistas sublinham que estes casos de transmissão de animais para humanos poderão aumentar devido às alterações climáticas, uma vez que as temperaturas mais quentes favorecem a propagação de espécies de insetos tropicais na Europa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'Las autoridades sanitarias francesas han confirmado el primer caso documentado a nivel mundial de infección por el virus Shamonda en un ser humano, desatando un intenso debate científico sobre el creciente peligro de las enfermedades zoonóticas en Europa. El virus Shamonda, miembro del orden Bunyavirales, era conocido hasta ahora exclusivamente como agente causante de una enfermedad febril en rumiantes y fue aislado por primera vez en 1982 en bovinos en Nigeria.

El paciente es un ganadero de 58 años de la región de Occitania que fue ingresado en una clínica con fiebre alta, fuertes dolores de cabeza y articulaciones, y un agotamiento pronunciado. Cuando los procedimientos diagnósticos convencionales no lograron identificar una causa clara, una secuenciación metagenómica de la sangre reveló la sorprendente presencia del virus Shamonda. El paciente se encuentra actualmente hospitalizado y responde bien a un tratamiento de soporte.

El Centro Europeo para la Prevención y el Control de las Enfermedades ha clasificado provisionalmente el riesgo de propagación en la población general como bajo. La evidencia disponible indica que el virus se transmite a través de mosquitos del género Culicoides — también conocidos como jejenes — y que, según los conocimientos actuales, no se produce una transmisión directa de persona a persona.

No obstante, el caso ha generado una preocupación considerable entre los virólogos. Los expertos señalan que el salto de un virus animal al ser humano — un denominado evento de spillover — siempre encierra el potencial de convertirse en una amenaza más grave, especialmente si el virus experimenta mutaciones en el huésped humano que podrían alterar su transmisibilidad. La comunidad científica relaciona la creciente frecuencia de estos eventos de spillover con el cambio climático: el aumento de las temperaturas amplía el hábitat de vectores tropicales como el mosquito Culicoides hacia el norte de Europa e incrementa simultáneamente la superficie de contacto entre humanos y fauna silvestre debido a los cambios en el uso del suelo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'French health authorities have confirmed the first globally documented case of a Shamonda virus infection in a human, sparking an intense scientific debate about the growing danger of zoonotic diseases in Europe. The Shamonda virus, a member of the Bunyavirales order, was previously known exclusively as the causative agent of a febrile illness in ruminants and was first isolated in cattle in Nigeria in 1982.

The patient is a 58-year-old livestock farmer from the Occitanie region who was admitted to a clinic with high fever, severe headaches and joint pain, and pronounced exhaustion. After conventional diagnostic procedures failed to identify a clear cause, metagenomic sequencing of his blood yielded the surprising detection of the Shamonda virus. The patient is currently hospitalized and responding well to supportive therapy.

The European Centre for Disease Prevention and Control has provisionally classified the risk of spread to the general population as low. Current evidence suggests that the virus is transmitted by Culicoides midges — also known as biting midges — and that direct human-to-human transmission does not occur based on present knowledge.

Nevertheless, the case has generated considerable concern among virologists. Experts point out that the spillover of an animal virus to humans always carries the potential to develop into a more serious threat, particularly if the virus undergoes mutations in the human host that could alter its transmissibility. The increasing frequency of such spillover events is being linked by the scientific community to climate change: rising temperatures are expanding the habitat of tropical vectors like the Culicoides midge into northern Europe while simultaneously increasing the human-wildlife interface through changing land use patterns.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Ranskan terveysviranomaiset ovat vahvistaneet ensimmäisen maailmanlaajuisesti dokumentoidun shamondavirustartunnan ihmisessä, mikä on käynnistänyt intensiivisen tieteellisen keskustelun zoonoottisten tautien kasvavasta vaarasta Euroopassa. Shamondavirus, Bunyavirales-lahkon jäsen, tunnettiin aiemmin yksinomaan märehtijöiden kuumetaudin aiheuttajana, ja se eristettiin ensimmäisen kerran naudoista Nigeriassa vuonna 1982.

Potilas on 58-vuotias karjankasvattaja Occitanian alueelta, joka otettiin sisään klinikalle korkean kuumeen, voimakkaiden päänsärkyjen ja nivelkipujen sekä voimakkaan uupumuksen vuoksi. Kun tavanomaiset diagnostiset menetelmät eivät kyenneet tunnistamaan selvää syytä, veren metagenominen sekvensointi paljasti yllättäen shamondaviruksen. Potilas on parhaillaan sairaalahoidossa ja vastaa hyvin tukihoitoon.

Euroopan tautienehkäisy- ja -valvontakeskus on alustavasti luokitellut leviämisriskin yleisväestöön matalaksi. Nykyinen näyttö viittaa siihen, että virus leviää Culicoides-polttiaisten — niin sanottujen polttiäisten — välityksellä eikä suoraa tartuntaa ihmisestä toiseen nykytiedon mukaan tapahdu.

Siitä huolimatta tapaus on herättänyt huomattavaa huolta virologien keskuudessa. Asiantuntijat huomauttavat, että eläinviruksen siirtyminen ihmiseen — niin sanottu spillover-tapahtuma — sisältää aina mahdollisuuden kehittyä vakavammaksi uhaksi, erityisesti jos virus käy läpi ihmisisännässä mutaatioita, jotka voivat muuttaa sen tarttuvuutta. Tiedeyhteisö yhdistää tällaisten spillover-tapahtumien lisääntyvän yleisyyden ilmastonmuutokseen: nousevat lämpötilat laajentavat trooppisten vektorien, kuten Culicoides-polttiaisten, elinympäristöä Pohjois-Eurooppaan ja lisäävät samalla ihmisen ja villieläinten kohtaamispintaa muuttuvan maankäytön myötä.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Le autorità sanitarie francesi hanno confermato il primo caso documentato a livello mondiale di infezione da virus Shamonda nell''uomo, innescando un intenso dibattito scientifico sul crescente pericolo delle malattie zoonotiche in Europa. Il virus Shamonda, membro dell''ordine Bunyavirales, era finora conosciuto esclusivamente come agente causale di una malattia febbrile nei ruminanti ed era stato isolato per la prima volta nei bovini in Nigeria nel 1982.

Il paziente è un allevatore di bestiame di 58 anni della regione dell''Occitania, ricoverato in una clinica con febbre alta, forti dolori alla testa e alle articolazioni e un marcato esaurimento. Quando le procedure diagnostiche convenzionali non sono riuscite a identificare una causa chiara, un sequenziamento metagenomico del sangue ha rivelato la sorprendente presenza del virus Shamonda. Il paziente è attualmente ricoverato in ospedale e risponde bene alla terapia di supporto.

Il Centro europeo per la prevenzione e il controllo delle malattie ha provvisoriamente classificato il rischio di diffusione nella popolazione generale come basso. Le prove attuali suggeriscono che il virus viene trasmesso dai moscerini del genere Culicoides e che, secondo le conoscenze attuali, non si verifica una trasmissione diretta da uomo a uomo.

Tuttavia, il caso ha generato notevole preoccupazione tra i virologi. Gli esperti fanno notare che il passaggio di un virus animale all''uomo — un cosiddetto evento di spillover — porta sempre il potenziale di evolversi in una minaccia più seria, specialmente se il virus subisce nell''ospite umano mutazioni che potrebbero alterare la sua trasmissibilità. La comunità scientifica collega la crescente frequenza di tali eventi di spillover al cambiamento climatico: le temperature in aumento espandono l''habitat di vettori tropicali come il moscerino Culicoides verso l''Europa settentrionale e aumentano contemporaneamente la superficie di contatto tra uomo e fauna selvatica a causa dei cambiamenti nell''uso del suolo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'As autoridades de saúde francesas confirmaram o primeiro caso documentado a nível mundial de infeção pelo vírus Shamonda num ser humano, desencadeando um intenso debate científico sobre o crescente perigo das doenças zoonóticas na Europa. O vírus Shamonda, membro da ordem Bunyavirales, era conhecido até agora exclusivamente como agente causador de uma doença febril em ruminantes e foi isolado pela primeira vez em bovinos na Nigéria em 1982.

O paciente é um criador de gado de 58 anos da região da Occitânia que foi internado numa clínica com febre alta, dores de cabeça e articulações intensas e um esgotamento pronunciado. Quando os procedimentos de diagnóstico convencionais não conseguiram identificar uma causa clara, uma sequenciação metagenómica do sangue revelou a surpreendente deteção do vírus Shamonda. O paciente encontra-se atualmente hospitalizado e responde bem à terapia de suporte.

O Centro Europeu de Prevenção e Controlo das Doenças classificou provisoriamente o risco de propagação na população geral como baixo. A evidência atual sugere que o vírus é transmitido por mosquitos do género Culicoides — também conhecidos como mosquitos mordedores — e que, segundo o conhecimento atual, não ocorre transmissão direta de pessoa para pessoa.

Contudo, o caso gerou considerável preocupação entre os virologistas. Os especialistas salientam que a passagem de um vírus animal para o ser humano — um chamado evento de spillover — encerra sempre o potencial de se tornar uma ameaça mais séria, particularmente se o vírus sofrer mutações no hospedeiro humano que possam alterar a sua transmissibilidade. A comunidade científica associa a crescente frequência destes eventos de spillover às alterações climáticas: o aumento das temperaturas expande o habitat de vetores tropicais como o mosquito Culicoides para o norte da Europa e aumenta simultaneamente a interface entre humanos e vida selvagem devido às mudanças no uso do solo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: das Virus
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Virus', 'virus', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el virus', 'el virus')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'virus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'virus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il virus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o vírus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: sich anstecken
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich anstecken', 'sich anstecken', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'contagiarse', 'contagiarse')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to get infected')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'saada tartunta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'contagiarsi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'infetar-se')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Übertragung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Übertragung', 'übertragung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la transmisión', 'la transmisión')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'transmission')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tartunta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la trasmissione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a transmissão')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Erreger
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Erreger', 'erreger', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el patógeno', 'el patógeno')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'pathogen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'taudinaiheuttaja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il patogeno')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o agente patogénico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Gesundheitsbehörde
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Gesundheitsbehörde', 'gesundheitsbehörde', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la autoridad sanitaria', 'la autoridad sanitaria')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'health authority')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'terveysviranomainen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''autorità sanitaria')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a autoridade de saúde')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: zoonotisch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zoonotisch', 'zoonotisch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'zoonótico', 'zoonótico')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'zoonotic')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'zoonoottinen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'zoonotico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'zoonótico')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Überwachung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Überwachung', 'überwachung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la vigilancia', 'la vigilancia')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'surveillance')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'valvonta')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la sorveglianza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a vigilância')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 6: KI entdeckt Sicherheitslücken in Software
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'KI entdeckt Sicherheitslücken in Software',
    'ki-entdeckt-sicherheitsluecken',
    'Cybersicherheit und künstliche Intelligenz',
    'tecnologia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'Computer-Programme haben manchmal Fehler. Diese Fehler können gefährlich sein. Hacker können die Fehler nutzen und Daten stehlen. Jetzt hilft künstliche Intelligenz bei der Suche nach solchen Fehlern. Eine KI hat ernste Probleme in PHP gefunden. PHP ist eine Programmiersprache. Viele Webseiten benutzen PHP. Die Regierungen in Europa wollen jetzt neue Regeln für die Sicherheit von Software. Experten sagen, dass KI schneller Fehler findet als Menschen. Das ist gut für alle Nutzer im Internet.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Künstliche Intelligenz hat schwerwiegende Sicherheitslücken in PHP entdeckt, einer der meistgenutzten Programmiersprachen im Internet. Sicherheitsforscher setzten ein KI-System ein, das den Quellcode automatisch analysierte und dabei Schwachstellen fand, die jahrelang unentdeckt geblieben waren. Diese Lücken hätten es Angreifern ermöglicht, auf Server zuzugreifen und sensible Daten zu stehlen. Nach der Entdeckung haben mehrere europäische Regierungen angekündigt, strengere Sicherheitsstandards für Software einzuführen. Experten begrüßen den Einsatz von KI in der Cybersicherheit, warnen aber auch vor Risiken. Dieselbe Technologie könnte nämlich auch von Kriminellen genutzt werden, um Schwachstellen zu finden und auszunutzen. Die EU-Kommission arbeitet bereits an einem Gesetzentwurf, der Softwarehersteller verpflichten soll, ihre Produkte regelmäßig auf Sicherheitslücken zu prüfen.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Ein bahnbrechendes KI-System hat kürzlich schwerwiegende Sicherheitslücken in PHP aufgedeckt, einer Programmiersprache, die schätzungsweise auf 77 Prozent aller Webserver weltweit zum Einsatz kommt. Die Entdeckung hat in der Technologiebranche für Aufsehen gesorgt und eine intensive Debatte über den Einsatz künstlicher Intelligenz in der Cybersicherheit ausgelöst.

Das von einem internationalen Forschungsteam entwickelte System durchforstete den gesamten Quellcode von PHP und identifizierte dabei mehrere kritische Schwachstellen, die von menschlichen Prüfern über Jahre hinweg übersehen worden waren. Besonders besorgniserregend sei, so die Forscher, dass einige dieser Lücken es potenziellen Angreifern ermöglicht hätten, die vollständige Kontrolle über betroffene Server zu übernehmen.

Als Reaktion auf diese Erkenntnisse haben mehrere europäische Regierungen verschärfte Sicherheitsmaßnahmen angekündigt. Die EU-Kommission hat einen Gesetzentwurf vorgelegt, der Softwarehersteller dazu verpflichten würde, regelmäßige KI-gestützte Sicherheitsaudits durchzuführen. Kritiker bemängeln allerdings, dass derselbe technologische Fortschritt auch Cyberkriminellen in die Hände spielen könnte, die KI-Werkzeuge nutzen würden, um Schwachstellen schneller zu identifizieren und auszunutzen, als Patches bereitgestellt werden können.

Die Cybersicherheitsbranche steht damit vor einem Paradigmenwechsel: Während KI-gestützte Verteidigungssysteme an Bedeutung gewinnen, müssen gleichzeitig ethische Leitlinien für den verantwortungsvollen Einsatz dieser Technologie erarbeitet werden. Experten mahnen, dass ohne eine international koordinierte Strategie ein digitales Wettrüsten drohe, bei dem weder Angreifer noch Verteidiger einen dauerhaften Vorteil erzielen könnten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'La IA descubre fallos de seguridad en software', 'ia-descubre-fallos-seguridad', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'AI Discovers Security Flaws in Software', 'ai-discovers-security-flaws', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Tekoäly löytää tietoturva-aukkoja ohjelmistoista', 'tekoaly-loytaa-tietoturva-aukkoja', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'L''IA scopre falle di sicurezza nel software', 'ia-scopre-falle-sicurezza', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'IA descobre falhas de segurança em software', 'ia-descobre-falhas-seguranca', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'Los programas de ordenador a veces tienen errores. Estos errores pueden ser peligrosos. Los hackers pueden usar los errores y robar datos. Ahora la inteligencia artificial ayuda a buscar estos errores. Una IA ha encontrado problemas graves en PHP. PHP es un lenguaje de programación. Muchas páginas web usan PHP. Los gobiernos de Europa quieren nuevas reglas para la seguridad del software. Los expertos dicen que la IA encuentra errores más rápido que las personas. Eso es bueno para todos los usuarios de internet.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'Computer programs sometimes have errors. These errors can be dangerous. Hackers can use the errors and steal data. Now artificial intelligence helps find these errors. An AI has found serious problems in PHP. PHP is a programming language. Many websites use PHP. Governments in Europe want new rules for software security. Experts say that AI finds errors faster than people. This is good for all internet users.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Tietokoneohjelmissa on joskus virheitä. Nämä virheet voivat olla vaarallisia. Hakkerit voivat käyttää virheitä ja varastaa tietoja. Nyt tekoäly auttaa etsimään näitä virheitä. Tekoäly on löytänyt vakavia ongelmia PHP:stä. PHP on ohjelmointikieli. Monet verkkosivut käyttävät PHP:tä. Euroopan hallitukset haluavat uusia sääntöjä ohjelmistojen turvallisuuteen. Asiantuntijat sanovat, että tekoäly löytää virheet nopeammin kuin ihmiset. Se on hyvä kaikille internetin käyttäjille.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'I programmi per computer a volte hanno errori. Questi errori possono essere pericolosi. Gli hacker possono usare gli errori e rubare dati. Ora l''intelligenza artificiale aiuta a trovare questi errori. Un''IA ha trovato problemi gravi in PHP. PHP è un linguaggio di programmazione. Molti siti web usano PHP. I governi in Europa vogliono nuove regole per la sicurezza del software. Gli esperti dicono che l''IA trova errori più velocemente delle persone. Questo è positivo per tutti gli utenti di internet.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'Os programas de computador às vezes têm erros. Estes erros podem ser perigosos. Os hackers podem usar os erros e roubar dados. Agora a inteligência artificial ajuda a encontrar estes erros. Uma IA encontrou problemas graves no PHP. PHP é uma linguagem de programação. Muitos sites usam PHP. Os governos na Europa querem novas regras para a segurança do software. Os especialistas dizem que a IA encontra erros mais rápido do que as pessoas. Isso é bom para todos os utilizadores da internet.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'La inteligencia artificial ha descubierto graves fallos de seguridad en PHP, uno de los lenguajes de programación más utilizados en internet. Investigadores de seguridad emplearon un sistema de IA que analizó automáticamente el código fuente y encontró vulnerabilidades que habían pasado desapercibidas durante años. Estas brechas habrían permitido a los atacantes acceder a servidores y robar datos sensibles. Tras el descubrimiento, varios gobiernos europeos anunciaron que introducirán estándares de seguridad más estrictos para el software. Los expertos celebran el uso de la IA en ciberseguridad, pero también advierten de los riesgos. La misma tecnología podría ser utilizada por criminales para encontrar y explotar vulnerabilidades. La Comisión Europea ya trabaja en un proyecto de ley que obligará a los fabricantes de software a revisar periódicamente sus productos en busca de fallos de seguridad.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'Artificial intelligence has discovered serious security vulnerabilities in PHP, one of the most widely used programming languages on the internet. Security researchers deployed an AI system that automatically analysed the source code and found weaknesses that had gone undetected for years. These gaps would have allowed attackers to access servers and steal sensitive data. Following the discovery, several European governments announced plans to introduce stricter security standards for software. Experts welcome the use of AI in cybersecurity but also warn of the risks. The same technology could be used by criminals to find and exploit vulnerabilities. The European Commission is already working on a draft law that would require software manufacturers to regularly check their products for security flaws.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Tekoäly on löytänyt vakavia tietoturva-aukkoja PHP:stä, joka on yksi internetin käytetyimmistä ohjelmointikielistä. Tietoturvatutkijat käyttivät tekoälyjärjestelmää, joka analysoi lähdekoodin automaattisesti ja löysi haavoittuvuuksia, jotka olivat jääneet huomaamatta vuosiksi. Nämä aukot olisivat mahdollistaneet hyökkääjien pääsyn palvelimille ja arkaluonteisten tietojen varastamisen. Löydön jälkeen useat Euroopan hallitukset ilmoittivat tiukempien turvallisuusstandardien käyttöönotosta ohjelmistoille. Asiantuntijat pitävät tekoälyn käyttöä kyberturvallisuudessa tervetulleena, mutta varoittavat myös riskeistä. Samaa teknologiaa voisivat rikolliset käyttää haavoittuvuuksien etsimiseen ja hyödyntämiseen. Euroopan komissio valmistelee jo lakiehdotusta, joka velvoittaisi ohjelmistovalmistajat tarkistamaan tuotteidensa tietoturvan säännöllisesti.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'L''intelligenza artificiale ha scoperto gravi falle di sicurezza in PHP, uno dei linguaggi di programmazione più utilizzati su internet. I ricercatori di sicurezza hanno impiegato un sistema di IA che ha analizzato automaticamente il codice sorgente, trovando vulnerabilità rimaste inosservate per anni. Queste falle avrebbero permesso agli aggressori di accedere ai server e rubare dati sensibili. Dopo la scoperta, diversi governi europei hanno annunciato l''introduzione di standard di sicurezza più severi per il software. Gli esperti accolgono con favore l''uso dell''IA nella cybersicurezza, ma avvertono anche dei rischi. La stessa tecnologia potrebbe essere utilizzata dai criminali per trovare e sfruttare vulnerabilità. La Commissione europea sta già lavorando a un progetto di legge che obbligherà i produttori di software a controllare regolarmente i propri prodotti.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'A inteligência artificial descobriu graves falhas de segurança no PHP, uma das linguagens de programação mais utilizadas na internet. Investigadores de segurança utilizaram um sistema de IA que analisou automaticamente o código-fonte e encontrou vulnerabilidades que tinham passado despercebidas durante anos. Estas falhas teriam permitido aos atacantes aceder a servidores e roubar dados sensíveis. Após a descoberta, vários governos europeus anunciaram a introdução de padrões de segurança mais rigorosos para o software. Os especialistas aplaudem o uso da IA na cibersegurança, mas também alertam para os riscos. A mesma tecnologia poderia ser usada por criminosos para encontrar e explorar vulnerabilidades. A Comissão Europeia já trabalha num projeto de lei que obrigará os fabricantes de software a verificar regularmente os seus produtos.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'Un revolucionario sistema de inteligencia artificial ha destapado recientemente graves vulnerabilidades de seguridad en PHP, un lenguaje de programación que se estima está presente en el 77 por ciento de los servidores web de todo el mundo. El hallazgo ha causado revuelo en el sector tecnológico y ha desencadenado un intenso debate sobre el papel de la inteligencia artificial en la ciberseguridad.

El sistema, desarrollado por un equipo de investigación internacional, rastreó el código fuente completo de PHP e identificó varias debilidades críticas que los revisores humanos habían pasado por alto durante años. Lo más preocupante, según los investigadores, es que algunas de estas brechas habrían permitido a posibles atacantes tomar el control total de los servidores afectados.

En respuesta a estos descubrimientos, varios gobiernos europeos han anunciado medidas de seguridad más estrictas. La Comisión Europea ha presentado un proyecto de ley que obligaría a los fabricantes de software a realizar auditorías de seguridad periódicas asistidas por IA. Sin embargo, los críticos advierten de que el mismo avance tecnológico podría beneficiar a los ciberdelincuentes, que utilizarían herramientas de IA para identificar y explotar vulnerabilidades más rápido de lo que se pueden publicar parches.

El sector de la ciberseguridad se enfrenta así a un cambio de paradigma: mientras los sistemas de defensa basados en IA ganan relevancia, es necesario elaborar directrices éticas para el uso responsable de esta tecnología. Los expertos advierten de que, sin una estrategia coordinada a nivel internacional, podría desatarse una carrera armamentística digital en la que ni atacantes ni defensores lograrían una ventaja duradera.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'A groundbreaking AI system has recently uncovered severe security vulnerabilities in PHP, a programming language estimated to run on 77 per cent of all web servers worldwide. The discovery has sent shockwaves through the technology industry and triggered an intense debate about the role of artificial intelligence in cybersecurity.

The system, developed by an international research team, combed through the entire PHP source code and identified several critical weaknesses that human reviewers had overlooked for years. Particularly alarming, according to the researchers, was the fact that some of these flaws would have allowed potential attackers to gain complete control over affected servers.

In response to these findings, several European governments have announced tightened security measures. The European Commission has tabled a draft law that would require software manufacturers to conduct regular AI-assisted security audits. Critics point out, however, that the same technological advance could play into the hands of cybercriminals, who would use AI tools to identify and exploit vulnerabilities faster than patches can be deployed.

The cybersecurity industry thus faces a paradigm shift: while AI-powered defence systems are gaining importance, ethical guidelines for the responsible use of this technology must be drawn up at the same time. Experts caution that without an internationally coordinated strategy, a digital arms race looms in which neither attackers nor defenders could achieve a lasting advantage.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Uraauurtava tekoälyjärjestelmä on äskettäin paljastanut vakavia tietoturva-aukkoja PHP:stä, ohjelmointikielestä, jonka arvioidaan toimivan 77 prosentissa maailman verkkopalvelimista. Löytö on herättänyt laajaa huomiota teknologia-alalla ja käynnistänyt kiivaankin keskustelun tekoälyn roolista kyberturvallisuudessa.

Kansainvälisen tutkimusryhmän kehittämä järjestelmä kävi läpi PHP:n koko lähdekoodin ja tunnisti useita kriittisiä haavoittuvuuksia, jotka olivat jääneet ihmistarkastajilta huomaamatta vuosien ajan. Tutkijoiden mukaan erityisen huolestuttavaa oli, että osa näistä aukoista olisi mahdollistanut hyökkääjien täydellisen hallinnan kohdepalvelimiin.

Löydösten seurauksena useat Euroopan hallitukset ovat ilmoittaneet tiukennetuista turvatoimista. Euroopan komissio on esittänyt lakiehdotuksen, joka velvoittaisi ohjelmistovalmistajat suorittamaan säännöllisiä tekoälyavusteisia tietoturva-auditointeja. Kriitikot huomauttavat kuitenkin, että sama teknologinen edistysaskel voisi hyödyttää myös kyberrikollisia, jotka käyttäisivät tekoälytyökaluja haavoittuvuuksien tunnistamiseen ja hyödyntämiseen nopeammin kuin korjauksia ehditään julkaista.

Kyberturvallisuusala on siten paradigman muutoksen edessä: samalla kun tekoälypohjaiset puolustusratkaisut kasvattavat merkitystään, on laadittava eettiset ohjeet teknologian vastuulliselle käytölle. Asiantuntijat varoittavat, että ilman kansainvälisesti koordinoitua strategiaa uhkaa digitaalinen kilpavarustelu, jossa kumpikaan osapuoli ei saavuttaisi pysyvää etulyöntiasemaa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Un rivoluzionario sistema di intelligenza artificiale ha recentemente portato alla luce gravi vulnerabilità di sicurezza in PHP, un linguaggio di programmazione che si stima sia utilizzato dal 77 per cento dei server web a livello mondiale. La scoperta ha scosso il settore tecnologico e innescato un acceso dibattito sul ruolo dell''intelligenza artificiale nella cybersicurezza.

Il sistema, sviluppato da un team di ricerca internazionale, ha setacciato l''intero codice sorgente di PHP identificando diverse debolezze critiche che i revisori umani avevano trascurato per anni. Secondo i ricercatori, particolarmente allarmante è il fatto che alcune di queste falle avrebbero consentito a potenziali aggressori di assumere il controllo completo dei server colpiti.

In risposta a queste scoperte, diversi governi europei hanno annunciato misure di sicurezza più severe. La Commissione europea ha presentato un disegno di legge che obbligherebbe i produttori di software a condurre regolari audit di sicurezza assistiti dall''IA. I critici osservano tuttavia che lo stesso progresso tecnologico potrebbe avvantaggiare anche i cybercriminali, i quali utilizzerebbero strumenti di IA per individuare e sfruttare le vulnerabilità più rapidamente di quanto si possano distribuire le patch.

Il settore della cybersicurezza si trova dunque di fronte a un cambio di paradigma: mentre i sistemi di difesa basati sull''IA acquistano rilevanza, occorre al contempo elaborare linee guida etiche per l''uso responsabile di questa tecnologia. Gli esperti avvertono che, senza una strategia coordinata a livello internazionale, si rischia una corsa al riarmo digitale in cui né attaccanti né difensori potrebbero ottenere un vantaggio duraturo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'Um revolucionário sistema de inteligência artificial revelou recentemente graves vulnerabilidades de segurança no PHP, uma linguagem de programação que se estima estar presente em 77 por cento dos servidores web em todo o mundo. A descoberta causou grande impacto no setor tecnológico e desencadeou um intenso debate sobre o papel da inteligência artificial na cibersegurança.

O sistema, desenvolvido por uma equipa de investigação internacional, percorreu todo o código-fonte do PHP e identificou várias fragilidades críticas que os revisores humanos tinham ignorado durante anos. Segundo os investigadores, o mais preocupante é que algumas destas falhas teriam permitido a potenciais atacantes assumir o controlo total dos servidores afetados.

Em resposta a estas descobertas, vários governos europeus anunciaram medidas de segurança reforçadas. A Comissão Europeia apresentou um projeto de lei que obrigaria os fabricantes de software a realizar auditorias de segurança regulares assistidas por IA. No entanto, os críticos alertam que o mesmo avanço tecnológico poderia beneficiar os cibercriminosos, que utilizariam ferramentas de IA para identificar e explorar vulnerabilidades mais rapidamente do que as correções podem ser disponibilizadas.

O setor da cibersegurança enfrenta assim uma mudança de paradigma: enquanto os sistemas de defesa baseados em IA ganham importância, é necessário desenvolver simultaneamente orientações éticas para o uso responsável desta tecnologia. Os especialistas advertem que, sem uma estratégia coordenada internacionalmente, poderá desencadear-se uma corrida ao armamento digital na qual nem atacantes nem defensores conseguiriam alcançar uma vantagem duradoura.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Sicherheitslücke
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Sicherheitslücke', 'sicherheitslücke', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la vulnerabilidad', 'la vulnerabilidad')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'security vulnerability')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tietoturva-aukko')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la vulnerabilità')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a vulnerabilidade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Quellcode
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Quellcode', 'quellcode', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el código fuente', 'el código fuente')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'source code')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lähdekoodi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il codice sorgente')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o código-fonte')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Angreifer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Angreifer', 'angreifer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el atacante', 'el atacante')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'attacker')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hyökkääjä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''aggressore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o atacante')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: aufdecken
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('aufdecken', 'aufdecken', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'descubrir', 'descubrir')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to uncover')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'paljastaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'scoprire')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'descobrir')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Schwachstelle
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Schwachstelle', 'schwachstelle', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el punto débil', 'el punto débil')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'weakness')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'heikkous')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il punto debole')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o ponto fraco')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: verschärfen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verschärfen', 'verschärfen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'endurecer', 'endurecer')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to tighten')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tiukentaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'inasprire')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'reforçar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Gesetzentwurf
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Gesetzentwurf', 'gesetzentwurf', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el proyecto de ley', 'el proyecto de ley')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'draft law')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'lakiehdotus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il disegno di legge')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o projeto de lei')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 7: Europas Startups wachsen trotz Herausforderungen
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Europas Startups wachsen trotz Herausforderungen',
    'europas-startups-wachsen',
    'Europäische Wirtschaft und Innovation',
    'economia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'In Europa gibt es immer mehr Startups. Ein Startup ist eine neue, kleine Firma mit einer guten Idee. Viele Startups arbeiten mit Technologie. Sie machen zum Beispiel Apps oder Software. Dieses Jahr sind besonders viele Startups in Deutschland, Frankreich und Spanien entstanden. Die Firmen bekommen Geld von Investoren. Investoren sind Menschen, die Geld in neue Firmen geben. Aber es gibt auch Probleme. Die Mieten für Büros sind teuer und es ist schwer, gute Mitarbeiter zu finden. Trotzdem wächst die Startup-Szene in Europa.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Die europäische Startup-Szene hat in den letzten Monaten ein bemerkenswertes Wachstum verzeichnet. Laut einem aktuellen Bericht sind in der ersten Hälfte des Jahres über zweitausend neue Technologieunternehmen in der EU gegründet worden. Besonders stark war das Wachstum in den Bereichen künstliche Intelligenz, grüne Energie und digitale Gesundheit.

Deutschland, Frankreich und Spanien führen die Liste der Länder mit den meisten Neugründungen an. Berlin und Paris gelten weiterhin als die wichtigsten europäischen Standorte für junge Unternehmen. Die Gesamtinvestitionen in europäische Startups stiegen um 15 Prozent im Vergleich zum Vorjahr.

Allerdings stehen die Gründer auch vor erheblichen Herausforderungen. Der Fachkräftemangel, hohe Betriebskosten und eine im Vergleich zu den USA kompliziertere Regulierung bremsen das Wachstum. Viele Gründer kritisieren, dass die bürokratischen Hürden in einigen EU-Ländern zu hoch seien. Trotzdem zeigen sich Investoren optimistisch und erwarten, dass Europa seinen technologischen Rückstand gegenüber den USA und China in den kommenden Jahren weiter verringern wird.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Die europäische Startup-Landschaft befindet sich in einem bemerkenswerten Aufschwung, der von Branchenbeobachtern als die dynamischste Phase seit der Finanzkrise bezeichnet wird. In der ersten Jahreshälfte wurden EU-weit mehr als zweitausend neue Technologieunternehmen gegründet, wobei die Bereiche künstliche Intelligenz, nachhaltige Energie und digitale Gesundheitsversorgung die stärksten Zuwächse verzeichneten.

Der aktuelle Bericht des Europäischen Innovationsrats zeigt, dass die Gesamtinvestitionen in europäische Startups um 15 Prozent gegenüber dem Vorjahr gestiegen sind und damit erstmals die Marke von 50 Milliarden Euro überschritten haben. Deutschland, Frankreich und Spanien führen die Liste der Neugründungen an, doch auch kleinere Ökosysteme in Portugal, den Niederlanden und den baltischen Staaten gewinnen an Bedeutung.

Dennoch wäre es verfrüht, von einer europäischen Erfolgsgeschichte zu sprechen. Die strukturellen Herausforderungen bleiben beträchtlich: Der Fachkräftemangel hat sich verschärft, die Betriebskosten in Metropolen wie Berlin, Paris und Barcelona sind deutlich gestiegen, und die regulatorische Fragmentierung innerhalb der EU erschwert die Skalierung junger Unternehmen über nationale Grenzen hinweg.

Besonders kritisch bewerten Gründer die Diskrepanz zwischen politischen Absichtserklärungen und der Realität vor Ort. Während die EU-Kommission ambitionierte Programme zur Innovationsförderung aufgelegt hat, klagen viele Jungunternehmer über langwierige Genehmigungsverfahren und eine überbordende Bürokratie. Branchenverbände fordern daher eine Harmonisierung der Gründungsvorschriften und eine Vereinfachung des grenzüberschreitenden Kapitalverkehrs, um Europas Wettbewerbsfähigkeit gegenüber den USA und China nachhaltig zu stärken.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'Las startups europeas crecen pese a los desafíos', 'startups-europeas-crecen', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'Europe''s Startups Grow Despite Challenges', 'europes-startups-grow', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Euroopan startup-yritykset kasvavat haasteista huolimatta', 'euroopan-startupit-kasvavat', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'Le startup europee crescono nonostante le sfide', 'startup-europee-crescono', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'As startups europeias crescem apesar dos desafios', 'startups-europeias-crescem', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'En Europa hay cada vez más startups. Una startup es una empresa nueva y pequeña con una buena idea. Muchas startups trabajan con tecnología. Hacen, por ejemplo, aplicaciones o software. Este año han surgido muchas startups en Alemania, Francia y España. Las empresas reciben dinero de inversores. Los inversores son personas que ponen dinero en empresas nuevas. Pero también hay problemas. Los alquileres de oficinas son caros y es difícil encontrar buenos empleados. Aun así, el mundo de las startups crece en Europa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'In Europe there are more and more startups. A startup is a new, small company with a good idea. Many startups work with technology. They make apps or software, for example. This year, many startups have been created in Germany, France and Spain. The companies receive money from investors. Investors are people who put money into new companies. But there are also problems. Office rents are expensive and it is hard to find good employees. Still, the startup scene in Europe is growing.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Euroopassa on yhä enemmän startup-yrityksiä. Startup on uusi, pieni yritys, jolla on hyvä idea. Monet startupit työskentelevät teknologian parissa. Ne tekevät esimerkiksi sovelluksia tai ohjelmistoja. Tänä vuonna erityisen monta startuppia on perustettu Saksassa, Ranskassa ja Espanjassa. Yritykset saavat rahaa sijoittajilta. Sijoittajat ovat ihmisiä, jotka antavat rahaa uusille yrityksille. Mutta ongelmiakin on. Toimistojen vuokrat ovat kalliita ja on vaikeaa löytää hyviä työntekijöitä. Silti startup-maailma kasvaa Euroopassa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'In Europa ci sono sempre più startup. Una startup è una nuova piccola azienda con una buona idea. Molte startup lavorano con la tecnologia. Fanno per esempio app o software. Quest''anno sono nate molte startup in Germania, Francia e Spagna. Le aziende ricevono soldi dagli investitori. Gli investitori sono persone che mettono soldi in aziende nuove. Ma ci sono anche problemi. Gli affitti degli uffici sono cari ed è difficile trovare buoni dipendenti. Nonostante ciò, il mondo delle startup cresce in Europa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'Na Europa há cada vez mais startups. Uma startup é uma empresa nova e pequena com uma boa ideia. Muitas startups trabalham com tecnologia. Fazem, por exemplo, aplicações ou software. Este ano surgiram muitas startups na Alemanha, França e Espanha. As empresas recebem dinheiro de investidores. Os investidores são pessoas que colocam dinheiro em empresas novas. Mas também há problemas. As rendas dos escritórios são caras e é difícil encontrar bons empregados. Mesmo assim, o mundo das startups cresce na Europa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'El ecosistema de startups europeo ha registrado un crecimiento notable en los últimos meses. Según un informe reciente, en la primera mitad del año se fundaron más de dos mil nuevas empresas tecnológicas en la UE. El crecimiento fue especialmente fuerte en los campos de la inteligencia artificial, la energía verde y la salud digital.

Alemania, Francia y España encabezan la lista de países con más nuevas fundaciones. Berlín y París siguen siendo los centros europeos más importantes para las empresas jóvenes. La inversión total en startups europeas creció un 15 por ciento respecto al año anterior.

Sin embargo, los fundadores también enfrentan desafíos considerables. La escasez de profesionales cualificados, los altos costes operativos y una regulación más complicada que en Estados Unidos frenan el crecimiento. Muchos fundadores critican que las barreras burocráticas en algunos países de la UE son demasiado altas. A pesar de ello, los inversores se muestran optimistas y esperan que Europa siga reduciendo su brecha tecnológica con Estados Unidos y China en los próximos años.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'The European startup scene has recorded remarkable growth in recent months. According to a recent report, over two thousand new technology companies were founded in the EU in the first half of the year. Growth was particularly strong in the fields of artificial intelligence, green energy and digital health.

Germany, France and Spain lead the list of countries with the most new ventures. Berlin and Paris continue to be the most important European hubs for young companies. Total investment in European startups rose by 15 per cent compared with the previous year.

However, founders also face considerable challenges. A shortage of skilled workers, high operating costs and regulation that is more complex than in the United States slow growth. Many founders criticise the bureaucratic hurdles in some EU countries as being too high. Despite this, investors remain optimistic and expect Europe to continue closing its technological gap with the United States and China in the coming years.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Eurooppalainen startup-kenttä on kirjannut huomattavaa kasvua viime kuukausina. Tuoreen raportin mukaan EU:ssa perustettiin vuoden ensimmäisellä puoliskolla yli kaksituhatta uutta teknologiayritystä. Kasvu oli erityisen voimakasta tekoälyn, vihreän energian ja digitaalisen terveydenhuollon aloilla.

Saksa, Ranska ja Espanja johtavat eniten uusia yrityksiä perustaneiden maiden listaa. Berliini ja Pariisi ovat edelleen Euroopan tärkeimmät nuorten yritysten keskittymät. Kokonaisinvestoinnit eurooppalaisiin startup-yrityksiin kasvoivat 15 prosenttia edellisvuoteen verrattuna.

Perustajat kohtaavat kuitenkin myös huomattavia haasteita. Osaajapula, korkeat toimintakustannukset ja Yhdysvaltoihin verrattuna monimutkaisempi sääntely jarruttavat kasvua. Monet perustajat kritisoivat byrokratian esteitä joissakin EU-maissa liian korkeiksi. Tästä huolimatta sijoittajat ovat optimistisia ja odottavat Euroopan jatkavan teknologisen kuilun kaventamista Yhdysvaltoihin ja Kiinaan nähden tulevina vuosina.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'L''ecosistema delle startup europee ha registrato una crescita notevole negli ultimi mesi. Secondo un rapporto recente, nella prima metà dell''anno sono state fondate oltre duemila nuove aziende tecnologiche nell''UE. La crescita è stata particolarmente forte nei settori dell''intelligenza artificiale, dell''energia verde e della salute digitale.

Germania, Francia e Spagna guidano la classifica dei Paesi con il maggior numero di nuove fondazioni. Berlino e Parigi continuano a essere i centri europei più importanti per le giovani imprese. Gli investimenti complessivi nelle startup europee sono aumentati del 15 per cento rispetto all''anno precedente.

Tuttavia, i fondatori devono affrontare anche sfide considerevoli. La carenza di manodopera qualificata, gli alti costi operativi e una regolamentazione più complessa rispetto agli Stati Uniti frenano la crescita. Molti fondatori criticano le barriere burocratiche in alcuni Paesi dell''UE come troppo elevate. Nonostante ciò, gli investitori si mostrano ottimisti e si aspettano che l''Europa continui a ridurre il divario tecnologico con Stati Uniti e Cina nei prossimi anni.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'O ecossistema de startups europeu registou um crescimento notável nos últimos meses. Segundo um relatório recente, mais de duas mil novas empresas tecnológicas foram fundadas na UE no primeiro semestre do ano. O crescimento foi particularmente forte nas áreas da inteligência artificial, energia verde e saúde digital.

Alemanha, França e Espanha lideram a lista dos países com mais novas fundações. Berlim e Paris continuam a ser os centros europeus mais importantes para as empresas jovens. O investimento total em startups europeias cresceu 15 por cento em relação ao ano anterior.

No entanto, os fundadores também enfrentam desafios consideráveis. A escassez de profissionais qualificados, os elevados custos operacionais e uma regulamentação mais complexa do que nos Estados Unidos travam o crescimento. Muitos fundadores criticam as barreiras burocráticas em alguns países da UE como sendo demasiado elevadas. Apesar disso, os investidores mostram-se otimistas e esperam que a Europa continue a reduzir o seu atraso tecnológico em relação aos Estados Unidos e à China nos próximos anos.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'El panorama europeo de startups atraviesa un auge notable que los analistas del sector califican como la fase más dinámica desde la crisis financiera. En el primer semestre del año se fundaron más de dos mil nuevas empresas tecnológicas en la UE, y los sectores de la inteligencia artificial, la energía sostenible y la salud digital registraron los mayores incrementos.

El informe del Consejo Europeo de Innovación revela que la inversión total en startups europeas creció un 15 por ciento respecto al año anterior, superando por primera vez la barrera de los 50.000 millones de euros. Alemania, Francia y España encabezan la lista de nuevas fundaciones, pero ecosistemas más pequeños en Portugal, los Países Bajos y los países bálticos también ganan relevancia.

No obstante, sería prematuro hablar de una historia de éxito europea. Los desafíos estructurales siguen siendo considerables: la escasez de profesionales cualificados se ha agravado, los costes operativos en metrópolis como Berlín, París y Barcelona han subido notablemente, y la fragmentación regulatoria dentro de la UE dificulta la expansión de las empresas jóvenes más allá de las fronteras nacionales.

Los fundadores valoran con especial dureza la brecha entre las declaraciones políticas de intenciones y la realidad sobre el terreno. Mientras la Comisión Europea ha puesto en marcha programas ambiciosos de fomento de la innovación, muchos jóvenes empresarios se quejan de procedimientos de aprobación largos y de una burocracia desbordante. Las asociaciones sectoriales reclaman por ello una armonización de las normas de constitución y una simplificación del movimiento transfronterizo de capitales para fortalecer de manera sostenible la competitividad europea frente a Estados Unidos y China.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'The European startup landscape is experiencing a remarkable upswing that industry observers describe as the most dynamic phase since the financial crisis. In the first half of the year, more than two thousand new technology companies were founded across the EU, with the fields of artificial intelligence, sustainable energy and digital healthcare recording the strongest gains.

The latest report from the European Innovation Council shows that total investment in European startups rose by 15 per cent year on year, surpassing the 50-billion-euro mark for the first time. Germany, France and Spain lead the list of new ventures, but smaller ecosystems in Portugal, the Netherlands and the Baltic states are also gaining prominence.

Nevertheless, it would be premature to speak of a European success story. The structural challenges remain considerable: the shortage of skilled workers has worsened, operating costs in cities such as Berlin, Paris and Barcelona have risen sharply, and regulatory fragmentation within the EU makes it difficult for young companies to scale across national borders.

Founders are particularly critical of the gap between political declarations of intent and the reality on the ground. While the European Commission has launched ambitious innovation-support programmes, many young entrepreneurs complain about lengthy approval processes and excessive bureaucracy. Industry associations are therefore calling for a harmonisation of incorporation rules and a simplification of cross-border capital flows in order to strengthen Europe''s competitiveness against the United States and China on a lasting basis.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Eurooppalainen startup-kenttä elää merkittävää nousua, jota alan tarkkailijat kuvaavat dynaamisimmaksi vaiheeksi sitten finanssikriisin. Vuoden ensimmäisellä puoliskolla EU:n alueella perustettiin yli kaksituhatta uutta teknologiayritystä, ja voimakkainta kasvu oli tekoälyn, kestävän energian ja digitaalisen terveydenhuollon aloilla.

Euroopan innovaationeuvoston tuore raportti osoittaa, että kokonaisinvestoinnit eurooppalaisiin startup-yrityksiin kasvoivat 15 prosenttia edellisvuodesta ja ylittivät ensimmäistä kertaa 50 miljardin euron rajan. Saksa, Ranska ja Espanja johtavat uusien yritysten perustamistilastoja, mutta myös pienemmät ekosysteemit Portugalissa, Alankomaissa ja Baltian maissa kasvattavat merkitystään.

Silti olisi ennenaikaista puhua eurooppalaisesta menestystarinasta. Rakenteelliset haasteet ovat edelleen huomattavia: osaajapula on pahentunut, toimintakustannukset Berliinin, Pariisin ja Barcelonan kaltaisissa suurkaupungeissa ovat nousseet selvästi, ja EU:n sisäinen sääntelypirstaloituminen vaikeuttaa nuorten yritysten laajentumista kansallisten rajojen yli.

Perustajat suhtautuvat erityisen kriittisesti poliittisten aiejulistusten ja paikan päällä kohdattavan todellisuuden väliseen kuiluun. Vaikka Euroopan komissio on käynnistänyt kunnianhimoisia innovaation tukiohjelmia, monet nuoret yrittäjät valittavat pitkistä lupamenettelyistä ja ylimitoitetusta byrokratiasta. Toimialajärjestöt vaativat siksi perustamissääntöjen yhtenäistämistä ja rajat ylittävän pääomaliikenteen yksinkertaistamista Euroopan kilpailukyvyn vahvistamiseksi kestävästi suhteessa Yhdysvaltoihin ja Kiinaan.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Il panorama europeo delle startup sta vivendo una ripresa notevole, che gli osservatori del settore definiscono la fase più dinamica dalla crisi finanziaria. Nel primo semestre dell''anno sono state fondate oltre duemila nuove aziende tecnologiche nell''UE, con i settori dell''intelligenza artificiale, dell''energia sostenibile e della sanità digitale a registrare gli incrementi più consistenti.

L''ultimo rapporto del Consiglio europeo per l''innovazione mostra che gli investimenti complessivi nelle startup europee sono cresciuti del 15 per cento rispetto all''anno precedente, superando per la prima volta la soglia dei 50 miliardi di euro. Germania, Francia e Spagna guidano la classifica delle nuove fondazioni, ma anche ecosistemi più piccoli in Portogallo, nei Paesi Bassi e negli Stati baltici stanno guadagnando rilevanza.

Tuttavia, sarebbe prematuro parlare di una storia di successo europea. Le sfide strutturali restano considerevoli: la carenza di manodopera qualificata si è aggravata, i costi operativi in metropoli come Berlino, Parigi e Barcellona sono saliti sensibilmente e la frammentazione normativa all''interno dell''UE ostacola la crescita delle giovani imprese oltre i confini nazionali.

I fondatori giudicano con particolare severità il divario tra le dichiarazioni di intenti politiche e la realtà sul campo. Mentre la Commissione europea ha lanciato ambiziosi programmi di sostegno all''innovazione, molti giovani imprenditori lamentano procedure di approvazione lunghe e una burocrazia soffocante. Le associazioni di categoria chiedono quindi un''armonizzazione delle norme sulla costituzione delle società e una semplificazione della circolazione transfrontaliera dei capitali per rafforzare in modo duraturo la competitività europea rispetto a Stati Uniti e Cina.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'O panorama europeu de startups atravessa uma recuperação notável, que os observadores do setor descrevem como a fase mais dinâmica desde a crise financeira. No primeiro semestre do ano, mais de duas mil novas empresas tecnológicas foram fundadas na UE, tendo os setores da inteligência artificial, da energia sustentável e da saúde digital registado os maiores incrementos.

O mais recente relatório do Conselho Europeu de Inovação mostra que o investimento total em startups europeias cresceu 15 por cento face ao ano anterior, ultrapassando pela primeira vez a barreira dos 50 mil milhões de euros. Alemanha, França e Espanha lideram a lista de novas fundações, mas ecossistemas mais pequenos em Portugal, nos Países Baixos e nos Estados bálticos também ganham relevância.

No entanto, seria prematuro falar de uma história de sucesso europeia. Os desafios estruturais continuam a ser consideráveis: a escassez de profissionais qualificados agravou-se, os custos operacionais em metrópoles como Berlim, Paris e Barcelona subiram acentuadamente, e a fragmentação regulatória dentro da UE dificulta a expansão das empresas jovens para além das fronteiras nacionais.

Os fundadores avaliam com particular severidade o fosso entre as declarações políticas de intenções e a realidade no terreno. Enquanto a Comissão Europeia lançou programas ambiciosos de apoio à inovação, muitos jovens empresários queixam-se de processos de aprovação morosos e de uma burocracia excessiva. As associações setoriais reclamam, por isso, uma harmonização das normas de constituição de empresas e uma simplificação da circulação transfronteiriça de capitais para reforçar de forma sustentável a competitividade europeia face aos Estados Unidos e à China.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: das Startup
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Startup', 'startup', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la startup', 'la startup')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'startup')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'startup-yritys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la startup')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a startup')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Investor
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Investor', 'investor', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el inversor', 'el inversor')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'investor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'sijoittaja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''investitore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o investidor')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Neugründung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Neugründung', 'neugründung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la nueva empresa', 'la nueva empresa')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'new venture')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'uusi yritys')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la nuova fondazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a nova empresa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Fachkräftemangel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fachkräftemangel', 'fachkräftemangel', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la escasez de profesionales', 'la escasez de profesionales')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'shortage of skilled workers')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'osaajapula')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la carenza di manodopera')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a escassez de profissionais')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: gründen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gründen', 'gründen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'fundar', 'fundar')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to found')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'perustaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'fondare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'fundar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Wettbewerbsfähigkeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wettbewerbsfähigkeit', 'wettbewerbsfähigkeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la competitividad', 'la competitividad')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'competitiveness')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kilpailukyky')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la competitività')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a competitividade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Herausforderung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Herausforderung', 'herausforderung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el desafío', 'el desafío')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'challenge')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'haaste')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la sfida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o desafio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 8: KI verbessert Unwetter-Vorhersagen
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'KI verbessert Unwetter-Vorhersagen',
    'ki-verbessert-unwetter-vorhersagen',
    'Wettervorhersage und künstliche Intelligenz',
    'ciencia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'Das Wetter kann manchmal sehr gefährlich sein. Stürme und Hurrikane zerstören Häuser und Straßen. Es ist wichtig, das Wetter gut vorherzusagen. Jetzt hilft künstliche Intelligenz dabei. KI-Programme können sehr viele Daten schnell analysieren. Sie schauen auf Temperaturen, Wind und Wolken. So können sie besser sagen, wann ein Sturm kommt. Meteorologen nutzen die neue Technik schon. Die Vorhersagen sind jetzt genauer als früher. Das hilft den Menschen, sich besser auf schlechtes Wetter vorzubereiten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Hurrikan-Forscher setzen zunehmend auf künstliche Intelligenz, um ihre Vorhersagen zu verbessern. Neue KI-Modelle können riesige Mengen an Wetterdaten in Echtzeit verarbeiten und Muster erkennen, die für menschliche Meteorologen kaum sichtbar sind. In der diesjährigen Sturmsaison haben KI-gestützte Vorhersagen die Zugbahnen von Hurrikanen deutlich genauer berechnet als herkömmliche Methoden.

Das Nationale Hurrikanzentrum der USA berichtete, dass die durchschnittliche Fehlerquote bei der Vorhersage der Zugbahn um 30 Prozent gesunken ist, seit KI-Systeme eingesetzt werden. Besonders wichtig ist die verbesserte Vorhersage der Intensität eines Sturms, die bisher am schwierigsten zu berechnen war.

Die Technologie nutzt Satellitendaten, Messdaten von Bojen und Wetterstationen sowie historische Sturmdaten. Durch maschinelles Lernen erkennt das System Zusammenhänge zwischen verschiedenen Faktoren wie Meerestemperatur, Luftfeuchtigkeit und Windscherung. Experten betonen jedoch, dass KI die Arbeit der Meteorologen ergänzt, aber nicht ersetzt. Die endgültige Bewertung und die Entscheidung über Warnungen liegen weiterhin bei erfahrenen Fachleuten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Die diesjährige Hurrikansaison hat einen bemerkenswerten technologischen Wandel in der Meteorologie sichtbar gemacht: Künstliche Intelligenz spielt eine zunehmend zentrale Rolle bei der Vorhersage schwerer Unwetter. Neue KI-Modelle, die auf neuronalen Netzwerken basieren, verarbeiten Petabytes an Satelliten-, Ozean- und Atmosphärendaten in Echtzeit und liefern Prognosen, die herkömmliche numerische Wettermodelle in mehreren Schlüsselkategorien übertreffen.

Das Nationale Hurrikanzentrum der USA meldete, dass die durchschnittliche Fehlerquote bei der Vorhersage von Zugbahnen seit der Integration von KI-Systemen um 30 Prozent gesunken sei. Noch bedeutsamer ist der Fortschritt bei der Intensitätsvorhersage, die traditionell die größte Schwäche der Hurrikanprognose darstellte. Hier konnten die neuen Modelle die Fehlerquote um bis zu 25 Prozent reduzieren, indem sie subtile Wechselwirkungen zwischen Meerestemperatur, vertikaler Windscherung und atmosphärischer Feuchtigkeit modellierten, die konventionelle Ansätze nur unzureichend erfassten.

Die verbesserte Vorhersagegenauigkeit hat unmittelbare Auswirkungen auf den Katastrophenschutz. Präzisere Warnungen ermöglichen es Behörden, Evakuierungen gezielter anzuordnen und Ressourcen effizienter zu verteilen. Schätzungen zufolge könnten die durch KI verbesserten Vorhersagen allein in der atlantischen Hurrikansaison wirtschaftliche Schäden in Milliardenhöhe verhindern.

Gleichzeitig warnen Meteorologen davor, die Technologie zu überschätzen. KI-Modelle seien zwar leistungsfähig, könnten aber bei neuartigen Wetterphänomenen versagen, für die keine historischen Trainingsdaten vorliegen. Die Kombination aus menschlicher Expertise und maschineller Analyse bleibe daher unverzichtbar. Zudem müssten die KI-Modelle kontinuierlich mit aktuellen Daten nachtrainiert werden, um dem sich wandelnden Klimasystem Rechnung zu tragen.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'La IA mejora las predicciones de tormentas', 'ia-mejora-predicciones-tormentas', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'AI Improves Severe Weather Forecasts', 'ai-improves-weather-forecasts', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Tekoäly parantaa myrskyennusteita', 'tekoaly-parantaa-myrskyennusteita', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'L''IA migliora le previsioni delle tempeste', 'ia-migliora-previsioni-tempeste', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'IA melhora as previsões de tempestades', 'ia-melhora-previsoes-tempestades', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'El tiempo puede ser muy peligroso a veces. Las tormentas y los huracanes destruyen casas y calles. Es importante predecir bien el tiempo. Ahora la inteligencia artificial ayuda con eso. Los programas de IA pueden analizar muchos datos rápidamente. Observan temperaturas, viento y nubes. Así pueden decir mejor cuándo viene una tormenta. Los meteorólogos ya usan la nueva técnica. Las predicciones ahora son más exactas que antes. Eso ayuda a las personas a prepararse mejor para el mal tiempo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'The weather can sometimes be very dangerous. Storms and hurricanes destroy houses and streets. It is important to predict the weather well. Now artificial intelligence helps with that. AI programs can analyse a lot of data quickly. They look at temperatures, wind and clouds. This way they can better say when a storm is coming. Weather forecasters already use the new technology. The predictions are now more accurate than before. This helps people prepare better for bad weather.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Sää voi joskus olla hyvin vaarallista. Myrskyt ja hurrikaanit tuhoavat taloja ja teitä. On tärkeää ennustaa säätä hyvin. Nyt tekoäly auttaa siinä. Tekoälyohjelmat voivat analysoida paljon tietoa nopeasti. Ne tarkastelevat lämpötiloja, tuulta ja pilviä. Näin ne voivat kertoa paremmin, milloin myrsky tulee. Meteorologit käyttävät uutta tekniikkaa jo nyt. Ennusteet ovat nyt tarkempia kuin ennen. Se auttaa ihmisiä varautumaan paremmin huonoon säähän.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'Il tempo può essere molto pericoloso a volte. Le tempeste e gli uragani distruggono case e strade. È importante prevedere bene il tempo. Ora l''intelligenza artificiale aiuta in questo. I programmi di IA possono analizzare molti dati velocemente. Osservano temperature, vento e nuvole. Così possono dire meglio quando arriva una tempesta. I meteorologi già usano la nuova tecnica. Le previsioni ora sono più precise di prima. Questo aiuta le persone a prepararsi meglio per il maltempo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'O tempo pode ser muito perigoso às vezes. As tempestades e os furacões destroem casas e ruas. É importante prever bem o tempo. Agora a inteligência artificial ajuda nisso. Os programas de IA podem analisar muitos dados rapidamente. Observam temperaturas, vento e nuvens. Assim podem dizer melhor quando vem uma tempestade. Os meteorologistas já usam a nova técnica. As previsões agora são mais exatas do que antes. Isso ajuda as pessoas a prepararem-se melhor para o mau tempo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'Los investigadores de huracanes recurren cada vez más a la inteligencia artificial para mejorar sus predicciones. Los nuevos modelos de IA pueden procesar enormes cantidades de datos meteorológicos en tiempo real y reconocer patrones apenas visibles para los meteorólogos humanos. En la temporada de tormentas de este año, las predicciones apoyadas por IA calcularon las trayectorias de los huracanes con mucha más precisión que los métodos tradicionales.

El Centro Nacional de Huracanes de EE. UU. informó de que la tasa media de error en la predicción de la trayectoria ha disminuido un 30 por ciento desde que se emplean sistemas de IA. Especialmente importante es la mejora en la predicción de la intensidad de una tormenta, que hasta ahora era lo más difícil de calcular.

La tecnología utiliza datos de satélites, mediciones de boyas y estaciones meteorológicas, así como datos históricos de tormentas. Mediante aprendizaje automático, el sistema reconoce relaciones entre factores como la temperatura del mar, la humedad del aire y la cizalladura del viento. Sin embargo, los expertos subrayan que la IA complementa el trabajo de los meteorólogos, pero no lo sustituye. La evaluación final y la decisión sobre las alertas siguen en manos de profesionales experimentados.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'Hurricane researchers are increasingly turning to artificial intelligence to improve their forecasts. New AI models can process vast amounts of weather data in real time and detect patterns that are barely visible to human meteorologists. During this year''s storm season, AI-assisted predictions calculated the tracks of hurricanes significantly more accurately than conventional methods.

The US National Hurricane Center reported that the average error rate in track prediction has fallen by 30 per cent since AI systems were deployed. Particularly important is the improved prediction of a storm''s intensity, which has so far been the most difficult element to calculate.

The technology uses satellite data, measurements from buoys and weather stations, and historical storm data. Through machine learning, the system identifies connections between factors such as sea temperature, humidity and wind shear. Experts emphasise, however, that AI complements the work of meteorologists but does not replace it. The final assessment and the decision on warnings continue to rest with experienced professionals.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Hurrikaanitutkijat turvautuvat yhä useammin tekoälyyn parantaakseen ennusteitaan. Uudet tekoälymallit pystyvät käsittelemään valtavia määriä säätietoja reaaliajassa ja tunnistamaan kaavoja, jotka ovat ihmismeteorologeille tuskin näkyvissä. Tämän vuoden myrskykaudella tekoälytuetut ennusteet laskivat hurrikaanien kulkureitit huomattavasti tarkemmin kuin perinteiset menetelmät.

Yhdysvaltain kansallinen hurrikaanikeskus kertoi, että kulkureitin ennusteen keskimääräinen virhemarginaali on laskenut 30 prosenttia tekoälyjärjestelmien käyttöönoton jälkeen. Erityisen tärkeää on myrskyn voimakkuuden ennustamisen parantuminen, mikä on tähän asti ollut vaikeinta laskea.

Teknologia hyödyntää satelliittitietoja, poijujen ja säähavaintoasemien mittaustietoja sekä historiallisia myrskytietoja. Koneoppimisen avulla järjestelmä tunnistaa yhteyksiä tekijöiden kuten meriveden lämpötilan, ilmankosteuden ja tuuliväänteen välillä. Asiantuntijat korostavat kuitenkin, että tekoäly täydentää meteorologien työtä, muttei korvaa sitä. Lopullinen arviointi ja varoituspäätökset ovat edelleen kokeneiden ammattilaisten käsissä.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'I ricercatori di uragani ricorrono sempre più all''intelligenza artificiale per migliorare le loro previsioni. I nuovi modelli di IA possono elaborare enormi quantità di dati meteorologici in tempo reale e individuare schemi appena visibili ai meteorologi umani. Nella stagione delle tempeste di quest''anno, le previsioni assistite dall''IA hanno calcolato le traiettorie degli uragani con una precisione nettamente superiore rispetto ai metodi tradizionali.

Il Centro nazionale uragani degli Stati Uniti ha riferito che il tasso medio di errore nella previsione della traiettoria è diminuito del 30 per cento dall''introduzione dei sistemi di IA. Particolarmente importante è il miglioramento nella previsione dell''intensità di una tempesta, finora l''elemento più difficile da calcolare.

La tecnologia utilizza dati satellitari, misurazioni da boe e stazioni meteorologiche e dati storici sulle tempeste. Grazie all''apprendimento automatico, il sistema riconosce correlazioni tra fattori come la temperatura del mare, l''umidità dell''aria e il wind shear. Gli esperti sottolineano tuttavia che l''IA integra il lavoro dei meteorologi senza sostituirlo. La valutazione finale e la decisione sulle allerte restano nelle mani dei professionisti esperti.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'Os investigadores de furacões recorrem cada vez mais à inteligência artificial para melhorar as suas previsões. Os novos modelos de IA conseguem processar enormes quantidades de dados meteorológicos em tempo real e detetar padrões dificilmente visíveis para os meteorologistas humanos. Na temporada de tempestades deste ano, as previsões apoiadas por IA calcularam as trajetórias dos furacões com uma precisão significativamente maior do que os métodos tradicionais.

O Centro Nacional de Furacões dos EUA informou que a taxa média de erro na previsão da trajetória diminuiu 30 por cento desde a implementação de sistemas de IA. Particularmente importante é a melhoria na previsão da intensidade de uma tempestade, que até agora era o elemento mais difícil de calcular.

A tecnologia utiliza dados de satélites, medições de boias e estações meteorológicas e dados históricos de tempestades. Através da aprendizagem automática, o sistema identifica relações entre fatores como a temperatura do mar, a humidade do ar e a cisalhamento do vento. No entanto, os especialistas sublinham que a IA complementa o trabalho dos meteorologistas, mas não o substitui. A avaliação final e a decisão sobre os alertas continuam nas mãos dos profissionais experientes.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'La temporada de huracanes de este año ha puesto de manifiesto un cambio tecnológico notable en la meteorología: la inteligencia artificial desempeña un papel cada vez más central en la predicción de fenómenos meteorológicos severos. Nuevos modelos de IA basados en redes neuronales procesan petabytes de datos satelitales, oceánicos y atmosféricos en tiempo real y ofrecen pronósticos que superan a los modelos numéricos tradicionales en varias categorías clave.

El Centro Nacional de Huracanes de EE. UU. informó de que la tasa media de error en la predicción de la trayectoria ha descendido un 30 por ciento desde la integración de sistemas de IA. Aún más significativo es el avance en la predicción de la intensidad, que tradicionalmente constituía la mayor debilidad del pronóstico de huracanes. Los nuevos modelos lograron reducir la tasa de error hasta un 25 por ciento al modelar interacciones sutiles entre la temperatura del mar, la cizalladura vertical del viento y la humedad atmosférica, que los enfoques convencionales captaban de forma insuficiente.

La mayor precisión de las predicciones tiene repercusiones directas en la protección civil. Las alertas más exactas permiten a las autoridades ordenar evacuaciones de manera más selectiva y distribuir los recursos con mayor eficiencia. Según estimaciones, las predicciones mejoradas con IA podrían evitar daños económicos de miles de millones solo en la temporada atlántica de huracanes.

Al mismo tiempo, los meteorólogos advierten de que no se debe sobreestimar la tecnología. Los modelos de IA son potentes, pero pueden fallar ante fenómenos meteorológicos inéditos para los que no existen datos de entrenamiento históricos. La combinación de experiencia humana y análisis automatizado sigue siendo, por tanto, imprescindible. Además, los modelos de IA deben reentrenarse continuamente con datos actualizados para dar cuenta de un sistema climático en constante evolución.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'This year''s hurricane season has brought into sharp focus a remarkable technological shift in meteorology: artificial intelligence is playing an increasingly central role in forecasting severe weather events. New AI models based on neural networks process petabytes of satellite, ocean and atmospheric data in real time, delivering forecasts that outperform conventional numerical weather models in several key categories.

The US National Hurricane Center reported that the average error rate in track prediction has fallen by 30 per cent since AI systems were integrated. Even more significant is the progress in intensity forecasting, which has traditionally been the weakest element of hurricane prediction. The new models were able to reduce the error rate by up to 25 per cent by modelling subtle interactions between sea temperature, vertical wind shear and atmospheric moisture that conventional approaches captured only inadequately.

The improved forecast accuracy has immediate implications for disaster preparedness. More precise warnings allow authorities to order evacuations in a more targeted fashion and to allocate resources more efficiently. Estimates suggest that AI-enhanced forecasts could prevent billions of dollars in economic damage in the Atlantic hurricane season alone.

At the same time, meteorologists caution against overestimating the technology. AI models are powerful but may fail when confronted with novel weather phenomena for which no historical training data exist. The combination of human expertise and machine analysis therefore remains indispensable. Moreover, the AI models must be continuously retrained with up-to-date data in order to account for the evolving climate system.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Tämän vuoden hurrikaanikausi on tuonut näkyväksi merkittävän teknologisen muutoksen meteorologiassa: tekoäly näyttelee yhä keskeisempää roolia vakavien sääilmiöiden ennustamisessa. Uudet neuroverkkoihin perustuvat tekoälymallit käsittelevät petatavuja satelliitti-, meri- ja ilmakehätietoa reaaliajassa ja tuottavat ennusteita, jotka päihittävät perinteiset numeeriset säämallit useissa avainluokissa.

Yhdysvaltain kansallinen hurrikaanlikeskus ilmoitti, että kulkureitin ennusteen keskimääräinen virhemarginaali on laskenut 30 prosenttia tekoälyjärjestelmien integroinnin jälkeen. Vielä merkittävämpää on edistys voimakkuuden ennustamisessa, joka on perinteisesti ollut hurrikaaniennusteen suurin heikkous. Uudet mallit onnistuivat vähentämään virhemarginaalia jopa 25 prosenttia mallintamalla hienovaraisia vuorovaikutuksia meriveden lämpötilan, pystysuuntaisen tuuliväänteen ja ilmakehän kosteuden välillä, joita perinteiset lähestymistavat eivät riittävästi tavoittaneet.

Ennustetarkkuuden parantumisella on välittömiä vaikutuksia katastrofivalmiuteen. Tarkemmat varoitukset mahdollistavat viranomaisten kohdennetummat evakuointimääräykset ja resurssien tehokkaamman jakamisen. Arvioiden mukaan tekoälyllä parannetut ennusteet voisivat estää miljardien eurojen taloudelliset vahingot pelkästään Atlantin hurrikaanikauden aikana.

Samalla meteorologit varoittavat teknologian yliarvioinnista. Tekoälymallit ovat tehokkaita, mutta voivat epäonnistua kohdatessaan uudenlaisia sääilmiöitä, joista ei ole historiallisia harjoitustietoja. Ihmisosaamisen ja koneanalyysin yhdistelmä pysyy siksi korvaamattomana. Lisäksi tekoälymalleja on jatkuvasti koulutettava uudelleen ajantasaisilla tiedoilla muuttuvan ilmastojärjestelmän huomioimiseksi.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'La stagione degli uragani di quest''anno ha messo in evidenza un notevole cambiamento tecnologico nella meteorologia: l''intelligenza artificiale svolge un ruolo sempre più centrale nella previsione di fenomeni meteorologici severi. Nuovi modelli di IA basati su reti neurali elaborano petabyte di dati satellitari, oceanici e atmosferici in tempo reale, fornendo previsioni che superano i modelli numerici tradizionali in diverse categorie chiave.

Il Centro nazionale uragani degli Stati Uniti ha riferito che il tasso medio di errore nella previsione della traiettoria è sceso del 30 per cento dall''integrazione dei sistemi di IA. Ancora più significativo è il progresso nella previsione dell''intensità, che tradizionalmente rappresentava il punto più debole della prognosi degli uragani. I nuovi modelli hanno ridotto il tasso di errore fino al 25 per cento modellando interazioni sottili tra temperatura del mare, wind shear verticale e umidità atmosferica, che gli approcci convenzionali coglievano solo in modo insufficiente.

La maggiore accuratezza delle previsioni ha ripercussioni immediate sulla protezione civile. Allerte più precise consentono alle autorità di ordinare evacuazioni in modo più mirato e di distribuire le risorse con maggiore efficienza. Secondo le stime, le previsioni potenziate dall''IA potrebbero prevenire danni economici per miliardi solo nella stagione atlantica degli uragani.

Allo stesso tempo, i meteorologi mettono in guardia dal sopravvalutare la tecnologia. I modelli di IA sono potenti, ma possono fallire di fronte a fenomeni meteorologici inediti per i quali non esistono dati di addestramento storici. La combinazione di competenza umana e analisi automatizzata resta pertanto indispensabile. Inoltre, i modelli di IA devono essere continuamente riaddestrati con dati aggiornati per tenere conto dell''evoluzione del sistema climatico.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'A temporada de furacões deste ano tornou visível uma mudança tecnológica notável na meteorologia: a inteligência artificial desempenha um papel cada vez mais central na previsão de fenómenos meteorológicos severos. Novos modelos de IA baseados em redes neurais processam petabytes de dados de satélites, oceânicos e atmosféricos em tempo real, produzindo previsões que superam os modelos numéricos tradicionais em várias categorias-chave.

O Centro Nacional de Furacões dos EUA informou que a taxa média de erro na previsão da trajetória diminuiu 30 por cento desde a integração de sistemas de IA. Ainda mais significativo é o progresso na previsão da intensidade, que tradicionalmente constituía o ponto mais fraco da previsão de furacões. Os novos modelos conseguiram reduzir a taxa de erro em até 25 por cento ao modelar interações subtis entre a temperatura do mar, a cisalhamento vertical do vento e a humidade atmosférica, que as abordagens convencionais captavam apenas de forma insuficiente.

A maior precisão das previsões tem repercussões imediatas na proteção civil. Alertas mais exatos permitem às autoridades ordenar evacuações de forma mais direcionada e distribuir os recursos com maior eficiência. Segundo estimativas, as previsões melhoradas com IA poderiam evitar prejuízos económicos na ordem dos milhares de milhões apenas na temporada atlântica de furacões.

Ao mesmo tempo, os meteorologistas alertam para que não se sobrevalorize a tecnologia. Os modelos de IA são poderosos, mas podem falhar perante fenómenos meteorológicos inéditos para os quais não existem dados de treino históricos. A combinação de experiência humana e análise automatizada permanece, portanto, indispensável. Além disso, os modelos de IA devem ser continuamente retreinados com dados atualizados para dar conta da evolução do sistema climático.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Vorhersage
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Vorhersage', 'vorhersage', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la predicción', 'la predicción')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'forecast')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ennuste')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la previsione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a previsão')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Hurrikan
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Hurrikan', 'hurrikan', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el huracán', 'el huracán')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'hurricane')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'hurrikaani')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''uragano')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o furacão')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Zugbahn
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zugbahn', 'zugbahn', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la trayectoria', 'la trayectoria')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'track')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kulkureitti')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la traiettoria')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a trajetória')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Fehlerquote
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Fehlerquote', 'fehlerquote', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la tasa de error', 'la tasa de error')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'error rate')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'virhemarginaali')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il tasso di errore')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a taxa de erro')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: verarbeiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verarbeiten', 'verarbeiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'procesar', 'procesar')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to process')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'käsitellä')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'elaborare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'processar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Katastrophenschutz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Katastrophenschutz', 'katastrophenschutz', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la protección civil', 'la protección civil')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'disaster preparedness')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'katastrofivalmius')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la protezione civile')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a proteção civil')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Evakuierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Evakuierung', 'evakuierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la evacuación', 'la evacuación')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'evacuation')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'evakuointi')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''evacuazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a evacuação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 9: Tausende protestieren in europäischen Städten
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Tausende protestieren in europäischen Städten',
    'proteste-in-europaeischen-staedten',
    'Soziale Proteste in Europa',
    'politica',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'Am Wochenende haben viele Menschen in Europa protestiert. In Mailand, Rom, Madrid und Lissabon gingen Tausende auf die Straße. Die Menschen sind unzufrieden. Sie wollen bessere Löhne und günstigere Wohnungen. Viele sagen, dass das Leben zu teuer ist. Essen, Mieten und Strom kosten immer mehr. Die Demonstranten trugen Schilder und riefen Parolen. Die Proteste waren größtenteils friedlich. Die Polizei war auch da. Gewerkschaften hatten zu den Demonstrationen aufgerufen. Die Politiker sollen zuhören, sagen die Demonstranten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Zehntausende Menschen haben am vergangenen Wochenende in mehreren europäischen Großstädten demonstriert. Von Mailand über Rom bis Madrid und Lissabon zogen Protestzüge durch die Innenstädte. Die Demonstranten forderten höhere Löhne, bezahlbaren Wohnraum und einen stärkeren sozialen Schutz.

Die Proteste wurden von Gewerkschaften und sozialen Bewegungen organisiert, die seit Monaten vor einer wachsenden sozialen Ungleichheit in Europa warnen. Die Lebenshaltungskosten sind in vielen EU-Ländern stark gestiegen, während die Löhne mit der Inflation nicht Schritt gehalten haben. Besonders betroffen sind junge Menschen, die sich keine eigene Wohnung leisten können.

In Madrid versammelten sich nach Angaben der Veranstalter rund fünfzigtausend Menschen auf der Puerta del Sol. In Rom blockierten Demonstranten zeitweise den Verkehr im Zentrum. In Mailand kam es zu kurzen Zusammenstößen zwischen Polizei und einer kleinen Gruppe von Demonstranten.

Die EU-Kommission reagierte auf die Proteste mit der Ankündigung, ein Maßnahmenpaket zur Bekämpfung der Wohnungskrise vorzulegen. Gewerkschaftsführer bezeichneten dies als einen ersten Schritt, betonten aber, dass konkrete Maßnahmen folgen müssten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Eine koordinierte Welle von Massenprotesten hat am vergangenen Wochenende mehrere europäische Hauptstädte erfasst und die wachsende Unzufriedenheit breiter Bevölkerungsschichten mit den sozioökonomischen Bedingungen auf dem Kontinent zum Ausdruck gebracht. Von Mailand über Rom und Madrid bis nach Lissabon und Tirana gingen Hunderttausende auf die Straße, um höhere Löhne, bezahlbaren Wohnraum und einen umfassenden Ausbau der sozialen Sicherungssysteme zu fordern.

Die von einem breiten Bündnis aus Gewerkschaften, Studierendenverbänden und zivilgesellschaftlichen Organisationen getragenen Demonstrationen markieren einen neuen Höhepunkt einer paneuropäischen Protestbewegung, die sich seit der Verschärfung der Lebenshaltungskostenkrise formiert hat. In zahlreichen EU-Mitgliedstaaten ist die reale Kaufkraft der Löhne trotz nominaler Steigerungen gesunken, während die Wohnkosten in urbanen Zentren ein historisches Niveau erreicht haben.

Besonders symbolträchtig gestaltete sich die Kundgebung in Madrid, wo nach Schätzungen der Veranstalter rund fünfzigtausend Menschen die Puerta del Sol füllten. Unter den Demonstrierenden befanden sich auffallend viele junge Erwachsene, die sich trotz akademischer Abschlüsse keine eigene Wohnung leisten können. In Rom blockierten Protestzüge zeitweise zentrale Verkehrsachsen, während es in Mailand zu vereinzelten Ausschreitungen kam, bei denen die Polizei Tränengas einsetzte.

Die EU-Kommission reagierte mit der Ankündigung eines Maßnahmenpakets gegen die Wohnungskrise, das unter anderem die Förderung des sozialen Wohnungsbaus und eine stärkere Regulierung von Kurzzeitvermietungsplattformen vorsieht. Gewerkschaftsführer bewerteten dies als überfälligen, aber unzureichenden Schritt und kündigten an, den Druck aufrechtzuerhalten, bis konkrete legislatorische Maßnahmen verabschiedet seien.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'Miles de personas protestan en ciudades europeas', 'protestas-ciudades-europeas', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'Thousands Protest Across European Cities', 'protests-european-cities', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Tuhannet osoittavat mieltään Euroopan kaupungeissa', 'mielenosoituksia-euroopan-kaupungeissa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'Migliaia protestano nelle città europee', 'proteste-citta-europee', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'Milhares protestam em cidades europeias', 'protestos-cidades-europeias', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'El fin de semana mucha gente ha protestado en Europa. En Milán, Roma, Madrid y Lisboa miles de personas salieron a la calle. La gente está descontenta. Quieren mejores salarios y viviendas más baratas. Muchos dicen que la vida es demasiado cara. La comida, los alquileres y la electricidad cuestan cada vez más. Los manifestantes llevaban pancartas y gritaban consignas. Las protestas fueron en su mayoría pacíficas. La policía también estaba presente. Los sindicatos habían convocado las manifestaciones. Los políticos deben escuchar, dicen los manifestantes.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'At the weekend many people protested in Europe. In Milan, Rome, Madrid and Lisbon thousands took to the streets. People are unhappy. They want better wages and cheaper housing. Many say that life is too expensive. Food, rents and electricity cost more and more. The protesters carried signs and shouted slogans. The protests were mostly peaceful. The police were also there. Trade unions had called for the demonstrations. Politicians must listen, the protesters say.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Viikonloppuna monet ihmiset osoittivat mieltään Euroopassa. Milanossa, Roomassa, Madridissa ja Lissabonissa tuhannet lähtivät kaduille. Ihmiset ovat tyytymättömiä. He haluavat parempia palkkoja ja halvempia asuntoja. Monet sanovat, että elämä on liian kallista. Ruoka, vuokrat ja sähkö maksavat yhä enemmän. Mielenosoittajat kantoivat kylttejä ja huusivat iskulauseita. Mielenosoitukset olivat pääosin rauhallisia. Poliisi oli myös paikalla. Ammattiliitot olivat kehottaneet mielenosoituksiin. Poliitikkojen pitää kuunnella, mielenosoittajat sanovat.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'Nel fine settimana molte persone hanno protestato in Europa. A Milano, Roma, Madrid e Lisbona migliaia di persone sono scese in strada. La gente è insoddisfatta. Vuole salari migliori e alloggi più economici. Molti dicono che la vita è troppo cara. Il cibo, gli affitti e l''elettricità costano sempre di più. I manifestanti portavano cartelli e gridavano slogan. Le proteste sono state per lo più pacifiche. C''era anche la polizia. I sindacati avevano indetto le manifestazioni. I politici devono ascoltare, dicono i manifestanti.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'No fim de semana muitas pessoas protestaram na Europa. Em Milão, Roma, Madrid e Lisboa milhares saíram às ruas. As pessoas estão insatisfeitas. Querem melhores salários e habitações mais baratas. Muitos dizem que a vida é demasiado cara. A comida, as rendas e a eletricidade custam cada vez mais. Os manifestantes levavam cartazes e gritavam palavras de ordem. Os protestos foram na sua maioria pacíficos. A polícia também estava presente. Os sindicatos tinham convocado as manifestações. Os políticos devem ouvir, dizem os manifestantes.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'Decenas de miles de personas se manifestaron el pasado fin de semana en varias grandes ciudades europeas. Desde Milán hasta Roma, Madrid y Lisboa, los cortejos de protesta recorrieron los centros urbanos. Los manifestantes exigían salarios más altos, vivienda asequible y una mayor protección social.

Las protestas fueron organizadas por sindicatos y movimientos sociales que llevan meses advirtiendo sobre una creciente desigualdad social en Europa. El coste de la vida ha subido considerablemente en muchos países de la UE, mientras los salarios no han seguido el ritmo de la inflación. Los jóvenes se ven especialmente afectados, ya que no pueden permitirse una vivienda propia.

En Madrid, según los organizadores, unas cincuenta mil personas se congregaron en la Puerta del Sol. En Roma, los manifestantes bloquearon temporalmente el tráfico en el centro. En Milán se produjeron breves enfrentamientos entre la policía y un pequeño grupo de manifestantes.

La Comisión Europea reaccionó a las protestas anunciando la presentación de un paquete de medidas para combatir la crisis de la vivienda. Los líderes sindicales calificaron esto como un primer paso, pero subrayaron que deben seguir medidas concretas.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'Tens of thousands of people demonstrated in several major European cities last weekend. From Milan to Rome, Madrid and Lisbon, protest marches wound through city centres. The demonstrators demanded higher wages, affordable housing and stronger social protection.

The protests were organised by trade unions and social movements that have been warning for months about growing social inequality in Europe. The cost of living has risen sharply in many EU countries, while wages have not kept pace with inflation. Young people are particularly affected, as they cannot afford their own homes.

In Madrid, around fifty thousand people gathered at the Puerta del Sol according to organisers. In Rome, protesters temporarily blocked traffic in the centre. In Milan, brief clashes occurred between police and a small group of demonstrators.

The European Commission responded to the protests by announcing a package of measures to tackle the housing crisis. Union leaders described this as a first step but stressed that concrete action must follow.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Kymmenettuhannet ihmiset osoittivat mieltään useissa Euroopan suurkaupungeissa viime viikonloppuna. Milanosta Rooman, Madridin ja Lissabonin kautta mielenosoituskulkueet etenivät kaupunkien keskustoissa. Mielenosoittajat vaativat korkeampia palkkoja, kohtuuhintaista asumista ja vahvempaa sosiaaliturvaa.

Mielenosoitukset järjestivät ammattiliitot ja sosiaaliset liikkeet, jotka ovat kuukausia varoittaneet kasvavasta sosiaalisesta eriarvoisuudesta Euroopassa. Elinkustannukset ovat nousseet jyrkästi monissa EU-maissa, kun taas palkat eivät ole pysyneet inflaation tahdissa. Erityisesti nuoret kärsivät, sillä he eivät pysty hankkimaan omaa asuntoa.

Madridissa järjestäjien mukaan noin viisikymmentätuhatta ihmistä kokoontui Puerta del Solille. Roomassa mielenosoittajat tukkivat hetkellisesti keskustan liikenteen. Milanossa syntyi lyhyitä yhteenottoja poliisin ja pienen mielenosoittajaryhmän välillä.

Euroopan komissio reagoi mielenosoituksiin ilmoittamalla toimenpidepaketista asuntokriisin torjumiseksi. Ammattiliittojen johtajat pitivät tätä ensimmäisenä askeleena, mutta korostivat, että konkreettisten toimien on seurattava.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'Decine di migliaia di persone hanno manifestato lo scorso fine settimana in diverse grandi città europee. Da Milano a Roma, Madrid e Lisbona, i cortei di protesta hanno attraversato i centri urbani. I manifestanti chiedevano salari più alti, alloggi accessibili e una protezione sociale più forte.

Le proteste sono state organizzate da sindacati e movimenti sociali che da mesi mettono in guardia sulla crescente disuguaglianza sociale in Europa. Il costo della vita è aumentato notevolmente in molti Paesi dell''UE, mentre i salari non hanno tenuto il passo con l''inflazione. I giovani sono particolarmente colpiti, poiché non possono permettersi un''abitazione propria.

A Madrid, secondo gli organizzatori, circa cinquantamila persone si sono riunite alla Puerta del Sol. A Roma, i manifestanti hanno bloccato temporaneamente il traffico in centro. A Milano si sono verificati brevi scontri tra la polizia e un piccolo gruppo di manifestanti.

La Commissione europea ha reagito alle proteste annunciando la presentazione di un pacchetto di misure per affrontare la crisi abitativa. I leader sindacali lo hanno definito un primo passo, ma hanno sottolineato che devono seguire azioni concrete.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'Dezenas de milhares de pessoas manifestaram-se no fim de semana passado em várias grandes cidades europeias. De Milão a Roma, Madrid e Lisboa, os cortejos de protesto percorreram os centros das cidades. Os manifestantes exigiam salários mais altos, habitação acessível e maior proteção social.

Os protestos foram organizados por sindicatos e movimentos sociais que há meses alertam para a crescente desigualdade social na Europa. O custo de vida subiu acentuadamente em muitos países da UE, enquanto os salários não acompanharam a inflação. Os jovens são particularmente afetados, pois não conseguem pagar uma habitação própria.

Em Madrid, segundo os organizadores, cerca de cinquenta mil pessoas reuniram-se na Puerta del Sol. Em Roma, os manifestantes bloquearam temporariamente o trânsito no centro. Em Milão, houve breves confrontos entre a polícia e um pequeno grupo de manifestantes.

A Comissão Europeia reagiu aos protestos anunciando a apresentação de um pacote de medidas para combater a crise habitacional. Os líderes sindicais classificaram isto como um primeiro passo, mas sublinharam que medidas concretas devem seguir-se.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'Una oleada coordinada de protestas masivas sacudió el pasado fin de semana varias capitales europeas, expresando el creciente descontento de amplias capas de la población con las condiciones socioeconómicas del continente. Desde Milán, pasando por Roma y Madrid, hasta Lisboa y Tirana, cientos de miles de personas salieron a las calles para exigir mejores salarios, vivienda asequible y una ampliación integral de los sistemas de protección social.

Las manifestaciones, respaldadas por una amplia coalición de sindicatos, asociaciones estudiantiles y organizaciones de la sociedad civil, marcan un nuevo punto álgido de un movimiento de protesta paneuropeo que se ha gestado desde el agravamiento de la crisis del coste de la vida. En numerosos Estados miembros de la UE, el poder adquisitivo real de los salarios ha disminuido pese a los aumentos nominales, mientras los costes de la vivienda en los centros urbanos han alcanzado niveles históricos.

Especialmente simbólica fue la concentración en Madrid, donde, según estimaciones de los organizadores, unas cincuenta mil personas llenaron la Puerta del Sol. Entre los manifestantes destacaba la presencia de numerosos jóvenes adultos que, a pesar de contar con títulos universitarios, no pueden permitirse una vivienda propia. En Roma, los cortejos bloquearon temporalmente las arterias centrales del tráfico, mientras que en Milán se produjeron disturbios aislados en los que la policía empleó gas lacrimógeno.

La Comisión Europea reaccionó con el anuncio de un paquete de medidas contra la crisis de la vivienda que contempla, entre otras cosas, el fomento de la vivienda social y una regulación más estricta de las plataformas de alquiler vacacional. Los líderes sindicales calificaron la medida de tardía pero insuficiente y anunciaron que mantendrán la presión hasta que se aprueben medidas legislativas concretas.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'A coordinated wave of mass protests swept through several European capitals last weekend, giving voice to the growing discontent of broad segments of the population with the socioeconomic conditions on the continent. From Milan to Rome and Madrid, and on to Lisbon and Tirana, hundreds of thousands took to the streets to demand higher wages, affordable housing and a comprehensive expansion of social safety nets.

The demonstrations, backed by a broad coalition of trade unions, student associations and civil-society organisations, mark a new high point in a pan-European protest movement that has been taking shape since the worsening of the cost-of-living crisis. In numerous EU member states, real purchasing power has declined despite nominal wage rises, while housing costs in urban centres have reached historic levels.

Particularly symbolic was the rally in Madrid, where an estimated fifty thousand people filled the Puerta del Sol according to organisers. Notably present among the demonstrators were large numbers of young adults who, despite holding university degrees, cannot afford their own homes. In Rome, protest marches temporarily blocked central traffic arteries, while in Milan isolated disturbances occurred in which police deployed tear gas.

The European Commission responded by announcing a package of measures to address the housing crisis, including the promotion of social housing and tighter regulation of short-term rental platforms. Union leaders called the move overdue but inadequate and announced they would maintain pressure until concrete legislative measures are adopted.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Koordinoitu joukkomielenosoitusten aalto pyyhkäisi viime viikonloppuna useiden Euroopan pääkaupunkien läpi ilmaisten laajojen väestöryhmien kasvavaa tyytymättömyyttä mantereen sosioekonomisiin oloihin. Milanosta Rooman ja Madridin kautta Lissaboniin ja Tiranaan sadat tuhannet nousivat kaduille vaatiakseen korkeampia palkkoja, kohtuuhintaista asumista ja sosiaaliturvajärjestelmien kattavaa laajentamista.

Ammattiliittojen, opiskelijajärjestöjen ja kansalaisyhteiskunnan organisaatioiden laajan koalition tukemina mielenosoitukset merkitsevät uutta huippupistettä yleiseurooppalaisessa protestiliikkeessä, joka on muotoutunut elinkustannuskriisin pahentumisen myötä. Lukuisissa EU:n jäsenvaltioissa palkkojen todellinen ostovoima on laskenut nimellistä kasvusta huolimatta, kun taas asumiskustannukset kaupunkikeskuksissa ovat saavuttaneet historiallisen tason.

Erityisen symbolinen oli Madrid-mielenosoitus, jossa järjestäjien arvion mukaan noin viisikymmentätuhatta ihmistä täytti Puerta del Solin. Mielenosoittajien joukossa oli huomattavan paljon nuoria aikuisia, joilla yliopistotutkinnoista huolimatta ei ole varaa omaan asuntoon. Roomassa mielenosoituskulkueet tukkivat hetkellisesti keskustan pääväyliä, ja Milanossa syntyi yksittäisiä levottomuuksia, joissa poliisi käytti kyynelkaasua.

Euroopan komissio reagoi ilmoittamalla toimenpidepaketista asuntokriisin torjumiseksi, johon sisältyy muun muassa sosiaalisen asuntorakentamisen edistäminen ja lyhytaikaisten vuokrauspalvelujen tiukempi sääntely. Ammattiliittojen johtajat pitivät toimenpidettä myöhässä tulleena mutta riittämättömänä ja ilmoittivat ylläpitävänsä painetta, kunnes konkreettiset lainsäädäntötoimet on hyväksytty.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Un''ondata coordinata di proteste di massa ha attraversato diverse capitali europee lo scorso fine settimana, dando voce al crescente malcontento di ampi strati della popolazione per le condizioni socioeconomiche del continente. Da Milano a Roma, Madrid, Lisbona e Tirana, centinaia di migliaia di persone sono scese in piazza per chiedere salari più alti, alloggi accessibili e un ampliamento complessivo dei sistemi di protezione sociale.

Le manifestazioni, sostenute da un''ampia coalizione di sindacati, associazioni studentesche e organizzazioni della società civile, segnano un nuovo picco di un movimento di protesta paneuropeo che si è formato dopo l''aggravarsi della crisi del costo della vita. In numerosi Stati membri dell''UE il potere d''acquisto reale dei salari è diminuito nonostante gli aumenti nominali, mentre i costi abitativi nei centri urbani hanno raggiunto livelli storici.

Particolarmente simbolica la manifestazione di Madrid, dove secondo le stime degli organizzatori circa cinquantamila persone hanno riempito la Puerta del Sol. Tra i manifestanti spiccava la presenza di numerosi giovani adulti che, pur avendo titoli universitari, non possono permettersi un''abitazione propria. A Roma, i cortei hanno bloccato temporaneamente le arterie centrali del traffico, mentre a Milano si sono verificati disordini isolati durante i quali la polizia ha impiegato gas lacrimogeni.

La Commissione europea ha reagito annunciando un pacchetto di misure contro la crisi abitativa che prevede, tra l''altro, la promozione dell''edilizia residenziale pubblica e una regolamentazione più severa delle piattaforme di affitto a breve termine. I leader sindacali hanno giudicato la misura tardiva ma insufficiente e hanno annunciato che manterranno la pressione fino all''approvazione di provvedimenti legislativi concreti.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'Uma vaga coordenada de protestos em massa varreu várias capitais europeias no fim de semana passado, dando expressão ao crescente descontentamento de amplas camadas da população com as condições socioeconómicas do continente. De Milão a Roma, Madrid, Lisboa e Tirana, centenas de milhares de pessoas saíram às ruas para exigir salários mais altos, habitação acessível e uma expansão abrangente dos sistemas de proteção social.

As manifestações, apoiadas por uma ampla coligação de sindicatos, associações estudantis e organizações da sociedade civil, marcam um novo ponto alto de um movimento de protesto pan-europeu que se formou desde o agravamento da crise do custo de vida. Em numerosos Estados-membros da UE, o poder de compra real dos salários diminuiu apesar dos aumentos nominais, enquanto os custos de habitação nos centros urbanos atingiram níveis históricos.

Especialmente simbólica foi a concentração em Madrid, onde, segundo estimativas dos organizadores, cerca de cinquenta mil pessoas encheram a Puerta del Sol. Entre os manifestantes destacava-se a presença de numerosos jovens adultos que, apesar de possuírem diplomas universitários, não conseguem pagar uma habitação própria. Em Roma, os cortejos bloquearam temporariamente as artérias centrais do trânsito, enquanto em Milão ocorreram distúrbios isolados nos quais a polícia usou gás lacrimogéneo.

A Comissão Europeia reagiu com o anúncio de um pacote de medidas contra a crise habitacional que prevê, entre outras coisas, a promoção da habitação social e uma regulamentação mais rigorosa das plataformas de aluguer de curta duração. Os líderes sindicais classificaram a medida como tardia mas insuficiente e anunciaram que manterão a pressão até que medidas legislativas concretas sejam aprovadas.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Demonstration
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Demonstration', 'demonstration', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la manifestación', 'la manifestación')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'demonstration')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'mielenosoitus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la manifestazione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a manifestação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Gewerkschaft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Gewerkschaft', 'gewerkschaft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el sindicato', 'el sindicato')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'trade union')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ammattiliitto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il sindacato')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o sindicato')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Wohnraum
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Wohnraum', 'wohnraum', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la vivienda', 'la vivienda')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'housing')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'asunto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''alloggio')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a habitação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Ungleichheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Ungleichheit', 'ungleichheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la desigualdad', 'la desigualdad')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'inequality')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'eriarvoisuus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la disuguaglianza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a desigualdade')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: fordern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('fordern', 'fordern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'exigir', 'exigir')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to demand')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'vaatia')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'esigere')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'exigir')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Lebenshaltungskosten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Lebenshaltungskosten', 'lebenshaltungskosten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el coste de vida', 'el coste de vida')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'cost of living')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'elinkustannukset')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il costo della vita')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o custo de vida')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Kaufkraft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Kaufkraft', 'kaufkraft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el poder adquisitivo', 'el poder adquisitivo')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'purchasing power')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'ostovoima')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il potere d''acquisto')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o poder de compra')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 10: Digitale Bildung verändert Europas Schulen
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint;
  v_version_a2_id bigint;
  v_version_b1_id bigint;
  v_version_b2_id bigint;
  v_lemma_id bigint;
  v_meaning_id bigint;
BEGIN

  -- Insert text
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Digitale Bildung verändert Europas Schulen',
    'digitale-bildung-europas-schulen',
    'Digitale Bildung und Technologie in Schulen',
    'educacion',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, topic = EXCLUDED.topic, categoria = EXCLUDED.categoria
  RETURNING id INTO v_text_id;

  -- Insert versions (A2, B1, B2)
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'Schulen in Europa verändern sich. Schüler lernen jetzt oft mit Tablets und Computern. In vielen Klassenzimmern gibt es digitale Tafeln. Lehrer benutzen auch neue Programme. Manche Schulen haben KI-Tutoren. Ein KI-Tutor ist ein Computerprogramm, das den Schülern hilft. Es erklärt Mathe oder Grammatik. Jeder Schüler kann in seinem eigenen Tempo lernen. Aber nicht alle finden das gut. Manche Eltern machen sich Sorgen, dass Kinder zu viel Zeit am Bildschirm verbringen. Andere sagen, digitale Bildung ist die Zukunft.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Die Digitalisierung verändert den Schulalltag in ganz Europa grundlegend. Immer mehr Schulen setzen auf Tablets, interaktive Whiteboards und KI-gestützte Lernprogramme. In einem aktuellen Bericht der EU-Bildungskommission wird festgestellt, dass inzwischen über 60 Prozent der europäischen Schulen digitale Lernwerkzeuge regelmäßig im Unterricht einsetzen.

Besonders vielversprechend sind KI-Tutoren, die den Lernfortschritt jedes Schülers individuell analysieren und den Unterrichtsinhalt entsprechend anpassen. In Finnland, das als Vorreiter der digitalen Bildung gilt, werden solche Systeme bereits flächendeckend eingesetzt. Die Ergebnisse sind ermutigend: Schüler, die mit KI-Unterstützung lernen, zeigen im Durchschnitt bessere Leistungen in Mathematik und Sprachfächern.

Doch die Entwicklung ist nicht unumstritten. Lehrerverbände in mehreren Ländern warnen davor, dass Technologie den persönlichen Kontakt zwischen Lehrern und Schülern nicht ersetzen kann. Außerdem gibt es Bedenken hinsichtlich des Datenschutzes, da die Lernplattformen umfangreiche Daten über das Verhalten der Kinder sammeln.

Ein weiteres Problem ist die digitale Kluft: Während Schulen in wohlhabenden Regionen moderne Ausstattung besitzen, fehlt es in ärmeren Gebieten oft an grundlegender Infrastruktur. Die EU hat deshalb ein Förderprogramm aufgelegt, das benachteiligten Schulen den Zugang zu digitaler Technik ermöglichen soll.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Die europäische Bildungslandschaft durchlebt einen tiefgreifenden digitalen Wandel, der sowohl weitreichende Chancen als auch erhebliche Risiken birgt. Laut dem jüngsten Bericht der EU-Bildungskommission setzen mittlerweile über 60 Prozent der Schulen in der Europäischen Union regelmäßig digitale Lernwerkzeuge ein — ein Anstieg um 20 Prozentpunkte im Vergleich zu vor drei Jahren.

Im Zentrum dieser Transformation stehen KI-gestützte Tutorensysteme, die den individuellen Lernfortschritt jedes Schülers in Echtzeit analysieren und den Unterrichtsinhalt dynamisch anpassen. Finnland, das seit langem als Vorreiter innovativer Pädagogik gilt, hat diese Technologie flächendeckend eingeführt und berichtet von einer messbaren Verbesserung der Leistungen in mathematischen und sprachlichen Kernkompetenzen. Die Systeme identifizieren Wissenslücken, bevor sie sich verfestigen, und bieten gezielte Übungen an, die auf den jeweiligen Lerntyp zugeschnitten sind.

Die Euphorie wird jedoch von einer wachsenden Skepsis begleitet. Pädagogische Fachverbände in Deutschland, Frankreich und Italien haben gemeinsam ein Positionspapier veröffentlicht, in dem sie vor einer Überdigitalisierung des Unterrichts warnen. Die sozioemotionale Entwicklung von Kindern, so die Verfasser, erfordere menschliche Interaktion, die kein Algorithmus ersetzen könne. Darüber hinaus werfen die Lernplattformen schwerwiegende datenschutzrechtliche Fragen auf: Die Systeme erfassen detaillierte Verhaltensmuster der Kinder, deren langfristige Speicherung und Nutzung unzureichend reguliert seien.

Ein weiteres strukturelles Problem stellt die digitale Kluft dar. Während Schulen in wirtschaftlich starken Regionen über modernste Ausstattung verfügen, fehlt es in benachteiligten Gebieten häufig an grundlegender digitaler Infrastruktur. Um diesem Gefälle entgegenzuwirken, hat die EU ein mit zwei Milliarden Euro dotiertes Förderprogramm aufgelegt, das bis 2028 allen Schulen einen gleichwertigen Zugang zu digitaler Bildungstechnologie gewährleisten soll. Kritiker bezweifeln jedoch, dass die Mittel ausreichen, um die tieferliegenden Ursachen der Bildungsungleichheit zu beseitigen.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'es', 'La educación digital transforma las escuelas de Europa', 'educacion-digital-escuelas-europa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'en', 'Digital Education Transforms Europe''s Schools', 'digital-education-europes-schools', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'fi', 'Digitaalinen koulutus muuttaa Euroopan kouluja', 'digitaalinen-koulutus-euroopan-koulut', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'it', 'L''istruzione digitale trasforma le scuole europee', 'istruzione-digitale-scuole-europee', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES (v_text_id, 'pt', 'A educação digital transforma as escolas da Europa', 'educacao-digital-escolas-europa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'es', 'Las escuelas en Europa están cambiando. Los alumnos ahora aprenden a menudo con tabletas y ordenadores. En muchas aulas hay pizarras digitales. Los profesores también usan programas nuevos. Algunas escuelas tienen tutores de IA. Un tutor de IA es un programa informático que ayuda a los alumnos. Explica matemáticas o gramática. Cada alumno puede aprender a su propio ritmo. Pero no todos lo ven bien. Algunos padres se preocupan de que los niños pasen demasiado tiempo ante la pantalla. Otros dicen que la educación digital es el futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'en', 'Schools in Europe are changing. Students now often learn with tablets and computers. In many classrooms there are digital boards. Teachers also use new programs. Some schools have AI tutors. An AI tutor is a computer program that helps students. It explains maths or grammar. Every student can learn at their own pace. But not everyone thinks this is good. Some parents worry that children spend too much time in front of screens. Others say digital education is the future.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'fi', 'Koulut Euroopassa muuttuvat. Oppilaat opiskelevat nyt usein tableteilla ja tietokoneilla. Monissa luokkahuoneissa on digitaalisia tauluja. Opettajat käyttävät myös uusia ohjelmia. Joissakin kouluissa on tekoälytutoreita. Tekoälytuutori on tietokoneohjelma, joka auttaa oppilaita. Se selittää matematiikkaa tai kielioppia. Jokainen oppilas voi oppia omaan tahtiinsa. Mutta kaikki eivät pidä siitä. Jotkut vanhemmat ovat huolissaan, että lapset viettävät liikaa aikaa näytön edessä. Toiset sanovat, että digitaalinen koulutus on tulevaisuutta.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'it', 'Le scuole in Europa stanno cambiando. Gli studenti ora imparano spesso con tablet e computer. In molte aule ci sono lavagne digitali. Anche gli insegnanti usano programmi nuovi. Alcune scuole hanno tutor di IA. Un tutor di IA è un programma informatico che aiuta gli studenti. Spiega matematica o grammatica. Ogni studente può imparare al proprio ritmo. Ma non tutti la vedono positivamente. Alcuni genitori si preoccupano che i bambini passino troppo tempo davanti allo schermo. Altri dicono che l''istruzione digitale è il futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_a2_id, 'pt', 'As escolas na Europa estão a mudar. Os alunos agora aprendem frequentemente com tablets e computadores. Em muitas salas de aula há quadros digitais. Os professores também usam programas novos. Algumas escolas têm tutores de IA. Um tutor de IA é um programa informático que ajuda os alunos. Explica matemática ou gramática. Cada aluno pode aprender ao seu próprio ritmo. Mas nem todos acham isso bom. Alguns pais preocupam-se com o facto de as crianças passarem demasiado tempo diante do ecrã. Outros dizem que a educação digital é o futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'es', 'La digitalización está transformando la vida escolar en toda Europa de manera fundamental. Cada vez más colegios apuestan por tabletas, pizarras interactivas y programas de aprendizaje basados en IA. Un informe reciente de la Comisión de Educación de la UE señala que más del 60 por ciento de los colegios europeos utilizan herramientas de aprendizaje digital de forma habitual en las clases.

Especialmente prometedores son los tutores de IA, que analizan el progreso de cada alumno de forma individual y adaptan el contenido educativo en consecuencia. En Finlandia, considerado un pionero de la educación digital, estos sistemas ya se emplean de forma generalizada. Los resultados son alentadores: los alumnos que aprenden con apoyo de IA muestran en promedio mejores resultados en matemáticas y lenguas.

Pero la evolución no está exenta de polémica. Asociaciones de profesores de varios países advierten de que la tecnología no puede sustituir el contacto personal entre profesores y alumnos. Además, existen preocupaciones respecto a la protección de datos, ya que las plataformas recopilan abundante información sobre el comportamiento de los niños.

Otro problema es la brecha digital: mientras los colegios de regiones prósperas disponen de equipamiento moderno, en zonas más desfavorecidas a menudo falta la infraestructura básica. La UE ha puesto en marcha un programa de ayudas que pretende facilitar el acceso a la tecnología digital a los colegios menos favorecidos.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'en', 'Digitalisation is fundamentally changing everyday school life across Europe. More and more schools are adopting tablets, interactive whiteboards and AI-powered learning programmes. A recent report by the EU Education Commission found that over 60 per cent of European schools now regularly use digital learning tools in their lessons.

Particularly promising are AI tutors, which analyse each student''s learning progress individually and adapt the lesson content accordingly. In Finland, regarded as a pioneer of digital education, such systems are already deployed nationwide. The results are encouraging: students who learn with AI support show better average performance in mathematics and language subjects.

However, the trend is not without controversy. Teachers'' associations in several countries warn that technology cannot replace the personal contact between teachers and students. There are also concerns about data protection, as the learning platforms collect extensive data about children''s behaviour.

Another problem is the digital divide: while schools in wealthy regions have modern equipment, schools in poorer areas often lack basic infrastructure. The EU has therefore launched a funding programme aimed at giving disadvantaged schools access to digital technology.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'fi', 'Digitalisaatio muuttaa koulun arkea kaikkialla Euroopassa perustavanlaatuisesti. Yhä useammat koulut ottavat käyttöön tabletteja, interaktiivisia tauluja ja tekoälypohjaisia oppimisohjelmia. EU:n koulutuskomission tuoreessa raportissa todetaan, että yli 60 prosenttia eurooppalaisista kouluista käyttää digitaalisia oppimisvälineitä säännöllisesti opetuksessa.

Erityisen lupaavia ovat tekoälytutorit, jotka analysoivat jokaisen oppilaan oppimisedistymistä yksilöllisesti ja mukauttavat opetussisältöä sen mukaisesti. Suomessa, jota pidetään digitaalisen koulutuksen edelläkävijänä, tällaisia järjestelmiä käytetään jo laajasti. Tulokset ovat rohkaisevia: tekoälyn tuella opiskelevat oppilaat saavuttavat keskimäärin parempia tuloksia matematiikassa ja kieliaineissa.

Kehitys ei kuitenkaan ole kiistaton. Opettajajärjestöt useissa maissa varoittavat, ettei teknologia voi korvata henkilökohtaista vuorovaikutusta opettajien ja oppilaiden välillä. Lisäksi tietosuojaan liittyy huolia, sillä oppimisalustat keräävät laajasti tietoja lasten käyttäytymisestä.

Toinen ongelma on digitaalinen kuilu: kun vauraiden alueiden kouluilla on moderni varustelu, köyhemmillä alueilla puuttuu usein perusinfrastruktuuri. EU on siksi käynnistänyt tukiohjelman, jonka tarkoituksena on tarjota heikommassa asemassa oleville kouluille pääsy digitaaliseen teknologiaan.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'it', 'La digitalizzazione sta cambiando radicalmente la vita scolastica in tutta Europa. Sempre più scuole adottano tablet, lavagne interattive e programmi di apprendimento basati sull''IA. Un recente rapporto della Commissione europea per l''istruzione rileva che oltre il 60 per cento delle scuole europee utilizza regolarmente strumenti di apprendimento digitale nelle lezioni.

Particolarmente promettenti sono i tutor di IA, che analizzano i progressi di ogni studente individualmente e adattano di conseguenza i contenuti didattici. In Finlandia, considerata un pioniere dell''istruzione digitale, questi sistemi sono già utilizzati su larga scala. I risultati sono incoraggianti: gli studenti che apprendono con il supporto dell''IA mostrano in media risultati migliori in matematica e nelle materie linguistiche.

Tuttavia, lo sviluppo non è privo di controversie. Le associazioni degli insegnanti di diversi Paesi avvertono che la tecnologia non può sostituire il contatto personale tra docenti e studenti. Vi sono inoltre preoccupazioni riguardo alla protezione dei dati, poiché le piattaforme di apprendimento raccolgono ampi dati sul comportamento dei bambini.

Un altro problema è il divario digitale: mentre le scuole nelle regioni prospere dispongono di attrezzature moderne, nelle aree più povere manca spesso l''infrastruttura di base. L''UE ha pertanto lanciato un programma di finanziamento volto a consentire alle scuole svantaggiate l''accesso alla tecnologia digitale.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b1_id, 'pt', 'A digitalização está a transformar fundamentalmente o dia a dia escolar em toda a Europa. Cada vez mais escolas adotam tablets, quadros interativos e programas de aprendizagem baseados em IA. Um relatório recente da Comissão de Educação da UE constatou que mais de 60 por cento das escolas europeias utilizam regularmente ferramentas de aprendizagem digital nas suas aulas.

Especialmente promissores são os tutores de IA, que analisam o progresso de cada aluno individualmente e adaptam o conteúdo educativo em conformidade. Na Finlândia, considerada pioneira da educação digital, estes sistemas já são utilizados de forma generalizada. Os resultados são encorajadores: os alunos que aprendem com apoio de IA apresentam, em média, melhores resultados em matemática e nas disciplinas de línguas.

No entanto, a evolução não é isenta de polémica. Associações de professores de vários países alertam que a tecnologia não pode substituir o contacto pessoal entre professores e alunos. Existem também preocupações quanto à proteção de dados, uma vez que as plataformas de aprendizagem recolhem dados extensos sobre o comportamento das crianças.

Outro problema é a exclusão digital: enquanto as escolas em regiões prósperas dispõem de equipamento moderno, nas áreas mais pobres falta frequentemente a infraestrutura básica. A UE lançou por isso um programa de financiamento destinado a proporcionar às escolas desfavorecidas o acesso à tecnologia digital.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'es', 'El panorama educativo europeo atraviesa una profunda transformación digital que entraña tanto amplias oportunidades como riesgos considerables. Según el último informe de la Comisión de Educación de la UE, más del 60 por ciento de las escuelas de la Unión Europea utilizan ya de forma habitual herramientas de aprendizaje digital, un aumento de 20 puntos porcentuales en comparación con hace tres años.

En el centro de esta transformación se encuentran los sistemas de tutoría basados en IA, que analizan en tiempo real el progreso individual de cada alumno y adaptan dinámicamente el contenido educativo. Finlandia, considerada desde hace tiempo un referente de la pedagogía innovadora, ha implantado esta tecnología de forma generalizada y reporta una mejora mensurable del rendimiento en competencias básicas de matemáticas y lengua. Los sistemas identifican lagunas de conocimiento antes de que se consoliden y ofrecen ejercicios específicos adaptados al perfil de aprendizaje de cada alumno.

Sin embargo, el entusiasmo viene acompañado de un escepticismo creciente. Asociaciones pedagógicas de Alemania, Francia e Italia han publicado conjuntamente un documento de posición en el que advierten de una sobredigitalización de la enseñanza. El desarrollo socioemocional de los niños, argumentan, requiere interacción humana que ningún algoritmo puede sustituir. Además, las plataformas de aprendizaje plantean serias cuestiones de protección de datos: los sistemas recopilan patrones de comportamiento detallados de los niños cuyo almacenamiento y uso a largo plazo están insuficientemente regulados.

Otro problema estructural es la brecha digital. Mientras que los colegios en regiones económicamente fuertes disponen de equipamiento de última generación, en las zonas desfavorecidas falta a menudo la infraestructura digital básica. Para contrarrestar esta desigualdad, la UE ha puesto en marcha un programa dotado con dos mil millones de euros que aspira a garantizar a todas las escuelas un acceso equitativo a la tecnología educativa digital para 2028. Los críticos dudan, sin embargo, de que los fondos sean suficientes para eliminar las causas profundas de la desigualdad educativa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'en', 'The European education landscape is undergoing a profound digital transformation that holds both far-reaching opportunities and considerable risks. According to the latest report from the EU Education Commission, over 60 per cent of schools in the European Union now regularly use digital learning tools — a rise of 20 percentage points compared with three years ago.

At the heart of this transformation are AI-powered tutoring systems that analyse each student''s individual learning progress in real time and dynamically adjust lesson content. Finland, long regarded as a pioneer of innovative pedagogy, has rolled out the technology nationwide and reports a measurable improvement in performance in core mathematical and linguistic competencies. The systems identify knowledge gaps before they become entrenched and offer targeted exercises tailored to each learner''s profile.

The enthusiasm, however, is accompanied by growing scepticism. Professional education associations in Germany, France and Italy have jointly published a position paper warning against an over-digitalisation of teaching. Children''s socioemotional development, the authors argue, requires human interaction that no algorithm can replace. Moreover, the learning platforms raise serious data-protection questions: the systems capture detailed behavioural patterns of children whose long-term storage and use are inadequately regulated.

A further structural problem is the digital divide. While schools in economically strong regions boast state-of-the-art equipment, schools in disadvantaged areas often lack basic digital infrastructure. To counter this imbalance, the EU has launched a two-billion-euro funding programme that aims to ensure all schools have equal access to digital education technology by 2028. Critics doubt, however, that the funds will be sufficient to address the deeper causes of educational inequality.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'fi', 'Eurooppalainen koulutuskenttä käy läpi syvällistä digitaalista murrosta, joka tarjoaa sekä laajoja mahdollisuuksia että merkittäviä riskejä. EU:n koulutuskomission tuoreimman raportin mukaan yli 60 prosenttia Euroopan unionin kouluista käyttää nykyisin säännöllisesti digitaalisia oppimisvälineitä — kasvu on 20 prosenttiyksikköä kolmen vuoden takaiseen verrattuna.

Muutoksen ytimessä ovat tekoälypohjaiset tutorointijärjestelmät, jotka analysoivat jokaisen oppilaan yksilöllistä oppimisedistymistä reaaliajassa ja mukauttavat opetussisältöä dynaamisesti. Suomi, jota on pitkään pidetty innovatiivisen pedagogiikan edelläkävijänä, on ottanut teknologian käyttöön valtakunnallisesti ja raportoi mitattavasta parannuksesta matemaattisten ja kielellisten ydintaitojen suoritustasossa. Järjestelmät tunnistavat tietoaukkoja ennen kuin ne vakiintuvat ja tarjoavat kohdennettuja harjoituksia kunkin oppijan profiiliin räätälöityinä.

Innostusta seuraa kuitenkin kasvava epäilys. Kasvatusalan järjestöt Saksassa, Ranskassa ja Italiassa ovat julkaisseet yhteisen kannanottopaperin, jossa varoitetaan opetuksen liiallisesta digitalisoinnista. Lasten sosioemotionaalinen kehitys, kirjoittajat perustelevat, edellyttää inhimillistä vuorovaikutusta, jota mikään algoritmi ei voi korvata. Lisäksi oppimisalustat herättävät vakavia tietosuojakysymyksiä: järjestelmät keräävät yksityiskohtaisia käyttäytymismalleja lapsista, joiden pitkäaikainen tallentaminen ja käyttö on riittämättömästi säännelty.

Toinen rakenteellinen ongelma on digitaalinen kuilu. Kun taloudellisesti vahvojen alueiden kouluilla on huippumoderni varustelu, heikommassa asemassa olevien alueiden kouluista puuttuu usein digitaalinen perusinfrastruktuuri. Tämän epätasapainon torjumiseksi EU on käynnistänyt kahden miljardin euron tukiohjelman, jonka tavoitteena on taata kaikille kouluille yhdenvertainen pääsy digitaaliseen koulutusteknologiaan vuoteen 2028 mennessä. Kriitikot epäilevät kuitenkin, riittävätkö varat koulutuksellisen eriarvoisuuden syvempien syiden poistamiseen.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'it', 'Il panorama educativo europeo sta attraversando una profonda trasformazione digitale che racchiude tanto ampie opportunità quanto rischi considerevoli. Secondo l''ultimo rapporto della Commissione europea per l''istruzione, oltre il 60 per cento delle scuole nell''Unione Europea utilizza ormai regolarmente strumenti di apprendimento digitale — un aumento di 20 punti percentuali rispetto a tre anni fa.

Al centro di questa trasformazione si collocano i sistemi di tutoraggio basati sull''IA, che analizzano in tempo reale i progressi individuali di ogni studente e adattano dinamicamente i contenuti didattici. La Finlandia, da tempo considerata un''apripista della pedagogia innovativa, ha introdotto questa tecnologia a livello capillare e riferisce di un miglioramento misurabile delle prestazioni nelle competenze di base matematiche e linguistiche. I sistemi individuano lacune di conoscenza prima che si consolidino e propongono esercizi mirati calibrati sul profilo di ciascun alunno.

L''entusiasmo è tuttavia accompagnato da uno scetticismo crescente. Associazioni pedagogiche di Germania, Francia e Italia hanno pubblicato congiuntamente un documento di posizione in cui mettono in guardia da un''eccessiva digitalizzazione dell''insegnamento. Lo sviluppo socioemotivo dei bambini, sostengono gli autori, richiede un''interazione umana che nessun algoritmo può sostituire. Inoltre, le piattaforme di apprendimento sollevano serie questioni di protezione dei dati: i sistemi raccolgono modelli di comportamento dettagliati dei bambini il cui stoccaggio e utilizzo a lungo termine sono regolamentati in modo insufficiente.

Un ulteriore problema strutturale è il divario digitale. Mentre le scuole nelle regioni economicamente forti dispongono di attrezzature all''avanguardia, nelle aree svantaggiate manca spesso l''infrastruttura digitale di base. Per contrastare questo squilibrio, l''UE ha varato un programma di finanziamento da due miliardi di euro che mira a garantire a tutte le scuole un accesso paritario alla tecnologia educativa digitale entro il 2028. I critici dubitano, tuttavia, che i fondi siano sufficienti a rimuovere le cause più profonde della disuguaglianza educativa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES (v_version_b2_id, 'pt', 'O panorama educativo europeu atravessa uma profunda transformação digital que encerra tanto amplas oportunidades como riscos consideráveis. Segundo o mais recente relatório da Comissão de Educação da UE, mais de 60 por cento das escolas na União Europeia utilizam atualmente ferramentas de aprendizagem digital de forma regular — um aumento de 20 pontos percentuais em comparação com há três anos.

No centro desta transformação estão os sistemas de tutoria baseados em IA, que analisam em tempo real o progresso individual de cada aluno e adaptam dinamicamente o conteúdo das aulas. A Finlândia, há muito considerada pioneira da pedagogia inovadora, implementou esta tecnologia a nível nacional e reporta uma melhoria mensurável do desempenho nas competências básicas de matemática e línguas. Os sistemas identificam lacunas de conhecimento antes de se consolidarem e oferecem exercícios direcionados adaptados ao perfil de cada aluno.

O entusiasmo é, contudo, acompanhado por um ceticismo crescente. Associações pedagógicas da Alemanha, França e Itália publicaram conjuntamente um documento de posição alertando contra uma digitalização excessiva do ensino. O desenvolvimento socioemocional das crianças, argumentam os autores, requer interação humana que nenhum algoritmo pode substituir. Além disso, as plataformas de aprendizagem levantam sérias questões de proteção de dados: os sistemas captam padrões de comportamento detalhados das crianças cujo armazenamento e utilização a longo prazo estão insuficientemente regulados.

Outro problema estrutural é a exclusão digital. Enquanto as escolas em regiões economicamente fortes dispõem de equipamento de última geração, nas áreas desfavorecidas falta frequentemente a infraestrutura digital básica. Para contrariar este desequilíbrio, a UE lançou um programa de financiamento dotado de dois mil milhões de euros que pretende garantir a todas as escolas um acesso equitativo à tecnologia educativa digital até 2028. Os críticos duvidam, contudo, que os fundos sejam suficientes para eliminar as causas mais profundas da desigualdade educativa.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Vocabulary

  -- Word: die Bildung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Bildung', 'bildung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la educación', 'la educación')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'education')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'koulutus')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'l''istruzione')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a educação')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Lernfortschritt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Lernfortschritt', 'lernfortschritt', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el progreso de aprendizaje', 'el progreso de aprendizaje')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'learning progress')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'oppimisedistyminen')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il progresso nell''apprendimento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o progresso de aprendizagem')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: der Datenschutz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Datenschutz', 'datenschutz', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la protección de datos', 'la protección de datos')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'data protection')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tietosuoja')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la protezione dei dati')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a proteção de dados')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Wissenslücke
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wissenslücke', 'wissenslücke', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la laguna de conocimiento', 'la laguna de conocimiento')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'knowledge gap')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tietoaukko')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'la lacuna di conoscenza')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'a lacuna de conhecimento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: anpassen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('anpassen', 'anpassen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'adaptar', 'adaptar')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'to adapt')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'mukauttaa')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'adattare')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'adaptar')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: die Kluft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Kluft', 'kluft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'la brecha', 'la brecha')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'divide')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'kuilu')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il divario')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o fosso')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

  -- Word: das Förderprogramm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Förderprogramm', 'förderprogramm', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish)
  VALUES (v_lemma_id, 'el programa de ayudas', 'el programa de ayudas')
  ON CONFLICT (lemma_id, normalized_spanish) DO NOTHING
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN
    SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id LIMIT 1;
  END IF;

  -- Link meaning to all versions
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;

  -- Meaning localizations
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'en', 'funding programme')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'fi', 'tukiohjelma')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'it', 'il programma di finanziamento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term)
  VALUES (v_meaning_id, 'pt', 'o programa de financiamento')
  ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;

END $$;

COMMIT;

-- Verify
SELECT 'texts' AS table_name, count(*) AS total FROM texts
UNION ALL
SELECT 'text_versions', count(*) FROM text_versions
UNION ALL
SELECT 'vocabulario', count(*) FROM vocabulario
UNION ALL
SELECT 'vocabulary_meanings', count(*) FROM vocabulary_meanings
UNION ALL
SELECT 'text_version_meanings', count(*) FROM text_version_meanings
UNION ALL
SELECT 'imk_text_localizations', count(*) FROM imk_text_localizations
UNION ALL
SELECT 'imk_version_localizations', count(*) FROM imk_version_localizations
UNION ALL
SELECT 'imk_meaning_localizations', count(*) FROM imk_meaning_localizations
ORDER BY table_name;

-- ================================================================
-- EXPANDED VOCABULARY: ~30 words per text with examples & translations
-- ================================================================


-- ============================================
-- Text 43 — 25 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- das Programm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Programm', 'das programm', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el programa', 'el programa', 'Dieses Programm hilft dir beim Sprachenlernen.', 'Este programa te ayuda a aprender idiomas.', 'program', 'ohjelma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Intelligenz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Intelligenz', 'die intelligenz', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la inteligencia', 'la inteligencia', 'Künstliche Intelligenz verändert unseren Alltag.', 'La inteligencia artificial cambia nuestra vida cotidiana.', 'intelligence', 'älykkyys', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Arzt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Arzt', 'der arzt', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el médico', 'el médico', 'Mein Arzt hat mir ein neues Medikament verschrieben.', 'Mi médico me recetó un nuevo medicamento.', 'doctor', 'lääkäri', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Bild
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Bild', 'das bild', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la imagen', 'la imagen', 'An der Wand hängt ein schönes Bild.', 'En la pared hay un cuadro bonito.', 'image', 'kuva', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Patient
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Patient', 'der patient', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el paciente', 'el paciente', 'Der Patient wartet seit einer Stunde im Wartezimmer.', 'El paciente lleva una hora esperando en la sala de espera.', 'patient', 'potilas', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- analysieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('analysieren', 'analysieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'analizar', 'analizar', 'Wir müssen die Ergebnisse genau analysieren.', 'Tenemos que analizar los resultados con detalle.', 'to analyze', 'analysoida', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Krankheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Krankheit', 'die krankheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la enfermedad', 'la enfermedad', 'Diese Krankheit ist in tropischen Ländern weit verbreitet.', 'Esta enfermedad está muy extendida en los países tropicales.', 'disease', 'sairaus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Technik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Technik', 'die technik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la técnica', 'la técnica', 'Die moderne Technik erleichtert viele Aufgaben.', 'La tecnología moderna facilita muchas tareas.', 'technology', 'tekniikka', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- nützlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nützlich', 'nützlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'útil', 'útil', 'Dieses Wörterbuch ist sehr nützlich für Anfänger.', 'Este diccionario es muy útil para principiantes.', 'useful', 'hyödyllinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Fehler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fehler', 'der fehler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el error', 'el error', 'Jeder macht mal einen Fehler, das ist normal.', 'Todo el mundo comete errores, es normal.', 'mistake', 'virhe', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- ersetzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('ersetzen', 'ersetzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'sustituir', 'sustituir', 'Roboter können manche Arbeitsplätze ersetzen.', 'Los robots pueden sustituir algunos puestos de trabajo.', 'to replace', 'korvata', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Entscheidung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Entscheidung', 'die entscheidung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la decisión', 'la decisión', 'Das war eine schwierige Entscheidung für die Familie.', 'Fue una decisión difícil para la familia.', 'decision', 'päätös', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- vertrauen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('vertrauen', 'vertrauen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'confiar', 'confiar', 'Ich vertraue meiner besten Freundin in allen Dingen.', 'Confío en mi mejor amiga en todo.', 'to trust', 'luottaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- helfen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('helfen', 'helfen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'ayudar', 'ayudar', 'Kannst du mir bitte bei den Hausaufgaben helfen?', '¿Puedes ayudarme con los deberes, por favor?', 'to help', 'auttaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- nutzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nutzen', 'nutzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'utilizar', 'utilizar', 'Viele Schüler nutzen das Internet für ihre Recherchen.', 'Muchos alumnos usan internet para sus investigaciones.', 'to use', 'käyttää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- finden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('finden', 'finden', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'encontrar', 'encontrar', 'Ich kann meinen Schlüssel nicht finden.', 'No encuentro mi llave.', 'to find', 'löytää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schnell
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schnell', 'schnell', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'rápido', 'rápido', 'Der Zug ist schneller als das Auto.', 'El tren es más rápido que el coche.', 'fast', 'nopea', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Arbeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Arbeit', 'die arbeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el trabajo', 'el trabajo', 'Nach der Arbeit gehe ich immer ins Fitnessstudio.', 'Después del trabajo siempre voy al gimnasio.', 'work', 'työ', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- weniger
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('weniger', 'weniger', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'menos', 'menos', 'Im Winter trinke ich weniger Wasser als im Sommer.', 'En invierno bebo menos agua que en verano.', 'less', 'vähemmän', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- treffen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('treffen', 'treffen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'tomar (una decisión)', 'tomar (una decisión)', 'Wir treffen uns morgen um drei Uhr im Café.', 'Nos vemos mañana a las tres en el café.', 'to make (a decision)', 'tehdä (päätös)', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- neu
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('neu', 'neu', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'nuevo', 'nuevo', 'Hast du schon das neue Restaurant in der Stadt probiert?', '¿Ya has probado el nuevo restaurante de la ciudad?', 'new', 'uusi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- lesen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lesen', 'lesen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'leer', 'leer', 'Mein Sohn liest jeden Abend vor dem Schlafen ein Buch.', 'Mi hijo lee un libro cada noche antes de dormir.', 'to read', 'lukea', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Mensch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Mensch', 'der mensch', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la persona', 'la persona', 'Jeder Mensch hat das Recht auf sauberes Wasser.', 'Toda persona tiene derecho al agua limpia.', 'person', 'ihminen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- künstlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('künstlich', 'künstlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'artificial', 'artificial', 'Der See im Park ist künstlich angelegt worden.', 'El lago del parque fue creado de forma artificial.', 'artificial', 'keinotekoinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Beispiel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Beispiel', 'das beispiel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el ejemplo', 'el ejemplo', 'Kannst du mir ein Beispiel geben?', '¿Puedes darme un ejemplo?', 'example', 'esimerkki', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (153, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (154, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (155, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 44 — 24 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- der Sommer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Sommer', 'der sommer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el verano', 'el verano', 'Letzten Sommer sind wir nach Griechenland geflogen.', 'El verano pasado volamos a Grecia.', 'summer', 'kesä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- heiß
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('heiß', 'heiß', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'caliente', 'caliente', 'Vorsicht, der Kaffee ist noch sehr heiß!', '¡Cuidado, el café todavía está muy caliente!', 'hot', 'kuuma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Temperatur
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Temperatur', 'die temperatur', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la temperatura', 'la temperatura', 'Die Temperatur im Klassenzimmer beträgt 22 Grad.', 'La temperatura en el aula es de 22 grados.', 'temperature', 'lämpötila', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- sterben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sterben', 'sterben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'morir', 'morir', 'Ohne Wasser können Pflanzen schnell sterben.', 'Sin agua, las plantas pueden morir rápidamente.', 'to die', 'kuolla', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Experte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Experte', 'der experte', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el experto', 'el experto', 'Der Experte erklärt die Gefahren des Rauchens.', 'El experto explica los peligros del tabaco.', 'expert', 'asiantuntija', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Gefahr
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Gefahr', 'die gefahr', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el peligro', 'el peligro', 'Im Straßenverkehr gibt es viele Gefahren.', 'En el tráfico hay muchos peligros.', 'danger', 'vaara', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- besonders
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besonders', 'besonders', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'especialmente', 'especialmente', 'Dieses Gericht ist besonders lecker mit frischen Kräutern.', 'Este plato está especialmente rico con hierbas frescas.', 'especially', 'erityisesti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schlimm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schlimm', 'schlimm', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'grave', 'grave', 'Die Überschwemmung war die schlimmste seit Jahrzehnten.', 'La inundación fue la peor en décadas.', 'bad', 'paha', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- extrem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('extrem', 'extrem', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'extremo', 'extremo', 'In der Wüste herrschen extreme Temperaturen.', 'En el desierto hay temperaturas extremas.', 'extreme', 'äärimmäinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Hitze
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Hitze', 'die hitze', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el calor', 'el calor', 'Bei dieser Hitze sollte man viel Wasser trinken.', 'Con este calor hay que beber mucha agua.', 'heat', 'helle', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regierung', 'die regierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die Regierung hat ein neues Gesetz verabschiedet.', 'El gobierno ha aprobado una nueva ley.', 'government', 'hallitus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Plan
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Plan', 'der plan', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el plan', 'el plan', 'Wir brauchen einen guten Plan für das Projekt.', 'Necesitamos un buen plan para el proyecto.', 'plan', 'suunnitelma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schuld
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schuld', 'schuld', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'culpable', 'culpable', 'Wer ist schuld an dem Unfall?', '¿Quién tiene la culpa del accidente?', 'to blame', 'syyllinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Todesfall
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Todesfall', 'der todesfall', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el fallecimiento', 'el fallecimiento', 'In der Familie gab es leider einen Todesfall.', 'Lamentablemente hubo un fallecimiento en la familia.', 'death', 'kuolemantapaus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- kühl
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kühl', 'kühl', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'fresco', 'fresco', 'Am Abend wird es draußen angenehm kühl.', 'Por la noche refresca agradablemente fuera.', 'cool', 'viileä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Raum
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Raum', 'der raum', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la habitación', 'la habitación', 'In dem Raum stehen ein Tisch und vier Stühle.', 'En la habitación hay una mesa y cuatro sillas.', 'room', 'huone', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Stadt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Stadt', 'die stadt', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la ciudad', 'la ciudad', 'Berlin ist eine große und interessante Stadt.', 'Berlín es una ciudad grande e interesante.', 'city', 'kaupunki', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- brauchen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('brauchen', 'brauchen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'necesitar', 'necesitar', 'Für das Rezept brauchen wir drei Eier.', 'Para la receta necesitamos tres huevos.', 'to need', 'tarvita', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Drittel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Drittel', 'das drittel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el tercio', 'el tercio', 'Ein Drittel der Bevölkerung lebt in Städten.', 'Un tercio de la población vive en ciudades.', 'third', 'kolmasosa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- alt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('alt', 'alt', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'viejo', 'viejo', 'Mein Großvater ist 85 Jahre alt.', 'Mi abuelo tiene 85 años.', 'old', 'vanha', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Jahr
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Jahr', 'das jahr', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el año', 'el año', 'Nächstes Jahr will ich Japanisch lernen.', 'El año que viene quiero aprender japonés.', 'year', 'vuosi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Grad
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Grad', 'der grad', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el grado', 'el grado', 'Heute sind es 25 Grad, perfekt für einen Ausflug.', 'Hoy hay 25 grados, perfecto para una excursión.', 'degree', 'aste', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Tag
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Tag', 'der tag', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el día', 'el día', 'Montag ist mein liebster Tag in der Woche.', 'El lunes es mi día favorito de la semana.', 'day', 'päivä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- besser
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besser', 'besser', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'mejor', 'mejor', 'Übung macht den Meister – du wirst immer besser.', 'La práctica hace al maestro, cada vez lo haces mejor.', 'better', 'parempi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (156, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (157, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (158, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 45 — 22 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- die Partei
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Partei', 'die partei', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el partido', 'el partido', 'Die Partei hat einen neuen Vorsitzenden gewählt.', 'El partido ha elegido un nuevo presidente.', 'party (political)', 'puolue', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- gewinnen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gewinnen', 'gewinnen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'ganar', 'ganar', 'Unsere Mannschaft hat das Spiel 3:1 gewonnen.', 'Nuestro equipo ganó el partido 3 a 1.', 'to win', 'voittaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Studentenbewegung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Studentenbewegung', 'die studentenbewegung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el movimiento estudiantil', 'el movimiento estudiantil', 'Die Studentenbewegung der 1960er Jahre veränderte die Gesellschaft.', 'El movimiento estudiantil de los años 60 cambió la sociedad.', 'student movement', 'opiskelijaliike', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- jung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('jung', 'jung', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'joven', 'joven', 'Die junge Frau arbeitet als Ingenieurin in München.', 'La joven trabaja como ingeniera en Múnich.', 'young', 'nuori', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Präsident
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Präsident', 'der präsident', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el presidente', 'el presidente', 'Der Präsident hielt eine wichtige Rede im Parlament.', 'El presidente pronunció un discurso importante en el parlamento.', 'president', 'presidentti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Macht
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Macht', 'die macht', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el poder', 'el poder', 'Die Macht der Medien wird oft unterschätzt.', 'El poder de los medios a menudo se subestima.', 'power', 'valta', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- unzufrieden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('unzufrieden', 'unzufrieden', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'insatisfecho', 'insatisfecho', 'Viele Kunden waren unzufrieden mit dem Service.', 'Muchos clientes estaban insatisfechos con el servicio.', 'dissatisfied', 'tyytymätön', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- protestieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('protestieren', 'protestieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'protestar', 'protestar', 'Tausende Menschen protestierten gegen die neuen Gesetze.', 'Miles de personas protestaron contra las nuevas leyes.', 'to protest', 'protestoida', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Straße
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Straße', 'die straße', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la calle', 'la calle', 'In unserer Straße gibt es viele alte Bäume.', 'En nuestra calle hay muchos árboles viejos.', 'street', 'katu', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Sieg
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Sieg', 'der sieg', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la victoria', 'la victoria', 'Der Sieg war eine große Überraschung für alle.', 'La victoria fue una gran sorpresa para todos.', 'victory', 'voitto', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- feiern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('feiern', 'feiern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'celebrar', 'celebrar', 'Wir feiern morgen den Geburtstag meiner Mutter.', 'Mañana celebramos el cumpleaños de mi madre.', 'to celebrate', 'juhlia', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- zufrieden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zufrieden', 'zufrieden', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'satisfecho', 'satisfecho', 'Ich bin mit dem Ergebnis sehr zufrieden.', 'Estoy muy satisfecho con el resultado.', 'satisfied', 'tyytyväinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regierung', 'die regierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die neue Regierung will die Steuern senken.', 'El nuevo gobierno quiere bajar los impuestos.', 'government', 'hallitus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- zusammenarbeiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zusammenarbeiten', 'zusammenarbeiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'colaborar', 'colaborar', 'Die beiden Firmen wollen in Zukunft enger zusammenarbeiten.', 'Las dos empresas quieren colaborar más estrechamente en el futuro.', 'to cooperate', 'tehdä yhteistyötä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- historisch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('historisch', 'historisch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'histórico', 'histórico', 'Die Altstadt hat viele historische Gebäude.', 'El casco antiguo tiene muchos edificios históricos.', 'historic', 'historiallinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Moment
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Moment', 'der moment', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el momento', 'el momento', 'Das war ein unvergesslicher Moment in meinem Leben.', 'Fue un momento inolvidable en mi vida.', 'moment', 'hetki', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Land
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Land', 'das land', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el país', 'el país', 'Finnland ist ein Land mit vielen Seen.', 'Finlandia es un país con muchos lagos.', 'country', 'maa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- wichtig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wichtig', 'wichtig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'importante', 'importante', 'Es ist wichtig, jeden Tag genug Wasser zu trinken.', 'Es importante beber suficiente agua cada día.', 'important', 'tärkeä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Student
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Student', 'der student', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el estudiante', 'el estudiante', 'Der Student bereitet sich auf die Prüfung vor.', 'El estudiante se prepara para el examen.', 'student', 'opiskelija', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- lange
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lange', 'lange', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'mucho tiempo', 'mucho tiempo', 'Ich habe lange auf den Bus gewartet.', 'Esperé mucho tiempo al autobús.', 'for a long time', 'pitkään', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- wollen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wollen', 'wollen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'querer', 'querer', 'Die Kinder wollen heute ins Schwimmbad gehen.', 'Los niños quieren ir hoy a la piscina.', 'to want', 'haluta', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- eng
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('eng', 'eng', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'estrecho', 'estrecho', 'Die Gasse in der Altstadt ist sehr eng.', 'El callejón del casco viejo es muy estrecho.', 'close / narrow', 'tiivis', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (159, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (160, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (161, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 46 — 23 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- die Firma
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Firma', 'die firma', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la empresa', 'la empresa', 'Die Firma hat dieses Jahr 200 neue Mitarbeiter eingestellt.', 'La empresa ha contratado 200 empleados nuevos este año.', 'company', 'yritys', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Börse
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Börse', 'die börse', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la bolsa', 'la bolsa', 'Die Börse hat heute starke Verluste verzeichnet.', 'La bolsa ha registrado fuertes pérdidas hoy.', 'stock exchange', 'pörssi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Produkt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Produkt', 'das produkt', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el producto', 'el producto', 'Das Produkt wird in über 30 Ländern verkauft.', 'El producto se vende en más de 30 países.', 'product', 'tuote', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- sprechen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sprechen', 'sprechen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'hablar', 'hablar', 'Sie spricht fünf Sprachen fließend.', 'Ella habla cinco idiomas con fluidez.', 'to speak', 'puhua', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Geschichte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Geschichte', 'die geschichte', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la historia', 'la historia', 'Die Geschichte Europas ist sehr komplex.', 'La historia de Europa es muy compleja.', 'history', 'historia', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Milliarde
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Milliarde', 'die milliarde', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el mil millones', 'el mil millones', 'Auf der Erde leben fast acht Milliarden Menschen.', 'En la Tierra viven casi ocho mil millones de personas.', 'billion', 'miljardi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- wert
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wert', 'wert', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'que vale', 'que vale', 'Das alte Gemälde ist mehrere Millionen Euro wert.', 'El cuadro antiguo vale varios millones de euros.', 'worth', 'arvoinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- kaufen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kaufen', 'kaufen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'comprar', 'comprar', 'Ich möchte mir ein neues Fahrrad kaufen.', 'Quiero comprarme una bicicleta nueva.', 'to buy', 'ostaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Branche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Branche', 'die branche', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el sector', 'el sector', 'Die Automobilbranche steckt im Wandel.', 'El sector automovilístico está en transformación.', 'industry', 'toimiala', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- wachsen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wachsen', 'wachsen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'crecer', 'crecer', 'Die Wirtschaft ist im letzten Quartal stark gewachsen.', 'La economía creció con fuerza en el último trimestre.', 'to grow', 'kasvaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Kosten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Kosten', 'die kosten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'los costes', 'los costes', 'Die Kosten für Energie sind in den letzten Monaten gestiegen.', 'Los costes de la energía han subido en los últimos meses.', 'costs', 'kustannukset', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- hoch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('hoch', 'hoch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'alto', 'alto', 'Der Berg ist über 4.000 Meter hoch.', 'La montaña tiene más de 4.000 metros de altura.', 'high', 'korkea', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- glauben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('glauben', 'glauben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'creer', 'creer', 'Ich glaube, morgen wird das Wetter besser.', 'Creo que mañana el tiempo será mejor.', 'to believe', 'uskoa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Zukunft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zukunft', 'die zukunft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el futuro', 'el futuro', 'Niemand weiß, was die Zukunft bringt.', 'Nadie sabe qué deparará el futuro.', 'future', 'tulevaisuus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- stattfinden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('stattfinden', 'stattfinden', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'tener lugar', 'tener lugar', 'Das Konzert findet am Samstag im Park statt.', 'El concierto tiene lugar el sábado en el parque.', 'to take place', 'tapahtua', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- amerikanisch
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('amerikanisch', 'amerikanisch', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'estadounidense', 'estadounidense', 'Der amerikanische Film hat viele Preise gewonnen.', 'La película estadounidense ganó muchos premios.', 'American', 'amerikkalainen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- bekannt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('bekannt', 'bekannt', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'conocido', 'conocido', 'München ist bekannt für sein Oktoberfest.', 'Múnich es conocido por su Oktoberfest.', 'well-known', 'tunnettu', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- verdreifachen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verdreifachen', 'verdreifachen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'triplicar', 'triplicar', 'Die Zahl der Online-Bestellungen hat sich verdreifacht.', 'El número de pedidos en línea se ha triplicado.', 'to triple', 'kolminkertaistaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Entwicklung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Entwicklung', 'die entwicklung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el desarrollo', 'el desarrollo', 'Die Entwicklung neuer Medikamente dauert viele Jahre.', 'El desarrollo de nuevos medicamentos lleva muchos años.', 'development', 'kehitys', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Anfang
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Anfang', 'der anfang', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el principio', 'el principio', 'Am Anfang war der Kurs schwierig, aber jetzt verstehe ich alles.', 'Al principio el curso era difícil, pero ahora lo entiendo todo.', 'beginning', 'alku', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- denken
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('denken', 'denken', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'pensar', 'pensar', 'Ich denke oft an meine Heimat.', 'Pienso a menudo en mi tierra.', 'to think', 'ajatella', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- groß
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('groß', 'groß', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'grande', 'grande', 'Hamburg ist die zweitgrößte Stadt Deutschlands.', 'Hamburgo es la segunda ciudad más grande de Alemania.', 'big', 'suuri', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Geld
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Geld', 'das geld', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el dinero', 'el dinero', 'Für die Reise habe ich nicht genug Geld gespart.', 'No he ahorrado suficiente dinero para el viaje.', 'money', 'raha', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (162, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (163, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (164, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 47 — 23 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- der Bauer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Bauer', 'der bauer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el agricultor', 'el agricultor', 'Der Bauer arbeitet jeden Tag auf dem Feld.', 'El agricultor trabaja cada día en el campo.', 'farmer', 'maanviljelijä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- krank
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('krank', 'krank', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'enfermo', 'enfermo', 'Meine Kollegin ist seit einer Woche krank.', 'Mi compañera lleva una semana enferma.', 'sick', 'sairas', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Fieber
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Fieber', 'das fieber', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la fiebre', 'la fiebre', 'Das Kind hat hohes Fieber und muss im Bett bleiben.', 'El niño tiene fiebre alta y debe quedarse en cama.', 'fever', 'kuume', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Kopfschmerzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Kopfschmerzen', 'die kopfschmerzen', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el dolor de cabeza', 'el dolor de cabeza', 'Ich habe starke Kopfschmerzen und nehme eine Tablette.', 'Tengo un fuerte dolor de cabeza y me tomo una pastilla.', 'headache', 'päänsärky', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- untersuchen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('untersuchen', 'untersuchen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'examinar', 'examinar', 'Die Polizei untersucht den Vorfall seit gestern.', 'La policía investiga el incidente desde ayer.', 'to examine', 'tutkia', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Risiko
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Risiko', 'das risiko', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el riesgo', 'el riesgo', 'Das Risiko einer Ansteckung ist hier sehr gering.', 'El riesgo de contagio aquí es muy bajo.', 'risk', 'riski', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Bevölkerung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Bevölkerung', 'die bevölkerung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la población', 'la población', 'Die Bevölkerung der Stadt wächst seit zehn Jahren.', 'La población de la ciudad crece desde hace diez años.', 'population', 'väestö', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- gering
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gering', 'gering', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'escaso', 'escaso', 'Die Chancen auf Schnee im Mai sind gering.', 'Las probabilidades de nieve en mayo son escasas.', 'low / slight', 'vähäinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- leicht
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('leicht', 'leicht', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'fácil', 'fácil', 'Die Aufgabe ist gar nicht so leicht, wie sie aussieht.', 'La tarea no es tan fácil como parece.', 'easy', 'helppo', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- beobachten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('beobachten', 'beobachten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'observar', 'observar', 'Wir beobachten die Vögel vom Balkon aus.', 'Observamos los pájaros desde el balcón.', 'to observe', 'tarkkailla', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Situation
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Situation', 'die situation', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la situación', 'la situación', 'Die Situation auf dem Arbeitsmarkt hat sich verbessert.', 'La situación en el mercado laboral ha mejorado.', 'situation', 'tilanne', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- genau
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('genau', 'genau', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'exactamente', 'exactamente', 'Kannst du mir genau erklären, wie das funktioniert?', '¿Puedes explicarme exactamente cómo funciona?', 'exactly', 'tarkasti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- sicher
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sicher', 'sicher', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'seguro', 'seguro', 'Bist du sicher, dass du den Schlüssel eingesteckt hast?', '¿Estás seguro de que has metido la llave?', 'sure / safe', 'varma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- sich verbreiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich verbreiten', 'sich verbreiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'propagarse', 'propagarse', 'Die Nachricht hat sich schnell im Internet verbreitet.', 'La noticia se difundió rápidamente por internet.', 'to spread', 'levitä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Tier
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tier', 'das tier', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el animal', 'el animal', 'Im Zoo kann man viele exotische Tiere sehen.', 'En el zoo se pueden ver muchos animales exóticos.', 'animal', 'eläin', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- normalerweise
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('normalerweise', 'normalerweise', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'normalmente', 'normalmente', 'Normalerweise stehe ich um sieben Uhr auf.', 'Normalmente me levanto a las siete.', 'normally', 'normaalisti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Mann
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Mann', 'der mann', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el hombre', 'el hombre', 'Der Mann im blauen Mantel ist mein Nachbar.', 'El hombre del abrigo azul es mi vecino.', 'man', 'mies', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- vorkommen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('vorkommen', 'vorkommen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'ocurrir', 'ocurrir', 'Solche Fehler können überall vorkommen.', 'Estos errores pueden ocurrir en cualquier sitio.', 'to occur', 'esiintyä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- weiter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('weiter', 'weiter', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'más allá', 'más allá', 'Geh einfach weiter geradeaus, dann findest du den Bahnhof.', 'Sigue recto y encontrarás la estación.', 'further', 'eteenpäin', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Fall
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fall', 'der fall', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el caso', 'el caso', 'Die Polizei hat den Fall nach drei Monaten gelöst.', 'La policía resolvió el caso después de tres meses.', 'case', 'tapaus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- neu
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('neu', 'neu', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'nuevo', 'nuevo', 'Hast du die neue Folge der Serie schon gesehen?', '¿Ya has visto el nuevo episodio de la serie?', 'new', 'uusi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- zum ersten Mal
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zum ersten Mal', 'zum ersten mal', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'por primera vez', 'por primera vez', 'Sie besucht zum ersten Mal ein anderes Land.', 'Visita otro país por primera vez.', 'for the first time', 'ensimmäistä kertaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- trotzdem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('trotzdem', 'trotzdem', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'sin embargo', 'sin embargo', 'Es regnet, aber wir gehen trotzdem spazieren.', 'Llueve, pero aun así salimos a pasear.', 'nevertheless', 'silti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (165, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (166, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (167, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 48 — 24 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- der Fehler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Fehler', 'der fehler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el error', 'el error', 'Der Lehrer hat einen Fehler in meiner Hausaufgabe gefunden.', 'El profesor encontró un error en mi tarea.', 'mistake', 'virhe', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- gefährlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gefährlich', 'gefährlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'peligroso', 'peligroso', 'Es ist gefährlich, nachts allein durch den Park zu gehen.', 'Es peligroso caminar solo por el parque de noche.', 'dangerous', 'vaarallinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Hacker
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Hacker', 'der hacker', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el hacker', 'el hacker', 'Der Hacker hat versucht, in das Netzwerk der Bank einzubrechen.', 'El hacker intentó entrar en la red del banco.', 'hacker', 'hakkeri', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- stehlen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('stehlen', 'stehlen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'robar', 'robar', 'Jemand hat sein Fahrrad vor dem Supermarkt gestohlen.', 'Alguien robó su bicicleta delante del supermercado.', 'to steal', 'varastaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Daten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Daten', 'die daten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'los datos', 'los datos', 'Die Firma speichert alle Daten in einer sicheren Cloud.', 'La empresa almacena todos los datos en una nube segura.', 'data', 'tiedot', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Suche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Suche', 'die suche', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la búsqueda', 'la búsqueda', 'Die Suche nach einer neuen Wohnung dauert oft lange.', 'La búsqueda de un piso nuevo suele durar mucho.', 'search', 'etsintä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- finden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('finden', 'finden', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'encontrar', 'encontrar', 'Ich kann meine Schlüssel nicht finden.', 'No puedo encontrar mis llaves.', 'to find', 'löytää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Programmiersprache
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Programmiersprache', 'die programmiersprache', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el lenguaje de programación', 'el lenguaje de programación', 'Python ist eine beliebte Programmiersprache für Anfänger.', 'Python es un lenguaje de programación popular para principiantes.', 'programming language', 'ohjelmointikieli', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Webseite
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Webseite', 'die webseite', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la página web', 'la página web', 'Die Webseite der Universität hat alle wichtigen Informationen.', 'La página web de la universidad tiene toda la información importante.', 'website', 'verkkosivusto', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- benutzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('benutzen', 'benutzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'usar', 'usar', 'Meine Großmutter lernt, ein Smartphone zu benutzen.', 'Mi abuela está aprendiendo a usar un smartphone.', 'to use', 'käyttää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regierung', 'die regierung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die Regierung hat ein neues Gesetz zum Umweltschutz beschlossen.', 'El gobierno aprobó una nueva ley de protección medioambiental.', 'government', 'hallitus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Regel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Regel', 'die regel', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la regla', 'la regla', 'In der Schule gibt es viele Regeln, die man beachten muss.', 'En el colegio hay muchas reglas que hay que respetar.', 'rule', 'sääntö', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Sicherheit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Sicherheit', 'die sicherheit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la seguridad', 'la seguridad', 'Die Sicherheit der Passagiere hat immer höchste Priorität.', 'La seguridad de los pasajeros siempre tiene la máxima prioridad.', 'security', 'turvallisuus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Software
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Software', 'die software', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el software', 'el software', 'Die neue Software macht die Arbeit im Büro viel einfacher.', 'El nuevo software hace el trabajo en la oficina mucho más fácil.', 'software', 'ohjelmisto', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Experte
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Experte', 'der experte', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el experto', 'el experto', 'Der Experte hat den Schaden am Dach begutachtet.', 'El experto examinó los daños en el tejado.', 'expert', 'asiantuntija', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schnell
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schnell', 'schnell', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'rápido', 'rápido', 'Der Zug nach Berlin ist sehr schnell.', 'El tren a Berlín es muy rápido.', 'fast', 'nopea', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Nutzer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Nutzer', 'der nutzer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el usuario', 'el usuario', 'Die App hat schon über eine Million Nutzer weltweit.', 'La aplicación ya tiene más de un millón de usuarios en todo el mundo.', 'user', 'käyttäjä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Internet
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Internet', 'das internet', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el internet', 'el internet', 'Ohne Internet kann ich meine E-Mails nicht lesen.', 'Sin internet no puedo leer mis correos electrónicos.', 'internet', 'internet', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- nutzen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('nutzen', 'nutzen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'utilizar', 'utilizar', 'Viele Menschen nutzen öffentliche Verkehrsmittel für den Weg zur Arbeit.', 'Mucha gente utiliza el transporte público para ir al trabajo.', 'to use', 'hyödyntää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Problem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Problem', 'das problem', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el problema', 'el problema', 'Wir haben ein Problem mit der Heizung in unserer Wohnung.', 'Tenemos un problema con la calefacción de nuestro piso.', 'problem', 'ongelma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- ernst
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('ernst', 'ernst', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'grave', 'grave', 'Die Lage in der Region ist sehr ernst.', 'La situación en la región es muy grave.', 'serious', 'vakava', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- helfen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('helfen', 'helfen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'ayudar', 'ayudar', 'Kannst du mir bitte beim Umzug helfen?', '¿Puedes ayudarme con la mudanza, por favor?', 'to help', 'auttaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- künstlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('künstlich', 'künstlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'artificial', 'artificial', 'Die Blumen auf dem Tisch sehen echt aus, aber sie sind künstlich.', 'Las flores de la mesa parecen reales, pero son artificiales.', 'artificial', 'keinotekoinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Intelligenz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Intelligenz', 'die intelligenz', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la inteligencia', 'la inteligencia', 'Emotionale Intelligenz ist im Berufsleben sehr wichtig.', 'La inteligencia emocional es muy importante en la vida profesional.', 'intelligence', 'älykkyys', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (168, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (169, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (170, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 49 — 23 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- die Firma
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Firma', 'die firma', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la empresa', 'la empresa', 'Mein Vater arbeitet seit zwanzig Jahren in derselben Firma.', 'Mi padre lleva veinte años trabajando en la misma empresa.', 'company', 'yritys', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Idee
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Idee', 'die idee', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la idea', 'la idea', 'Das ist eine großartige Idee für unser nächstes Projekt!', '¡Es una idea genial para nuestro próximo proyecto!', 'idea', 'idea', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Technologie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Technologie', 'die technologie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la tecnología', 'la tecnología', 'Neue Technologien verändern die Art, wie wir kommunizieren.', 'Las nuevas tecnologías cambian la forma en que nos comunicamos.', 'technology', 'teknologia', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die App
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die App', 'die app', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la aplicación', 'la aplicación', 'Ich habe eine neue App zum Sprachenlernen heruntergeladen.', 'Me descargué una nueva aplicación para aprender idiomas.', 'app', 'sovellus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- entstehen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('entstehen', 'entstehen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'surgir', 'surgir', 'In der Altstadt soll ein neuer Park entstehen.', 'En el casco antiguo se va a crear un nuevo parque.', 'to emerge', 'syntyä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Geld
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Geld', 'das geld', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el dinero', 'el dinero', 'Ich spare Geld für eine Reise nach Japan.', 'Ahorro dinero para un viaje a Japón.', 'money', 'raha', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- bekommen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('bekommen', 'bekommen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'recibir', 'recibir', 'Zum Geburtstag habe ich ein neues Buch bekommen.', 'Por mi cumpleaños recibí un libro nuevo.', 'to receive', 'saada', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Miete
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Miete', 'die miete', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el alquiler', 'el alquiler', 'Die Miete für unsere Wohnung ist letztes Jahr gestiegen.', 'El alquiler de nuestro piso subió el año pasado.', 'rent', 'vuokra', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Büro
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Büro', 'das büro', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la oficina', 'la oficina', 'In unserem Büro gibt es eine kleine Küche und einen Balkon.', 'En nuestra oficina hay una cocina pequeña y un balcón.', 'office', 'toimisto', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- teuer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('teuer', 'teuer', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'caro', 'caro', 'Das Restaurant war gut, aber ziemlich teuer.', 'El restaurante estaba bien, pero era bastante caro.', 'expensive', 'kallis', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schwer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schwer', 'schwer', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'difícil', 'difícil', 'Die Prüfung war sehr schwer, aber ich habe bestanden.', 'El examen fue muy difícil, pero aprobé.', 'difficult', 'vaikea', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Mitarbeiter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Mitarbeiter', 'der mitarbeiter', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el empleado', 'el empleado', 'Die Firma sucht neue Mitarbeiter für die Marketingabteilung.', 'La empresa busca nuevos empleados para el departamento de marketing.', 'employee', 'työntekijä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- wachsen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wachsen', 'wachsen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'crecer', 'crecer', 'Die Stadt wächst jedes Jahr um tausend Einwohner.', 'La ciudad crece mil habitantes cada año.', 'to grow', 'kasvaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- arbeiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('arbeiten', 'arbeiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'trabajar', 'trabajar', 'Meine Schwester arbeitet als Ingenieurin bei Siemens.', 'Mi hermana trabaja como ingeniera en Siemens.', 'to work', 'työskennellä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- besonders
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besonders', 'besonders', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'especialmente', 'especialmente', 'Der Film war besonders spannend am Ende.', 'La película fue especialmente emocionante al final.', 'especially', 'erityisesti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- klein
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('klein', 'klein', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'pequeño', 'pequeño', 'Wir wohnen in einer kleinen Wohnung im Stadtzentrum.', 'Vivimos en un piso pequeño en el centro de la ciudad.', 'small', 'pieni', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- neu
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('neu', 'neu', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'nuevo', 'nuevo', 'Hast du schon das neue Restaurant in der Altstadt ausprobiert?', '¿Ya probaste el restaurante nuevo del casco antiguo?', 'new', 'uusi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- geben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('geben', 'geben', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'dar', 'dar', 'Können Sie mir bitte ein Glas Wasser geben?', '¿Puede darme un vaso de agua, por favor?', 'to give', 'antaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Beispiel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Beispiel', 'das beispiel', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el ejemplo', 'el ejemplo', 'Können Sie mir bitte ein Beispiel geben?', '¿Puede darme un ejemplo, por favor?', 'example', 'esimerkki', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- gut
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gut', 'gut', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'bueno', 'bueno', 'Das Essen in der Kantine ist heute besonders gut.', 'La comida del comedor está especialmente buena hoy.', 'good', 'hyvä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- trotzdem
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('trotzdem', 'trotzdem', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'sin embargo', 'sin embargo', 'Es regnet, aber wir gehen trotzdem spazieren.', 'Llueve, pero aun así salimos a pasear.', 'nevertheless', 'silti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Szene
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Szene', 'die szene', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la escena', 'la escena', 'Berlin hat eine lebendige Kulturszene mit vielen Theatern.', 'Berlín tiene una escena cultural vibrante con muchos teatros.', 'scene', 'skene', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- immer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('immer', 'immer', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'siempre', 'siempre', 'Mein Großvater trinkt immer um drei Uhr Kaffee.', 'Mi abuelo siempre toma café a las tres.', 'always', 'aina', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (171, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (172, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (173, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 50 — 21 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- das Wetter
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Wetter', 'das wetter', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el tiempo', 'el tiempo', 'Das Wetter in Hamburg ist oft regnerisch und grau.', 'El tiempo en Hamburgo suele ser lluvioso y gris.', 'weather', 'sää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Sturm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Sturm', 'der sturm', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la tormenta', 'la tormenta', 'Der Sturm hat letzte Nacht viele Bäume umgeworfen.', 'La tormenta derribó muchos árboles anoche.', 'storm', 'myrsky', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- zerstören
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zerstören', 'zerstören', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'destruir', 'destruir', 'Das Erdbeben hat viele Gebäude in der Stadt zerstört.', 'El terremoto destruyó muchos edificios de la ciudad.', 'to destroy', 'tuhota', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Haus
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Haus', 'das haus', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la casa', 'la casa', 'Unsere Nachbarn haben ein schönes Haus mit Garten.', 'Nuestros vecinos tienen una casa bonita con jardín.', 'house', 'talo', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Straße
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Straße', 'die straße', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la calle', 'la calle', 'In unserer Straße gibt es viele kleine Geschäfte.', 'En nuestra calle hay muchas tiendas pequeñas.', 'street', 'katu', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- wichtig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wichtig', 'wichtig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'importante', 'importante', 'Es ist wichtig, jeden Tag genug Wasser zu trinken.', 'Es importante beber suficiente agua cada día.', 'important', 'tärkeä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- vorhersagen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('vorhersagen', 'vorhersagen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'predecir', 'predecir', 'Niemand kann die Zukunft genau vorhersagen.', 'Nadie puede predecir el futuro con exactitud.', 'to predict', 'ennustaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- analysieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('analysieren', 'analysieren', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'analizar', 'analizar', 'Die Wissenschaftler analysieren die Proben im Labor.', 'Los científicos analizan las muestras en el laboratorio.', 'to analyze', 'analysoida', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Temperatur
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Temperatur', 'die temperatur', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la temperatura', 'la temperatura', 'Im Winter sinkt die Temperatur oft unter null Grad.', 'En invierno la temperatura baja a menudo de cero grados.', 'temperature', 'lämpötila', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Wind
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Wind', 'der wind', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el viento', 'el viento', 'An der Küste weht oft ein starker Wind.', 'En la costa suele soplar un viento fuerte.', 'wind', 'tuuli', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Wolke
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wolke', 'die wolke', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la nube', 'la nube', 'Dunkle Wolken ziehen auf – es wird bald regnen.', 'Se acercan nubes oscuras, pronto lloverá.', 'cloud', 'pilvi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Meteorologe
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Meteorologe', 'der meteorologe', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el meteorólogo', 'el meteorólogo', 'Der Meteorologe erklärt im Fernsehen das Wetter für die Woche.', 'El meteorólogo explica en televisión el tiempo de la semana.', 'meteorologist', 'meteorologi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Technik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Technik', 'die technik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la técnica', 'la técnica', 'Dank moderner Technik können wir überall arbeiten.', 'Gracias a la tecnología moderna podemos trabajar en cualquier sitio.', 'technology', 'tekniikka', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- genau
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('genau', 'genau', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'preciso', 'preciso', 'Die Uhr ist sehr genau und geht keine Sekunde falsch.', 'El reloj es muy preciso y no se atrasa ni un segundo.', 'precise', 'tarkka', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- früher
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('früher', 'früher', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'antes', 'antes', 'Früher gab es hier nur Felder, jetzt stehen überall Häuser.', 'Antes aquí solo había campos, ahora hay casas por todas partes.', 'before', 'ennen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- sich vorbereiten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich vorbereiten', 'sich vorbereiten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'prepararse', 'prepararse', 'Ich muss mich auf die Prüfung nächste Woche vorbereiten.', 'Tengo que prepararme para el examen de la semana que viene.', 'to prepare', 'valmistautua', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schlecht
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schlecht', 'schlecht', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'malo', 'malo', 'Bei schlechtem Wetter bleibe ich lieber zu Hause.', 'Con mal tiempo prefiero quedarme en casa.', 'bad', 'huono', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- manchmal
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('manchmal', 'manchmal', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'a veces', 'a veces', 'Manchmal gehe ich nach der Arbeit ins Schwimmbad.', 'A veces voy a la piscina después del trabajo.', 'sometimes', 'joskus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- schauen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('schauen', 'schauen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'mirar', 'mirar', 'Schau mal aus dem Fenster, es schneit!', '¡Mira por la ventana, está nevando!', 'to look', 'katsoa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- besser
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('besser', 'besser', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'mejor', 'mejor', 'Nach dem Arztbesuch geht es mir schon viel besser.', 'Después de ir al médico ya me siento mucho mejor.', 'better', 'parempi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Daten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Daten', 'die daten', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'los datos', 'los datos', 'Für die Anmeldung brauchen wir Ihre persönlichen Daten.', 'Para la inscripción necesitamos sus datos personales.', 'data', 'tiedot', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (174, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (175, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (176, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 51 — 22 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- das Wochenende
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Wochenende', 'das wochenende', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el fin de semana', 'el fin de semana', 'Am Wochenende fahren wir oft aufs Land.', 'Los fines de semana solemos ir al campo.', 'weekend', 'viikonloppu', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- unzufrieden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('unzufrieden', 'unzufrieden', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'insatisfecho', 'insatisfecho', 'Der Kunde war unzufrieden mit dem Service im Hotel.', 'El cliente estaba insatisfecho con el servicio del hotel.', 'dissatisfied', 'tyytymätön', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Lohn
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Lohn', 'der lohn', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el salario', 'el salario', 'Die Arbeiter fordern einen höheren Lohn.', 'Los trabajadores exigen un salario más alto.', 'wage', 'palkka', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Wohnung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wohnung', 'die wohnung', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el piso', 'el piso', 'Wir haben endlich eine bezahlbare Wohnung in der Stadt gefunden.', 'Por fin encontramos un piso asequible en la ciudad.', 'apartment', 'asunto', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- günstig
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('günstig', 'günstig', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'barato', 'barato', 'Im Supermarkt nebenan sind die Preise sehr günstig.', 'En el supermercado de al lado los precios son muy baratos.', 'affordable', 'edullinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Leben
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Leben', 'das leben', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la vida', 'la vida', 'Das Leben auf dem Land ist ruhiger als in der Stadt.', 'La vida en el campo es más tranquila que en la ciudad.', 'life', 'elämä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Essen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Essen', 'das essen', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la comida', 'la comida', 'Das Essen in diesem Restaurant schmeckt ausgezeichnet.', 'La comida de este restaurante sabe excelente.', 'food', 'ruoka', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Strom
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Strom', 'der strom', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la electricidad', 'la electricidad', 'Die Kosten für Strom sind im letzten Jahr stark gestiegen.', 'El coste de la electricidad ha subido mucho el último año.', 'electricity', 'sähkö', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- kosten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('kosten', 'kosten', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'costar', 'costar', 'Wie viel kostet ein Kilo Äpfel auf dem Markt?', '¿Cuánto cuesta un kilo de manzanas en el mercado?', 'to cost', 'maksaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Demonstrant
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Demonstrant', 'der demonstrant', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el manifestante', 'el manifestante', 'Die Demonstranten versammelten sich vor dem Rathaus.', 'Los manifestantes se reunieron frente al ayuntamiento.', 'protester', 'mielenosoittaja', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Schild
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Schild', 'das schild', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el cartel', 'el cartel', 'Auf dem Schild stand: Bitte nicht betreten.', 'En el cartel ponía: Prohibido el paso.', 'sign', 'kyltti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- rufen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('rufen', 'rufen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'gritar', 'gritar', 'Die Kinder rufen laut nach ihrer Mutter.', 'Los niños llaman a gritos a su madre.', 'to shout', 'huutaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Parole
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Parole', 'die parole', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el lema', 'el lema', 'Die Parole der Bewegung war auf vielen T-Shirts zu lesen.', 'El lema del movimiento se podía leer en muchas camisetas.', 'slogan', 'iskulause', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- friedlich
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('friedlich', 'friedlich', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'pacífico', 'pacífico', 'Der Abend am See war wunderbar friedlich.', 'La tarde junto al lago fue maravillosamente tranquila.', 'peaceful', 'rauhallinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Polizei
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Polizei', 'die polizei', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la policía', 'la policía', 'Nach dem Unfall hat jemand sofort die Polizei gerufen.', 'Después del accidente alguien llamó a la policía de inmediato.', 'police', 'poliisi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- aufrufen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('aufrufen', 'aufrufen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'convocar', 'convocar', 'Die Organisation rief alle Bürger zur Teilnahme auf.', 'La organización llamó a todos los ciudadanos a participar.', 'to call upon', 'kehottaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Politiker
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Politiker', 'der politiker', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el político', 'el político', 'Die Politikerin hielt eine Rede vor dem Parlament.', 'La política pronunció un discurso ante el parlamento.', 'politician', 'poliitikko', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- zuhören
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('zuhören', 'zuhören', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'escuchar', 'escuchar', 'Bitte hör mir kurz zu, ich möchte dir etwas Wichtiges sagen.', 'Escúchame un momento, quiero decirte algo importante.', 'to listen', 'kuunnella', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Protest
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Protest', 'der protest', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la protesta', 'la protesta', 'Der Protest gegen das neue Gesetz dauerte mehrere Wochen.', 'La protesta contra la nueva ley duró varias semanas.', 'protest', 'protesti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- tragen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('tragen', 'tragen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'llevar', 'llevar', 'Im Winter trage ich immer eine warme Mütze.', 'En invierno siempre llevo un gorro caliente.', 'to carry / to wear', 'kantaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- größtenteils
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('größtenteils', 'größtenteils', NULL, 'Adverb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'en su mayoría', 'en su mayoría', 'Die Renovierung ist größtenteils abgeschlossen.', 'La renovación está en su mayor parte terminada.', 'mostly', 'suurimmaksi osaksi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- gehen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('gehen', 'gehen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'ir', 'ir', 'Wir gehen jeden Morgen zusammen zur Schule.', 'Vamos juntos al colegio todas las mañanas.', 'to go', 'mennä', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (177, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (178, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (179, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;


-- ============================================
-- Text 52 — 23 new words
-- ============================================

DO $$
DECLARE
  v_lemma_id INT;
  v_meaning_id INT;
BEGIN
  -- die Schule
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Schule', 'die schule', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el colegio', 'el colegio', 'Mein Sohn geht auf eine Schule in der Nähe von unserem Haus.', 'Mi hijo va a un colegio cerca de nuestra casa.', 'school', 'koulu', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Schüler
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Schüler', 'der schüler', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el alumno', 'el alumno', 'Die Schüler bereiten sich auf die Abschlussprüfung vor.', 'Los alumnos se preparan para el examen final.', 'student', 'oppilas', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- verändern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verändern', 'verändern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'cambiar', 'cambiar', 'Das Internet hat die Art, wie wir einkaufen, komplett verändert.', 'Internet ha cambiado completamente la forma en que compramos.', 'to change', 'muuttaa', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- lernen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('lernen', 'lernen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'aprender', 'aprender', 'Ich lerne seit drei Monaten Klavier spielen.', 'Llevo tres meses aprendiendo a tocar el piano.', 'to learn', 'oppia', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Tablet
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tablet', 'das tablet', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la tableta', 'la tableta', 'Die Kinder lesen ihre Schulbücher jetzt auf dem Tablet.', 'Los niños ahora leen sus libros de texto en la tableta.', 'tablet', 'tabletti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Computer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Computer', 'der computer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el ordenador', 'el ordenador', 'Mein alter Computer ist zu langsam für neue Programme.', 'Mi ordenador viejo es demasiado lento para programas nuevos.', 'computer', 'tietokone', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Klassenzimmer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Klassenzimmer', 'das klassenzimmer', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el aula', 'el aula', 'Das Klassenzimmer wurde frisch gestrichen und sieht hell aus.', 'El aula fue pintada de nuevo y se ve luminosa.', 'classroom', 'luokkahuone', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- digital
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('digital', 'digital', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'digital', 'digital', 'Viele Zeitungen bieten jetzt auch digitale Ausgaben an.', 'Muchos periódicos ofrecen ahora también ediciones digitales.', 'digital', 'digitaalinen', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Tafel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Tafel', 'die tafel', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la pizarra', 'la pizarra', 'Der Lehrer schreibt die Hausaufgaben an die Tafel.', 'El profesor escribe los deberes en la pizarra.', 'board', 'taulu', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Lehrer
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Lehrer', 'der lehrer', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el profesor', 'el profesor', 'Unser Deutschlehrer kommt aus Österreich.', 'Nuestro profesor de alemán es de Austria.', 'teacher', 'opettaja', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Programm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Programm', 'das programm', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el programa', 'el programa', 'Mit diesem Programm kann man Fotos bearbeiten.', 'Con este programa se pueden editar fotos.', 'program', 'ohjelma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- erklären
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('erklären', 'erklären', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'explicar', 'explicar', 'Können Sie mir bitte den Weg zum Bahnhof erklären?', '¿Puede explicarme el camino a la estación, por favor?', 'to explain', 'selittää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Grammatik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Grammatik', 'die grammatik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la gramática', 'la gramática', 'Deutsche Grammatik hat viele Regeln und Ausnahmen.', 'La gramática alemana tiene muchas reglas y excepciones.', 'grammar', 'kielioppi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Tempo
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Tempo', 'das tempo', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el ritmo', 'el ritmo', 'Der Läufer hat ein beeindruckendes Tempo vorgelegt.', 'El corredor impuso un ritmo impresionante.', 'pace', 'tahti', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- eigen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('eigen', 'eigen', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'propio', 'propio', 'Jedes Kind hat seinen eigenen Lernstil.', 'Cada niño tiene su propio estilo de aprendizaje.', 'own', 'oma', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Eltern
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Eltern', 'die eltern', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'los padres', 'los padres', 'Meine Eltern kommen nächste Woche zu Besuch.', 'Mis padres vienen de visita la semana que viene.', 'parents', 'vanhemmat', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- sich Sorgen machen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('sich Sorgen machen', 'sich sorgen machen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'preocuparse', 'preocuparse', 'Mach dir keine Sorgen, alles wird gut!', '¡No te preocupes, todo saldrá bien!', 'to worry', 'huolestua', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- das Kind
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Kind', 'das kind', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el niño', 'el niño', 'Das Kind spielt jeden Tag im Garten nach der Schule.', 'El niño juega en el jardín todos los días después del colegio.', 'child', 'lapsi', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Zeit
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zeit', 'die zeit', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el tiempo', 'el tiempo', 'Ich habe heute leider keine Zeit für ein Treffen.', 'Hoy, por desgracia, no tengo tiempo para una reunión.', 'time', 'aika', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- der Bildschirm
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Bildschirm', 'der bildschirm', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'la pantalla', 'la pantalla', 'Der Bildschirm meines Laptops hat einen Kratzer.', 'La pantalla de mi portátil tiene un arañazo.', 'screen', 'näyttö', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- verbringen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('verbringen', 'verbringen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'pasar (tiempo)', 'pasar (tiempo)', 'Im Sommer verbringen wir unseren Urlaub am Meer.', 'En verano pasamos las vacaciones en la playa.', 'to spend (time)', 'viettää', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- die Zukunft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Zukunft', 'die zukunft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'el futuro', 'el futuro', 'Wir müssen schon jetzt an die Zukunft denken.', 'Tenemos que pensar en el futuro desde ahora.', 'future', 'tulevaisuus', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

  -- manche
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('manche', 'manche', NULL, 'Adjektiv')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;

  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi, level)
  VALUES (v_lemma_id, 'algunos', 'algunos', 'Manche Leute stehen jeden Tag um fünf Uhr morgens auf.', 'Algunas personas se levantan a las cinco de la mañana todos los días.', 'some', 'jotkut', 'A2')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET
    example = EXCLUDED.example,
    example_es = EXCLUDED.example_es,
    english = EXCLUDED.english,
    fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;

  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (180, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (181, v_meaning_id)
  ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
  VALUES (182, v_meaning_id)
  ON CONFLICT DO NOTHING;

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

END $$;

-- Update original 67 vocabulary entries with examples (DE/ES) and translations (EN/FI)

DO $$
BEGIN

-- anpassen (4364) - adaptar
UPDATE vocabulary_meanings SET
  example = 'Man kann die Helligkeit des Bildschirms an die Umgebung anpassen.',
  example_es = 'Se puede ajustar el brillo de la pantalla al entorno.',
  english = 'to adapt',
  fi = 'mukauttaa'
WHERE id = 4364;

-- aufdecken (4335) - descubrir
UPDATE vocabulary_meanings SET
  example = 'Die Journalisten haben einen großen Skandal aufgedeckt.',
  example_es = 'Los periodistas destaparon un gran escándalo.',
  english = 'to uncover',
  fi = 'paljastaa'
WHERE id = 4335;

-- autoritär (4316) - autoritario
UPDATE vocabulary_meanings SET
  example = 'In autoritären Staaten haben die Menschen wenig Freiheit.',
  example_es = 'En los estados autoritarios la gente tiene poca libertad.',
  english = 'authoritarian',
  fi = 'autoritaarinen'
WHERE id = 4316;

-- das Förderprogramm (4366)
UPDATE vocabulary_meanings SET
  example = 'Das Förderprogramm hilft jungen Unternehmen beim Start.',
  example_es = 'El programa de ayudas ayuda a las empresas jóvenes a arrancar.',
  english = 'funding program',
  fi = 'tukiohjelma'
WHERE id = 4366;

-- das Krankenhaus (4297)
UPDATE vocabulary_meanings SET
  example = 'Mein Onkel lag drei Wochen im Krankenhaus nach der Operation.',
  example_es = 'Mi tío estuvo tres semanas en el hospital tras la operación.',
  english = 'hospital',
  fi = 'sairaala'
WHERE id = 4297;

-- das Rechenzentrum (4323)
UPDATE vocabulary_meanings SET
  example = 'Das neue Rechenzentrum verbraucht so viel Strom wie eine Kleinstadt.',
  example_es = 'El nuevo centro de datos consume tanta electricidad como una ciudad pequeña.',
  english = 'data center',
  fi = 'datakeskus'
WHERE id = 4323;

-- das Startup (4339)
UPDATE vocabulary_meanings SET
  example = 'Das Startup hat in nur zwei Jahren hundert Mitarbeiter eingestellt.',
  example_es = 'La startup contrató a cien empleados en solo dos años.',
  english = 'startup',
  fi = 'startup-yritys'
WHERE id = 4339;

-- das Virus (4325)
UPDATE vocabulary_meanings SET
  example = 'Das Virus hat sich in wenigen Wochen über mehrere Länder verbreitet.',
  example_es = 'El virus se propagó por varios países en pocas semanas.',
  english = 'virus',
  fi = 'virus'
WHERE id = 4325;

-- das Warnsystem (4308)
UPDATE vocabulary_meanings SET
  example = 'Das Warnsystem hat die Bevölkerung rechtzeitig vor dem Erdbeben gewarnt.',
  example_es = 'El sistema de alerta avisó a la población a tiempo del terremoto.',
  english = 'warning system',
  fi = 'varoitusjärjestelmä'
WHERE id = 4308;

-- der Angreifer (4334)
UPDATE vocabulary_meanings SET
  example = 'Der Angreifer konnte das Passwort des Administrators erraten.',
  example_es = 'El atacante logró adivinar la contraseña del administrador.',
  english = 'attacker',
  fi = 'hyökkääjä'
WHERE id = 4334;

-- der Börsengang (4317)
UPDATE vocabulary_meanings SET
  example = 'Der Börsengang des Unternehmens war ein großer Erfolg.',
  example_es = 'La salida a bolsa de la empresa fue un gran éxito.',
  english = 'IPO',
  fi = 'listautuminen'
WHERE id = 4317;

-- der Datenschutz (4299)
UPDATE vocabulary_meanings SET
  example = 'In Europa gelten strenge Regeln für den Datenschutz.',
  example_es = 'En Europa hay normas estrictas de protección de datos.',
  english = 'data protection',
  fi = 'tietosuoja'
WHERE id = 4299;

-- der Erreger (4328)
UPDATE vocabulary_meanings SET
  example = 'Die Wissenschaftler haben den Erreger der Krankheit identifiziert.',
  example_es = 'Los científicos identificaron el patógeno de la enfermedad.',
  english = 'pathogen',
  fi = 'taudinaiheuttaja'
WHERE id = 4328;

-- der Fachkräftemangel (4342)
UPDATE vocabulary_meanings SET
  example = 'Wegen des Fachkräftemangels suchen viele Firmen im Ausland nach Personal.',
  example_es = 'Debido a la escasez de profesionales, muchas empresas buscan personal en el extranjero.',
  english = 'skilled worker shortage',
  fi = 'ammattitaitoisen työvoiman pula'
WHERE id = 4342;

-- der Gesetzentwurf (4338)
UPDATE vocabulary_meanings SET
  example = 'Der Gesetzentwurf wurde im Parlament heftig diskutiert.',
  example_es = 'El proyecto de ley fue debatido intensamente en el parlamento.',
  english = 'bill (draft law)',
  fi = 'lakiesitys'
WHERE id = 4338;

-- der Gewinn (4319)
UPDATE vocabulary_meanings SET
  example = 'Die Firma hat dieses Jahr zum ersten Mal einen Gewinn erzielt.',
  example_es = 'La empresa obtuvo beneficios por primera vez este año.',
  english = 'profit',
  fi = 'voitto'
WHERE id = 4319;

-- der Hurrikan (4347)
UPDATE vocabulary_meanings SET
  example = 'Der Hurrikan hat an der Küste schwere Schäden verursacht.',
  example_es = 'El huracán causó graves daños en la costa.',
  english = 'hurricane',
  fi = 'hurrikaani'
WHERE id = 4347;

-- der Investor (4321)
UPDATE vocabulary_meanings SET
  example = 'Ein Investor aus Japan hat zehn Millionen Euro in das Projekt gesteckt.',
  example_es = 'Un inversor de Japón invirtió diez millones de euros en el proyecto.',
  english = 'investor',
  fi = 'sijoittaja'
WHERE id = 4321;

-- der Katastrophenschutz (4351)
UPDATE vocabulary_meanings SET
  example = 'Der Katastrophenschutz verteilt Decken und Wasser an die Betroffenen.',
  example_es = 'Protección civil reparte mantas y agua a los afectados.',
  english = 'disaster relief',
  fi = 'pelastustoimi'
WHERE id = 4351;

-- der Klimawandel (4304)
UPDATE vocabulary_meanings SET
  example = 'Der Klimawandel führt zu immer häufigeren Überschwemmungen.',
  example_es = 'El cambio climático provoca inundaciones cada vez más frecuentes.',
  english = 'climate change',
  fi = 'ilmastonmuutos'
WHERE id = 4304;

-- der Lernfortschritt (4361)
UPDATE vocabulary_meanings SET
  example = 'Die Lehrerin dokumentiert den Lernfortschritt jedes Schülers.',
  example_es = 'La profesora documenta el progreso de aprendizaje de cada alumno.',
  english = 'learning progress',
  fi = 'oppimisen edistyminen'
WHERE id = 4361;

-- der Machtwechsel (4313)
UPDATE vocabulary_meanings SET
  example = 'Nach dem Machtwechsel hat das Land viele Reformen durchgeführt.',
  example_es = 'Tras el cambio de poder, el país llevó a cabo muchas reformas.',
  english = 'change of power',
  fi = 'vallanvaihto'
WHERE id = 4313;

-- der Quellcode (4333)
UPDATE vocabulary_meanings SET
  example = 'Der Quellcode des Programms ist öffentlich und kann von jedem gelesen werden.',
  example_es = 'El código fuente del programa es público y cualquiera puede leerlo.',
  english = 'source code',
  fi = 'lähdekoodi'
WHERE id = 4333;

-- der Umsatz (4318)
UPDATE vocabulary_meanings SET
  example = 'Der Umsatz der Firma ist im Vergleich zum Vorjahr um 30 Prozent gestiegen.',
  example_es = 'Los ingresos de la empresa subieron un 30 por ciento respecto al año anterior.',
  english = 'revenue',
  fi = 'liikevaihto'
WHERE id = 4318;

-- der Wohnraum (4355)
UPDATE vocabulary_meanings SET
  example = 'In Großstädten ist bezahlbarer Wohnraum immer schwerer zu finden.',
  example_es = 'En las grandes ciudades es cada vez más difícil encontrar vivienda asequible.',
  english = 'housing',
  fi = 'asuntotila'
WHERE id = 4355;

-- die Aktie (4322)
UPDATE vocabulary_meanings SET
  example = 'Die Aktie des Unternehmens ist heute um fünf Prozent gestiegen.',
  example_es = 'La acción de la empresa subió hoy un cinco por ciento.',
  english = 'share / stock',
  fi = 'osake'
WHERE id = 4322;

-- die Bewertung (4320)
UPDATE vocabulary_meanings SET
  example = 'Die Bewertung des Restaurants im Internet ist sehr positiv.',
  example_es = 'La valoración del restaurante en internet es muy positiva.',
  english = 'valuation',
  fi = 'arvostus'
WHERE id = 4320;

-- die Bildung (4360)
UPDATE vocabulary_meanings SET
  example = 'Bildung ist der Schlüssel zu einem besseren Leben.',
  example_es = 'La educación es la clave para una vida mejor.',
  english = 'education',
  fi = 'koulutus'
WHERE id = 4360;

-- die Demokratie (4315)
UPDATE vocabulary_meanings SET
  example = 'In einer Demokratie kann jeder Bürger frei seine Meinung sagen.',
  example_es = 'En una democracia cada ciudadano puede expresar libremente su opinión.',
  english = 'democracy',
  fi = 'demokratia'
WHERE id = 4315;

-- die Demonstration (4353)
UPDATE vocabulary_meanings SET
  example = 'An der Demonstration gegen den Krieg nahmen Tausende Menschen teil.',
  example_es = 'Miles de personas participaron en la manifestación contra la guerra.',
  english = 'demonstration',
  fi = 'mielenosoitus'
WHERE id = 4353;

-- die Diagnose (4296)
UPDATE vocabulary_meanings SET
  example = 'Nach vielen Tests stellte der Arzt endlich eine klare Diagnose.',
  example_es = 'Después de muchas pruebas, el médico por fin dio un diagnóstico claro.',
  english = 'diagnosis',
  fi = 'diagnoosi'
WHERE id = 4296;

-- die Evakuierung (4352)
UPDATE vocabulary_meanings SET
  example = 'Die Evakuierung des Gebäudes dauerte nur zehn Minuten.',
  example_es = 'La evacuación del edificio duró solo diez minutos.',
  english = 'evacuation',
  fi = 'evakuointi'
WHERE id = 4352;

-- die Fehlerquote (4301)
UPDATE vocabulary_meanings SET
  example = 'Die Fehlerquote bei der Produktion ist auf unter ein Prozent gesunken.',
  example_es = 'La tasa de error en la producción bajó a menos del uno por ciento.',
  english = 'error rate',
  fi = 'virheprosentti'
WHERE id = 4301;

-- die Gesundheitsbehörde (4329)
UPDATE vocabulary_meanings SET
  example = 'Die Gesundheitsbehörde hat eine Warnung vor verunreinigtem Trinkwasser herausgegeben.',
  example_es = 'La autoridad sanitaria emitió una advertencia sobre agua potable contaminada.',
  english = 'health authority',
  fi = 'terveysviranomainen'
WHERE id = 4329;

-- die Gewerkschaft (4354)
UPDATE vocabulary_meanings SET
  example = 'Die Gewerkschaft verhandelt mit dem Arbeitgeber über höhere Gehälter.',
  example_es = 'El sindicato negocia con el empleador salarios más altos.',
  english = 'trade union',
  fi = 'ammattiliitto'
WHERE id = 4354;

-- die Grünfläche (4306)
UPDATE vocabulary_meanings SET
  example = 'In unserem Viertel gibt es leider nur wenige Grünflächen.',
  example_es = 'En nuestro barrio hay por desgracia pocas zonas verdes.',
  english = 'green space',
  fi = 'viheralue'
WHERE id = 4306;

-- die Herausforderung (4345)
UPDATE vocabulary_meanings SET
  example = 'Die größte Herausforderung war, das Projekt pünktlich fertigzustellen.',
  example_es = 'El mayor desafío fue terminar el proyecto a tiempo.',
  english = 'challenge',
  fi = 'haaste'
WHERE id = 4345;

-- die Hitzewelle (4303)
UPDATE vocabulary_meanings SET
  example = 'Während der Hitzewelle blieben viele Geschäfte nachmittags geschlossen.',
  example_es = 'Durante la ola de calor muchas tiendas cerraron por la tarde.',
  english = 'heat wave',
  fi = 'helleaalto'
WHERE id = 4303;

-- die Kaufkraft (4359)
UPDATE vocabulary_meanings SET
  example = 'Die Kaufkraft der Bevölkerung sinkt, wenn die Preise steigen.',
  example_es = 'El poder adquisitivo de la población baja cuando suben los precios.',
  english = 'purchasing power',
  fi = 'ostovoima'
WHERE id = 4359;

-- die Kluft (4365)
UPDATE vocabulary_meanings SET
  example = 'Die Kluft zwischen Arm und Reich wird in vielen Ländern größer.',
  example_es = 'La brecha entre ricos y pobres crece en muchos países.',
  english = 'gap / divide',
  fi = 'kuilu'
WHERE id = 4365;

-- die Korruption (4311)
UPDATE vocabulary_meanings SET
  example = 'Korruption ist eines der größten Probleme in vielen Entwicklungsländern.',
  example_es = 'La corrupción es uno de los mayores problemas en muchos países en desarrollo.',
  english = 'corruption',
  fi = 'korruptio'
WHERE id = 4311;

-- die Lebenshaltungskosten (4358)
UPDATE vocabulary_meanings SET
  example = 'Die Lebenshaltungskosten in München sind höher als in Leipzig.',
  example_es = 'El coste de vida en Múnich es más alto que en Leipzig.',
  english = 'cost of living',
  fi = 'elinkustannukset'
WHERE id = 4358;

-- die Neugründung (4341)
UPDATE vocabulary_meanings SET
  example = 'Die Zahl der Neugründungen ist in diesem Quartal deutlich gestiegen.',
  example_es = 'El número de nuevas empresas ha aumentado notablemente este trimestre.',
  english = 'new business',
  fi = 'uusi yritys'
WHERE id = 4341;

-- die Pressefreiheit (4312)
UPDATE vocabulary_meanings SET
  example = 'Ohne Pressefreiheit können Journalisten nicht unabhängig berichten.',
  example_es = 'Sin libertad de prensa los periodistas no pueden informar con independencia.',
  english = 'press freedom',
  fi = 'lehdistönvapaus'
WHERE id = 4312;

-- die Röntgenaufnahme (4298)
UPDATE vocabulary_meanings SET
  example = 'Die Röntgenaufnahme zeigt, dass der Knochen gebrochen ist.',
  example_es = 'La radiografía muestra que el hueso está roto.',
  english = 'X-ray',
  fi = 'röntgenkuva'
WHERE id = 4298;

-- die Schwachstelle (4336)
UPDATE vocabulary_meanings SET
  example = 'Die Ingenieure haben eine Schwachstelle in der Brücke entdeckt.',
  example_es = 'Los ingenieros descubrieron un punto débil en el puente.',
  english = 'weak point',
  fi = 'heikkous'
WHERE id = 4336;

-- die Sicherheitslücke (4332)
UPDATE vocabulary_meanings SET
  example = 'Durch eine Sicherheitslücke konnten Daten von Millionen Nutzern gestohlen werden.',
  example_es = 'A través de una vulnerabilidad se pudieron robar datos de millones de usuarios.',
  english = 'security vulnerability',
  fi = 'tietoturva-aukko'
WHERE id = 4332;

-- die Sterblichkeit (4305)
UPDATE vocabulary_meanings SET
  example = 'Die Sterblichkeit bei dieser Krankheit ist bei älteren Menschen höher.',
  example_es = 'La mortalidad por esta enfermedad es mayor entre las personas mayores.',
  english = 'mortality',
  fi = 'kuolleisuus'
WHERE id = 4305;

-- die Treibhausgase (4309)
UPDATE vocabulary_meanings SET
  example = 'Fabriken und Autos stoßen große Mengen an Treibhausgasen aus.',
  example_es = 'Las fábricas y los coches emiten grandes cantidades de gases de efecto invernadero.',
  english = 'greenhouse gases',
  fi = 'kasvihuonekaasut'
WHERE id = 4309;

-- die Übertragung (4327)
UPDATE vocabulary_meanings SET
  example = 'Die Übertragung des Spiels kann man live im Fernsehen sehen.',
  example_es = 'La transmisión del partido se puede ver en directo por televisión.',
  english = 'transmission',
  fi = 'tartunta'
WHERE id = 4327;

-- die Überwachung (4331)
UPDATE vocabulary_meanings SET
  example = 'Die Überwachung des Verkehrs erfolgt durch Kameras an der Autobahn.',
  example_es = 'La vigilancia del tráfico se realiza mediante cámaras en la autopista.',
  english = 'surveillance',
  fi = 'valvonta'
WHERE id = 4331;

-- die Ungleichheit (4356)
UPDATE vocabulary_meanings SET
  example = 'Die Ungleichheit beim Zugang zu Bildung ist ein globales Problem.',
  example_es = 'La desigualdad en el acceso a la educación es un problema global.',
  english = 'inequality',
  fi = 'eriarvoisuus'
WHERE id = 4356;

-- die Vorhersage (4346)
UPDATE vocabulary_meanings SET
  example = 'Die Vorhersage für morgen sagt Regen und kühle Temperaturen an.',
  example_es = 'La predicción para mañana anuncia lluvia y temperaturas frescas.',
  english = 'forecast',
  fi = 'ennuste'
WHERE id = 4346;

-- die Wahl (4310)
UPDATE vocabulary_meanings SET
  example = 'Bei der letzten Wahl haben über 80 Prozent der Bürger abgestimmt.',
  example_es = 'En las últimas elecciones votaron más del 80 por ciento de los ciudadanos.',
  english = 'election',
  fi = 'vaali'
WHERE id = 4310;

-- die Wettbewerbsfähigkeit (4344)
UPDATE vocabulary_meanings SET
  example = 'Innovation ist wichtig für die Wettbewerbsfähigkeit eines Landes.',
  example_es = 'La innovación es importante para la competitividad de un país.',
  english = 'competitiveness',
  fi = 'kilpailukyky'
WHERE id = 4344;

-- die Wissenslücke (4363)
UPDATE vocabulary_meanings SET
  example = 'Der Test hat gezeigt, dass die Schüler noch Wissenslücken in Mathematik haben.',
  example_es = 'El examen mostró que los alumnos aún tienen lagunas de conocimiento en matemáticas.',
  english = 'knowledge gap',
  fi = 'tietoaukko'
WHERE id = 4363;

-- die Zugbahn (4348)
UPDATE vocabulary_meanings SET
  example = 'Meteorologen berechnen die Zugbahn des Sturms mit Computermodellen.',
  example_es = 'Los meteorólogos calculan la trayectoria de la tormenta con modelos informáticos.',
  english = 'trajectory / path',
  fi = 'reitti'
WHERE id = 4348;

-- erkennen (4300)
UPDATE vocabulary_meanings SET
  example = 'Am Akzent kann man erkennen, woher jemand kommt.',
  example_es = 'Por el acento se puede detectar de dónde es alguien.',
  english = 'to detect / recognize',
  fi = 'tunnistaa'
WHERE id = 4300;

-- fordern (4357)
UPDATE vocabulary_meanings SET
  example = 'Die Eltern fordern mehr Sicherheit auf dem Schulweg.',
  example_es = 'Los padres exigen más seguridad en el camino al colegio.',
  english = 'to demand',
  fi = 'vaatia'
WHERE id = 4357;

-- gefährdet (4307)
UPDATE vocabulary_meanings SET
  example = 'Viele Tierarten sind durch den Verlust ihres Lebensraums gefährdet.',
  example_es = 'Muchas especies animales están amenazadas por la pérdida de su hábitat.',
  english = 'endangered',
  fi = 'uhanalainen'
WHERE id = 4307;

-- gründen (4343)
UPDATE vocabulary_meanings SET
  example = 'Sie hat nach dem Studium ihre eigene Firma gegründet.',
  example_es = 'Fundó su propia empresa después de la carrera.',
  english = 'to found',
  fi = 'perustaa'
WHERE id = 4343;

-- nachhaltig (4324)
UPDATE vocabulary_meanings SET
  example = 'Wir müssen nachhaltiger mit unseren Ressourcen umgehen.',
  example_es = 'Debemos gestionar nuestros recursos de forma más sostenible.',
  english = 'sustainable',
  fi = 'kestävä'
WHERE id = 4324;

-- sich anstecken (4326)
UPDATE vocabulary_meanings SET
  example = 'Im Winter kann man sich leicht mit einer Erkältung anstecken.',
  example_es = 'En invierno es fácil contagiarse de un resfriado.',
  english = 'to get infected',
  fi = 'tartuttautua'
WHERE id = 4326;

-- unterstützen (4302)
UPDATE vocabulary_meanings SET
  example = 'Die Organisation unterstützt Familien in schwierigen Situationen.',
  example_es = 'La organización apoya a familias en situaciones difíciles.',
  english = 'to support',
  fi = 'tukea'
WHERE id = 4302;

-- verarbeiten (4350)
UPDATE vocabulary_meanings SET
  example = 'Die Fabrik verarbeitet täglich 500 Tonnen Rohstoffe.',
  example_es = 'La fábrica procesa 500 toneladas de materias primas al día.',
  english = 'to process',
  fi = 'käsitellä'
WHERE id = 4350;

-- verschärfen (4337)
UPDATE vocabulary_meanings SET
  example = 'Die Regierung will die Strafen für Steuerhinterziehung verschärfen.',
  example_es = 'El gobierno quiere endurecer las penas por evasión fiscal.',
  english = 'to tighten',
  fi = 'tiukentaa'
WHERE id = 4337;

-- zoonotisch (4330)
UPDATE vocabulary_meanings SET
  example = 'Zoonotische Krankheiten können von Tieren auf Menschen übertragen werden.',
  example_es = 'Las enfermedades zoonóticas pueden transmitirse de animales a personas.',
  english = 'zoonotic',
  fi = 'zoonoottinen'
WHERE id = 4330;

-- protestieren (missing from list but in original 66)
UPDATE vocabulary_meanings SET
  example = 'Die Studenten protestieren gegen die Erhöhung der Studiengebühren.',
  example_es = 'Los estudiantes protestan contra la subida de las tasas universitarias.',
  english = 'to protest',
  fi = 'protestoida'
WHERE id = (SELECT id FROM vocabulary_meanings WHERE normalized_spanish = 'protestar' AND example IS NULL LIMIT 1);

END $$;

-- Add EN/FI localizations for original entries

INSERT INTO imk_meaning_localizations (meaning_id, language, term)
SELECT vm.id, 'en', vm.english
FROM vocabulary_meanings vm
JOIN text_version_meanings tvm ON tvm.meaning_id = vm.id
JOIN text_versions tv ON tv.id = tvm.text_version_id
WHERE tv.text_id BETWEEN 43 AND 52
AND vm.english IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM imk_meaning_localizations l WHERE l.meaning_id = vm.id AND l.language = 'en')
GROUP BY vm.id, vm.english
ON CONFLICT (meaning_id, language) DO NOTHING;

INSERT INTO imk_meaning_localizations (meaning_id, language, term)
SELECT vm.id, 'fi', vm.fi
FROM vocabulary_meanings vm
JOIN text_version_meanings tvm ON tvm.meaning_id = vm.id
JOIN text_versions tv ON tv.id = tvm.text_version_id
WHERE tv.text_id BETWEEN 43 AND 52
AND vm.fi IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM imk_meaning_localizations l WHERE l.meaning_id = vm.id AND l.language = 'fi')
GROUP BY vm.id, vm.fi
ON CONFLICT (meaning_id, language) DO NOTHING;
