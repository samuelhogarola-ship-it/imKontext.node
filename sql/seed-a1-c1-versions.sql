-- seed-a1-c1-versions.sql
-- Adds A1 versions for ALL texts (5-24, 29-37, 43-57) and C1 versions for texts 43-57
-- Prerequisite: migration 20261029_add_a1_level.sql (CHECK constraint allows A1)
-- A1 vocabulary density target: ~45%

-- ============================================================
-- PART 1: A1 VERSIONS FOR TEXTS 5-24 (legacy texts)
-- ============================================================

DO $$
DECLARE
  v_id bigint;
BEGIN
  -- TEXT 5: Es ist sehr heiß in Deutschland
  INSERT INTO text_versions (text_id, level, content) VALUES (5, 'A1',
    'Es ist heiß in Deutschland. Die Sonne scheint. Es sind 38 Grad. Das ist sehr warm. Die Menschen trinken Wasser. Alte Menschen bleiben zu Hause. In drei Tagen kommt Regen. Das ist gut.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 5 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Hace calor en Alemania. El sol brilla. Hay 38 grados. Eso es muy caliente. La gente bebe agua. Las personas mayores se quedan en casa. En tres días viene lluvia. Eso es bueno.', true),
    (v_id, 'en', 'It is hot in Germany. The sun is shining. It is 38 degrees. That is very warm. People drink water. Old people stay at home. In three days rain comes. That is good.', true),
    (v_id, 'fi', 'Saksassa on kuuma. Aurinko paistaa. On 38 astetta. Se on hyvin lämmin. Ihmiset juovat vettä. Vanhat ihmiset pysyvät kotona. Kolmen päivän päästä tulee sadetta. Se on hyvä.', true),
    (v_id, 'it', 'Fa caldo in Germania. Il sole splende. Ci sono 38 gradi. Fa molto caldo. Le persone bevono acqua. Le persone anziane restano a casa. Tra tre giorni viene la pioggia. Questo è bene.', true),
    (v_id, 'pt', 'Está calor na Alemanha. O sol brilha. Estão 38 graus. Isso é muito quente. As pessoas bebem água. Os idosos ficam em casa. Em três dias vem chuva. Isso é bom.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 6: Der Zug kommt zu spät – schon wieder
  INSERT INTO text_versions (text_id, level, content) VALUES (6, 'A1',
    'Die Züge in Deutschland kommen oft zu spät. Viele Menschen sind sauer. Die Gleise sind alt. Die Reparatur dauert lange. Die Deutsche Bahn braucht mehr Geld. Die Fahrgäste warten.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 6 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Los trenes en Alemania llegan tarde a menudo. Mucha gente está enfadada. Las vías son viejas. La reparación dura mucho. Deutsche Bahn necesita más dinero. Los pasajeros esperan.', true),
    (v_id, 'en', 'Trains in Germany are often late. Many people are angry. The tracks are old. The repair takes long. Deutsche Bahn needs more money. The passengers wait.', true),
    (v_id, 'fi', 'Junat Saksassa ovat usein myöhässä. Monet ihmiset ovat vihaisia. Raiteet ovat vanhoja. Korjaus kestää kauan. Deutsche Bahn tarvitsee lisää rahaa. Matkustajat odottavat.', true),
    (v_id, 'it', 'I treni in Germania arrivano spesso in ritardo. Molte persone sono arrabbiate. I binari sono vecchi. La riparazione dura molto. Deutsche Bahn ha bisogno di più soldi. I passeggeri aspettano.', true),
    (v_id, 'pt', 'Os trens na Alemanha chegam frequentemente atrasados. Muitas pessoas estão zangadas. Os trilhos são velhos. O reparo demora muito. A Deutsche Bahn precisa de mais dinheiro. Os passageiros esperam.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 7: Die Bienen sterben
  INSERT INTO text_versions (text_id, level, content) VALUES (7, 'A1',
    'In Deutschland gibt es weniger Bienen. Bienen sind wichtig. Sie helfen Blumen wachsen. Gift tötet die Bienen. Der Klimawandel ist auch ein Problem. Menschen pflanzen Blumen für die Bienen.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 7 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Alemania hay menos abejas. Las abejas son importantes. Ayudan a las flores a crecer. El veneno mata a las abejas. El cambio climático también es un problema. La gente planta flores para las abejas.', true),
    (v_id, 'en', 'In Germany there are fewer bees. Bees are important. They help flowers grow. Poison kills the bees. Climate change is also a problem. People plant flowers for the bees.', true),
    (v_id, 'fi', 'Saksassa on vähemmän mehiläisiä. Mehiläiset ovat tärkeitä. Ne auttavat kukkia kasvamaan. Myrkky tappaa mehiläisiä. Ilmastonmuutos on myös ongelma. Ihmiset istuttavat kukkia mehiläisille.', true),
    (v_id, 'it', 'In Germania ci sono meno api. Le api sono importanti. Aiutano i fiori a crescere. Il veleno uccide le api. Il cambiamento climatico è anche un problema. Le persone piantano fiori per le api.', true),
    (v_id, 'pt', 'Na Alemanha há menos abelhas. As abelhas são importantes. Elas ajudam as flores a crescer. O veneno mata as abelhas. A mudança climática também é um problema. As pessoas plantam flores para as abelhas.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 8: In deutschen Städten gibt es zu wenige Wohnungen
  INSERT INTO text_versions (text_id, level, content) VALUES (8, 'A1',
    'In Deutschland ist es schwer, eine Wohnung zu finden. In Berlin und München gibt es zu wenige Wohnungen. Die Miete ist teuer. Studenten und Familien suchen lange. Die Regierung will mehr Häuser bauen.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 8 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Alemania es difícil encontrar un piso. En Berlín y Múnich hay muy pocos pisos. El alquiler es caro. Estudiantes y familias buscan mucho tiempo. El gobierno quiere construir más casas.', true),
    (v_id, 'en', 'In Germany it is hard to find a flat. In Berlin and Munich there are too few flats. The rent is expensive. Students and families search for a long time. The government wants to build more houses.', true),
    (v_id, 'fi', 'Saksassa on vaikea löytää asuntoa. Berliinissä ja Münchenissä on liian vähän asuntoja. Vuokra on kallis. Opiskelijat ja perheet etsivät kauan. Hallitus haluaa rakentaa lisää taloja.', true),
    (v_id, 'it', 'In Germania è difficile trovare un appartamento. A Berlino e Monaco ci sono troppo pochi appartamenti. L''affitto è caro. Studenti e famiglie cercano a lungo. Il governo vuole costruire più case.', true),
    (v_id, 'pt', 'Na Alemanha é difícil encontrar um apartamento. Em Berlim e Munique há poucos apartamentos. O aluguel é caro. Estudantes e famílias procuram por muito tempo. O governo quer construir mais casas.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 9: Der DAX ist sehr hoch
  INSERT INTO text_versions (text_id, level, content) VALUES (9, 'A1',
    'Der DAX zeigt die Wirtschaft in Deutschland. Er zeigt die 40 größten Firmen. Der DAX ist gerade sehr hoch. Die Firmen verdienen viel Geld. Aber das Essen ist teuer. Nicht alle Menschen haben genug Geld.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 9 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'El DAX muestra la economía en Alemania. Muestra las 40 empresas más grandes. El DAX está muy alto ahora. Las empresas ganan mucho dinero. Pero la comida es cara. No todas las personas tienen suficiente dinero.', true),
    (v_id, 'en', 'The DAX shows the economy in Germany. It shows the 40 biggest companies. The DAX is very high right now. The companies earn a lot of money. But food is expensive. Not all people have enough money.', true),
    (v_id, 'fi', 'DAX näyttää Saksan talouden. Se näyttää 40 suurinta yritystä. DAX on nyt hyvin korkea. Yritykset ansaitsevat paljon rahaa. Mutta ruoka on kallista. Kaikilla ihmisillä ei ole tarpeeksi rahaa.', true),
    (v_id, 'it', 'Il DAX mostra l''economia in Germania. Mostra le 40 aziende più grandi. Il DAX è molto alto ora. Le aziende guadagnano molti soldi. Ma il cibo è caro. Non tutte le persone hanno abbastanza soldi.', true),
    (v_id, 'pt', 'O DAX mostra a economia na Alemanha. Mostra as 40 maiores empresas. O DAX está muito alto agora. As empresas ganham muito dinheiro. Mas a comida é cara. Nem todas as pessoas têm dinheiro suficiente.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 10: SAP: Das wertvollste Unternehmen
  INSERT INTO text_versions (text_id, level, content) VALUES (10, 'A1',
    'SAP ist eine große Firma in Deutschland. SAP macht Software für andere Firmen. Die Firma kommt aus Walldorf. SAP ist sehr viel Geld wert. Viele Firmen auf der Welt benutzen SAP.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 10 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'SAP es una gran empresa en Alemania. SAP hace software para otras empresas. La empresa viene de Walldorf. SAP vale mucho dinero. Muchas empresas en el mundo usan SAP.', true),
    (v_id, 'en', 'SAP is a big company in Germany. SAP makes software for other companies. The company comes from Walldorf. SAP is worth a lot of money. Many companies in the world use SAP.', true),
    (v_id, 'fi', 'SAP on suuri yritys Saksassa. SAP tekee ohjelmistoja muille yrityksille. Yritys on Walldorfista. SAP on hyvin arvokas. Monet yritykset maailmassa käyttävät SAP:ia.', true),
    (v_id, 'it', 'SAP è una grande azienda in Germania. SAP fa software per altre aziende. L''azienda viene da Walldorf. SAP vale molti soldi. Molte aziende nel mondo usano SAP.', true),
    (v_id, 'pt', 'SAP é uma grande empresa na Alemanha. SAP faz software para outras empresas. A empresa vem de Walldorf. SAP vale muito dinheiro. Muitas empresas no mundo usam SAP.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 11: Anthropic geht an die Börse
  INSERT INTO text_versions (text_id, level, content) VALUES (11, 'A1',
    'Anthropic ist eine Firma aus den USA. Sie macht künstliche Intelligenz. Ihr Produkt heißt Claude. Anthropic will an die Börse gehen. Dann kann man Aktien kaufen. KI ist gerade sehr beliebt.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 11 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Anthropic es una empresa de EE.UU. Hace inteligencia artificial. Su producto se llama Claude. Anthropic quiere salir a bolsa. Entonces se pueden comprar acciones. La IA es muy popular ahora.', true),
    (v_id, 'en', 'Anthropic is a company from the USA. It makes artificial intelligence. Its product is called Claude. Anthropic wants to go public. Then you can buy shares. AI is very popular right now.', true),
    (v_id, 'fi', 'Anthropic on yhdysvaltalainen yritys. Se tekee tekoälyä. Sen tuote on nimeltään Claude. Anthropic haluaa pörssiin. Sitten voi ostaa osakkeita. Tekoäly on nyt hyvin suosittua.', true),
    (v_id, 'it', 'Anthropic è un''azienda degli USA. Fa intelligenza artificiale. Il suo prodotto si chiama Claude. Anthropic vuole andare in borsa. Allora si possono comprare azioni. L''IA è molto popolare ora.', true),
    (v_id, 'pt', 'Anthropic é uma empresa dos EUA. Faz inteligência artificial. Seu produto se chama Claude. Anthropic quer entrar na bolsa. Então pode-se comprar ações. A IA é muito popular agora.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 12: Rüstungsaktien steigen
  INSERT INTO text_versions (text_id, level, content) VALUES (12, 'A1',
    'Firmen machen Waffen. Diese Firmen heißen Rüstungsunternehmen. Ihre Aktien steigen. Die Länder in Europa kaufen mehr Waffen. Das kostet viel Geld. Manche Menschen finden das schlecht.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 12 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Las empresas fabrican armas. Estas empresas se llaman empresas de defensa. Sus acciones suben. Los países de Europa compran más armas. Eso cuesta mucho dinero. Algunas personas piensan que eso es malo.', true),
    (v_id, 'en', 'Companies make weapons. These companies are called defence companies. Their shares are rising. The countries in Europe buy more weapons. That costs a lot of money. Some people think that is bad.', true),
    (v_id, 'fi', 'Yritykset tekevät aseita. Näitä yrityksiä kutsutaan puolustusyhtiöiksi. Niiden osakkeet nousevat. Euroopan maat ostavat enemmän aseita. Se maksaa paljon rahaa. Jotkut ihmiset pitävät sitä huonona.', true),
    (v_id, 'it', 'Le aziende fabbricano armi. Queste aziende si chiamano aziende della difesa. Le loro azioni salgono. I paesi in Europa comprano più armi. Questo costa molti soldi. Alcune persone pensano che sia sbagliato.', true),
    (v_id, 'pt', 'Empresas fabricam armas. Essas empresas chamam-se empresas de defesa. Suas ações sobem. Os países da Europa compram mais armas. Isso custa muito dinheiro. Algumas pessoas acham isso ruim.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 13: Interrail
  INSERT INTO text_versions (text_id, level, content) VALUES (13, 'A1',
    'Interrail ist ein Zugticket für Europa. Man kann in vielen Ländern Zug fahren. Es ist günstig. Junge Menschen reisen gern mit Interrail. Man kann Paris und Rom besuchen. Der Zug ist gut für die Umwelt.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 13 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Interrail es un billete de tren para Europa. Se puede viajar en tren por muchos países. Es barato. Los jóvenes les gusta viajar con Interrail. Se puede visitar París y Roma. El tren es bueno para el medio ambiente.', true),
    (v_id, 'en', 'Interrail is a train ticket for Europe. You can take the train in many countries. It is cheap. Young people like to travel with Interrail. You can visit Paris and Rome. The train is good for the environment.', true),
    (v_id, 'fi', 'Interrail on junalippu Eurooppaan. Sillä voi matkustaa junalla monissa maissa. Se on edullinen. Nuoret matkustavat mielellään Interraililla. Pariisiin ja Roomaan voi matkustaa. Juna on hyvä ympäristölle.', true),
    (v_id, 'it', 'Interrail è un biglietto del treno per l''Europa. Si può viaggiare in treno in molti paesi. È economico. I giovani amano viaggiare con Interrail. Si possono visitare Parigi e Roma. Il treno è buono per l''ambiente.', true),
    (v_id, 'pt', 'Interrail é um bilhete de trem para a Europa. Pode-se viajar de trem em muitos países. É barato. Os jovens gostam de viajar com Interrail. Pode-se visitar Paris e Roma. O trem é bom para o meio ambiente.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 14: Surfen an der Ostsee
  INSERT INTO text_versions (text_id, level, content) VALUES (14, 'A1',
    'An der Ostsee gibt es Surfcamps. Kinder und Jugendliche lernen dort surfen. Die Ostsee ist ruhig. Das ist gut für Anfänger. Im Sommer kommen viele Jugendliche. Sie lernen Freunde kennen.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 14 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En el mar Báltico hay campamentos de surf. Los niños y jóvenes aprenden a surfear allí. El mar Báltico es tranquilo. Eso es bueno para principiantes. En verano vienen muchos jóvenes. Hacen nuevos amigos.', true),
    (v_id, 'en', 'There are surf camps at the Baltic Sea. Children and young people learn to surf there. The Baltic Sea is calm. That is good for beginners. In summer many young people come. They make new friends.', true),
    (v_id, 'fi', 'Itämerellä on surffausleirejä. Lapset ja nuoret oppivat siellä surffaamaan. Itämeri on rauhallinen. Se on hyvä aloittelijoille. Kesällä tulee paljon nuoria. He saavat uusia ystäviä.', true),
    (v_id, 'it', 'Al Mar Baltico ci sono campi di surf. Bambini e giovani imparano a fare surf lì. Il Mar Baltico è calmo. Questo è buono per i principianti. In estate vengono molti giovani. Fanno nuovi amici.', true),
    (v_id, 'pt', 'No Mar Báltico há campos de surf. Crianças e jovens aprendem a surfar lá. O Mar Báltico é calmo. Isso é bom para iniciantes. No verão vêm muitos jovens. Eles fazem novos amigos.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 15: Das Deutschlandticket
  INSERT INTO text_versions (text_id, level, content) VALUES (15, 'A1',
    'Das Deutschlandticket kostet 58 Euro im Monat. Man kann in ganz Deutschland Bus und Bahn fahren. Es ist günstig. Junge Menschen benutzen das Ticket gern. Man kann es jeden Monat kaufen und kündigen.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 15 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'El Deutschlandticket cuesta 58 euros al mes. Se puede viajar en autobús y tren por toda Alemania. Es barato. A los jóvenes les gusta usar el billete. Se puede comprar y cancelar cada mes.', true),
    (v_id, 'en', 'The Deutschlandticket costs 58 euros a month. You can take buses and trains in all of Germany. It is cheap. Young people like to use the ticket. You can buy and cancel it every month.', true),
    (v_id, 'fi', 'Deutschlandticket maksaa 58 euroa kuukaudessa. Sillä voi matkustaa bussilla ja junalla koko Saksassa. Se on edullinen. Nuoret käyttävät lippua mielellään. Sen voi ostaa ja perua joka kuukausi.', true),
    (v_id, 'it', 'Il Deutschlandticket costa 58 euro al mese. Si può viaggiare in autobus e treno in tutta la Germania. È economico. I giovani usano volentieri il biglietto. Si può comprare e disdire ogni mese.', true),
    (v_id, 'pt', 'O Deutschlandticket custa 58 euros por mês. Pode-se viajar de ônibus e trem por toda a Alemanha. É barato. Os jovens gostam de usar o bilhete. Pode-se comprar e cancelar todo mês.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 16: Sommerjob im Feriencamp
  INSERT INTO text_versions (text_id, level, content) VALUES (16, 'A1',
    'Im Sommer arbeiten junge Menschen in Feriencamps. Sie betreuen Kinder. Man verdient nicht viel Geld. Aber man bekommt Essen und ein Bett. Man muss 18 Jahre alt sein. Es macht Spaß.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 16 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En verano los jóvenes trabajan en campamentos de vacaciones. Cuidan a los niños. No se gana mucho dinero. Pero se recibe comida y una cama. Hay que tener 18 años. Es divertido.', true),
    (v_id, 'en', 'In summer young people work in holiday camps. They look after children. You do not earn much money. But you get food and a bed. You must be 18 years old. It is fun.', true),
    (v_id, 'fi', 'Kesällä nuoret työskentelevät lomaleireillä. He hoitavat lapsia. Rahaa ei ansaita paljon. Mutta saa ruokaa ja sängyn. Pitää olla 18-vuotias. Se on hauskaa.', true),
    (v_id, 'it', 'In estate i giovani lavorano nei campi vacanza. Si occupano dei bambini. Non si guadagna molto. Ma si riceve cibo e un letto. Bisogna avere 18 anni. È divertente.', true),
    (v_id, 'pt', 'No verão os jovens trabalham em acampamentos de férias. Cuidam das crianças. Não se ganha muito dinheiro. Mas recebe-se comida e uma cama. É preciso ter 18 anos. É divertido.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 17: Eurovision Song Contest 2026
  INSERT INTO text_versions (text_id, level, content) VALUES (17, 'A1',
    'Der Eurovision ist ein Musikwettbewerb. Viele Länder singen. Das Publikum wählt den Gewinner. Dieses Jahr ist der Eurovision in Wien. Millionen Menschen schauen im Fernsehen. Es ist ein großes Fest.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 17 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Eurovisión es un concurso de música. Muchos países cantan. El público elige al ganador. Este año Eurovisión es en Viena. Millones de personas miran por televisión. Es una gran fiesta.', true),
    (v_id, 'en', 'Eurovision is a music competition. Many countries sing. The audience chooses the winner. This year Eurovision is in Vienna. Millions of people watch on television. It is a big party.', true),
    (v_id, 'fi', 'Eurovision on musiikkikilpailu. Monet maat laulavat. Yleisö valitsee voittajan. Tänä vuonna Eurovision on Wienissä. Miljoonat ihmiset katsovat televisiosta. Se on suuri juhla.', true),
    (v_id, 'it', 'L''Eurovision è una gara musicale. Molti paesi cantano. Il pubblico sceglie il vincitore. Quest''anno l''Eurovision è a Vienna. Milioni di persone guardano in televisione. È una grande festa.', true),
    (v_id, 'pt', 'O Eurovision é uma competição musical. Muitos países cantam. O público escolhe o vencedor. Este ano o Eurovision é em Viena. Milhões de pessoas assistem na televisão. É uma grande festa.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 18: Enhanced Games
  INSERT INTO text_versions (text_id, level, content) VALUES (18, 'A1',
    'In Las Vegas gibt es neue Spiele. Sie heißen Enhanced Games. Die Sportler dürfen Doping benutzen. Das ist bei anderen Spielen verboten. Viele Menschen finden das falsch. Andere finden es interessant.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 18 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Las Vegas hay nuevos juegos. Se llaman Enhanced Games. Los deportistas pueden usar dopaje. Eso está prohibido en otros juegos. Muchas personas piensan que está mal. Otras lo encuentran interesante.', true),
    (v_id, 'en', 'In Las Vegas there are new games. They are called Enhanced Games. The athletes may use doping. That is forbidden at other games. Many people think it is wrong. Others find it interesting.', true),
    (v_id, 'fi', 'Las Vegasissa on uudet kisat. Niiden nimi on Enhanced Games. Urheilijat saavat käyttää dopingia. Se on kiellettyä muissa kisoissa. Monet ihmiset pitävät sitä vääränä. Toiset pitävät sitä kiinnostavana.', true),
    (v_id, 'it', 'A Las Vegas ci sono nuovi giochi. Si chiamano Enhanced Games. Gli atleti possono usare il doping. Questo è vietato in altri giochi. Molte persone pensano che sia sbagliato. Altre lo trovano interessante.', true),
    (v_id, 'pt', 'Em Las Vegas há novos jogos. Chamam-se Enhanced Games. Os atletas podem usar doping. Isso é proibido em outros jogos. Muitas pessoas acham isso errado. Outras acham interessante.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 19: Indigene Menschen in Brasilien
  INSERT INTO text_versions (text_id, level, content) VALUES (19, 'A1',
    'In Brasilien leben indigene Menschen. Sie leben dort seit langer Zeit. Jetzt protestieren sie. Sie wollen ihr Land behalten. Der Staat gibt ihnen das Land oft nicht. Der Protest heißt Freies Land Camp.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 19 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Brasil viven personas indígenas. Viven allí desde hace mucho tiempo. Ahora protestan. Quieren quedarse con su tierra. El estado muchas veces no les da la tierra. La protesta se llama Campamento Tierra Libre.', true),
    (v_id, 'en', 'In Brazil indigenous people live. They have lived there for a long time. Now they are protesting. They want to keep their land. The state often does not give them the land. The protest is called Free Land Camp.', true),
    (v_id, 'fi', 'Brasiliassa asuu alkuperäiskansoja. He ovat asuneet siellä kauan. Nyt he protestoivat. He haluavat pitää maansa. Valtio ei usein anna heille maata. Protesti on nimeltään Vapaa maa -leiri.', true),
    (v_id, 'it', 'In Brasile vivono popoli indigeni. Vivono lì da molto tempo. Ora protestano. Vogliono tenere la loro terra. Lo stato spesso non gli dà la terra. La protesta si chiama Campo Terra Libera.', true),
    (v_id, 'pt', 'No Brasil vivem povos indígenas. Eles vivem lá há muito tempo. Agora protestam. Querem manter sua terra. O estado muitas vezes não lhes dá a terra. O protesto se chama Acampamento Terra Livre.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 20: BTS ist zurück
  INSERT INTO text_versions (text_id, level, content) VALUES (20, 'A1',
    'BTS ist eine Musikgruppe aus Korea. Sie sind sehr bekannt. Sie haben viele Fans. Die Fans heißen ARMY. BTS hat ein neues Album. Sie machen eine Welttournee. K-Pop ist sehr populär.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 20 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'BTS es un grupo de música de Corea. Son muy famosos. Tienen muchos fans. Los fans se llaman ARMY. BTS tiene un nuevo álbum. Hacen una gira mundial. El K-Pop es muy popular.', true),
    (v_id, 'en', 'BTS is a music group from Korea. They are very famous. They have many fans. The fans are called ARMY. BTS has a new album. They are doing a world tour. K-Pop is very popular.', true),
    (v_id, 'fi', 'BTS on musiikkiryhmä Koreasta. He ovat hyvin kuuluisia. Heillä on paljon faneja. Faneja kutsutaan nimellä ARMY. BTS:llä on uusi albumi. He tekevät maailmankiertueen. K-Pop on hyvin suosittua.', true),
    (v_id, 'it', 'BTS è un gruppo musicale dalla Corea. Sono molto famosi. Hanno molti fan. I fan si chiamano ARMY. BTS ha un nuovo album. Fanno un tour mondiale. Il K-Pop è molto popolare.', true),
    (v_id, 'pt', 'BTS é um grupo musical da Coreia. São muito famosos. Têm muitos fãs. Os fãs chamam-se ARMY. BTS tem um novo álbum. Fazem uma turnê mundial. O K-Pop é muito popular.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 21: Jugendstudie - Stress
  INSERT INTO text_versions (text_id, level, content) VALUES (21, 'A1',
    'Viele junge Menschen in Deutschland haben Stress. Sie haben Angst vor der Zukunft. 30 Prozent brauchen Hilfe. Die größten Sorgen sind Krieg und teure Wohnungen. Manche wollen Deutschland verlassen.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 21 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Muchos jóvenes en Alemania tienen estrés. Tienen miedo del futuro. El 30 por ciento necesita ayuda. Las mayores preocupaciones son la guerra y los pisos caros. Algunos quieren dejar Alemania.', true),
    (v_id, 'en', 'Many young people in Germany are stressed. They are afraid of the future. 30 percent need help. The biggest worries are war and expensive flats. Some want to leave Germany.', true),
    (v_id, 'fi', 'Monilla nuorilla Saksassa on stressiä. He pelkäävät tulevaisuutta. 30 prosenttia tarvitsee apua. Suurimmat huolet ovat sota ja kalliit asunnot. Jotkut haluavat lähteä Saksasta.', true),
    (v_id, 'it', 'Molti giovani in Germania sono stressati. Hanno paura del futuro. Il 30 percento ha bisogno di aiuto. Le preoccupazioni più grandi sono la guerra e gli affitti cari. Alcuni vogliono lasciare la Germania.', true),
    (v_id, 'pt', 'Muitos jovens na Alemanha têm estresse. Têm medo do futuro. 30 por cento precisam de ajuda. As maiores preocupações são a guerra e os apartamentos caros. Alguns querem sair da Alemanha.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 22: Artemis - zum Mond fliegen
  INSERT INTO text_versions (text_id, level, content) VALUES (22, 'A1',
    'Die NASA hat ein Programm. Es heißt Artemis. Menschen sollen zum Mond fliegen. Das letzte Mal war 1972. Die Rakete ist groß und stark. Vielleicht fliegt ein Mensch auch zum Mars.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 22 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'La NASA tiene un programa. Se llama Artemis. Las personas van a volar a la Luna. La última vez fue en 1972. El cohete es grande y fuerte. Quizás una persona también vuele a Marte.', true),
    (v_id, 'en', 'NASA has a programme. It is called Artemis. Humans shall fly to the Moon. The last time was in 1972. The rocket is big and strong. Perhaps a person will also fly to Mars.', true),
    (v_id, 'fi', 'NASAlla on ohjelma. Sen nimi on Artemis. Ihmisten pitäisi lentää Kuuhun. Viime kerta oli vuonna 1972. Raketti on suuri ja vahva. Ehkä ihminen lentää myös Marsiin.', true),
    (v_id, 'it', 'La NASA ha un programma. Si chiama Artemis. Gli esseri umani vogliono volare sulla Luna. L''ultima volta era nel 1972. Il razzo è grande e forte. Forse una persona volerà anche su Marte.', true),
    (v_id, 'pt', 'A NASA tem um programa. Chama-se Artemis. Os humanos querem voar à Lua. A última vez foi em 1972. O foguete é grande e forte. Talvez uma pessoa também voe a Marte.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 23: Abiturienten feiern Party
  INSERT INTO text_versions (text_id, level, content) VALUES (23, 'A1',
    'Abiturienten in Berlin haben eine Party gemacht. Sie haben Müll hinterlassen. Dann haben sie den Park sauber gemacht. Der Schulleiter war stolz. Die Jugendlichen haben Verantwortung gezeigt.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 23 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Los graduados en Berlín hicieron una fiesta. Dejaron basura. Después limpiaron el parque. El director estaba orgulloso. Los jóvenes mostraron responsabilidad.', true),
    (v_id, 'en', 'School leavers in Berlin had a party. They left rubbish behind. Then they cleaned the park. The headmaster was proud. The young people showed responsibility.', true),
    (v_id, 'fi', 'Abiturientit Berliinissä pitivät juhlat. He jättivät roskia. Sitten he siivosivat puiston. Rehtori oli ylpeä. Nuoret osoittivat vastuullisuutta.', true),
    (v_id, 'it', 'I diplomandi a Berlino hanno fatto una festa. Hanno lasciato spazzatura. Poi hanno pulito il parco. Il preside era orgoglioso. I giovani hanno mostrato responsabilità.', true),
    (v_id, 'pt', 'Os formandos em Berlim fizeram uma festa. Deixaram lixo. Depois limparam o parque. O diretor ficou orgulhoso. Os jovens mostraram responsabilidade.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 24: Viele junge Deutsche wollen ins Ausland
  INSERT INTO text_versions (text_id, level, content) VALUES (24, 'A1',
    'Viele junge Menschen in Deutschland wollen weg. Es gibt zu wenige Wohnungen. Die Jobs sind unsicher. 41 von 100 denken darüber nach. Aber viele bleiben auch. Sie lieben ihre Familie und Freunde.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 24 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Muchos jóvenes en Alemania quieren irse. Hay muy pocos pisos. Los trabajos son inseguros. 41 de 100 piensan en ello. Pero muchos también se quedan. Aman a su familia y amigos.', true),
    (v_id, 'en', 'Many young people in Germany want to leave. There are too few flats. The jobs are insecure. 41 out of 100 think about it. But many also stay. They love their family and friends.', true),
    (v_id, 'fi', 'Monet nuoret Saksassa haluavat lähteä. Asuntoja on liian vähän. Työpaikat ovat epävarmoja. 41 sadasta ajattelee sitä. Mutta monet myös jäävät. He rakastavat perhettään ja ystäviään.', true),
    (v_id, 'it', 'Molti giovani in Germania vogliono andarsene. Ci sono troppo pochi appartamenti. I lavori sono insicuri. 41 su 100 ci pensano. Ma molti restano anche. Amano la loro famiglia e i loro amici.', true),
    (v_id, 'pt', 'Muitos jovens na Alemanha querem ir embora. Há poucos apartamentos. Os empregos são inseguros. 41 de 100 pensam nisso. Mas muitos também ficam. Amam sua família e amigos.', true)
  ON CONFLICT DO NOTHING;
END $$;

-- ============================================================
-- PART 2: A1 VERSIONS FOR TEXTS 29-37
-- ============================================================

DO $$
DECLARE
  v_id bigint;
BEGIN
  -- TEXT 29: Das Abitur 2026
  INSERT INTO text_versions (text_id, level, content) VALUES (29, 'A1',
    'In Deutschland beginnt das Abitur. Das Abitur ist die letzte Prüfung in der Schule. Die Schüler schreiben Prüfungen in Deutsch, Mathe und Englisch. Danach können sie studieren. Viele Familien feiern.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 29 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Alemania comienza el Abitur. El Abitur es el último examen en la escuela. Los alumnos hacen exámenes de alemán, matemáticas e inglés. Después pueden estudiar. Muchas familias celebran.', true),
    (v_id, 'en', 'In Germany the Abitur begins. The Abitur is the last exam at school. The students write exams in German, maths and English. After that they can study. Many families celebrate.', true),
    (v_id, 'fi', 'Saksassa alkaa Abitur. Abitur on viimeinen koe koulussa. Oppilaat kirjoittavat kokeita saksassa, matematiikassa ja englannissa. Sen jälkeen he voivat opiskella. Monet perheet juhlivat.', true),
    (v_id, 'it', 'In Germania inizia l''Abitur. L''Abitur è l''ultimo esame a scuola. Gli studenti fanno esami di tedesco, matematica e inglese. Dopo possono studiare. Molte famiglie festeggiano.', true),
    (v_id, 'pt', 'Na Alemanha começa o Abitur. O Abitur é o último exame na escola. Os alunos fazem provas de alemão, matemática e inglês. Depois podem estudar. Muitas famílias comemoram.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 30: Frauenfußball beim FC St. Pauli
  INSERT INTO text_versions (text_id, level, content) VALUES (30, 'A1',
    'Der FC St. Pauli ist ein Fußballverein in Hamburg. Die Frauenmannschaft hat Probleme. Es gibt zu wenige Trainingsplätze. Das Geld ist ein Problem. Die Männer bekommen mehr Geld. Die Fans sind traurig.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 30 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'El FC St. Pauli es un club de fútbol en Hamburgo. El equipo femenino tiene problemas. Hay muy pocos campos de entrenamiento. El dinero es un problema. Los hombres reciben más dinero. Los fans están tristes.', true),
    (v_id, 'en', 'FC St. Pauli is a football club in Hamburg. The women''s team has problems. There are too few training grounds. Money is a problem. The men get more money. The fans are sad.', true),
    (v_id, 'fi', 'FC St. Pauli on jalkapalloseura Hampurissa. Naisten joukkueella on ongelmia. Harjoituskenttiä on liian vähän. Raha on ongelma. Miehet saavat enemmän rahaa. Fanit ovat surullisia.', true),
    (v_id, 'it', 'L''FC St. Pauli è un club di calcio ad Amburgo. La squadra femminile ha problemi. Ci sono troppo pochi campi di allenamento. I soldi sono un problema. Gli uomini ricevono più soldi. I tifosi sono tristi.', true),
    (v_id, 'pt', 'O FC St. Pauli é um clube de futebol em Hamburgo. A equipe feminina tem problemas. Há poucos campos de treino. O dinheiro é um problema. Os homens recebem mais dinheiro. Os torcedores estão tristes.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 31: Neue Regeln für die Rente
  INSERT INTO text_versions (text_id, level, content) VALUES (31, 'A1',
    'In Deutschland gibt es neue Regeln für die Rente. Die Rente ist Geld für alte Menschen. Wenn man nicht mehr arbeitet, bekommt man Rente. Viele Menschen haben Angst. Sie fragen: Habe ich genug Geld im Alter?'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 31 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Alemania hay nuevas reglas para las pensiones. La pensión es dinero para las personas mayores. Cuando ya no se trabaja, se recibe pensión. Muchas personas tienen miedo. Preguntan: ¿Tengo suficiente dinero para la vejez?', true),
    (v_id, 'en', 'In Germany there are new rules for pensions. The pension is money for old people. When you no longer work, you get a pension. Many people are afraid. They ask: Do I have enough money for old age?', true),
    (v_id, 'fi', 'Saksassa on uudet eläkesäännöt. Eläke on rahaa vanhuksille. Kun ei enää työskentele, saa eläkettä. Monet ihmiset pelkäävät. He kysyvät: Onko minulla tarpeeksi rahaa vanhuuteen?', true),
    (v_id, 'it', 'In Germania ci sono nuove regole per le pensioni. La pensione è denaro per le persone anziane. Quando non si lavora più, si riceve la pensione. Molte persone hanno paura. Chiedono: Ho abbastanza soldi per la vecchiaia?', true),
    (v_id, 'pt', 'Na Alemanha há novas regras para as pensões. A pensão é dinheiro para os idosos. Quando não se trabalha mais, recebe-se pensão. Muitas pessoas têm medo. Perguntam: Tenho dinheiro suficiente para a velhice?', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 32: Brand in einem Krankenhaus
  INSERT INTO text_versions (text_id, level, content) VALUES (32, 'A1',
    'In Aachen hat es in einem Krankenhaus gebrannt. Die Feuerwehr ist schnell gekommen. Die Patienten waren sicher. Niemand ist gestorben. Die Polizei untersucht das Feuer. Das Krankenhaus muss repariert werden.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 32 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'En Aquisgrán hubo un incendio en un hospital. Los bomberos vinieron rápido. Los pacientes estaban seguros. Nadie murió. La policía investiga el fuego. El hospital debe ser reparado.', true),
    (v_id, 'en', 'In Aachen there was a fire in a hospital. The fire brigade came quickly. The patients were safe. Nobody died. The police investigate the fire. The hospital must be repaired.', true),
    (v_id, 'fi', 'Aachenissa sairaalassa oli tulipalo. Palokunta tuli nopeasti. Potilaat olivat turvassa. Kukaan ei kuollut. Poliisi tutkii tulipaloa. Sairaala on korjattava.', true),
    (v_id, 'it', 'Ad Aquisgrana c''è stato un incendio in un ospedale. I pompieri sono arrivati velocemente. I pazienti erano al sicuro. Nessuno è morto. La polizia indaga sull''incendio. L''ospedale deve essere riparato.', true),
    (v_id, 'pt', 'Em Aachen houve um incêndio num hospital. Os bombeiros vieram rápido. Os pacientes estavam seguros. Ninguém morreu. A polícia investiga o fogo. O hospital precisa ser reparado.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 33: El Niño
  INSERT INTO text_versions (text_id, level, content) VALUES (33, 'A1',
    'El Niño ist ein Wetterphänomen. Warmes Wasser im Ozean verändert das Wetter. In Europa kann es sehr heiß werden. Es kann auch Sturm geben. Die Menschen sollen viel Wasser trinken und die Natur schützen.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 33 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'El Niño es un fenómeno meteorológico. El agua caliente en el océano cambia el tiempo. En Europa puede hacer mucho calor. También puede haber tormentas. La gente debe beber mucha agua y proteger la naturaleza.', true),
    (v_id, 'en', 'El Niño is a weather phenomenon. Warm water in the ocean changes the weather. In Europe it can get very hot. There can also be storms. People should drink a lot of water and protect nature.', true),
    (v_id, 'fi', 'El Niño on sääilmiö. Lämmin vesi valtameressä muuttaa säätä. Euroopassa voi tulla hyvin kuuma. Myös myrskyjä voi tulla. Ihmisten pitäisi juoda paljon vettä ja suojella luontoa.', true),
    (v_id, 'it', 'El Niño è un fenomeno meteorologico. L''acqua calda nell''oceano cambia il tempo. In Europa può fare molto caldo. Possono esserci anche tempeste. Le persone devono bere molta acqua e proteggere la natura.', true),
    (v_id, 'pt', 'El Niño é um fenômeno meteorológico. A água quente no oceano muda o tempo. Na Europa pode ficar muito quente. Também pode haver tempestades. As pessoas devem beber muita água e proteger a natureza.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 34: Benzin ist teuer – E-Autos
  INSERT INTO text_versions (text_id, level, content) VALUES (34, 'A1',
    'Benzin ist sehr teuer in Deutschland. Viele Menschen kaufen jetzt Elektroautos. Ein E-Auto braucht nur Strom. Das ist billiger. Der Staat gibt Geld für neue E-Autos. Viele Automarken haben neue Modelle.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 34 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'La gasolina es muy cara en Alemania. Mucha gente ahora compra coches eléctricos. Un coche eléctrico solo necesita electricidad. Eso es más barato. El estado da dinero para coches eléctricos nuevos. Muchas marcas tienen nuevos modelos.', true),
    (v_id, 'en', 'Petrol is very expensive in Germany. Many people now buy electric cars. An electric car only needs electricity. That is cheaper. The state gives money for new electric cars. Many car brands have new models.', true),
    (v_id, 'fi', 'Bensiini on hyvin kallista Saksassa. Monet ihmiset ostavat nyt sähköautoja. Sähköauto tarvitsee vain sähköä. Se on halvempaa. Valtio antaa rahaa uusiin sähköautoihin. Monilla automerkeillä on uusia malleja.', true),
    (v_id, 'it', 'La benzina è molto cara in Germania. Molte persone ora comprano auto elettriche. Un''auto elettrica ha bisogno solo di elettricità. Questo è più economico. Lo stato dà soldi per nuove auto elettriche. Molte marche hanno nuovi modelli.', true),
    (v_id, 'pt', 'A gasolina é muito cara na Alemanha. Muitas pessoas agora compram carros elétricos. Um carro elétrico precisa apenas de eletricidade. Isso é mais barato. O estado dá dinheiro para carros elétricos novos. Muitas marcas têm novos modelos.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 35: SC Freiburg spielt in Europa
  INSERT INTO text_versions (text_id, level, content) VALUES (35, 'A1',
    'Der SC Freiburg ist ein Fußballverein. Er kommt aus Baden-Württemberg. Freiburg spielt in der Europa League. Das ist ein großer Wettbewerb. Die Fans sind stolz. Das Spiel war spannend.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 35 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'El SC Freiburg es un club de fútbol. Viene de Baden-Württemberg. Freiburg juega en la Europa League. Es una gran competición. Los fans están orgullosos. El partido fue emocionante.', true),
    (v_id, 'en', 'SC Freiburg is a football club. It comes from Baden-Württemberg. Freiburg plays in the Europa League. That is a big competition. The fans are proud. The match was exciting.', true),
    (v_id, 'fi', 'SC Freiburg on jalkapalloseura. Se on Baden-Württembergistä. Freiburg pelaa Eurooppa-liigassa. Se on suuri kilpailu. Fanit ovat ylpeitä. Peli oli jännittävä.', true),
    (v_id, 'it', 'Lo SC Freiburg è un club di calcio. Viene dal Baden-Württemberg. Il Freiburg gioca in Europa League. È una grande competizione. I tifosi sono orgogliosi. La partita è stata emozionante.', true),
    (v_id, 'pt', 'O SC Freiburg é um clube de futebol. Vem de Baden-Württemberg. O Freiburg joga na Europa League. É uma grande competição. Os torcedores estão orgulhosos. O jogo foi emocionante.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 36: Handysucht bei Jugendlichen
  INSERT INTO text_versions (text_id, level, content) VALUES (36, 'A1',
    'Viele Kinder benutzen ihr Handy zu viel. Das ist ein Problem. Sie schlafen schlecht. Sie lernen weniger. Die Eltern machen sich Sorgen. Experten sagen: Nicht mehr als zwei Stunden am Tag.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 36 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'Muchos niños usan demasiado el móvil. Eso es un problema. Duermen mal. Estudian menos. Los padres se preocupan. Los expertos dicen: no más de dos horas al día.', true),
    (v_id, 'en', 'Many children use their phone too much. That is a problem. They sleep badly. They study less. The parents are worried. Experts say: no more than two hours a day.', true),
    (v_id, 'fi', 'Monet lapset käyttävät puhelintaan liikaa. Se on ongelma. He nukkuvat huonosti. He opiskelevat vähemmän. Vanhemmat ovat huolissaan. Asiantuntijat sanovat: ei enempää kuin kaksi tuntia päivässä.', true),
    (v_id, 'it', 'Molti bambini usano troppo il cellulare. Questo è un problema. Dormono male. Studiano meno. I genitori sono preoccupati. Gli esperti dicono: non più di due ore al giorno.', true),
    (v_id, 'pt', 'Muitas crianças usam demais o celular. Isso é um problema. Dormem mal. Estudam menos. Os pais se preocupam. Os especialistas dizem: não mais que duas horas por dia.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 37: Frieden USA-Iran
  INSERT INTO text_versions (text_id, level, content) VALUES (37, 'A1',
    'Die USA und der Iran kämpfen nicht mehr. Es gibt eine Waffenruhe. Das ist eine gute Nachricht. Der Krieg war ein Problem für deutsche Firmen. Jetzt hoffen die Firmen, dass es besser wird.'
  ) RETURNING id INTO v_id;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_id, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 37 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_id, 'es', 'EE.UU. e Irán ya no luchan. Hay un alto el fuego. Esa es una buena noticia. La guerra era un problema para las empresas alemanas. Ahora las empresas esperan que mejore.', true),
    (v_id, 'en', 'The USA and Iran are no longer fighting. There is a ceasefire. That is good news. The war was a problem for German companies. Now the companies hope it will get better.', true),
    (v_id, 'fi', 'USA ja Iran eivät enää taistele. On aselepo. Se on hyvä uutinen. Sota oli ongelma saksalaisille yrityksille. Nyt yritykset toivovat, että tilanne paranee.', true),
    (v_id, 'it', 'Gli USA e l''Iran non combattono più. C''è un cessate il fuoco. Questa è una buona notizia. La guerra era un problema per le aziende tedesche. Ora le aziende sperano che migliori.', true),
    (v_id, 'pt', 'Os EUA e o Irã não lutam mais. Há um cessar-fogo. Essa é uma boa notícia. A guerra era um problema para as empresas alemãs. Agora as empresas esperam que melhore.', true)
  ON CONFLICT DO NOTHING;
END $$;

-- ============================================================
-- PART 3: A1 + C1 VERSIONS FOR TEXTS 43-57
-- ============================================================

DO $$
DECLARE
  v_a1 bigint;
  v_c1 bigint;
BEGIN
  -- TEXT 43: KI hilft Ärzten
  INSERT INTO text_versions (text_id, level, content) VALUES (43, 'A1',
    'Computer helfen Ärzten. Die Computer nutzen KI. KI kann Bilder lesen. Sie findet Krankheiten schnell. In Deutschland nutzen 120 Krankenhäuser KI. Die Ärzte sagen: KI ist nützlich. Aber KI ersetzt keine Ärzte.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 43 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Los ordenadores ayudan a los médicos. Los ordenadores usan IA. La IA puede leer imágenes. Encuentra enfermedades rápido. En Alemania 120 hospitales usan IA. Los médicos dicen: la IA es útil. Pero la IA no reemplaza a los médicos.', true),
    (v_a1, 'en', 'Computers help doctors. The computers use AI. AI can read images. It finds diseases quickly. In Germany 120 hospitals use AI. The doctors say: AI is useful. But AI does not replace doctors.', true),
    (v_a1, 'fi', 'Tietokoneet auttavat lääkäreitä. Tietokoneet käyttävät tekoälyä. Tekoäly osaa lukea kuvia. Se löytää sairaudet nopeasti. Saksassa 120 sairaalaa käyttää tekoälyä. Lääkärit sanovat: tekoäly on hyödyllistä. Mutta tekoäly ei korvaa lääkäreitä.', true),
    (v_a1, 'it', 'I computer aiutano i medici. I computer usano l''IA. L''IA può leggere le immagini. Trova le malattie velocemente. In Germania 120 ospedali usano l''IA. I medici dicono: l''IA è utile. Ma l''IA non sostituisce i medici.', true),
    (v_a1, 'pt', 'Os computadores ajudam os médicos. Os computadores usam IA. A IA pode ler imagens. Encontra doenças rapidamente. Na Alemanha 120 hospitais usam IA. Os médicos dizem: a IA é útil. Mas a IA não substitui os médicos.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (43, 'C1',
    'Die Integration künstlicher Intelligenz in die europäische Krankenhauslandschaft markiert einen Paradigmenwechsel in der medizinischen Diagnostik. Mittlerweile setzen über 120 Kliniken allein in Deutschland algorithmenbasierte Systeme ein, die radiologische Aufnahmen mit einer Präzision analysieren, die jene erfahrener Fachärzte in bestimmten Bereichen übertrifft. Besonders bei der Früherkennung onkologischer Erkrankungen und kardiovaskulärer Anomalien haben sich die KI-gestützten Diagnoseverfahren als bahnbrechend erwiesen. Dennoch betonen Medizinethiker, dass die finale Entscheidungshoheit weiterhin beim behandelnden Arzt verbleiben müsse, da algorithmenbasierte Systeme zwar Muster erkennen, jedoch den ganzheitlichen klinischen Kontext eines Patienten nicht vollständig erfassen können. Die Europäische Kommission hat inzwischen regulatorische Rahmenbedingungen geschaffen, die sowohl die Innovation fördern als auch den Patientenschutz gewährleisten sollen. Kritiker bemängeln indes, dass die Abhängigkeit von proprietären Systemen die digitale Souveränität europäischer Gesundheitsinstitutionen gefährden könnte.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 43 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La integración de la inteligencia artificial en el panorama hospitalario europeo marca un cambio de paradigma en el diagnóstico médico. Actualmente, más de 120 clínicas solo en Alemania emplean sistemas basados en algoritmos que analizan imágenes radiológicas con una precisión que supera a la de especialistas experimentados en ciertas áreas. Especialmente en la detección temprana de enfermedades oncológicas y anomalías cardiovasculares, los procedimientos diagnósticos asistidos por IA han demostrado ser revolucionarios. Sin embargo, los expertos en ética médica subrayan que la autoridad decisoria final debe permanecer en el médico tratante, ya que los sistemas algorítmicos reconocen patrones pero no pueden captar completamente el contexto clínico integral de un paciente. La Comisión Europea ha creado marcos regulatorios que pretenden tanto fomentar la innovación como garantizar la protección del paciente. Los críticos señalan que la dependencia de sistemas propietarios podría poner en peligro la soberanía digital de las instituciones sanitarias europeas.', true),
    (v_c1, 'en', 'The integration of artificial intelligence into the European hospital landscape marks a paradigm shift in medical diagnostics. By now, over 120 clinics in Germany alone deploy algorithm-based systems that analyse radiological images with a precision surpassing that of experienced specialists in certain areas. Particularly in the early detection of oncological diseases and cardiovascular anomalies, AI-assisted diagnostic procedures have proven groundbreaking. Nevertheless, medical ethicists emphasise that final decision-making authority must remain with the attending physician, as algorithm-based systems can identify patterns but cannot fully grasp the holistic clinical context of a patient. The European Commission has since established regulatory frameworks intended to both promote innovation and ensure patient protection. Critics argue that dependence on proprietary systems could jeopardise the digital sovereignty of European healthcare institutions.', true),
    (v_c1, 'fi', 'Tekoälyn integrointi eurooppalaiseen sairaalaympäristöön merkitsee paradigman muutosta lääketieteellisessä diagnostiikassa. Tällä hetkellä yli 120 klinikkaa pelkästään Saksassa käyttää algoritmipohjaisia järjestelmiä, jotka analysoivat radiologisia kuvia tarkkuudella, joka ylittää kokeneiden erikoislääkärien tarkkuuden tietyillä alueilla. Erityisesti onkologisten sairauksien varhaisessa havaitsemisessa ja kardiovaskulaaristen poikkeavuuksien tunnistamisessa tekoälyavusteiset diagnostiset menetelmät ovat osoittautuneet uraauurtaviksi. Lääketieteen eetikot korostavat kuitenkin, että lopullinen päätösvalta on säilyttävä hoitavalla lääkärillä, sillä algoritmipohjaiset järjestelmät tunnistavat kyllä malleja mutta eivät pysty täysin ymmärtämään potilaan kokonaisvaltaista kliinistä kontekstia. Euroopan komissio on sittemmin luonut sääntelykehykset, joiden tarkoituksena on sekä edistää innovaatiota että varmistaa potilasturva.', true),
    (v_c1, 'it', 'L''integrazione dell''intelligenza artificiale nel panorama ospedaliero europeo segna un cambio di paradigma nella diagnostica medica. Attualmente, oltre 120 cliniche nella sola Germania impiegano sistemi basati su algoritmi che analizzano immagini radiologiche con una precisione che in certi ambiti supera quella di specialisti esperti. In particolare nella diagnosi precoce di malattie oncologiche e anomalie cardiovascolari, le procedure diagnostiche assistite dall''IA si sono rivelate rivoluzionarie. Tuttavia, gli esperti di etica medica sottolineano che l''autorità decisionale finale deve rimanere al medico curante, poiché i sistemi algoritmici riconoscono modelli ma non possono cogliere pienamente il contesto clinico olistico di un paziente. La Commissione Europea ha nel frattempo creato quadri normativi intesi a promuovere l''innovazione e garantire la protezione dei pazienti.', true),
    (v_c1, 'pt', 'A integração da inteligência artificial no panorama hospitalar europeu marca uma mudança de paradigma no diagnóstico médico. Atualmente, mais de 120 clínicas só na Alemanha utilizam sistemas baseados em algoritmos que analisam imagens radiológicas com uma precisão que supera a de especialistas experientes em certas áreas. Especialmente na deteção precoce de doenças oncológicas e anomalias cardiovasculares, os procedimentos de diagnóstico assistidos por IA provaram ser revolucionários. No entanto, os especialistas em ética médica sublinham que a autoridade decisória final deve permanecer com o médico assistente, uma vez que os sistemas algorítmicos reconhecem padrões mas não conseguem captar plenamente o contexto clínico holístico de um paciente. A Comissão Europeia criou entretanto quadros regulamentares destinados a promover a inovação e garantir a proteção dos pacientes.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 44: Rekordhitze in Europa
  INSERT INTO text_versions (text_id, level, content) VALUES (44, 'A1',
    'Im Sommer war es in Europa sehr heiß. Es waren über 40 Grad. Viele Menschen sind gestorben. Fast 50.000 Menschen. Alte Menschen waren in Gefahr. Der Klimawandel ist schuld. Die Regierungen müssen mehr tun.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 44 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'En verano hizo mucho calor en Europa. Había más de 40 grados. Muchas personas murieron. Casi 50.000 personas. Las personas mayores estaban en peligro. El cambio climático es culpable. Los gobiernos deben hacer más.', true),
    (v_a1, 'en', 'In summer it was very hot in Europe. It was over 40 degrees. Many people died. Almost 50,000 people. Old people were in danger. Climate change is to blame. Governments must do more.', true),
    (v_a1, 'fi', 'Kesällä Euroopassa oli hyvin kuuma. Oli yli 40 astetta. Monet ihmiset kuolivat. Lähes 50 000 ihmistä. Vanhat ihmiset olivat vaarassa. Ilmastonmuutos on syyllinen. Hallitusten on tehtävä enemmän.', true),
    (v_a1, 'it', 'In estate faceva molto caldo in Europa. C''erano oltre 40 gradi. Molte persone sono morte. Quasi 50.000 persone. Le persone anziane erano in pericolo. Il cambiamento climatico è colpevole. I governi devono fare di più.', true),
    (v_a1, 'pt', 'No verão fez muito calor na Europa. Estavam acima de 40 graus. Muitas pessoas morreram. Quase 50.000 pessoas. Os idosos estavam em perigo. A mudança climática é culpada. Os governos devem fazer mais.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (44, 'C1',
    'Die beispiellose Hitzewelle, die Europa im Sommer heimsuchte, hat nach Schätzungen der Weltgesundheitsorganisation nahezu 50.000 vorzeitige Todesfälle verursacht und damit die verheerendste klimabedingte Katastrophe auf dem Kontinent seit Beginn der systematischen Aufzeichnungen markiert. Klimatologen attribuieren rund zwei Drittel der Übersterblichkeit direkt dem anthropogenen Klimawandel, während die verbleibenden Fälle auf unzureichende Anpassungsinfrastruktur und mangelnde Hitzeschutzmaßnahmen zurückzuführen seien. Besonders betroffen waren vulnerable Bevölkerungsgruppen in den Mittelmeerstaaten, wo die Temperaturen stellenweise 47 Grad Celsius überschritten. Die Europäische Umweltagentur fordert nunmehr eine grundlegende Revision der urbanen Klimaanpassungsstrategien, einschließlich der systematischen Begrünung von Innenstädten und der Implementierung hitzeresilienter Baustandards. Die Diskrepanz zwischen den ambitionierten Klimazielen der EU und der tatsächlichen Umsetzung konkreter Schutzmaßnahmen bleibt indes Gegenstand heftiger politischer Kontroversen.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 44 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La ola de calor sin precedentes que azotó Europa en verano ha causado, según estimaciones de la OMS, casi 50.000 muertes prematuras, marcando la catástrofe climática más devastadora del continente desde el inicio de los registros sistemáticos. Los climatólogos atribuyen aproximadamente dos tercios de la sobremortalidad directamente al cambio climático antropogénico, mientras que los casos restantes se deberían a una infraestructura de adaptación insuficiente y a medidas de protección contra el calor inadecuadas. Las poblaciones vulnerables de los estados mediterráneos fueron las más afectadas, donde las temperaturas superaron en algunos lugares los 47 grados Celsius. La Agencia Europea de Medio Ambiente exige ahora una revisión fundamental de las estrategias urbanas de adaptación climática.', true),
    (v_c1, 'en', 'The unprecedented heatwave that struck Europe this summer has, according to WHO estimates, caused nearly 50,000 premature deaths, marking the most devastating climate-related catastrophe on the continent since systematic records began. Climatologists attribute roughly two thirds of the excess mortality directly to anthropogenic climate change, while the remaining cases are ascribed to inadequate adaptation infrastructure and insufficient heat protection measures. Particularly affected were vulnerable populations in the Mediterranean states, where temperatures in places exceeded 47 degrees Celsius. The European Environment Agency now demands a fundamental revision of urban climate adaptation strategies, including the systematic greening of inner cities and the implementation of heat-resilient building standards.', true),
    (v_c1, 'fi', 'Ennennäkemätön helleaalto, joka iski Eurooppaan kesällä, on WHO:n arvioiden mukaan aiheuttanut lähes 50 000 ennenaikaista kuolemaa, mikä tekee siitä mantereen tuhoisimman ilmastoon liittyvän katastrofin systemaattisten tilastojen alusta lähtien. Klimatologit attribuoivat noin kaksi kolmasosaa ylikuolleisuudesta suoraan ihmisen aiheuttamaan ilmastonmuutokseen, kun taas loput tapaukset johtuvat riittämättömästä sopeutumisinfrastruktuurista ja puutteellisista lämpösuojatoimista. Erityisesti haavoittuvat väestöryhmät Välimeren maissa kärsivät, missä lämpötilat paikoin ylittivät 47 celsiusastetta.', true),
    (v_c1, 'it', 'L''ondata di calore senza precedenti che ha colpito l''Europa in estate ha causato, secondo le stime dell''OMS, quasi 50.000 decessi prematuri, segnando la catastrofe climatica più devastante del continente dall''inizio delle registrazioni sistematiche. I climatologi attribuiscono circa due terzi della mortalità in eccesso direttamente al cambiamento climatico antropogenico, mentre i restanti casi sarebbero da ricondurre a infrastrutture di adattamento insufficienti e a misure di protezione dal calore inadeguate. Particolarmente colpite sono state le popolazioni vulnerabili degli stati mediterranei, dove le temperature hanno superato in alcuni luoghi i 47 gradi Celsius.', true),
    (v_c1, 'pt', 'A vaga de calor sem precedentes que atingiu a Europa no verão causou, segundo estimativas da OMS, quase 50.000 mortes prematuras, marcando a catástrofe climática mais devastadora do continente desde o início dos registos sistemáticos. Os climatologistas atribuem cerca de dois terços da sobremortalidade diretamente às alterações climáticas antropogénicas, enquanto os restantes casos se devem a infraestruturas de adaptação insuficientes e a medidas de proteção contra o calor inadequadas. As populações vulneráveis dos estados mediterrânicos foram particularmente afetadas, onde as temperaturas ultrapassaram pontualmente os 47 graus Celsius.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 45: Studentenbewegung in Serbien
  INSERT INTO text_versions (text_id, level, content) VALUES (45, 'A1',
    'In Serbien gab es eine Wahl. Studenten haben eine neue Partei gemacht. Die Partei hat gewonnen. Der alte Präsident war lange an der Macht. Die Menschen wollten mehr Demokratie. Europa ist zufrieden.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 45 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'En Serbia hubo una elección. Los estudiantes hicieron un nuevo partido. El partido ganó. El viejo presidente estuvo mucho tiempo en el poder. La gente quería más democracia. Europa está satisfecha.', true),
    (v_a1, 'en', 'In Serbia there was an election. Students made a new party. The party won. The old president was in power for a long time. People wanted more democracy. Europe is satisfied.', true),
    (v_a1, 'fi', 'Serbiassa oli vaalit. Opiskelijat perustivat uuden puolueen. Puolue voitti. Vanha presidentti oli vallassa kauan. Ihmiset halusivat enemmän demokratiaa. Eurooppa on tyytyväinen.', true),
    (v_a1, 'it', 'In Serbia ci sono state le elezioni. Gli studenti hanno creato un nuovo partito. Il partito ha vinto. Il vecchio presidente era al potere da molto tempo. La gente voleva più democrazia. L''Europa è soddisfatta.', true),
    (v_a1, 'pt', 'Na Sérvia houve uma eleição. Os estudantes fizeram um novo partido. O partido ganhou. O velho presidente esteve no poder por muito tempo. As pessoas queriam mais democracia. A Europa está satisfeita.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (45, 'C1',
    'Der erdrutschartige Wahlsieg der aus einer Studentenbewegung hervorgegangenen Partei in Serbien stellt einen historischen Wendepunkt in der politischen Landschaft des Westbalkans dar. Nach über einem Jahrzehnt zunehmend autoritärer Regierungsführung unter dem bisherigen Präsidenten, die von systematischer Aushöhlung demokratischer Institutionen, Einschränkung der Pressefreiheit und weitverbreiteter Korruption geprägt war, haben die serbischen Wähler ein unmissverständliches Signal für einen demokratischen Neuanfang gesetzt. Die zivilgesellschaftliche Mobilisierung, die ihren Ursprung in Universitätsprotesten gegen manipulierte Prüfungsergebnisse nahm, entwickelte sich binnen weniger Monate zu einer landesweiten Bewegung, die sämtliche gesellschaftliche Schichten erfasste. Europäische Diplomaten bewerten den Machtwechsel als potenzielle Initialzündung für eine Wiederannäherung Serbiens an die europäische Wertegemeinschaft, wenngleich die strukturellen Herausforderungen der demokratischen Konsolidierung nicht unterschätzt werden dürften.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 45 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La victoria electoral aplastante del partido surgido de un movimiento estudiantil en Serbia representa un punto de inflexión histórico en el panorama político de los Balcanes Occidentales. Tras más de una década de gobierno cada vez más autoritario bajo el anterior presidente, caracterizado por la erosión sistemática de las instituciones democráticas, la restricción de la libertad de prensa y la corrupción generalizada, los votantes serbios han enviado una señal inequívoca de un nuevo comienzo democrático. La movilización de la sociedad civil, que tuvo su origen en protestas universitarias contra resultados de exámenes manipulados, se convirtió en pocos meses en un movimiento nacional que abarcó todos los estratos sociales.', true),
    (v_c1, 'en', 'The landslide election victory of the party that emerged from a student movement in Serbia represents a historic turning point in the political landscape of the Western Balkans. After more than a decade of increasingly authoritarian governance under the former president, marked by the systematic erosion of democratic institutions, restrictions on press freedom and widespread corruption, Serbian voters have sent an unequivocal signal for a democratic new beginning. The civil society mobilisation, which originated in university protests against manipulated exam results, evolved within a few months into a nationwide movement that encompassed all social strata. European diplomats assess the change of power as a potential catalyst for Serbia''s rapprochement with the European community of values.', true),
    (v_c1, 'fi', 'Opiskelijaliikkeestä syntyneen puolueen maanvyörymäinen vaalivoitto Serbiassa edustaa historiallista käännekohtaa Länsi-Balkanin poliittisessa maisemassa. Yli vuosikymmenen kestäneen yhä autoritaarisemman hallinnon jälkeen, jolle oli ominaista demokraattisten instituutioiden järjestelmällinen rapautuminen, lehdistönvapauden rajoittaminen ja laajalle levinnyt korruptio, serbialaiset äänestäjät ovat lähettäneet yksiselitteisen signaalin demokraattisesta uudesta alusta. Kansalaisyhteiskunnan mobilisaatio, joka sai alkunsa yliopistoprotesteista manipuloituja koetuloksia vastaan, kehittyi muutamassa kuukaudessa koko maan kattavaksi liikkeeksi.', true),
    (v_c1, 'it', 'La vittoria elettorale schiacciante del partito nato da un movimento studentesco in Serbia rappresenta un punto di svolta storico nel panorama politico dei Balcani occidentali. Dopo oltre un decennio di governo sempre più autoritario sotto il precedente presidente, caratterizzato dall''erosione sistematica delle istituzioni democratiche, dalla limitazione della libertà di stampa e dalla corruzione diffusa, gli elettori serbi hanno inviato un segnale inequivocabile per un nuovo inizio democratico. La mobilitazione della società civile, originata dalle proteste universitarie contro risultati d''esame manipolati, si è evoluta in pochi mesi in un movimento nazionale che ha coinvolto tutti gli strati sociali.', true),
    (v_c1, 'pt', 'A vitória eleitoral esmagadora do partido que emergiu de um movimento estudantil na Sérvia representa um ponto de viragem histórico no panorama político dos Balcãs Ocidentais. Após mais de uma década de governação cada vez mais autoritária sob o anterior presidente, marcada pela erosão sistemática das instituições democráticas, restrições à liberdade de imprensa e corrupção generalizada, os eleitores sérvios enviaram um sinal inequívoco de um novo começo democrático. A mobilização da sociedade civil, que teve origem em protestos universitários contra resultados de exames manipulados, evoluiu em poucos meses para um movimento nacional que abrangeu todos os estratos sociais.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 46: Anthropic Börsengang
  INSERT INTO text_versions (text_id, level, content) VALUES (46, 'A1',
    'Anthropic ist eine Firma. Sie macht KI. Ihr Produkt heißt Claude. Die Firma will an die Börse gehen. Die Firma ist über 100 Milliarden Dollar wert. KI wächst sehr schnell. Viele wollen in KI investieren.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 46 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Anthropic es una empresa. Hace IA. Su producto se llama Claude. La empresa quiere salir a bolsa. La empresa vale más de 100 mil millones de dólares. La IA crece muy rápido. Muchos quieren invertir en IA.', true),
    (v_a1, 'en', 'Anthropic is a company. It makes AI. Its product is called Claude. The company wants to go public. The company is worth over 100 billion dollars. AI is growing very fast. Many want to invest in AI.', true),
    (v_a1, 'fi', 'Anthropic on yritys. Se tekee tekoälyä. Sen tuote on nimeltään Claude. Yritys haluaa pörssiin. Yritys on yli 100 miljardin dollarin arvoinen. Tekoäly kasvaa hyvin nopeasti. Monet haluavat sijoittaa tekoälyyn.', true),
    (v_a1, 'it', 'Anthropic è un''azienda. Fa IA. Il suo prodotto si chiama Claude. L''azienda vuole andare in borsa. L''azienda vale oltre 100 miliardi di dollari. L''IA cresce molto velocemente. Molti vogliono investire nell''IA.', true),
    (v_a1, 'pt', 'Anthropic é uma empresa. Faz IA. O seu produto chama-se Claude. A empresa quer entrar na bolsa. A empresa vale mais de 100 mil milhões de dólares. A IA cresce muito rápido. Muitos querem investir em IA.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (46, 'C1',
    'Der geplante Börsengang von Anthropic, einem der führenden Unternehmen im Bereich der generativen künstlichen Intelligenz, könnte sich als einer der bedeutendsten in der Geschichte der Technologiebranche erweisen. Mit einer antizipierten Bewertung von über 100 Milliarden Dollar würde das Unternehmen in die Riege der wertvollsten Technologiekonzerne weltweit aufsteigen. Die Verdreifachung des Jahresumsatzes unterstreicht das exponenzielle Wachstum, das die gesamte KI-Branche derzeit erlebt, wenngleich die Profitabilität angesichts der enormen Infrastrukturkosten für das Training großer Sprachmodelle weiterhin aussteht. Finanzanalysten verweisen auf die strategische Positionierung des Unternehmens, das sich durch einen dezidierten Fokus auf KI-Sicherheit von der Konkurrenz abhebt. Gleichwohl mehren sich die Stimmen, die vor einer spekulativen Überbewertung im KI-Sektor warnen und Parallelen zur Dotcom-Blase der Jahrtausendwende ziehen. Die regulatorischen Unwägbarkeiten, insbesondere im Hinblick auf den EU AI Act, dürften die Investorenentscheidungen maßgeblich beeinflussen.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 46 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La salida a bolsa prevista de Anthropic, una de las empresas líderes en inteligencia artificial generativa, podría resultar una de las más significativas en la historia del sector tecnológico. Con una valoración anticipada de más de 100 mil millones de dólares, la empresa ascendería a las filas de los conglomerados tecnológicos más valiosos del mundo. La triplicación de la facturación anual subraya el crecimiento exponencial que experimenta actualmente todo el sector de la IA, aunque la rentabilidad sigue pendiente dados los enormes costes de infraestructura para el entrenamiento de grandes modelos de lenguaje. Los analistas financieros señalan el posicionamiento estratégico de la empresa, que se distingue de la competencia por su enfoque decidido en la seguridad de la IA.', true),
    (v_c1, 'en', 'Anthropic''s planned initial public offering, one of the leading companies in generative artificial intelligence, could prove to be one of the most significant in the history of the technology sector. With an anticipated valuation exceeding 100 billion dollars, the company would join the ranks of the world''s most valuable technology conglomerates. The tripling of annual revenue underscores the exponential growth currently experienced across the entire AI industry, although profitability remains elusive given the enormous infrastructure costs for training large language models. Financial analysts point to the company''s strategic positioning, which distinguishes itself from competitors through a dedicated focus on AI safety. Nevertheless, voices warning of speculative overvaluation in the AI sector and drawing parallels to the dotcom bubble of the millennium are growing louder.', true),
    (v_c1, 'fi', 'Anthropicin suunniteltu listautuminen pörssiin, yhden johtavan generatiivisen tekoälyn yrityksen, saattaa osoittautua yhdeksi merkittävimmistä teknologiasektorin historiassa. Yli 100 miljardin dollarin ennakoidulla arvostuksella yritys nousisi maailman arvokkaimpien teknologiayhtiöiden joukkoon. Vuotuisen liikevaihdon kolminkertaistuminen korostaa eksponentiaalista kasvua, jota koko tekoälyala tällä hetkellä kokee, vaikka kannattavuus on edelleen saavuttamatta suurten kielimallien kouluttamisen valtavien infrastruktuurikustannusten vuoksi.', true),
    (v_c1, 'it', 'La prevista quotazione in borsa di Anthropic, una delle aziende leader nell''intelligenza artificiale generativa, potrebbe rivelarsi una delle più significative nella storia del settore tecnologico. Con una valutazione anticipata di oltre 100 miliardi di dollari, l''azienda entrerebbe nelle file dei conglomerati tecnologici più preziosi al mondo. La triplicazione del fatturato annuale sottolinea la crescita esponenziale che l''intero settore dell''IA sta attualmente vivendo, sebbene la redditività resti in sospeso dati gli enormi costi infrastrutturali per l''addestramento dei grandi modelli linguistici. Gli analisti finanziari evidenziano il posizionamento strategico dell''azienda, che si distingue dalla concorrenza per un focus deciso sulla sicurezza dell''IA.', true),
    (v_c1, 'pt', 'A planeada oferta pública inicial da Anthropic, uma das empresas líderes em inteligência artificial generativa, poderá revelar-se uma das mais significativas na história do setor tecnológico. Com uma avaliação antecipada superior a 100 mil milhões de dólares, a empresa juntar-se-ia às fileiras dos conglomerados tecnológicos mais valiosos do mundo. A triplicação da faturação anual sublinha o crescimento exponencial que todo o setor de IA está atualmente a experienciar, embora a rentabilidade continue por alcançar dados os enormes custos de infraestrutura para o treino de grandes modelos linguísticos.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 47: Shamonda-Virus
  INSERT INTO text_versions (text_id, level, content) VALUES (47, 'A1',
    'In Frankreich gibt es einen neuen Virus. Er heißt Shamonda-Virus. Normalerweise haben nur Tiere diesen Virus. Jetzt ist ein Mensch krank. Er ist ein Bauer. Er ist im Krankenhaus. Das Risiko ist gering.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 47 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'En Francia hay un nuevo virus. Se llama virus Shamonda. Normalmente solo los animales tienen este virus. Ahora una persona está enferma. Es un agricultor. Está en el hospital. El riesgo es bajo.', true),
    (v_a1, 'en', 'In France there is a new virus. It is called Shamonda virus. Normally only animals have this virus. Now a person is sick. He is a farmer. He is in hospital. The risk is low.', true),
    (v_a1, 'fi', 'Ranskassa on uusi virus. Sen nimi on Shamonda-virus. Normaalisti vain eläimillä on tämä virus. Nyt ihminen on sairas. Hän on maanviljelijä. Hän on sairaalassa. Riski on pieni.', true),
    (v_a1, 'it', 'In Francia c''è un nuovo virus. Si chiama virus Shamonda. Normalmente solo gli animali hanno questo virus. Ora una persona è malata. È un agricoltore. È in ospedale. Il rischio è basso.', true),
    (v_a1, 'pt', 'Na França há um novo vírus. Chama-se vírus Shamonda. Normalmente só os animais têm este vírus. Agora uma pessoa está doente. É um agricultor. Está no hospital. O risco é baixo.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (47, 'C1',
    'Die Bestätigung des ersten humanen Infektionsfalls mit dem Shamonda-Virus in Frankreich hat in der epidemiologischen Fachwelt erhebliche Aufmerksamkeit erregt, da das Arbovirus bislang ausschließlich im veterinärmedizinischen Kontext dokumentiert war. Der betroffene Landwirt aus der Region Okzitanien wies die für eine Arbovirus-Infektion typische Symptomatik auf, einschließlich persistierenden Fiebers und schwerer Cephalgien. Virologen vermuten, dass kontaminierte Culicoides-Mücken als Übertragungsvektor fungiert haben dürften, was auf eine potenzielle Erweiterung des Wirtsspektrums hindeutet. Die französischen Gesundheitsbehörden stufen das Risiko einer Mensch-zu-Mensch-Transmission zwar als äußerst gering ein, haben jedoch vorsorglich eine epidemiologische Surveillance-Kampagne in den angrenzenden Départements eingeleitet. Dieser Fall unterstreicht die zunehmende Relevanz des One-Health-Ansatzes, der die untrennbare Verflechtung von Human-, Tier- und Umweltgesundheit anerkennt und interdisziplinäre Forschungsstrategien erfordert.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 47 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La confirmación del primer caso de infección humana con el virus Shamonda en Francia ha generado considerable atención en la comunidad epidemiológica, dado que el arbovirus hasta ahora solo había sido documentado en contexto veterinario. El agricultor afectado de la región de Occitania presentó la sintomatología típica de una infección por arbovirus, incluyendo fiebre persistente y cefaleas severas. Los virólogos sospechan que mosquitos Culicoides contaminados habrían fungido como vector de transmisión, lo que sugiere una potencial ampliación del espectro de huéspedes.', true),
    (v_c1, 'en', 'The confirmation of the first human infection case with the Shamonda virus in France has generated considerable attention in the epidemiological community, as the arbovirus had until now been documented exclusively in a veterinary context. The affected farmer from the Occitanie region presented symptoms typical of an arbovirus infection, including persistent fever and severe cephalgia. Virologists suspect that contaminated Culicoides midges may have served as the transmission vector, suggesting a potential expansion of the host spectrum. French health authorities rate the risk of human-to-human transmission as extremely low but have as a precaution initiated an epidemiological surveillance campaign in the adjacent départements.', true),
    (v_c1, 'fi', 'Ensimmäisen Shamonda-viruksen aiheuttaman ihmistartunnan vahvistaminen Ranskassa on herättänyt huomattavaa huomiota epidemiologisessa tiedeyhteisössä, sillä arbovirus oli tähän asti dokumentoitu yksinomaan eläinlääketieteellisessä kontekstissa. Occitanian alueen maanviljelijällä todettiin arbovirusinfektion tyypillinen oireisto, mukaan lukien pitkittynyt kuume ja vaikeat päänsäryt. Virologit epäilevät, että saastuneet Culicoides-polttiaishyttyset ovat toimineet tartuntavektorina, mikä viittaa isäntäkirjon mahdolliseen laajentumiseen.', true),
    (v_c1, 'it', 'La conferma del primo caso di infezione umana con il virus Shamonda in Francia ha generato notevole attenzione nella comunità epidemiologica, poiché l''arbovirus era finora documentato esclusivamente in contesto veterinario. L''agricoltore colpito della regione dell''Occitania presentava la sintomatologia tipica di un''infezione da arbovirus, tra cui febbre persistente e cefalee severe. I virologi sospettano che zanzare Culicoides contaminate abbiano fungito da vettore di trasmissione, suggerendo un potenziale ampliamento dello spettro degli ospiti.', true),
    (v_c1, 'pt', 'A confirmação do primeiro caso de infeção humana pelo vírus Shamonda em França gerou considerável atenção na comunidade epidemiológica, uma vez que o arbovírus tinha sido até agora documentado exclusivamente em contexto veterinário. O agricultor afetado da região da Occitânia apresentou a sintomatologia típica de uma infeção por arbovírus, incluindo febre persistente e cefaleias severas. Os virologistas suspeitam que mosquitos Culicoides contaminados terão servido como vetor de transmissão, sugerindo uma potencial expansão do espetro de hospedeiros.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 48: KI entdeckt Sicherheitslücken
  INSERT INTO text_versions (text_id, level, content) VALUES (48, 'A1',
    'Computer-Programme haben manchmal Fehler. Hacker können diese Fehler nutzen. KI hilft jetzt, Fehler zu finden. KI findet Fehler schneller als Menschen. Das ist gut für die Sicherheit im Internet.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 48 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Los programas de ordenador a veces tienen errores. Los hackers pueden usar estos errores. La IA ahora ayuda a encontrar errores. La IA encuentra errores más rápido que las personas. Eso es bueno para la seguridad en internet.', true),
    (v_a1, 'en', 'Computer programmes sometimes have errors. Hackers can use these errors. AI now helps to find errors. AI finds errors faster than people. That is good for internet security.', true),
    (v_a1, 'fi', 'Tietokoneohjelmissa on joskus virheitä. Hakkerit voivat käyttää näitä virheitä. Tekoäly auttaa nyt löytämään virheitä. Tekoäly löytää virheet nopeammin kuin ihmiset. Se on hyvä internetin turvallisuudelle.', true),
    (v_a1, 'it', 'I programmi per computer a volte hanno errori. Gli hacker possono usare questi errori. L''IA ora aiuta a trovare errori. L''IA trova errori più velocemente delle persone. Questo è buono per la sicurezza su internet.', true),
    (v_a1, 'pt', 'Os programas de computador às vezes têm erros. Os hackers podem usar esses erros. A IA agora ajuda a encontrar erros. A IA encontra erros mais rápido que as pessoas. Isso é bom para a segurança na internet.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (48, 'C1',
    'Der Einsatz künstlicher Intelligenz zur Identifizierung von Sicherheitslücken in Software stellt einen Quantensprung in der Cybersicherheitslandschaft dar. Jüngst entdeckten KI-gestützte Analysesysteme kritische Vulnerabilitäten in PHP, einer Programmiersprache, die nach wie vor das Rückgrat eines erheblichen Teils der globalen Webinfrastruktur bildet. Die Effizienz algorithmischer Codeanalyse übertrifft herkömmliche manuelle Audits um ein Vielfaches, was angesichts der exponentiell wachsenden Codebasis moderner Anwendungen von fundamentaler Bedeutung ist. Die Europäische Union reagiert mit der Verschärfung des Cyber Resilience Act, der Softwarehersteller erstmalig verbindlich zur kontinuierlichen Sicherheitsüberprüfung ihrer Produkte verpflichtet. Experten mahnen jedoch zur Vorsicht: Die gleiche Technologie, die defensive Sicherheitsforschung revolutioniert, könnte in den Händen maligner Akteure die Entdeckung ausnutzbarer Schwachstellen beschleunigen und damit ein digitales Wettrüsten auslösen.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 48 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'El uso de inteligencia artificial para identificar vulnerabilidades en software representa un salto cuántico en el panorama de la ciberseguridad. Recientemente, sistemas de análisis asistidos por IA descubrieron vulnerabilidades críticas en PHP, un lenguaje de programación que sigue constituyendo la columna vertebral de una parte considerable de la infraestructura web global. La eficiencia del análisis algorítmico de código supera con creces las auditorías manuales convencionales. La UE responde con el endurecimiento del Cyber Resilience Act, que obliga por primera vez a los fabricantes de software a verificar continuamente la seguridad de sus productos.', true),
    (v_c1, 'en', 'The deployment of artificial intelligence for identifying software vulnerabilities represents a quantum leap in the cybersecurity landscape. Recently, AI-assisted analysis systems discovered critical vulnerabilities in PHP, a programming language that continues to form the backbone of a considerable portion of global web infrastructure. The efficiency of algorithmic code analysis surpasses conventional manual audits by a significant margin. The EU is responding with the tightening of the Cyber Resilience Act, which for the first time mandates software manufacturers to continuously verify the security of their products. Experts caution, however, that the same technology revolutionising defensive security research could, in the hands of malicious actors, accelerate the discovery of exploitable weaknesses.', true),
    (v_c1, 'fi', 'Tekoälyn käyttö ohjelmistojen tietoturva-aukkojen tunnistamiseen edustaa kvanttihyppyä kyberturvallisuuden kentässä. Äskettäin tekoälyavusteiset analyysijärjestelmät löysivät kriittisiä haavoittuvuuksia PHP:stä, ohjelmointikielestä, joka muodostaa edelleen merkittävän osan maailmanlaajuisesta verkkoinfrastruktuurista. Algoritmisen koodianalyysin tehokkuus ylittää perinteiset manuaaliset auditoinnit moninkertaisesti. EU reagoi tiukentamalla Cyber Resilience Act -säädöstä, joka velvoittaa ensimmäistä kertaa ohjelmistovalmistajat tuotteidensa jatkuvaan turvallisuustarkistukseen.', true),
    (v_c1, 'it', 'L''impiego dell''intelligenza artificiale per identificare vulnerabilità nel software rappresenta un salto quantico nel panorama della cybersicurezza. Di recente, sistemi di analisi assistiti dall''IA hanno scoperto vulnerabilità critiche in PHP, un linguaggio di programmazione che costituisce tuttora la spina dorsale di una parte considerevole dell''infrastruttura web globale. L''efficienza dell''analisi algoritmica del codice supera di gran lunga gli audit manuali convenzionali. L''UE risponde con l''inasprimento del Cyber Resilience Act, che per la prima volta obbliga i produttori di software alla verifica continua della sicurezza dei propri prodotti.', true),
    (v_c1, 'pt', 'A utilização de inteligência artificial para identificar vulnerabilidades em software representa um salto quântico no panorama da cibersegurança. Recentemente, sistemas de análise assistidos por IA descobriram vulnerabilidades críticas em PHP, uma linguagem de programação que continua a formar a espinha dorsal de uma parte considerável da infraestrutura web global. A eficiência da análise algorítmica de código supera em muito as auditorias manuais convencionais. A UE responde com o endurecimento do Cyber Resilience Act, que pela primeira vez obriga os fabricantes de software à verificação contínua da segurança dos seus produtos.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 49: Europas Startups wachsen
  INSERT INTO text_versions (text_id, level, content) VALUES (49, 'A1',
    'In Europa gibt es viele neue Firmen. Sie heißen Startups. Sie machen Apps und Software. Investoren geben Geld. Aber die Büros sind teuer. Es ist schwer, gute Mitarbeiter zu finden. Trotzdem wachsen die Startups.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 49 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'En Europa hay muchas empresas nuevas. Se llaman startups. Hacen aplicaciones y software. Los inversores dan dinero. Pero las oficinas son caras. Es difícil encontrar buenos empleados. Aun así, las startups crecen.', true),
    (v_a1, 'en', 'In Europe there are many new companies. They are called startups. They make apps and software. Investors give money. But offices are expensive. It is hard to find good employees. Still, the startups grow.', true),
    (v_a1, 'fi', 'Euroopassa on paljon uusia yrityksiä. Niitä kutsutaan startupeiksi. Ne tekevät sovelluksia ja ohjelmistoja. Sijoittajat antavat rahaa. Mutta toimistot ovat kalliita. Hyviä työntekijöitä on vaikea löytää. Silti startupit kasvavat.', true),
    (v_a1, 'it', 'In Europa ci sono molte nuove aziende. Si chiamano startup. Fanno app e software. Gli investitori danno soldi. Ma gli uffici sono cari. È difficile trovare buoni dipendenti. Tuttavia, le startup crescono.', true),
    (v_a1, 'pt', 'Na Europa há muitas empresas novas. Chamam-se startups. Fazem aplicações e software. Os investidores dão dinheiro. Mas os escritórios são caros. É difícil encontrar bons funcionários. Mesmo assim, as startups crescem.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (49, 'C1',
    'Das europäische Startup-Ökosystem verzeichnet trotz eines herausfordernden makroökonomischen Umfelds eine bemerkenswerte Resilienz, wobei insbesondere Deutschland, Frankreich und Spanien als Inkubatoren technologischer Innovation hervortreten. Die Risikokapitalinvestitionen haben sich nach dem Einbruch der vorangegangenen Jahre stabilisiert, wenngleich Gründer zunehmend gezwungen sind, nachhaltige Geschäftsmodelle nachzuweisen, bevor sie signifikante Finanzierungsrunden abschließen können. Der Fachkräftemangel im Technologiesektor erweist sich als strukturelles Hindernis, das die Expansionsmöglichkeiten vielversprechender Jungunternehmen limitiert. Parallel dazu treiben regulatorische Initiativen wie der Digital Markets Act die Marktliberalisierung voran, was kleineren Akteuren verbesserte Marktzugangschancen eröffnet. Analysten prognostizieren, dass die Konvergenz von Deep Tech, Green Tech und KI-Anwendungen in den kommenden Jahren eine neue Gründungswelle anstoßen dürfte.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 49 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'El ecosistema europeo de startups registra una notable resiliencia pese a un entorno macroeconómico desafiante, destacando especialmente Alemania, Francia y España como incubadoras de innovación tecnológica. Las inversiones de capital riesgo se han estabilizado tras el desplome de los años anteriores, aunque los fundadores se ven cada vez más obligados a demostrar modelos de negocio sostenibles antes de cerrar rondas de financiación significativas. La escasez de talento cualificado en el sector tecnológico se revela como un obstáculo estructural que limita las posibilidades de expansión de jóvenes empresas prometedoras.', true),
    (v_c1, 'en', 'The European startup ecosystem shows remarkable resilience despite a challenging macroeconomic environment, with Germany, France and Spain standing out as incubators of technological innovation. Venture capital investments have stabilised after the slump of previous years, though founders are increasingly required to demonstrate sustainable business models before closing significant funding rounds. The shortage of skilled workers in the technology sector proves to be a structural obstacle limiting the expansion opportunities of promising young companies. Analysts forecast that the convergence of deep tech, green tech and AI applications is likely to trigger a new wave of entrepreneurship in the coming years.', true),
    (v_c1, 'fi', 'Eurooppalainen startup-ekosysteemi osoittaa huomattavaa resilienssiä haastavasta makrotaloudellisesta ympäristöstä huolimatta, ja erityisesti Saksa, Ranska ja Espanja erottuvat teknologisen innovaation hautomina. Riskipääomasijoitukset ovat vakautuneet edellisten vuosien romahduksen jälkeen, vaikka perustajien on yhä enemmän osoitettava kestäviä liiketoimintamalleja ennen merkittävien rahoituskierrosten päättämistä. Teknologia-alan osaajapula osoittautuu rakenteelliseksi esteeksi, joka rajoittaa lupaavien nuorten yritysten laajentumismahdollisuuksia.', true),
    (v_c1, 'it', 'L''ecosistema europeo delle startup registra una notevole resilienza nonostante un contesto macroeconomico impegnativo, con Germania, Francia e Spagna che emergono come incubatori di innovazione tecnologica. Gli investimenti in capitale di rischio si sono stabilizzati dopo il crollo degli anni precedenti, sebbene i fondatori siano sempre più obbligati a dimostrare modelli di business sostenibili prima di chiudere round di finanziamento significativi. La carenza di personale qualificato nel settore tecnologico si rivela un ostacolo strutturale che limita le possibilità di espansione di giovani aziende promettenti.', true),
    (v_c1, 'pt', 'O ecossistema europeu de startups regista uma notável resiliência apesar de um ambiente macroeconómico desafiante, com a Alemanha, França e Espanha a destacarem-se como incubadoras de inovação tecnológica. Os investimentos de capital de risco estabilizaram-se após a queda dos anos anteriores, embora os fundadores sejam cada vez mais obrigados a demonstrar modelos de negócio sustentáveis antes de fechar rondas de financiamento significativas.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 50: KI verbessert Unwetter-Vorhersagen
  INSERT INTO text_versions (text_id, level, content) VALUES (50, 'A1',
    'Das Wetter kann gefährlich sein. Stürme zerstören Häuser. KI hilft jetzt bei der Wettervorhersage. KI analysiert viele Daten. Die Vorhersagen sind jetzt besser. Das hilft den Menschen.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 50 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'El tiempo puede ser peligroso. Las tormentas destruyen casas. La IA ahora ayuda con el pronóstico del tiempo. La IA analiza muchos datos. Los pronósticos ahora son mejores. Eso ayuda a la gente.', true),
    (v_a1, 'en', 'The weather can be dangerous. Storms destroy houses. AI now helps with weather forecasting. AI analyses a lot of data. The forecasts are now better. That helps people.', true),
    (v_a1, 'fi', 'Sää voi olla vaarallista. Myrskyt tuhoavat taloja. Tekoäly auttaa nyt sääennusteiden tekemisessä. Tekoäly analysoi paljon dataa. Ennusteet ovat nyt parempia. Se auttaa ihmisiä.', true),
    (v_a1, 'it', 'Il tempo può essere pericoloso. Le tempeste distruggono case. L''IA ora aiuta con le previsioni del tempo. L''IA analizza molti dati. Le previsioni sono ora migliori. Questo aiuta le persone.', true),
    (v_a1, 'pt', 'O tempo pode ser perigoso. Tempestades destroem casas. A IA agora ajuda com a previsão do tempo. A IA analisa muitos dados. As previsões agora são melhores. Isso ajuda as pessoas.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (50, 'C1',
    'Die Integration maschineller Lernverfahren in die meteorologische Prognostik hat die Genauigkeit von Unwetterwarnungen signifikant verbessert und damit das Potenzial, menschliche Verluste bei extremen Wetterereignissen substanziell zu reduzieren. Neuartige neuronale Netzwerkarchitekturen, die auf umfangreichen historischen Wetterdatensätzen trainiert wurden, vermögen komplexe atmosphärische Wechselwirkungen zu modellieren, die konventionellen numerischen Vorhersagemodellen verborgen bleiben. Meteorologen berichten von einer Verlängerung des zuverlässigen Prognosehorizonts um durchschnittlich 36 Stunden, was insbesondere für die Evakuierungsplanung bei Hurrikanen und Sturzfluten von immenser Bedeutung ist. Gleichwohl warnen Klimawissenschaftler davor, dass die verbesserte Vorhersagefähigkeit nicht als Substitut für konsequente Klimaschutzmaßnahmen missverstanden werden dürfe, da die zunehmende Häufigkeit und Intensität extremer Wetterereignisse die Anpassungskapazitäten selbst modernster Frühwarnsysteme langfristig zu überfordern droht.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 50 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La integración de métodos de aprendizaje automático en la prognosis meteorológica ha mejorado significativamente la precisión de las alertas de tormentas, con el potencial de reducir sustancialmente las pérdidas humanas en eventos climáticos extremos. Las novedosas arquitecturas de redes neuronales, entrenadas en extensos conjuntos de datos meteorológicos históricos, son capaces de modelar interacciones atmosféricas complejas que permanecen ocultas a los modelos numéricos convencionales. Los meteorólogos informan de una extensión del horizonte de pronóstico fiable en un promedio de 36 horas.', true),
    (v_c1, 'en', 'The integration of machine learning methods into meteorological forecasting has significantly improved the accuracy of severe weather warnings, with the potential to substantially reduce human casualties during extreme weather events. Novel neural network architectures, trained on extensive historical weather datasets, are capable of modelling complex atmospheric interactions that remain hidden from conventional numerical prediction models. Meteorologists report an extension of the reliable forecast horizon by an average of 36 hours, which is of immense importance particularly for evacuation planning during hurricanes and flash floods.', true),
    (v_c1, 'fi', 'Koneoppimismenetelmien integrointi meteorologiseen ennustamiseen on merkittävästi parantanut myrskyvaroitusten tarkkuutta, mikä tarjoaa mahdollisuuden vähentää oleellisesti inhimillisiä menetyksiä äärimmäisissä sääilmiöissä. Uudenlaiset neuroverkkoarkkitehtuurit, jotka on koulutettu laajoilla historiallisilla sääaineistoilla, pystyvät mallintamaan monimutkaisia ilmakehän vuorovaikutuksia, jotka jäävät perinteisiltä numeerilta ennustemalleilla piiloon.', true),
    (v_c1, 'it', 'L''integrazione di metodi di apprendimento automatico nella prognostica meteorologica ha migliorato significativamente la precisione degli avvisi di maltempo, con il potenziale di ridurre sostanzialmente le perdite umane durante eventi meteorologici estremi. Le nuove architetture di reti neurali, addestrate su ampi set di dati meteorologici storici, sono in grado di modellare interazioni atmosferiche complesse che rimangono nascoste ai modelli di previsione numerica convenzionali.', true),
    (v_c1, 'pt', 'A integração de métodos de aprendizagem automática na prognóstica meteorológica melhorou significativamente a precisão dos avisos de tempestade, com o potencial de reduzir substancialmente as perdas humanas em eventos climáticos extremos. As novas arquiteturas de redes neurais, treinadas em extensos conjuntos de dados meteorológicos históricos, são capazes de modelar interações atmosféricas complexas que permanecem ocultas aos modelos de previsão numérica convencionais.', true)
  ON CONFLICT DO NOTHING;

  -- TEXTS 51-57: continuing A1 + C1
  -- TEXT 51: Tausende protestieren
  INSERT INTO text_versions (text_id, level, content) VALUES (51, 'A1',
    'Viele Menschen in Europa haben protestiert. In Mailand, Madrid und Lissabon gingen sie auf die Straße. Sie wollen bessere Löhne. Essen und Miete sind zu teuer. Die Proteste waren friedlich.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 51 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Muchas personas en Europa han protestado. En Milán, Madrid y Lisboa salieron a la calle. Quieren mejores salarios. La comida y el alquiler son demasiado caros. Las protestas fueron pacíficas.', true),
    (v_a1, 'en', 'Many people in Europe have protested. In Milan, Madrid and Lisbon they went to the streets. They want better wages. Food and rent are too expensive. The protests were peaceful.', true),
    (v_a1, 'fi', 'Monet ihmiset Euroopassa ovat protestoineet. Milanossa, Madridissa ja Lissabonissa he menivät kaduille. He haluavat parempia palkkoja. Ruoka ja vuokra ovat liian kalliita. Protestit olivat rauhallisia.', true),
    (v_a1, 'it', 'Molte persone in Europa hanno protestato. A Milano, Madrid e Lisbona sono scese in strada. Vogliono salari migliori. Il cibo e l''affitto sono troppo cari. Le proteste sono state pacifiche.', true),
    (v_a1, 'pt', 'Muitas pessoas na Europa protestaram. Em Milão, Madrid e Lisboa foram às ruas. Querem melhores salários. Comida e aluguel são caros demais. Os protestos foram pacíficos.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (51, 'C1',
    'Die jüngste Welle koordinierter Massenproteste in europäischen Metropolen offenbart die tiefgreifende sozioökonomische Unzufriedenheit, die breite Bevölkerungsschichten angesichts persistierender Inflation und stagnierender Reallöhne erfasst hat. In Mailand, Rom, Madrid und Lissabon mobilisierten Gewerkschaften und zivilgesellschaftliche Organisationen Zehntausende, die eine fundamentale Neuausrichtung der Wirtschafts- und Sozialpolitik forderten. Die Demonstranten prangerten insbesondere die wachsende Divergenz zwischen Unternehmensgewinnen und Arbeitnehmerentlohnung an, wobei sie auf die historisch hohen Gewinnmargen multinationaler Konzerne verwiesen. Politikwissenschaftler sehen in der supranationalen Koordination der Proteste ein Novum, das auf eine Europäisierung sozialer Konflikte hindeutet und die Legitimität nationaler Austeritätspolitiken grundsätzlich infrage stellt.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 51 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La reciente ola de protestas masivas coordinadas en metrópolis europeas revela la profunda insatisfacción socioeconómica que ha invadido amplios sectores de la población ante la inflación persistente y los salarios reales estancados. En Milán, Roma, Madrid y Lisboa, sindicatos y organizaciones de la sociedad civil movilizaron a decenas de miles que exigían una reorientación fundamental de la política económica y social. Los manifestantes denunciaron especialmente la creciente divergencia entre los beneficios empresariales y la remuneración de los trabajadores.', true),
    (v_c1, 'en', 'The recent wave of coordinated mass protests across European metropolises reveals the profound socioeconomic discontent that has gripped broad sections of the population amid persistent inflation and stagnant real wages. In Milan, Rome, Madrid and Lisbon, trade unions and civil society organisations mobilised tens of thousands who demanded a fundamental reorientation of economic and social policy. The demonstrators specifically denounced the growing divergence between corporate profits and worker remuneration. Political scientists see in the supranational coordination of the protests a novelty that points to a Europeanisation of social conflicts.', true),
    (v_c1, 'fi', 'Viimeaikainen koordinoitujen massamielenosoitusten aalto eurooppalaisissa suurkaupungeissa paljastaa syvän sosioekonomisen tyytymättömyyden, joka on vallannut laajoja väestöryhmiä jatkuvan inflaation ja pysähtyneiden reaali-palkkojen keskellä. Milanossa, Roomassa, Madridissa ja Lissabonissa ammattiliitot ja kansalaisyhteiskunnan organisaatiot mobilisoivat kymmeniätuhansia, jotka vaativat talous- ja sosiaalipolitiikan perusteellista uudelleensuuntaamista.', true),
    (v_c1, 'it', 'La recente ondata di proteste di massa coordinate nelle metropoli europee rivela la profonda insoddisfazione socioeconomica che ha colpito ampi strati della popolazione di fronte all''inflazione persistente e ai salari reali stagnanti. A Milano, Roma, Madrid e Lisbona, sindacati e organizzazioni della società civile hanno mobilitato decine di migliaia di persone che chiedevano un riorientamento fondamentale della politica economica e sociale. I manifestanti hanno denunciato in particolare la crescente divergenza tra profitti aziendali e remunerazione dei lavoratori.', true),
    (v_c1, 'pt', 'A recente vaga de protestos em massa coordenados nas metrópoles europeias revela a profunda insatisfação socioeconómica que tomou conta de amplas camadas da população perante a inflação persistente e os salários reais estagnados. Em Milão, Roma, Madrid e Lisboa, sindicatos e organizações da sociedade civil mobilizaram dezenas de milhares que exigiam uma reorientação fundamental da política económica e social.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 52: Digitale Bildung
  INSERT INTO text_versions (text_id, level, content) VALUES (52, 'A1',
    'Schulen in Europa verändern sich. Schüler lernen mit Tablets und Computern. Manche Schulen haben KI-Tutoren. Jeder Schüler lernt in seinem Tempo. Manche Eltern machen sich Sorgen. Andere finden digitale Bildung gut.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 52 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Las escuelas en Europa están cambiando. Los alumnos aprenden con tablets y ordenadores. Algunas escuelas tienen tutores de IA. Cada alumno aprende a su ritmo. Algunos padres se preocupan. Otros piensan que la educación digital es buena.', true),
    (v_a1, 'en', 'Schools in Europe are changing. Pupils learn with tablets and computers. Some schools have AI tutors. Each pupil learns at their own pace. Some parents are worried. Others think digital education is good.', true),
    (v_a1, 'fi', 'Koulut Euroopassa muuttuvat. Oppilaat opiskelevat tableteilla ja tietokoneilla. Joillakin kouluilla on tekoälytutoreita. Jokainen oppilas opiskelee omaan tahtiinsa. Jotkut vanhemmat ovat huolissaan. Toiset pitävät digitaalista koulutusta hyvänä.', true),
    (v_a1, 'it', 'Le scuole in Europa stanno cambiando. Gli alunni imparano con tablet e computer. Alcune scuole hanno tutor IA. Ogni alunno impara al proprio ritmo. Alcuni genitori sono preoccupati. Altri pensano che l''educazione digitale sia buona.', true),
    (v_a1, 'pt', 'As escolas na Europa estão a mudar. Os alunos aprendem com tablets e computadores. Algumas escolas têm tutores de IA. Cada aluno aprende ao seu ritmo. Alguns pais preocupam-se. Outros acham a educação digital boa.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (52, 'C1',
    'Die fortschreitende Digitalisierung des europäischen Bildungswesens vollzieht sich mit einer Dynamik, die fundamentale pädagogische Paradigmen infrage stellt. Die Implementierung KI-gestützter Tutorensysteme, die individualisierte Lernpfade generieren und den Lernfortschritt adaptiv anpassen, verspricht eine Demokratisierung des Bildungszugangs, birgt jedoch zugleich die Gefahr einer technologischen Determinierung pädagogischer Prozesse. Bildungsforscher konstatieren eine zunehmende Polarisierung: Während progressive Schulen in Skandinavien und den Benelux-Staaten hybride Lernmodelle erfolgreich erproben, verharren zahlreiche Bildungseinrichtungen in Süd- und Osteuropa in einer digitalen Unterversorgung. Die Debatte um Bildschirmzeit versus kognitive Entwicklung erweist sich als differenzierter, als die öffentliche Diskussion vermuten lässt, wobei Metaanalysen auf eine nichtlineare Dosis-Wirkungs-Beziehung hindeuten. Entscheidend sei nicht die Quantität, sondern die Qualität der digitalen Interaktion, betonen Entwicklungspsychologen.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 52 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La progresiva digitalización del sistema educativo europeo se desarrolla con una dinámica que cuestiona paradigmas pedagógicos fundamentales. La implementación de sistemas tutoriales asistidos por IA, que generan itinerarios de aprendizaje individualizados y adaptan el progreso de forma adaptativa, promete una democratización del acceso educativo, pero conlleva al mismo tiempo el riesgo de una determinación tecnológica de los procesos pedagógicos. Los investigadores en educación constatan una polarización creciente entre los modelos híbridos exitosos en Escandinavia y los países del Benelux, y la insuficiencia digital persistente en el sur y este de Europa.', true),
    (v_c1, 'en', 'The advancing digitalisation of European education is proceeding with a dynamism that calls fundamental pedagogical paradigms into question. The implementation of AI-assisted tutoring systems that generate individualised learning paths and adaptively adjust progress promises a democratisation of educational access yet simultaneously harbours the risk of technological determination of pedagogical processes. Education researchers observe an increasing polarisation: while progressive schools in Scandinavia and the Benelux states successfully trial hybrid learning models, numerous institutions in Southern and Eastern Europe remain digitally underserved. The debate over screen time versus cognitive development proves more nuanced than the public discourse suggests.', true),
    (v_c1, 'fi', 'Eurooppalaisen koulutusjärjestelmän etenevä digitalisaatio tapahtuu dynamiikalla, joka kyseenalaistaa pedagogiikan perusparadigmoja. Tekoälyavusteisten tutorijärjestelmien implementointi, jotka luovat yksilöllisiä oppimispolkuja ja mukautuvasti säätävät oppimisen etenemistä, lupaa koulutuksen saavutettavuuden demokratisointia mutta sisältää samalla riskin pedagogisten prosessien teknologisesta determinoinnista.', true),
    (v_c1, 'it', 'La progressiva digitalizzazione del sistema educativo europeo procede con una dinamica che mette in discussione paradigmi pedagogici fondamentali. L''implementazione di sistemi tutoriali assistiti dall''IA, che generano percorsi di apprendimento individualizzati e adattano il progresso in modo adattivo, promette una democratizzazione dell''accesso all''istruzione, ma comporta al contempo il rischio di una determinazione tecnologica dei processi pedagogici.', true),
    (v_c1, 'pt', 'A progressiva digitalização do sistema educativo europeu decorre com uma dinâmica que questiona paradigmas pedagógicos fundamentais. A implementação de sistemas tutoriais assistidos por IA, que geram percursos de aprendizagem individualizados e adaptam o progresso de forma adaptativa, promete uma democratização do acesso educativo, mas comporta simultaneamente o risco de uma determinação tecnológica dos processos pedagógicos.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 53: Rekordexporte
  INSERT INTO text_versions (text_id, level, content) VALUES (53, 'A1',
    'Deutschland verkauft viele Produkte ins Ausland. Besonders Autos und Maschinen. China und die USA kaufen viel. Aber die Energie ist teuer. Kleine Firmen haben es schwer. Die Regierung will helfen.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 53 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Alemania vende muchos productos al extranjero. Especialmente coches y máquinas. China y EE.UU. compran mucho. Pero la energía es cara. Las pequeñas empresas lo tienen difícil. El gobierno quiere ayudar.', true),
    (v_a1, 'en', 'Germany sells many products abroad. Especially cars and machines. China and the USA buy a lot. But energy is expensive. Small companies have a hard time. The government wants to help.', true),
    (v_a1, 'fi', 'Saksa myy paljon tuotteita ulkomaille. Erityisesti autoja ja koneita. Kiina ja USA ostavat paljon. Mutta energia on kallista. Pienillä yrityksillä on vaikeaa. Hallitus haluaa auttaa.', true),
    (v_a1, 'it', 'La Germania vende molti prodotti all''estero. Soprattutto auto e macchinari. La Cina e gli USA comprano molto. Ma l''energia è cara. Le piccole aziende hanno difficoltà. Il governo vuole aiutare.', true),
    (v_a1, 'pt', 'A Alemanha vende muitos produtos ao estrangeiro. Especialmente carros e máquinas. A China e os EUA compram muito. Mas a energia é cara. As pequenas empresas têm dificuldades. O governo quer ajudar.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (53, 'C1',
    'Die deutschen Exportzahlen haben ein historisches Allzeithoch erreicht, wobei die Automobil- und Maschinenbaubranche einmal mehr als tragende Säulen der Außenhandelsbilanz fungieren. Die Nachfrage aus China und den Vereinigten Staaten treibt diese Entwicklung maßgeblich voran, wenngleich die zunehmenden geopolitischen Spannungen und protektionistischen Tendenzen erhebliche Unsicherheitsfaktoren darstellen. Paradoxerweise kontrastiert diese makroökonomische Erfolgsmeldung mit der prekären Lage mittelständischer Zulieferbetriebe, die unter den exorbitanten Energiekosten ächzen und deren Wettbewerbsfähigkeit durch die schleppende Energiewende zunehmend erodiert. Ökonomen warnen vor einer strukturellen Verwundbarkeit des deutschen Exportmodells, das in seiner Abhängigkeit von wenigen Schlüsselindustrien und dominanten Absatzmärkten inhärente Klumpenrisiken birgt.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 53 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'Las cifras de exportación alemanas han alcanzado un máximo histórico, con la industria automovilística y de maquinaria fungiendo una vez más como pilares fundamentales de la balanza comercial exterior. La demanda de China y Estados Unidos impulsa significativamente esta evolución, aunque las crecientes tensiones geopolíticas y las tendencias proteccionistas representan factores de incertidumbre considerables. Paradójicamente, esta noticia macroeconómica positiva contrasta con la situación precaria de las pymes proveedoras, que sufren bajo los exorbitantes costes energéticos.', true),
    (v_c1, 'en', 'German export figures have reached an all-time high, with the automotive and mechanical engineering sectors once again serving as the load-bearing pillars of the foreign trade balance. Demand from China and the United States is driving this development significantly, although growing geopolitical tensions and protectionist tendencies represent considerable uncertainty factors. Paradoxically, this macroeconomic success story contrasts with the precarious situation of medium-sized suppliers, who are groaning under exorbitant energy costs and whose competitiveness is increasingly eroding due to the sluggish energy transition.', true),
    (v_c1, 'fi', 'Saksan vientiluvut ovat saavuttaneet historiallisen ennätyksen, ja auto- ja koneteollisuus toimivat jälleen ulkomaankauppataseen kantavina pilareina. Kiinan ja Yhdysvaltojen kysyntä ajaa tätä kehitystä merkittävästi, vaikka kasvavat geopoliittiset jännitteet ja protektionistiset suuntaukset edustavat huomattavia epävarmuustekijöitä.', true),
    (v_c1, 'it', 'Le cifre delle esportazioni tedesche hanno raggiunto un massimo storico, con il settore automobilistico e dell''ingegneria meccanica che fungono ancora una volta da pilastri portanti della bilancia commerciale estera. La domanda dalla Cina e dagli Stati Uniti guida significativamente questo sviluppo, sebbene le crescenti tensioni geopolitiche e le tendenze protezionistiche rappresentino fattori di incertezza considerevoli.', true),
    (v_c1, 'pt', 'Os números das exportações alemãs atingiram um máximo histórico, com os setores automóvel e de engenharia mecânica a funcionar uma vez mais como pilares fundamentais da balança comercial. A procura da China e dos Estados Unidos impulsiona significativamente este desenvolvimento, embora as crescentes tensões geopolíticas e as tendências protecionistas representem fatores de incerteza consideráveis.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 54: Klimakonferenz Mongolei
  INSERT INTO text_versions (text_id, level, content) VALUES (54, 'A1',
    'Viele Länder treffen sich in der Mongolei. Sie sprechen über das Klima. Die Erde wird wärmer. Das Eis schmilzt. Die Länder wollen weniger CO2 machen. Das Ziel: 50 Prozent weniger bis 2035.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 54 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Muchos países se reúnen en Mongolia. Hablan sobre el clima. La Tierra se calienta. El hielo se derrite. Los países quieren producir menos CO2. El objetivo: 50 por ciento menos hasta 2035.', true),
    (v_a1, 'en', 'Many countries meet in Mongolia. They talk about the climate. The Earth is getting warmer. The ice is melting. The countries want to produce less CO2. The goal: 50 percent less by 2035.', true),
    (v_a1, 'fi', 'Monet maat tapaavat Mongoliassa. He puhuvat ilmastosta. Maa lämpenee. Jää sulaa. Maat haluavat tuottaa vähemmän CO2:ta. Tavoite: 50 prosenttia vähemmän vuoteen 2035 mennessä.', true),
    (v_a1, 'it', 'Molti paesi si incontrano in Mongolia. Parlano del clima. La Terra si riscalda. Il ghiaccio si scioglie. I paesi vogliono produrre meno CO2. L''obiettivo: 50 percento in meno entro il 2035.', true),
    (v_a1, 'pt', 'Muitos países reúnem-se na Mongólia. Falam sobre o clima. A Terra está a aquecer. O gelo derrete. Os países querem produzir menos CO2. O objetivo: 50 por cento menos até 2035.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (54, 'C1',
    'Die in der mongolischen Hauptstadt Ulaanbaatar abgehaltene Klimakonferenz hat mit der Verabschiedung eines ambitionierten Reduktionsziels von 50 Prozent der globalen CO2-Emissionen bis 2035 einen historischen Meilenstein gesetzt, der allerdings von Klimawissenschaftlern als unzureichend kritisiert wird, um die 1,5-Grad-Schwelle des Pariser Abkommens einzuhalten. Die Verhandlungen offenbarten die persistierende Kluft zwischen Industrie- und Entwicklungsländern hinsichtlich der Verteilung finanzieller Lasten und technologischer Transferleistungen. Insbesondere die Inselstaaten des Pazifiks, deren existenzielle Bedrohung durch den steigenden Meeresspiegel unmittelbar greifbar ist, forderten weiterreichende Sofortmaßnahmen. Die Wahl der Mongolei als Austragungsort symbolisiert die wachsende Sichtbarkeit zentralasiatischer Staaten in der internationalen Klimadiplomatie, zumal die Region selbst von der fortschreitenden Desertifikation und extremen Temperaturschwankungen überproportional betroffen ist.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 54 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La conferencia climática celebrada en la capital mongola Ulán Bator ha establecido un hito histórico con la aprobación de un ambicioso objetivo de reducción del 50 por ciento de las emisiones globales de CO2 hasta 2035, aunque los científicos climáticos lo critican como insuficiente para cumplir el umbral de 1,5 grados del Acuerdo de París. Las negociaciones revelaron la persistente brecha entre países industrializados y en desarrollo respecto a la distribución de cargas financieras y transferencias tecnológicas.', true),
    (v_c1, 'en', 'The climate conference held in the Mongolian capital Ulaanbaatar has set a historic milestone with the adoption of an ambitious reduction target of 50 percent of global CO2 emissions by 2035, which is nevertheless criticised by climate scientists as insufficient to meet the 1.5-degree threshold of the Paris Agreement. The negotiations revealed the persistent gap between industrialised and developing nations regarding the distribution of financial burdens and technology transfers. The Pacific island states in particular, whose existential threat from rising sea levels is immediately palpable, demanded more far-reaching immediate measures.', true),
    (v_c1, 'fi', 'Mongolian pääkaupungissa Ulaanbaatarissa pidetty ilmastokonferenssi on asettanut historiallisen virstanpylvään hyväksymällä kunnianhimoisen tavoitteen vähentää maailmanlaajuisia CO2-päästöjä 50 prosentilla vuoteen 2035 mennessä, vaikka ilmastotutkijat kritisoivat sitä riittämättömäksi Pariisin sopimuksen 1,5 asteen kynnyksen saavuttamiseksi.', true),
    (v_c1, 'it', 'La conferenza sul clima tenutasi nella capitale mongola Ulaanbaatar ha segnato una pietra miliare storica con l''adozione di un ambizioso obiettivo di riduzione del 50 percento delle emissioni globali di CO2 entro il 2035, criticato tuttavia dagli scienziati del clima come insufficiente per rispettare la soglia di 1,5 gradi dell''Accordo di Parigi.', true),
    (v_c1, 'pt', 'A conferência climática realizada na capital mongol Ulaanbaatar estabeleceu um marco histórico com a adoção de um ambicioso objetivo de redução de 50 por cento das emissões globais de CO2 até 2035, embora criticado por cientistas climáticos como insuficiente para cumprir o limiar de 1,5 graus do Acordo de Paris.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 55: Neue KI-Modelle
  INSERT INTO text_versions (text_id, level, content) VALUES (55, 'A1',
    'KI wird immer besser. Neue Programme können Texte schreiben und Bilder machen. Viele Menschen nutzen KI jeden Tag. KI hilft bei der Arbeit und in der Schule. Aber manche haben Angst vor KI. Die EU hat neue Regeln gemacht.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 55 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'La IA mejora cada vez más. Nuevos programas pueden escribir textos y hacer imágenes. Muchas personas usan IA todos los días. La IA ayuda en el trabajo y en la escuela. Pero algunos tienen miedo de la IA. La UE ha hecho nuevas reglas.', true),
    (v_a1, 'en', 'AI is getting better and better. New programmes can write texts and make images. Many people use AI every day. AI helps at work and at school. But some are afraid of AI. The EU has made new rules.', true),
    (v_a1, 'fi', 'Tekoäly paranee koko ajan. Uudet ohjelmat osaavat kirjoittaa tekstejä ja tehdä kuvia. Monet ihmiset käyttävät tekoälyä joka päivä. Tekoäly auttaa työssä ja koulussa. Mutta jotkut pelkäävät tekoälyä. EU on tehnyt uudet säännöt.', true),
    (v_a1, 'it', 'L''IA migliora sempre di più. Nuovi programmi possono scrivere testi e fare immagini. Molte persone usano l''IA ogni giorno. L''IA aiuta al lavoro e a scuola. Ma alcuni hanno paura dell''IA. L''UE ha fatto nuove regole.', true),
    (v_a1, 'pt', 'A IA melhora cada vez mais. Novos programas podem escrever textos e fazer imagens. Muitas pessoas usam IA todos os dias. A IA ajuda no trabalho e na escola. Mas alguns têm medo da IA. A UE fez novas regras.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (55, 'C1',
    'Die rasante Evolution generativer KI-Modelle hat eine gesellschaftliche Transformation eingeleitet, deren Tragweite mit der industriellen Revolution verglichen wird. Die jüngste Generation multimodaler Systeme, die simultan Text, Bild, Audio und Video generieren und interpretieren können, durchdringt zunehmend sämtliche Lebensbereiche von der medizinischen Diagnostik über die juristische Textanalyse bis hin zum kreativen Schaffen. Die Europäische Union hat mit dem AI Act einen wegweisenden regulatorischen Rahmen geschaffen, der risikobasierte Transparenzpflichten für KI-Anbieter etabliert und hochriskante Anwendungen einer strengen Konformitätsbewertung unterwirft. Gleichwohl bleibt die fundamentale Frage ungelöst, inwiefern autonome Systeme, die auf stochastischen Prozessen basieren, für ihre Ausgaben haftbar gemacht werden können. Arbeitsmarktökonomen prognostizieren eine tiefgreifende Umstrukturierung der Beschäftigungslandschaft, wobei die Komplementarität menschlicher und maschineller Fähigkeiten entscheidend dafür sein dürfte, ob die Technologie primär Arbeitsplätze substituiert oder augmentiert.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 55 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La rápida evolución de los modelos de IA generativa ha iniciado una transformación social cuyo alcance se compara con la revolución industrial. La última generación de sistemas multimodales, capaces de generar e interpretar simultáneamente texto, imagen, audio y vídeo, penetra cada vez más todos los ámbitos de la vida. La UE ha creado con el AI Act un marco regulatorio pionero que establece obligaciones de transparencia basadas en riesgo para proveedores de IA y somete las aplicaciones de alto riesgo a una estricta evaluación de conformidad. Los economistas laborales pronostican una profunda reestructuración del panorama laboral.', true),
    (v_c1, 'en', 'The rapid evolution of generative AI models has initiated a societal transformation whose magnitude is compared to the industrial revolution. The latest generation of multimodal systems, capable of simultaneously generating and interpreting text, image, audio and video, increasingly permeates all areas of life. The EU has created a pioneering regulatory framework with the AI Act, establishing risk-based transparency obligations for AI providers and subjecting high-risk applications to strict conformity assessment. Labour economists forecast a profound restructuring of the employment landscape, where the complementarity of human and machine capabilities will be decisive in determining whether the technology primarily substitutes or augments jobs.', true),
    (v_c1, 'fi', 'Generatiivisten tekoälymallien nopea evoluutio on käynnistänyt yhteiskunnallisen muutoksen, jonka laajuutta verrataan teolliseen vallankumoukseen. Uusin sukupolvi multimodaalisia järjestelmiä, jotka pystyvät samanaikaisesti tuottamaan ja tulkitsemaan tekstiä, kuvaa, ääntä ja videota, tunkeutuu yhä enemmän kaikille elämänalueille. EU on luonut AI Actilla uraauurtavan sääntelykehyksen, joka asettaa riskiperusteisia läpinäkyvyysvelvoitteita tekoälytarjoajille.', true),
    (v_c1, 'it', 'La rapida evoluzione dei modelli di IA generativa ha avviato una trasformazione sociale la cui portata viene paragonata alla rivoluzione industriale. L''ultima generazione di sistemi multimodali, in grado di generare e interpretare simultaneamente testo, immagini, audio e video, permea sempre più tutti gli ambiti della vita. L''UE ha creato con l''AI Act un quadro normativo pionieristico che stabilisce obblighi di trasparenza basati sul rischio per i fornitori di IA.', true),
    (v_c1, 'pt', 'A rápida evolução dos modelos de IA generativa iniciou uma transformação social cuja magnitude é comparada à revolução industrial. A última geração de sistemas multimodais, capazes de gerar e interpretar simultaneamente texto, imagem, áudio e vídeo, permeia cada vez mais todas as áreas da vida. A UE criou com o AI Act um quadro regulatório pioneiro que estabelece obrigações de transparência baseadas no risco para fornecedores de IA.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 56: Ronaldo suspendiert
  INSERT INTO text_versions (text_id, level, content) VALUES (56, 'A1',
    'Cristiano Ronaldo hat Probleme. Der portugiesische Verband hat ihn gesperrt. Ronaldo hat den Schiedsrichter kritisiert. Das ist gegen die Regeln. Er kann drei Spiele nicht spielen. Die Fans sind traurig.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 56 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Cristiano Ronaldo tiene problemas. La federación portuguesa lo ha suspendido. Ronaldo criticó al árbitro. Eso es contra las reglas. No puede jugar tres partidos. Los fans están tristes.', true),
    (v_a1, 'en', 'Cristiano Ronaldo has problems. The Portuguese football association has suspended him. Ronaldo criticised the referee. That is against the rules. He cannot play three matches. The fans are sad.', true),
    (v_a1, 'fi', 'Cristiano Ronaldolla on ongelmia. Portugalin jalkapalloliitto on hyllyttänyt hänet. Ronaldo arvosteli tuomaria. Se on sääntöjen vastaista. Hän ei voi pelata kolmea ottelua. Fanit ovat surullisia.', true),
    (v_a1, 'it', 'Cristiano Ronaldo ha problemi. La federazione portoghese lo ha sospeso. Ronaldo ha criticato l''arbitro. Questo è contro le regole. Non può giocare tre partite. I tifosi sono tristi.', true),
    (v_a1, 'pt', 'Cristiano Ronaldo tem problemas. A federação portuguesa suspendeu-o. Ronaldo criticou o árbitro. Isso é contra as regras. Não pode jogar três jogos. Os fãs estão tristes.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (56, 'C1',
    'Die Suspendierung Cristiano Ronaldos durch den portugiesischen Fußballverband wirft ein Schlaglicht auf die inhärenten Spannungen zwischen der kommerziellen Vermarktung von Sportikonen und der institutionellen Disziplinargewalt der Verbände. Der 41-jährige Rekordnationalspieler, dessen Kritik am Schiedsrichter die Verbandssatzung unzweideutig verletzte, sieht sich mit einer Dreiersperre konfrontiert, die seine möglicherweise letzte Länderspielperiode überschattet. Sportrechtler verweisen auf den Präzedenzcharakter des Falls, da die Verhältnismäßigkeit disziplinarischer Maßnahmen gegenüber Spielern von Ronaldos Statur unweigerlich unter dem Brennglas der Öffentlichkeit steht. Die Episode illustriert zudem die zunehmende Problematik alternder Superstars, die zwischen der unaufhaltsamen physischen Regression und dem selbstauferlegten Anspruch auf sportliche Relevanz oszillieren. Die Auswirkungen auf die Sponsorenverträge und die mediale Rezeption des Falls verdeutlichen die komplexe Verflechtung von Sport, Kommerz und öffentlicher Wahrnehmung im modernen Profifußball.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 56 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'La suspensión de Cristiano Ronaldo por la federación portuguesa de fútbol arroja luz sobre las tensiones inherentes entre la comercialización de íconos deportivos y la autoridad disciplinaria institucional de las federaciones. El jugador de 41 años, cuya crítica al árbitro violó inequívocamente los estatutos de la federación, se enfrenta a una suspensión de tres partidos que ensombrece su posiblemente último período de selección. Los juristas deportivos señalan el carácter precedente del caso, ya que la proporcionalidad de las medidas disciplinarias contra jugadores de la talla de Ronaldo está inevitablemente bajo la lupa pública.', true),
    (v_c1, 'en', 'Cristiano Ronaldo''s suspension by the Portuguese football association throws a spotlight on the inherent tensions between the commercial marketing of sports icons and the institutional disciplinary authority of associations. The 41-year-old record international, whose criticism of the referee unambiguously violated the association''s statutes, faces a three-match ban that overshadows what may be his final international period. Sports lawyers point to the precedent-setting nature of the case, as the proportionality of disciplinary measures against players of Ronaldo''s stature inevitably comes under public scrutiny. The episode also illustrates the growing problem of ageing superstars oscillating between inexorable physical regression and self-imposed claims to sporting relevance.', true),
    (v_c1, 'fi', 'Cristiano Ronaldon hyllytys Portugalin jalkapalloliiton toimesta valaisee urheilutähtien kaupallisen markkinoinnin ja liittojen institutionaalisen kurinpitovallan välisiä sisäsyntyisiä jännitteitä. 41-vuotias ennätysmaaottelupelaaja, jonka tuomarikritiikki rikkoi yksiselitteisesti liiton sääntöjä, kohtaa kolmen ottelun pelikiellon, joka varjostaa hänen mahdollisesti viimeistä maajoukkuejaksoa. Urheiluoikeudellisesti tapaus on ennakkotapausluonteinen.', true),
    (v_c1, 'it', 'La sospensione di Cristiano Ronaldo da parte della federazione calcistica portoghese getta luce sulle tensioni intrinseche tra la commercializzazione di icone sportive e l''autorità disciplinare istituzionale delle federazioni. Il 41enne recordman di presenze in nazionale, la cui critica all''arbitro ha violato inequivocabilmente lo statuto della federazione, affronta una squalifica di tre partite che oscura quello che potrebbe essere il suo ultimo periodo in nazionale.', true),
    (v_c1, 'pt', 'A suspensão de Cristiano Ronaldo pela federação portuguesa de futebol lança luz sobre as tensões inerentes entre a comercialização de ícones desportivos e a autoridade disciplinar institucional das federações. O jogador de 41 anos, recordista de internacionalizações, cuja crítica ao árbitro violou inequivocamente os estatutos da federação, enfrenta uma suspensão de três jogos que ensombra o que poderá ser o seu último período de seleção.', true)
  ON CONFLICT DO NOTHING;

  -- TEXT 57: 65 Jahre Mauerbau
  INSERT INTO text_versions (text_id, level, content) VALUES (57, 'A1',
    'Vor 65 Jahren hat die DDR die Berliner Mauer gebaut. Deutschland war in zwei Teile geteilt: Ost und West. Familien waren getrennt. 1989 ist die Mauer gefallen. Heute erinnert sich Deutschland daran. Freiheit ist wichtig.'
  ) RETURNING id INTO v_a1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_a1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 57 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_a1, 'es', 'Hace 65 años la RDA construyó el Muro de Berlín. Alemania estaba dividida en dos partes: Este y Oeste. Las familias estaban separadas. En 1989 cayó el muro. Hoy Alemania lo recuerda. La libertad es importante.', true),
    (v_a1, 'en', 'Sixty-five years ago the GDR built the Berlin Wall. Germany was divided into two parts: East and West. Families were separated. In 1989 the wall fell. Today Germany remembers. Freedom is important.', true),
    (v_a1, 'fi', '65 vuotta sitten DDR rakensi Berliinin muurin. Saksa oli jaettu kahteen osaan: itään ja länteen. Perheet olivat erillään. Vuonna 1989 muuri kaatui. Tänään Saksa muistaa sen. Vapaus on tärkeää.', true),
    (v_a1, 'it', 'Sessantacinque anni fa la DDR costruì il Muro di Berlino. La Germania era divisa in due parti: Est e Ovest. Le famiglie erano separate. Nel 1989 il muro cadde. Oggi la Germania ricorda. La libertà è importante.', true),
    (v_a1, 'pt', 'Há 65 anos a RDA construiu o Muro de Berlim. A Alemanha estava dividida em duas partes: Leste e Oeste. As famílias estavam separadas. Em 1989 o muro caiu. Hoje a Alemanha lembra. A liberdade é importante.', true)
  ON CONFLICT DO NOTHING;

  INSERT INTO text_versions (text_id, level, content) VALUES (57, 'C1',
    'Die Erinnerung an den 65. Jahrestag des Mauerbaus am 13. August 1961 gewinnt vor dem Hintergrund aktueller demokratiepolitischer Verwerfungen eine beklemmende Aktualität. Das Bauwerk, das die DDR-Führung euphemistisch als „Antifaschistischen Schutzwall" deklarierte, teilte nicht nur eine Stadt und ein Land, sondern manifestierte die ideologische Zerrissenheit einer gesamten Epoche. Mindestens 140 Menschen verloren bei Fluchtversuchen ihr Leben, wobei die exakte Zahl aufgrund lückenhafter DDR-Akten weiterhin Gegenstand historiographischer Forschung bleibt. Der Fall der Mauer am 9. November 1989 wird gemeinhin als friedliche Revolution glorifiziert, doch Soziologen weisen darauf hin, dass die psychosozialen Langzeitfolgen der deutschen Teilung bis heute nachwirken und sich in persistierenden Einkommens-, Vermögens- und Mentaldisparitäten zwischen Ost und West manifestieren. Die gegenwärtige Erstarkung populistischer Bewegungen in den neuen Bundesländern wird von Politikwissenschaftlern als Symptom einer unvollendeten inneren Vereinigung gedeutet, die weit über ökonomische Angleichung hinausreicht.'
  ) RETURNING id INTO v_c1;
  INSERT INTO text_version_meanings (text_version_id, meaning_id)
    SELECT v_c1, tvm.meaning_id FROM text_version_meanings tvm
    JOIN text_versions tv ON tv.id = tvm.text_version_id
    WHERE tv.text_id = 57 AND tv.level = 'A2' ON CONFLICT DO NOTHING;
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_c1, 'es', 'El recuerdo del 65 aniversario de la construcción del Muro el 13 de agosto de 1961 cobra una inquietante actualidad ante las actuales fracturas democráticas. La estructura, que el régimen de la RDA declaró eufemísticamente como "Muro de Protección Antifascista", no solo dividió una ciudad y un país, sino que manifestó el desgarramiento ideológico de toda una época. Al menos 140 personas perdieron la vida en intentos de fuga. La caída del Muro el 9 de noviembre de 1989 se glorifica generalmente como revolución pacífica, pero los sociólogos señalan que las consecuencias psicosociales a largo plazo de la división alemana persisten hasta hoy. El actual fortalecimiento de movimientos populistas en los nuevos estados federados es interpretado como síntoma de una unificación interior inacabada.', true),
    (v_c1, 'en', 'The commemoration of the 65th anniversary of the Wall''s construction on 13 August 1961 acquires a disquieting topicality against the backdrop of current democratic upheavals. The structure, which the GDR leadership euphemistically declared an "Anti-Fascist Protection Rampart," not only divided a city and a country but manifested the ideological fragmentation of an entire epoch. At least 140 people lost their lives in escape attempts, though the exact figure remains subject to historiographic research due to incomplete GDR records. The fall of the Wall on 9 November 1989 is commonly glorified as a peaceful revolution, yet sociologists point out that the long-term psychosocial consequences of German division persist to this day, manifesting in persistent income, wealth and mental disparities between East and West.', true),
    (v_c1, 'fi', 'Muistelu 65 vuotta sitten 13. elokuuta 1961 rakennetusta muurista saa ahdistavan ajankohtaisuuden nykyisten demokratiapoliittisten murtumien taustalla. Rakennelma, jonka DDR:n johto julisti kiertoilmaisulla "antifasistiseksi suojavallaksi", ei jakanut ainoastaan kaupunkia ja maata vaan ilmensi koko aikakauden ideologista repeytymistä. Vähintään 140 ihmistä menetti henkensä pakoyrityksissa. Muurin kaatumista 9. marraskuuta 1989 ylistetään yleisesti rauhanomaisena vallankumouksena, mutta sosiologit huomauttavat, että Saksan jakautumisen pitkäaikaiset psykososiaaliset seuraukset vaikuttavat yhä tänään.', true),
    (v_c1, 'it', 'Il ricordo del 65° anniversario della costruzione del Muro il 13 agosto 1961 acquista un''inquietante attualità sullo sfondo delle attuali fratture democratiche. La struttura, che il regime della DDR dichiarò eufemisticamente "Vallo di Protezione Antifascista", non divise solo una città e un paese, ma manifestò la lacerazione ideologica di un''intera epoca. Almeno 140 persone persero la vita nei tentativi di fuga. La caduta del Muro il 9 novembre 1989 viene comunemente glorificata come rivoluzione pacifica, ma i sociologi sottolineano che le conseguenze psicosociali a lungo termine della divisione tedesca persistono ancora oggi.', true),
    (v_c1, 'pt', 'A memória do 65.° aniversário da construção do Muro a 13 de agosto de 1961 adquire uma inquietante atualidade perante as atuais fraturas democráticas. A estrutura, que o regime da RDA declarou eufemisticamente como "Muralha de Proteção Antifascista", não dividiu apenas uma cidade e um país, mas manifestou a dilaceração ideológica de toda uma época. Pelo menos 140 pessoas perderam a vida em tentativas de fuga. A queda do Muro a 9 de novembro de 1989 é comummente glorificada como revolução pacífica, mas os sociólogos apontam que as consequências psicossociais a longo prazo da divisão alemã persistem até hoje.', true)
  ON CONFLICT DO NOTHING;

END $$;
