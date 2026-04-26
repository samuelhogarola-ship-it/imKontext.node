-- ============================================================
-- Seed generated from structured TXT
-- Source: /Users/sam/Documents/imKontext/backend/anadir_a_supabase/imKontext Ferien Jugendliche 2026.txt
-- Tables: texts, text_versions, vocabulario, text_version_vocabulary
-- ============================================================

-- Theme 1: Interrail: Mit dem Zug durch ganz Europa
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Interrail: Mit dem Zug durch ganz Europa',
  null,
  'premium',
  now(),
  'interrail-mit-dem-zug-durch-ganz-europa'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'interrail-mit-dem-zug-durch-ganz-europa'),
  'A2',
  'Interrail ist ein Zugticket für Europa. Mit diesem Ticket kann man in vielen Ländern Zug fahren. Es ist ein Ticket für alle Züge.

Viele junge Menschen kaufen das Interrail-Ticket in den Sommerferien. Es ist eine günstige Art zu reisen. Man kann Paris, Rom oder Barcelona besuchen.

In diesem Jahr kaufen besonders viele Jugendliche das Ticket. Der Zug ist gut für die Umwelt. Das finden viele junge Menschen wichtig.'
),
(
  (select id from texts where slug = 'interrail-mit-dem-zug-durch-ganz-europa'),
  'B1',
  'Das Interrail-Ticket erlebt in diesem Sommer einen neuen Rekord. Mehr als 500.000 junge Europäerinnen und Europäer haben das Ticket für die Sommerferien 2026 bereits gebucht – so viele wie nie zuvor. Das Ticket erlaubt es, in 33 europäischen Ländern unbegrenzt Zug zu fahren.

Die Gründe für den Boom sind vielfältig. Viele Jugendliche wollen nachhaltig reisen und vermeiden das Flugzeug. Dazu kommt, dass die EU seit 2021 kostenlose Interrail-Pässe für 18-Jährige anbietet. Hunderttausende junge Menschen haben das Angebot in den letzten Jahren genutzt.

Beliebte Ziele sind Spanien, Italien und Portugal. Aber auch weniger bekannte Länder wie Slowenien oder Nordmazedonien werden immer beliebter. Der Zug ist langsamer als das Flugzeug – aber viele sagen: Das Reisen selbst ist das Erlebnis.'
),
(
  (select id from texts where slug = 'interrail-mit-dem-zug-durch-ganz-europa'),
  'B2',
  'Das Interrail-Ticket ist in diesem Sommer so gefragt wie nie. Mehr als eine halbe Million Buchungen wurden bereits im April registriert – ein Anstieg von rund 30 Prozent gegenüber dem Vorjahreszeitraum. Hinter dem Boom steckt mehr als nur ein Reisetrend: Es ist ein kultureller Wandel in der Art, wie junge Europäerinnen und Europäer Urlaub denken.

Die Kombination aus ökologischem Bewusstsein, dem kostenlosen EU-Pass für 18-Jährige und einer wachsenden Skepsis gegenüber Massentourismus hat eine neue Generation von Zugreisenden hervorgebracht. Statt All-inclusive-Urlaub oder Billigflug-Wochenende wird das sogenannte Slow Travel zum Leitbild: bewusst reisen, Zwischenstopps einplanen, Städte abseits der Touristenpfade entdecken.

Für die Deutsche Bahn und ihre europäischen Partner ist der Boom eine Herausforderung. Beliebte Strecken wie München–Venedig oder Berlin–Prag sind in den Sommermonaten oft ausgebucht. Die EU diskutiert, ob mehr Nachtverbindungen und eine bessere grenzüberschreitende Buchungsinfrastruktur geschaffen werden sollen, um den Trend zu unterstützen.'
),
(
  (select id from texts where slug = 'interrail-mit-dem-zug-durch-ganz-europa'),
  'C1',
  'Der Interrail-Boom 2026 ist kein bloßes Marktphänomen – er ist ein Symptom einer tiefergehenden Verschiebung in der Reisekultur junger Europäerinnen und Europäer. Wer heute mit dem Zug von Berlin nach Lissabon fährt, trifft eine Entscheidung, die zugleich ökologisch, politisch und ästhetisch aufgeladen ist: langsamer reisen, weniger emittieren, Europa nicht als Flugraum, sondern als Landschaft erleben.

Die EU hat diesen Wandel aktiv befördert. Das DiscoverEU-Programm, das 18-Jährigen kostenlose Interrail-Pässe zur Verfügung stellt, ist konzeptionell klug: Es kombiniert Mobilitätsförderung mit europäischer Identitätsbildung. Wer als Jugendlicher mit dem Zug durch zehn Länder gefahren ist, hat Europa nicht als abstraktes Politikprojekt kennengelernt, sondern als gelebten Raum.

Strukturell offenbart der Boom jedoch die Defizite des europäischen Schienennetzes. Grenzüberschreitende Buchungen sind immer noch umständlich, Nachtverbindungen dünn gesät und die Preisgestaltung jenseits des Interrail-Passes wenig wettbewerbsfähig gegenüber Billigfliegern. Die Frage, ob Europa ein echtes Eisenbahnnetz des 21. Jahrhunderts bekommt, ist letztlich eine Frage des politischen Willens und der Investitionsbereitschaft – nicht der Nachfrage. Die ist offensichtlich vorhanden.

Interrail ist damit mehr als ein Ticket. Es ist ein Argument.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 2: Surfen an der Ostsee: Ein Sommersport für Jugendliche
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Surfen an der Ostsee: Ein Sommersport für Jugendliche',
  null,
  'premium',
  now(),
  'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche'),
  'A2',
  'An der Ostsee in Norddeutschland gibt es viele Surfcamps. Dort lernen Kinder und Jugendliche surfen. Das Surfen macht viel Spaß.

Die Ostsee ist ruhiger als der Atlantik. Das ist gut für Anfänger. Man kann auch Kiten, Stand-up-Paddling und Windsurfen lernen.

Im Sommer kommen viele Jugendliche aus ganz Deutschland. Sie wohnen im Camp, essen zusammen und lernen neue Freunde kennen. Es ist ein tolles Erlebnis.'
),
(
  (select id from texts where slug = 'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche'),
  'B1',
  'Die Surfcamps an der schleswig-holsteinischen und mecklenburgischen Ostseeküste melden für den Sommer 2026 viele ausgebuchte Wochen. Die Nachfrage nach Wassersport-Ferien in Deutschland ist in den letzten Jahren stark gestiegen – besonders bei Jugendlichen zwischen 13 und 19 Jahren.

In den Camps können die Teilnehmerinnen und Teilnehmer Windsurfen, Kitesurfen, SUP (Stand-up-Paddling) und klassisches Wellenreiten lernen. Die Ostsee ist wegen ihrer geringeren Wellenhöhe ideal für Einsteiger. Erfahrene Surfer können an windstarken Tagen trotzdem echte Herausforderungen finden.

Viele Jugendliche kommen allein und lernen im Camp neue Leute kennen. Das soziale Erlebnis ist für viele genauso wichtig wie der Sport selbst. Eltern schätzen, dass die Camps pädagogisch betreut sind und gleichzeitig viel Freiheit lassen.'
),
(
  (select id from texts where slug = 'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche'),
  'B2',
  'Die Buchungszahlen sprechen eine klare Sprache: Wassersport-Feriencamps an der deutschen Ostseeküste sind im Sommer 2026 gefragter denn je. Betreiber in Prerow, Kühlungsborn und auf Fehmarn berichten von Wartelisten für die Hauptsaison und einer deutlich gestiegenen Nachfrage aus dem Inland – ein Trend, den Branchenkenner auf eine Kombination aus Nachholeffekten nach der Pandemie, gestiegenen Auslandsreisekosten und wachsendem Interesse an Natursport zurückführen.

Das Angebot ist in den vergangenen Jahren professioneller geworden. Moderne Camps verbinden Wassersportausbildung mit nachhaltigen Konzepten: Solarenergie, vegetarische Verpflegung und lokale Kooperationen mit Biobauern gehören inzwischen zum Standard vieler Anbieter. Einige Camps haben Sprachmodule integriert – Englisch lernen am Morgen, Surfen am Nachmittag.

Für viele Jugendliche sind diese Ferien mehr als Urlaub. Die Kombination aus körperlicher Herausforderung, Gemeinschaft und Naturnähe schafft Erfahrungen, die im schulischen Alltag kaum zu machen sind. Pädagoginnen und Pädagogen sehen in solchen Angeboten ein wertvolles Komplement zu digitallastigen Freizeitgewohnheiten.'
),
(
  (select id from texts where slug = 'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche'),
  'C1',
  'Dass Surfcamps an der deutschen Ostsee boomen, ist keine Überraschung – es ist das vorhersehbare Ergebnis mehrerer zusammenlaufender Trends. Steigende Flugreisekosten, ein wachsendes Bewusstsein für naturbasierte Freizeitgestaltung und die pandemiebedingte Neuentdeckung inländischer Urlaubsziele haben die Nachfrage nach Wassersport-Feriencamps in den letzten drei Jahren mehr als verdoppelt.

Was dabei interessiert, ist nicht nur die wirtschaftliche Dimension, sondern die pädagogische. Surfcamps versprechen – und liefern häufig – etwas, das im Alltag Jugendlicher zunehmend selten geworden ist: körperliche Herausforderung in einer nicht-kompetitiven Umgebung, unmittelbares Naturerleben ohne digitale Vermittlung und soziale Bindungen, die unter gemeinsamen Anstrengungsbedingungen entstehen. Die Forschung zur positiven Jugendentwicklung stützt diese Erfahrungswerte empirisch.

Zugleich unterliegt das Segment einer zunehmenden Kommerzialisierung, die nicht ohne Widersprüche ist. Premium-Camps mit Wellnessangeboten und Influencer-Kooperationen werben um eine zahlungskräftige Klientel, während günstigere Angebote für einkommensschwächere Familien seltener werden. Die Frage, ob Natursporterfahrungen ein Privileg der Mittelschicht bleiben oder durch öffentliche Förderung breiter zugänglich gemacht werden sollen, wird politisch bislang kaum gestellt.

Ein Surfcamp ist kein Bildungsprogramm. Aber es ist auch nicht nichts.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 3: Das Deutschlandticket: Günstig mit dem Zug durch Deutschland
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Das Deutschlandticket: Günstig mit dem Zug durch Deutschland',
  null,
  'premium',
  now(),
  'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland'),
  'A2',
  'Das Deutschlandticket kostet 58 Euro pro Monat. Mit diesem Ticket kann man in ganz Deutschland Bus und Bahn fahren. Es ist sehr praktisch.

Viele Jugendliche benutzen das Ticket in den Sommerferien. Sie fahren zum Beispiel an die Ostsee oder in die Berge. Das Ticket ist günstig und umweltfreundlich.

Man kann das Ticket jeden Monat kaufen und auch wieder kündigen. Das ist sehr flexibel. Besonders junge Menschen finden das Ticket toll.'
),
(
  (select id from texts where slug = 'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland'),
  'B1',
  'Das Deutschlandticket ist seit seiner Einführung 2023 eines der erfolgreichsten Nahverkehrsprojekte in Deutschland. Für 58 Euro im Monat können Inhaberinnen und Inhaber alle Busse, S-Bahnen, U-Bahnen und Regionalbahnen in ganz Deutschland nutzen – ohne Aufpreis und ohne Reservierung.

Besonders in den Sommerferien nutzen viele Jugendliche das Ticket für günstige Reisen im Inland. Mit dem Ticket und etwas Geduld kann man zum Beispiel von München an die Ostseeküste fahren oder den Schwarzwald erkunden. Fernzüge der Deutschen Bahn sind jedoch nicht inbegriffen.

Kritiker bemängeln, dass das Ticket in strukturschwachen Regionen wenig nützt, weil das ÖPNV-Angebot dort dünn ist. Die Bundesländer diskutieren deshalb, ob das Ticket durch gezielte Investitionen in den ländlichen Nahverkehr begleitet werden soll. Für Stadtbewohner ist es hingegen eine echte Alternative zum Auto.'
),
(
  (select id from texts where slug = 'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland'),
  'B2',
  'Das Deutschlandticket feiert in diesem Sommer seinen dritten Geburtstag – und die Bilanz ist ambivalent. Auf der Habenseite stehen mehr als 13 Millionen Abonnentinnen und Abonnenten, ein messbarer Rückgang des Pkw-Aufkommens in Großstädten und eine gestiegene Mobilität einkommensschwächerer Bevölkerungsgruppen. Auf der Sollseite: eine nach wie vor offene Finanzierungsfrage und ein strukturell unvollständiges Nahverkehrsangebot in ländlichen Regionen.

Für Jugendliche ist das Ticket im Sommer ein echter Game-Changer. Mehrere Bundesländer bieten ermäßigte oder kostenlose Varianten für Schülerinnen und Schüler an. Wer flexibel ist und Umsteigezeiten in Kauf nimmt, kann damit günstig einen Großteil Deutschlands erkunden. Reisende berichten von spontanen Entdeckungen: Städte, die ohne teures Bahnticket außerhalb der Reichweite geblieben wären.

Die politische Zukunft des Tickets ist allerdings unsicher. Bund und Länder streiten seit Monaten über die Finanzierung. Ein Ende des Angebots würde nicht nur Millionen Abonnenten treffen, sondern auch ein Signal senden: dass der politische Wille zur Mobilitätswende seine Grenzen hat, sobald es ans Geld geht.'
),
(
  (select id from texts where slug = 'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland'),
  'C1',
  'Das Deutschlandticket ist das ambitionierteste und zugleich widersprüchlichste Verkehrspolitikprojekt der jüngeren deutschen Geschichte. Es hat in drei Jahren mehr Menschen in den öffentlichen Nahverkehr gebracht als alle Kampagnen und Förderprogramme der Jahrzehnte zuvor – und es steht dennoch permanent auf der Kippe, weil die Frage seiner Finanzierung politisch nicht grundsätzlich geklärt wurde.

Die strukturelle Spannung ist evident: Das Ticket ist flächen- und angebotsneutral – es verbilligt Mobilität dort, wo bereits ein gutes Angebot existiert, und ändert dort wenig, wo Busse nur einmal täglich fahren oder gar nicht. Wer in München oder Hamburg lebt, profitiert enorm. Wer in der Altmark oder der Eifel wohnt, hat von einem günstigen Ticket wenig, wenn der nächste Bus drei Stunden später kommt. Das Ticket löst die Netzfrage nicht – es setzt sie voraus.

Für junge Menschen ist das Angebot dennoch transformativ. Es eröffnet einen experimentellen Umgang mit Mobilität: spontan, stationsgebunden, explorativ. Wer als 17-Jähriger mit der Regionalbahn durch Deutschland reist, erfährt sein Land auf eine Art, die weder das Auto noch das Flugzeug bietet. In diesem Sinne ist das Deutschlandticket auch ein kulturpolitisches Instrument – ob das seinen Erfindern bewusst war oder nicht.

Die eigentliche Frage ist, ob Deutschland bereit ist, dieses Instrument dauerhaft zu finanzieren. Bislang lautet die Antwort: jährlich neu verhandelt, also: ungeklärt.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 4: Sommerjob im Feriencamp: Geld verdienen und Spaß haben
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Sommerjob im Feriencamp: Geld verdienen und Spaß haben',
  null,
  'premium',
  now(),
  'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben'),
  'A2',
  'In den Sommerferien arbeiten viele junge Menschen in Feriencamps. Sie betreuen Kinder und Jugendliche. Das ist ein toller Sommerjob.

Als Betreuer verdient man nicht viel Geld. Aber man bekommt Unterkunft und Essen. Man lernt viel und macht neue Freunde.

Man muss mindestens 18 Jahre alt sein. Ein Erste-Hilfe-Kurs ist oft notwendig. Viele Universitätsstudenten machen diesen Job in den Semesterferien.'
),
(
  (select id from texts where slug = 'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben'),
  'B1',
  'Jedes Jahr suchen Jugendreiseveranstalter in Deutschland Tausende von Betreuerinnen und Betreuern für ihre Sommercamps. Der Job ist kein klassischer Ferienjob – er ist intensiv, verantwortungsvoll und gleichzeitig eines der abwechslungsreichsten Erlebnisse, die man mit 20 haben kann.

Wer als Betreuer arbeitet, ist rund um die Uhr für eine Gruppe von Kindern oder Jugendlichen verantwortlich. Man organisiert Aktivitäten, löst Konflikte, kümmert sich um Sicherheit und sorgt dafür, dass alle eine gute Zeit haben. Die Bezahlung ist gering – oft nur ein Taschengeld plus Unterkunft und Verpflegung. Aber die Erfahrung, die man mitnimmt, ist schwer zu bezahlen.

Viele Betreuerinnen und Betreuer berichten, dass der Job ihre Persönlichkeit verändert hat. Sie haben gelernt, Verantwortung zu übernehmen, Geduld zu haben und in Gruppen zu führen. Diese Fähigkeiten sind später im Studium und im Beruf sehr wertvoll.'
),
(
  (select id from texts where slug = 'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben'),
  'B2',
  'Der Markt für Feriencamps in Deutschland wächst – und damit auch der Bedarf an qualifizierten Betreuerinnen und Betreuern. Große Veranstalter wie ruf Jugendreisen, Freebird oder das Jugendwerk der AWO suchen jedes Jahr zusammen mehr als 10.000 Saisonkräfte für ihre Sommer-Programme. Die Nachfrage übersteigt das Angebot, wie viele Anbieter berichten.

Der Job erfordert mehr als gute Laune. Neben einem Mindestalter von 18 Jahren wird meist ein Erste-Hilfe-Kurs, Erfahrung in der Kinder- und Jugendarbeit und oft auch Englischkenntnisse verlangt. Wer internationale Camps betreut, braucht interkulturelle Kompetenz. Große Veranstalter bieten vor dem Sommer mehrtägige Schulungen an.

Finanziell ist der Job wenig attraktiv: Das Taschengeld liegt zwischen 200 und 400 Euro pro Woche, zuzüglich freier Unterkunft und Verpflegung. Was viele Bewerberinnen und Bewerber dennoch anzieht, ist die Kombination aus Abenteuer, Gemeinschaft und dem Gefühl, wirklich gebraucht zu werden. Personalverantwortliche berichten, dass viele ehemalige Betreuer den Job als einen der prägendsten ihrer Jugend bezeichnen.'
),
(
  (select id from texts where slug = 'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben'),
  'C1',
  'In der Debatte über informelles Lernen und außerschulische Kompetenzentwicklung werden Feriencamps selten erwähnt. Dabei bieten sie eines der dichtesten Umgebungen für das, was Bildungsforscher als transformative Erfahrung bezeichnen: einen Kontext, in dem junge Menschen echte Verantwortung übernehmen, scheitern können und dennoch unterstützt werden.

Wer einen Sommer lang 15 Jugendliche betreut – ihren Streit schlichtet, ihre Niedergeschlagenheit auffängt, ihre Begeisterung kanalisiert und dabei selbst regelmäßig überfordert ist – hat mehr über Führen, Kommunizieren und Empathie gelernt als in vielen Seminaren. Das ist keine Romantisierung, sondern eine empirisch gut belegte These: Studien zur Entwicklung sozial-emotionaler Kompetenzen zeigen konsistent, dass intensive Gruppenverantwortung ein besonders wirksames Lernformat ist.

Dennoch bleibt der Betreuer-Job gesellschaftlich unterschätzt. Die Niedriglöhne signalisieren, dass Arbeit mit Kindern und Jugendlichen ökonomisch gering bewertet wird – ein Muster, das sich in der gesamten Care-Ökonomie wiederfindet. Wer einen Sommer lang Kinder betreut, leistet gesellschaftlich Wertvolles und erhält dafür ein Taschengeld.

Vielleicht ist das die eigentliche Lektion des Betreuer-Jobs: nicht nur, was man lernt, sondern auch, was die Gesellschaft für diese Arbeit zu zahlen bereit ist.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Global deduplicated vocabulary
insert into vocabulario (
  german,
  word_type,
  spanish,
  example_sentence_de,
  level,
  article,
  plural_form,
  infinitive,
  example_sentence_es,
  example_sentence_de_generated,
  past_simple,
  past_participle
)
select *
from (
  values
  (
    'abseits der Touristenpfade',
    'adjective',
    'fuera de los circuitos turísticos',
    'Statt All-inclusive-Urlaub oder Billigflug-Wochenende wird das sogenannte Slow Travel zum Leitbild: bewusst reisen, Zwischenstopps einplanen, Städte abseits der Touristenpfade entdecken.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'abwechslungsreich',
    'adjective',
    'variado, lleno de actividades',
    'Der Job ist kein klassischer Ferienjob – er ist intensiv, verantwortungsvoll und gleichzeitig eines der abwechslungsreichsten Erlebnisse, die man mit 20 haben kann.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'anbieten',
    'verb',
    'ofrecer',
    'Dazu kommt, dass die EU seit 2021 kostenlose Interrail-Pässe für 18-Jährige anbietet.',
    'B1',
    null,
    null,
    'anbieten',
    null,
    null,
    null,
    null
  ),
  (
    'angebotsneutral',
    'adjective',
    'neutral respecto a la oferta existente',
    'Die strukturelle Spannung ist evident: Das Ticket ist flächen- und angebotsneutral – es verbilligt Mobilität dort, wo bereits ein gutes Angebot existiert, und ändert dort wenig, wo Busse nur einmal täglich fahren oder gar nicht.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'auf der Habenseite',
    'adjective',
    'en el lado positivo',
    'Auf der Habenseite stehen mehr als 13 Millionen Abonnentinnen und Abonnenten, ein messbarer Rückgang des Pkw-Aufkommens in Großstädten und eine gestiegene Mobilität einkommensschwächerer Bevölkerungsgruppen.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'auf der Kippe stehen',
    'verb',
    'estar en el aire, peligrar',
    'Es hat in drei Jahren mehr Menschen in den öffentlichen Nahverkehr gebracht als alle Kampagnen und Förderprogramme der Jahrzehnte zuvor – und es steht dennoch permanent auf der Kippe, weil die Frage seiner Finanzierung politisch nicht grundsätzlich geklärt wurde.',
    'C1',
    null,
    null,
    'auf der Kippe stehen',
    null,
    null,
    null,
    null
  ),
  (
    'auf der Sollseite',
    'adjective',
    'en el lado negativo',
    'Auf der Sollseite: eine nach wie vor offene Finanzierungsfrage und ein strukturell unvollständiges Nahverkehrsangebot in ländlichen Regionen.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'auffangen',
    'verb',
    'contener, hacer frente a',
    'Wer einen Sommer lang 15 Jugendliche betreut – ihren Streit schlichtet, ihre Niedergeschlagenheit auffängt, ihre Begeisterung kanalisiert und dabei selbst regelmäßig überfordert ist – hat mehr über Führen, Kommunizieren und Empathie gelernt als in vielen Seminaren.',
    'C1',
    null,
    null,
    'auffangen',
    null,
    null,
    null,
    null
  ),
  (
    'aufgeladen',
    'verb',
    'cargado de significado',
    'Wer heute mit dem Zug von Berlin nach Lissabon fährt, trifft eine Entscheidung, die zugleich ökologisch, politisch und ästhetisch aufgeladen ist: langsamer reisen, weniger emittieren, Europa nicht als Flugraum, sondern als Landschaft erleben.',
    'C1',
    null,
    null,
    'aufgeladen',
    null,
    null,
    null,
    null
  ),
  (
    'ausgebucht',
    'adjective',
    'sin plazas disponibles, completo',
    'Beliebte Strecken wie München–Venedig oder Berlin–Prag sind in den Sommermonaten oft ausgebucht.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'außerhalb der Reichweite',
    'adjective',
    'fuera del alcance',
    'Reisende berichten von spontanen Entdeckungen: Städte, die ohne teures Bahnticket außerhalb der Reichweite geblieben wären.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'befördern',
    'verb',
    'impulsar, promover',
    'Die EU hat diesen Wandel aktiv befördert.',
    'C1',
    null,
    null,
    'befördern',
    null,
    null,
    null,
    null
  ),
  (
    'beliebt',
    'adjective',
    'popular',
    'Beliebte Ziele sind Spanien, Italien und Portugal.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'bemängeln',
    'verb',
    'criticar, señalar carencias',
    'Kritiker bemängeln, dass das Ticket in strukturschwachen Regionen wenig nützt, weil das ÖPNV-Angebot dort dünn ist.',
    'B1',
    null,
    null,
    'bemängeln',
    null,
    null,
    null,
    null
  ),
  (
    'benutzen',
    'verb',
    'usar, utilizar',
    'Viele Jugendliche benutzen das Ticket in den Sommerferien.',
    'A2',
    null,
    null,
    'benutzen',
    null,
    null,
    null,
    null
  ),
  (
    'bereit sein',
    'adjective',
    'estar dispuesto a',
    'Vielleicht ist das die eigentliche Lektion des Betreuer-Jobs: nicht nur, was man lernt, sondern auch, was die Gesellschaft für diese Arbeit zu zahlen bereit ist.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'besuchen',
    'verb',
    'visitar',
    'Man kann Paris, Rom oder Barcelona besuchen.',
    'A2',
    null,
    null,
    'besuchen',
    null,
    null,
    null,
    null
  ),
  (
    'betreuen',
    'verb',
    'cuidar, ocuparse de',
    'Sie betreuen Kinder und Jugendliche.',
    'A2',
    null,
    null,
    'betreuen',
    null,
    null,
    null,
    null
  ),
  (
    'betreut',
    'adjective',
    'supervisado, con acompañamiento',
    'Eltern schätzen, dass die Camps pädagogisch betreut sind und gleichzeitig viel Freiheit lassen.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'buchen',
    'verb',
    'reservar',
    'Mehr als 500.000 junge Europäerinnen und Europäer haben das Ticket für die Sommerferien 2026 bereits gebucht – so viele wie nie zuvor.',
    'B1',
    null,
    null,
    'buchen',
    null,
    null,
    null,
    null
  ),
  (
    'das Angebot',
    'noun',
    'la oferta',
    'Hunderttausende junge Menschen haben das Angebot in den letzten Jahren genutzt.',
    'B1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Bewusstsein',
    'noun',
    'conciencia',
    'Die Kombination aus ökologischem Bewusstsein, dem kostenlosen EU-Pass für 18-Jährige und einer wachsenden Skepsis gegenüber Massentourismus hat eine neue Generation von Zugreisenden hervorgebracht.',
    'B2',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Erlebnis',
    'noun',
    'la experiencia, la vivencia',
    'Der Zug ist langsamer als das Flugzeug – aber viele sagen: Das Reisen selbst ist das Erlebnis.',
    'B1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das informelle Lernen',
    'noun',
    'aprendizaje informal',
    'In der Debatte über informelles Lernen und außerschulische Kompetenzentwicklung werden Feriencamps selten erwähnt.',
    'C1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Inland',
    'noun',
    'interior del país, territorio nacional',
    'Besonders in den Sommerferien nutzen viele Jugendliche das Ticket für günstige Reisen im Inland.',
    'B1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das kulturpolitische Instrument',
    'noun',
    'instrumento de política cultural',
    'In diesem Sinne ist das Deutschlandticket auch ein kulturpolitisches Instrument – ob das seinen Erfindern bewusst war oder nicht.',
    'C1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Leitbild',
    'noun',
    'modelo, ideal a seguir',
    'Statt All-inclusive-Urlaub oder Billigflug-Wochenende wird das sogenannte Slow Travel zum Leitbild: bewusst reisen, Zwischenstopps einplanen, Städte abseits der Touristenpfade entdecken.',
    'B2',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Marktphänomen',
    'noun',
    'fenómeno de mercado',
    'Der Interrail-Boom 2026 ist kein bloßes Marktphänomen – er ist ein Symptom einer tiefergehenden Verschiebung in der Reisekultur junger Europäerinnen und Europäer.',
    'C1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Nahverkehrsprojekt',
    'noun',
    'proyecto de transporte público local',
    'Das Deutschlandticket ist seit seiner Einführung 2023 eines der erfolgreichsten Nahverkehrsprojekte in Deutschland.',
    'B1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Naturerleben',
    'noun',
    'vivencia directa de la naturaleza',
    'Surfcamps versprechen – und liefern häufig – etwas, das im Alltag Jugendlicher zunehmend selten geworden ist: körperliche Herausforderung in einer nicht-kompetitiven Umgebung, unmittelbares Naturerleben ohne digitale Vermittlung und soziale Bindungen, die unter gemeinsamen Anstrengungsbedingungen entstehen.',
    'C1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Schienennetz',
    'noun',
    'red ferroviaria',
    'Strukturell offenbart der Boom jedoch die Defizite des europäischen Schienennetzes.',
    'C1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Taschengeld',
    'noun',
    'dinero de bolsillo',
    'Die Bezahlung ist gering – oft nur ein Taschengeld plus Unterkunft und Verpflegung.',
    'B1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Wellenreiten',
    'noun',
    'surf de olas',
    'In den Camps können die Teilnehmerinnen und Teilnehmer Windsurfen, Kitesurfen, SUP (Stand-up-Paddling) und klassisches Wellenreiten lernen.',
    'B1',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'das Zugticket',
    'noun',
    'billete de tren',
    'Interrail ist ein Zugticket für Europa.',
    'A2',
    'das',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Anbieter',
    'noun',
    'proveedor, ofertante',
    'Moderne Camps verbinden Wassersportausbildung mit nachhaltigen Konzepten: Solarenergie, vegetarische Verpflegung und lokale Kooperationen mit Biobauern gehören inzwischen zum Standard vieler Anbieter.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Anfänger',
    'noun',
    'principiante',
    'Das ist gut für Anfänger.',
    'A2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Anstieg',
    'noun',
    'aumento, incremento',
    'Mehr als eine halbe Million Buchungen wurden bereits im April registriert – ein Anstieg von rund 30 Prozent gegenüber dem Vorjahreszeitraum.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Aufpreis',
    'noun',
    'suplemento, sobrecoste',
    'Für 58 Euro im Monat können Inhaberinnen und Inhaber alle Busse, S-Bahnen, U-Bahnen und Regionalbahnen in ganz Deutschland nutzen – ohne Aufpreis und ohne Reservierung.',
    'B1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Bedarf',
    'noun',
    'necesidad, demanda',
    'Der Markt für Feriencamps in Deutschland wächst – und damit auch der Bedarf an qualifizierten Betreuerinnen und Betreuern.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Betreiber',
    'noun',
    'operador, gestor',
    'Betreiber in Prerow, Kühlungsborn und auf Fehmarn berichten von Wartelisten für die Hauptsaison und einer deutlich gestiegenen Nachfrage aus dem Inland – ein Trend, den Branchenkenner auf eine Kombination aus Nachholeffekten nach der Pandemie, gestiegenen Auslandsreisekosten und wachsendem Interesse an Natursport zurückführen.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Betreuer',
    'noun',
    'monitor, cuidador',
    'Als Betreuer verdient man nicht viel Geld.',
    'A2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Branchenkenner',
    'noun',
    'experto del sector',
    'Betreiber in Prerow, Kühlungsborn und auf Fehmarn berichten von Wartelisten für die Hauptsaison und einer deutlich gestiegenen Nachfrage aus dem Inland – ein Trend, den Branchenkenner auf eine Kombination aus Nachholeffekten nach der Pandemie, gestiegenen Auslandsreisekosten und wachsendem Interesse an Natursport zurückführen.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Erste-Hilfe-Kurs',
    'noun',
    'curso de primeros auxilios',
    'Ein Erste-Hilfe-Kurs ist oft notwendig.',
    'A2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der gelebte Raum',
    'noun',
    'espacio vivido, experimentado de primera mano',
    'Wer als Jugendlicher mit dem Zug durch zehn Länder gefahren ist, hat Europa nicht als abstraktes Politikprojekt kennengelernt, sondern als gelebten Raum.',
    'C1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Grund',
    'noun',
    'motivo, razón',
    'Die Gründe für den Boom sind vielfältig.',
    'B1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Inhaber',
    'noun',
    'titular, titular del abono',
    'Für 58 Euro im Monat können Inhaberinnen und Inhaber alle Busse, S-Bahnen, U-Bahnen und Regionalbahnen in ganz Deutschland nutzen – ohne Aufpreis und ohne Reservierung.',
    'B1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Jugendreiseveranstalter',
    'noun',
    'organizador de viajes juveniles',
    'Jedes Jahr suchen Jugendreiseveranstalter in Deutschland Tausende von Betreuerinnen und Betreuern für ihre Sommercamps.',
    'B1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Nachholeffekt',
    'noun',
    'efecto de recuperación tras una pausa',
    'Betreiber in Prerow, Kühlungsborn und auf Fehmarn berichten von Wartelisten für die Hauptsaison und einer deutlich gestiegenen Nachfrage aus dem Inland – ein Trend, den Branchenkenner auf eine Kombination aus Nachholeffekten nach der Pandemie, gestiegenen Auslandsreisekosten und wachsendem Interesse an Natursport zurückführen.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Pass',
    'noun',
    'pase, abono',
    'Dazu kommt, dass die EU seit 2021 kostenlose Interrail-Pässe für 18-Jährige anbietet.',
    'B1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Rückgang',
    'noun',
    'descenso, reducción',
    'Auf der Habenseite stehen mehr als 13 Millionen Abonnentinnen und Abonnenten, ein messbarer Rückgang des Pkw-Aufkommens in Großstädten und eine gestiegene Mobilität einkommensschwächerer Bevölkerungsgruppen.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Sommerjob',
    'noun',
    'trabajo de verano',
    'Das ist ein toller Sommerjob.',
    'A2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Umgang mit',
    'noun',
    'la relación con, el modo de gestionar',
    'Es eröffnet einen experimentellen Umgang mit Mobilität: spontan, stationsgebunden, explorativ.',
    'C1',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Vorjahreszeitraum',
    'noun',
    'el mismo período del año anterior',
    'Mehr als eine halbe Million Buchungen wurden bereits im April registriert – ein Anstieg von rund 30 Prozent gegenüber dem Vorjahreszeitraum.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Wandel',
    'noun',
    'cambio, transformación',
    'Hinter dem Boom steckt mehr als nur ein Reisetrend: Es ist ein kultureller Wandel in der Art, wie junge Europäerinnen und Europäer Urlaub denken.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Zug',
    'noun',
    'tren',
    'Es ist ein Ticket für alle Züge.',
    'A2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'der Zwischenstopp',
    'noun',
    'parada intermedia',
    'Statt All-inclusive-Urlaub oder Billigflug-Wochenende wird das sogenannte Slow Travel zum Leitbild: bewusst reisen, Zwischenstopps einplanen, Städte abseits der Touristenpfade entdecken.',
    'B2',
    'der',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Berge',
    'noun',
    'las montañas',
    'Sie fahren zum Beispiel an die Ostsee oder in die Berge.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Bewerberin / der Bewerber',
    'noun',
    'candidata / candidato',
    'Was viele Bewerberinnen und Bewerber dennoch anzieht, ist die Kombination aus Abenteuer, Gemeinschaft und dem Gefühl, wirklich gebraucht zu werden.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Bezahlung',
    'noun',
    'la remuneración, el pago',
    'Die Bezahlung ist gering – oft nur ein Taschengeld plus Unterkunft und Verpflegung.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Bilanz',
    'noun',
    'balance, valoración',
    'Das Deutschlandticket feiert in diesem Sommer seinen dritten Geburtstag – und die Bilanz ist ambivalent.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Bindung',
    'noun',
    'vínculo',
    'Surfcamps versprechen – und liefern häufig – etwas, das im Alltag Jugendlicher zunehmend selten geworden ist: körperliche Herausforderung in einer nicht-kompetitiven Umgebung, unmittelbares Naturerleben ohne digitale Vermittlung und soziale Bindungen, die unter gemeinsamen Anstrengungsbedingungen entstehen.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Buchung',
    'noun',
    'reserva',
    'Mehr als eine halbe Million Buchungen wurden bereits im April registriert – ein Anstieg von rund 30 Prozent gegenüber dem Vorjahreszeitraum.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Care-Ökonomie',
    'noun',
    'economía del cuidado',
    'Die Niedriglöhne signalisieren, dass Arbeit mit Kindern und Jugendlichen ökonomisch gering bewertet wird – ein Muster, das sich in der gesamten Care-Ökonomie wiederfindet.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Einführung',
    'noun',
    'introducción, lanzamiento',
    'Das Deutschlandticket ist seit seiner Einführung 2023 eines der erfolgreichsten Nahverkehrsprojekte in Deutschland.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die einkommensschwächere Bevölkerungsgruppe',
    'noun',
    'grupo de población con menores ingresos',
    'Auf der Habenseite stehen mehr als 13 Millionen Abonnentinnen und Abonnenten, ein messbarer Rückgang des Pkw-Aufkommens in Großstädten und eine gestiegene Mobilität einkommensschwächerer Bevölkerungsgruppen.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Freizeitgestaltung',
    'noun',
    'organización del ocio',
    'Steigende Flugreisekosten, ein wachsendes Bewusstsein für naturbasierte Freizeitgestaltung und die pandemiebedingte Neuentdeckung inländischer Urlaubsziele haben die Nachfrage nach Wassersport-Feriencamps in den letzten drei Jahren mehr als verdoppelt.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Fähigkeit',
    'noun',
    'habilidad, capacidad',
    'Diese Fähigkeiten sind später im Studium und im Beruf sehr wertvoll.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Geduld',
    'noun',
    'paciencia',
    'Mit dem Ticket und etwas Geduld kann man zum Beispiel von München an die Ostseeküste fahren oder den Schwarzwald erkunden.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Gemeinschaft',
    'noun',
    'comunidad, vida en grupo',
    'Die Kombination aus körperlicher Herausforderung, Gemeinschaft und Naturnähe schafft Erfahrungen, die im schulischen Alltag kaum zu machen sind.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Hauptsaison',
    'noun',
    'temporada alta',
    'Betreiber in Prerow, Kühlungsborn und auf Fehmarn berichten von Wartelisten für die Hauptsaison und einer deutlich gestiegenen Nachfrage aus dem Inland – ein Trend, den Branchenkenner auf eine Kombination aus Nachholeffekten nach der Pandemie, gestiegenen Auslandsreisekosten und wachsendem Interesse an Natursport zurückführen.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Herausforderung',
    'noun',
    'reto, desafío',
    'Für die Deutsche Bahn und ihre europäischen Partner ist der Boom eine Herausforderung.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Identitätsbildung',
    'noun',
    'construcción de identidad',
    'Das DiscoverEU-Programm, das 18-Jährigen kostenlose Interrail-Pässe zur Verfügung stellt, ist konzeptionell klug: Es kombiniert Mobilitätsförderung mit europäischer Identitätsbildung.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die interkulturelle Kompetenz',
    'noun',
    'competencia intercultural',
    'Wer internationale Camps betreut, braucht interkulturelle Kompetenz.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Investitionsbereitschaft',
    'noun',
    'disposición a invertir',
    'Jahrhunderts bekommt, ist letztlich eine Frage des politischen Willens und der Investitionsbereitschaft – nicht der Nachfrage.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Jugendlichen',
    'noun',
    'los jóvenes',
    'In diesem Jahr kaufen besonders viele Jugendliche das Ticket.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Mittelschicht',
    'noun',
    'clase media',
    'Die Frage, ob Natursporterfahrungen ein Privileg der Mittelschicht bleiben oder durch öffentliche Förderung breiter zugänglich gemacht werden sollen, wird politisch bislang kaum gestellt.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Mobilitätsförderung',
    'noun',
    'fomento de la movilidad',
    'Das DiscoverEU-Programm, das 18-Jährigen kostenlose Interrail-Pässe zur Verfügung stellt, ist konzeptionell klug: Es kombiniert Mobilitätsförderung mit europäischer Identitätsbildung.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Mobilitätswende',
    'noun',
    'transición hacia una movilidad sostenible',
    'Ein Ende des Angebots würde nicht nur Millionen Abonnenten treffen, sondern auch ein Signal senden: dass der politische Wille zur Mobilitätswende seine Grenzen hat, sobald es ans Geld geht.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Nachfrage',
    'noun',
    'la demanda',
    'Die Nachfrage nach Wassersport-Ferien in Deutschland ist in den letzten Jahren stark gestiegen – besonders bei Jugendlichen zwischen 13 und 19 Jahren.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Nachtverbindung',
    'noun',
    'conexión nocturna',
    'Die EU diskutiert, ob mehr Nachtverbindungen und eine bessere grenzüberschreitende Buchungsinfrastruktur geschaffen werden sollen, um den Trend zu unterstützen.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Naturnähe',
    'noun',
    'proximidad a la naturaleza',
    'Die Kombination aus körperlicher Herausforderung, Gemeinschaft und Naturnähe schafft Erfahrungen, die im schulischen Alltag kaum zu machen sind.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Niedriglöhne',
    'noun',
    'los salarios bajos',
    'Die Niedriglöhne signalisieren, dass Arbeit mit Kindern und Jugendlichen ökonomisch gering bewertet wird – ein Muster, das sich in der gesamten Care-Ökonomie wiederfindet.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Ostsee',
    'noun',
    'el mar Báltico',
    'An der Ostsee in Norddeutschland gibt es viele Surfcamps.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Ostseeküste',
    'noun',
    'costa del Báltico',
    'Die Surfcamps an der schleswig-holsteinischen und mecklenburgischen Ostseeküste melden für den Sommer 2026 viele ausgebuchte Wochen.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Personalverantwortlichen',
    'noun',
    'responsables de recursos humanos',
    'Personalverantwortliche berichten, dass viele ehemalige Betreuer den Job als einen der prägendsten ihrer Jugend bezeichnen.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Persönlichkeit',
    'noun',
    'la personalidad',
    'Viele Betreuerinnen und Betreuer berichten, dass der Job ihre Persönlichkeit verändert hat.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Preisgestaltung',
    'noun',
    'política de precios',
    'Grenzüberschreitende Buchungen sind immer noch umständlich, Nachtverbindungen dünn gesät und die Preisgestaltung jenseits des Interrail-Passes wenig wettbewerbsfähig gegenüber Billigfliegern.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Saisonkraft',
    'noun',
    'trabajador de temporada',
    'Große Veranstalter wie ruf Jugendreisen, Freebird oder das Jugendwerk der AWO suchen jedes Jahr zusammen mehr als 10.000 Saisonkräfte für ihre Sommer-Programme.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Schulung',
    'noun',
    'formación, capacitación',
    'Große Veranstalter bieten vor dem Sommer mehrtägige Schulungen an.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Semesterferien',
    'noun',
    'vacaciones universitarias',
    'Viele Universitätsstudenten machen diesen Job in den Semesterferien.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Skepsis',
    'noun',
    'escepticismo',
    'Die Kombination aus ökologischem Bewusstsein, dem kostenlosen EU-Pass für 18-Jährige und einer wachsenden Skepsis gegenüber Massentourismus hat eine neue Generation von Zugreisenden hervorgebracht.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Sommerferien',
    'noun',
    'vacaciones de verano',
    'Viele junge Menschen kaufen das Interrail-Ticket in den Sommerferien.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die strukturelle Spannung',
    'noun',
    'tensión estructural',
    'Die strukturelle Spannung ist evident: Das Ticket ist flächen- und angebotsneutral – es verbilligt Mobilität dort, wo bereits ein gutes Angebot existiert, und ändert dort wenig, wo Busse nur einmal täglich fahren oder gar nicht.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Teilnehmer',
    'noun',
    'participantes',
    'In den Camps können die Teilnehmerinnen und Teilnehmer Windsurfen, Kitesurfen, SUP (Stand-up-Paddling) und klassisches Wellenreiten lernen.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die transformative Erfahrung',
    'noun',
    'experiencia transformadora',
    'Dabei bieten sie eines der dichtesten Umgebungen für das, was Bildungsforscher als transformative Erfahrung bezeichnen: einen Kontext, in dem junge Menschen echte Verantwortung übernehmen, scheitern können und dennoch unterstützt werden.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Umsteigezeit',
    'noun',
    'tiempo de transbordo',
    'Wer flexibel ist und Umsteigezeiten in Kauf nimmt, kann damit günstig einen Großteil Deutschlands erkunden.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Umwelt',
    'noun',
    'el medio ambiente',
    'Der Zug ist gut für die Umwelt.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Unterkunft',
    'noun',
    'alojamiento',
    'Aber man bekommt Unterkunft und Essen.',
    'A2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Vermittlung',
    'noun',
    'mediación, intermediación',
    'Surfcamps versprechen – und liefern häufig – etwas, das im Alltag Jugendlicher zunehmend selten geworden ist: körperliche Herausforderung in einer nicht-kompetitiven Umgebung, unmittelbares Naturerleben ohne digitale Vermittlung und soziale Bindungen, die unter gemeinsamen Anstrengungsbedingungen entstehen.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Verpflegung',
    'noun',
    'manutención, alimentación',
    'Moderne Camps verbinden Wassersportausbildung mit nachhaltigen Konzepten: Solarenergie, vegetarische Verpflegung und lokale Kooperationen mit Biobauern gehören inzwischen zum Standard vieler Anbieter.',
    'B2',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Verschiebung',
    'noun',
    'desplazamiento, cambio de fondo',
    'Der Interrail-Boom 2026 ist kein bloßes Marktphänomen – er ist ein Symptom einer tiefergehenden Verschiebung in der Reisekultur junger Europäerinnen und Europäer.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die Wellenhöhe',
    'noun',
    'altura de las olas',
    'Die Ostsee ist wegen ihrer geringeren Wellenhöhe ideal für Einsteiger.',
    'B1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'die zahlungskräftige Klientel',
    'noun',
    'clientela con alto poder adquisitivo',
    'Premium-Camps mit Wellnessangeboten und Influencer-Kooperationen werben um eine zahlungskräftige Klientel, während günstigere Angebote für einkommensschwächere Familien seltener werden.',
    'C1',
    'die',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'digitallastig',
    'adjective',
    'dominado por lo digital',
    'Pädagoginnen und Pädagogen sehen in solchen Angeboten ein wertvolles Komplement zu digitallastigen Freizeitgewohnheiten.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'dünn gesät',
    'adjective',
    'escaso, poco frecuente',
    'Grenzüberschreitende Buchungen sind immer noch umständlich, Nachtverbindungen dünn gesät und die Preisgestaltung jenseits des Interrail-Passes wenig wettbewerbsfähig gegenüber Billigfliegern.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'eine klare Sprache sprechen',
    'noun',
    'hablar por sí solos, ser elocuentes',
    'Die Buchungszahlen sprechen eine klare Sprache: Wassersport-Feriencamps an der deutschen Ostseeküste sind im Sommer 2026 gefragter denn je.',
    'B2',
    'eine',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'emittieren',
    'verb',
    'emitir',
    'Wer heute mit dem Zug von Berlin nach Lissabon fährt, trifft eine Entscheidung, die zugleich ökologisch, politisch und ästhetisch aufgeladen ist: langsamer reisen, weniger emittieren, Europa nicht als Flugraum, sondern als Landschaft erleben.',
    'C1',
    null,
    null,
    'emittieren',
    null,
    null,
    null,
    null
  ),
  (
    'empirisch gut belegt',
    'adjective',
    'respaldado por evidencia empírica',
    'Das ist keine Romantisierung, sondern eine empirisch gut belegte These: Studien zur Entwicklung sozial-emotionaler Kompetenzen zeigen konsistent, dass intensive Gruppenverantwortung ein besonders wirksames Lernformat ist.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'erfahren',
    'verb',
    'experimentado',
    'Erfahrene Surfer können an windstarken Tagen trotzdem echte Herausforderungen finden.',
    'B1',
    null,
    null,
    'erfahren',
    null,
    null,
    null,
    null
  ),
  (
    'erfordern',
    'verb',
    'requerir, exigir',
    'Der Job erfordert mehr als gute Laune.',
    'B2',
    null,
    null,
    'erfordern',
    null,
    null,
    null,
    null
  ),
  (
    'erkunden',
    'verb',
    'explorar, recorrer',
    'Mit dem Ticket und etwas Geduld kann man zum Beispiel von München an die Ostseeküste fahren oder den Schwarzwald erkunden.',
    'B1',
    null,
    null,
    'erkunden',
    null,
    null,
    null,
    null
  ),
  (
    'erlauben',
    'verb',
    'permitir',
    'Das Ticket erlaubt es, in 33 europäischen Ländern unbegrenzt Zug zu fahren.',
    'B1',
    null,
    null,
    'erlauben',
    null,
    null,
    null,
    null
  ),
  (
    'erleben',
    'verb',
    'vivir, experimentar',
    'Das Interrail-Ticket erlebt in diesem Sommer einen neuen Rekord.',
    'B1',
    null,
    null,
    'erleben',
    null,
    null,
    null,
    null
  ),
  (
    'ermäßigt',
    'adjective',
    'con descuento, a precio reducido',
    'Mehrere Bundesländer bieten ermäßigte oder kostenlose Varianten für Schülerinnen und Schüler an.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'eröffnen',
    'verb',
    'abrir, dar acceso a',
    'Es eröffnet einen experimentellen Umgang mit Mobilität: spontan, stationsgebunden, explorativ.',
    'C1',
    null,
    null,
    'eröffnen',
    null,
    null,
    null,
    null
  ),
  (
    'flexibel',
    'adjective',
    'flexible',
    'Das ist sehr flexibel.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'Freunde kennenlernen',
    'verb',
    'hacer amigos',
    'Sie wohnen im Camp, essen zusammen und lernen neue Freunde kennen.',
    'A2',
    null,
    null,
    'Freunde kennenlernen',
    null,
    null,
    null,
    null
  ),
  (
    'gefragt',
    'adjective',
    'solicitado, muy demandado',
    'Das Interrail-Ticket ist in diesem Sommer so gefragt wie nie.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'grenzüberschreitend',
    'adjective',
    'transfronterizo',
    'Die EU diskutiert, ob mehr Nachtverbindungen und eine bessere grenzüberschreitende Buchungsinfrastruktur geschaffen werden sollen, um den Trend zu unterstützen.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'günstig',
    'adjective',
    'barato, asequible',
    'Es ist eine günstige Art zu reisen.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'hervorbringen',
    'verb',
    'generar, producir',
    'Die Kombination aus ökologischem Bewusstsein, dem kostenlosen EU-Pass für 18-Jährige und einer wachsenden Skepsis gegenüber Massentourismus hat eine neue Generation von Zugreisenden hervorgebracht.',
    'B2',
    null,
    null,
    'hervorbringen',
    null,
    null,
    null,
    null
  ),
  (
    'inbegriffen',
    'verb',
    'incluido',
    'Fernzüge der Deutschen Bahn sind jedoch nicht inbegriffen.',
    'B1',
    null,
    null,
    'inbegriffen',
    null,
    null,
    null,
    null
  ),
  (
    'jährlich neu verhandelt',
    'adjective',
    'renegociado cada año',
    'Bislang lautet die Antwort: jährlich neu verhandelt, also: ungeklärt.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'kanalisieren',
    'verb',
    'canalizar, encauzar',
    'Wer einen Sommer lang 15 Jugendliche betreut – ihren Streit schlichtet, ihre Niedergeschlagenheit auffängt, ihre Begeisterung kanalisiert und dabei selbst regelmäßig überfordert ist – hat mehr über Führen, Kommunizieren und Empathie gelernt als in vielen Seminaren.',
    'C1',
    null,
    null,
    'kanalisieren',
    null,
    null,
    null,
    null
  ),
  (
    'kaufen',
    'verb',
    'comprar',
    'Viele junge Menschen kaufen das Interrail-Ticket in den Sommerferien.',
    'A2',
    null,
    null,
    'kaufen',
    null,
    null,
    null,
    null
  ),
  (
    'Konflikte lösen',
    'verb',
    'resolver conflictos',
    'Man organisiert Aktivitäten, löst Konflikte, kümmert sich um Sicherheit und sorgt dafür, dass alle eine gute Zeit haben.',
    'B1',
    null,
    null,
    'Konflikte lösen',
    null,
    null,
    null,
    null
  ),
  (
    'kosten',
    'verb',
    'costar',
    'Das Deutschlandticket kostet 58 Euro pro Monat.',
    'A2',
    null,
    null,
    'kosten',
    null,
    null,
    null,
    null
  ),
  (
    'kündigen',
    'verb',
    'cancelar, darse de baja',
    'Man kann das Ticket jeden Monat kaufen und auch wieder kündigen.',
    'A2',
    null,
    null,
    'kündigen',
    null,
    null,
    null,
    null
  ),
  (
    'mindestens',
    'adjective',
    'como mínimo',
    'Man muss mindestens 18 Jahre alt sein.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'nachhaltig',
    'adjective',
    'sostenible',
    'Viele Jugendliche wollen nachhaltig reisen und vermeiden das Flugzeug.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'nie zuvor',
    'adjective',
    'nunca antes',
    'Mehr als 500.000 junge Europäerinnen und Europäer haben das Ticket für die Sommerferien 2026 bereits gebucht – so viele wie nie zuvor.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'notwendig',
    'adjective',
    'necesario',
    'Ein Erste-Hilfe-Kurs ist oft notwendig.',
    'A2',
    null,
    null,
    null,
    'Andere sagen: Es ist notwendig für die Sicherheit Europas.',
    null,
    null,
    null
  ),
  (
    'nutzen',
    'verb',
    'aprovechar, usar',
    'Hunderttausende junge Menschen haben das Angebot in den letzten Jahren genutzt.',
    'B1',
    null,
    null,
    'nutzen',
    null,
    null,
    null,
    null
  ),
  (
    'offenbaren',
    'verb',
    'revelar, poner de manifiesto',
    'Strukturell offenbart der Boom jedoch die Defizite des europäischen Schienennetzes.',
    'C1',
    null,
    null,
    'offenbaren',
    null,
    null,
    null,
    null
  ),
  (
    'praktisch',
    'adjective',
    'práctico, cómodo',
    'Es ist sehr praktisch.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'prägend',
    'adjective',
    'formativo, que marca',
    'Personalverantwortliche berichten, dass viele ehemalige Betreuer den Job als einen der prägendsten ihrer Jugend bezeichnen.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'reisen',
    'verb',
    'viajar',
    'Es ist eine günstige Art zu reisen.',
    'A2',
    null,
    null,
    'reisen',
    null,
    null,
    null,
    null
  ),
  (
    'ruhig',
    'adjective',
    'tranquilo, calmado',
    'Die Ostsee ist ruhiger als der Atlantik.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'rund um die Uhr',
    'adjective',
    'las 24 horas del día',
    'Wer als Betreuer arbeitet, ist rund um die Uhr für eine Gruppe von Kindern oder Jugendlichen verantwortlich.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'schlichten',
    'verb',
    'mediar, resolver',
    'Wer einen Sommer lang 15 Jugendliche betreut – ihren Streit schlichtet, ihre Niedergeschlagenheit auffängt, ihre Begeisterung kanalisiert und dabei selbst regelmäßig überfordert ist – hat mehr über Führen, Kommunizieren und Empathie gelernt als in vielen Seminaren.',
    'C1',
    null,
    null,
    'schlichten',
    null,
    null,
    null,
    null
  ),
  (
    'schätzen',
    'verb',
    'valorar, apreciar',
    'Eltern schätzen, dass die Camps pädagogisch betreut sind und gleichzeitig viel Freiheit lassen.',
    'B1',
    null,
    null,
    'schätzen',
    null,
    null,
    null,
    null
  ),
  (
    'Spaß machen',
    'verb',
    'ser divertido, gustar mucho',
    'Das Surfen macht viel Spaß.',
    'A2',
    null,
    null,
    'Spaß machen',
    null,
    null,
    null,
    null
  ),
  (
    'streiten',
    'verb',
    'disputar, discutir',
    'Bund und Länder streiten seit Monaten über die Finanzierung.',
    'B2',
    null,
    null,
    'streiten',
    null,
    null,
    null,
    null
  ),
  (
    'strukturschwach',
    'adjective',
    'con infraestructuras deficientes',
    'Kritiker bemängeln, dass das Ticket in strukturschwachen Regionen wenig nützt, weil das ÖPNV-Angebot dort dünn ist.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'stützen',
    'verb',
    'respaldar, sostener empiricamente',
    'Die Forschung zur positiven Jugendentwicklung stützt diese Erfahrungswerte empirisch.',
    'C1',
    null,
    null,
    'stützen',
    null,
    null,
    null,
    null
  ),
  (
    'toll',
    'adjective',
    'genial, estupendo',
    'Besonders junge Menschen finden das Ticket toll.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'umständlich',
    'adjective',
    'engorroso, complicado',
    'Grenzüberschreitende Buchungen sind immer noch umständlich, Nachtverbindungen dünn gesät und die Preisgestaltung jenseits des Interrail-Passes wenig wettbewerbsfähig gegenüber Billigfliegern.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'umweltfreundlich',
    'adjective',
    'respetuoso con el medio ambiente',
    'Das Ticket ist günstig und umweltfreundlich.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'unbegrenzt',
    'adjective',
    'sin límite, ilimitado',
    'Das Ticket erlaubt es, in 33 europäischen Ländern unbegrenzt Zug zu fahren.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'unterliegen',
    'verb',
    'estar sujeto a',
    'Zugleich unterliegt das Segment einer zunehmenden Kommerzialisierung, die nicht ohne Widersprüche ist.',
    'C1',
    null,
    null,
    'unterliegen',
    null,
    null,
    null,
    null
  ),
  (
    'unterschätzen',
    'verb',
    'subestimar',
    'Dennoch bleibt der Betreuer-Job gesellschaftlich unterschätzt.',
    'C1',
    null,
    null,
    'unterschätzen',
    null,
    null,
    null,
    null
  ),
  (
    'Verantwortung übernehmen',
    'verb',
    'asumir responsabilidad',
    'Sie haben gelernt, Verantwortung zu übernehmen, Geduld zu haben und in Gruppen zu führen.',
    'B1',
    null,
    null,
    'Verantwortung übernehmen',
    null,
    null,
    null,
    null
  ),
  (
    'verantwortungsvoll',
    'adjective',
    'responsable, que exige responsabilidad',
    'Der Job ist kein klassischer Ferienjob – er ist intensiv, verantwortungsvoll und gleichzeitig eines der abwechslungsreichsten Erlebnisse, die man mit 20 haben kann.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'vermeiden',
    'verb',
    'evitar',
    'Viele Jugendliche wollen nachhaltig reisen und vermeiden das Flugzeug.',
    'B1',
    null,
    null,
    'vermeiden',
    null,
    null,
    null,
    null
  ),
  (
    'vielfältig',
    'adjective',
    'variado, diverso',
    'Die Gründe für den Boom sind vielfältig.',
    'B1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'voraussetzen',
    'verb',
    'presuponer, dar por sentado',
    'Das Ticket löst die Netzfrage nicht – es setzt sie voraus.',
    'C1',
    null,
    null,
    'voraussetzen',
    null,
    null,
    null,
    null
  ),
  (
    'vorhersehbar',
    'adjective',
    'previsible',
    'Dass Surfcamps an der deutschen Ostsee boomen, ist keine Überraschung – es ist das vorhersehbare Ergebnis mehrerer zusammenlaufender Trends.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'wichtig',
    'adjective',
    'importante',
    'Das finden viele junge Menschen wichtig.',
    'A2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'wohnen',
    'verb',
    'alojarse, vivir',
    'Sie wohnen im Camp, essen zusammen und lernen neue Freunde kennen.',
    'A2',
    null,
    null,
    'wohnen',
    null,
    null,
    null,
    null
  ),
  (
    'Zug fahren',
    'verb',
    'viajar en tren',
    'Mit diesem Ticket kann man in vielen Ländern Zug fahren.',
    'A2',
    null,
    null,
    'Zug fahren',
    null,
    null,
    null,
    null
  ),
  (
    'zur Verfügung stellen',
    'verb',
    'poner a disposición',
    'Das DiscoverEU-Programm, das 18-Jährigen kostenlose Interrail-Pässe zur Verfügung stellt, ist konzeptionell klug: Es kombiniert Mobilitätsförderung mit europäischer Identitätsbildung.',
    'C1',
    null,
    null,
    'zur Verfügung stellen',
    null,
    null,
    null,
    null
  ),
  (
    'zurückführen auf',
    'adjective',
    'atribuir a',
    'Betreiber in Prerow, Kühlungsborn und auf Fehmarn berichten von Wartelisten für die Hauptsaison und einer deutlich gestiegenen Nachfrage aus dem Inland – ein Trend, den Branchenkenner auf eine Kombination aus Nachholeffekten nach der Pandemie, gestiegenen Auslandsreisekosten und wachsendem Interesse an Natursport zurückführen.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'zusammenlaufend',
    'adjective',
    'convergente, que confluyen',
    'Dass Surfcamps an der deutschen Ostsee boomen, ist keine Überraschung – es ist das vorhersehbare Ergebnis mehrerer zusammenlaufender Trends.',
    'C1',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'zuzüglich',
    'adjective',
    'más, además de',
    'Finanziell ist der Job wenig attraktiv: Das Taschengeld liegt zwischen 200 und 400 Euro pro Woche, zuzüglich freier Unterkunft und Verpflegung.',
    'B2',
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'übersteigen',
    'verb',
    'superar, exceder',
    'Die Nachfrage übersteigt das Angebot, wie viele Anbieter berichten.',
    'B2',
    null,
    null,
    'übersteigen',
    null,
    null,
    null,
    null
  )
) as v(
  german,
  word_type,
  spanish,
  example_sentence_de,
  level,
  article,
  plural_form,
  infinitive,
  example_sentence_es,
  example_sentence_de_generated,
  past_simple,
  past_participle
)
where not exists (
  select 1
  from vocabulario existing
  where lower(existing.german) = lower(v.german)
);

-- Vocabulary links per text version
insert into text_version_vocabulary (
  text_version_id,
  vocabulario_id
)
select distinct
  tv.id,
  v.id
from (
  values
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'das Zugticket'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'Zug fahren'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'der Zug'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'kaufen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'die Sommerferien'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'günstig'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'reisen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'besuchen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'die Jugendlichen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'die Umwelt'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'A2',
    'wichtig'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'erleben'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'buchen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'nie zuvor'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'erlauben'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'unbegrenzt'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'der Grund'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'vielfältig'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'nachhaltig'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'vermeiden'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'der Pass'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'anbieten'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'das Angebot'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'nutzen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'beliebt'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B1',
    'das Erlebnis'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'gefragt'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'die Buchung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'der Anstieg'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'der Vorjahreszeitraum'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'der Wandel'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'das Bewusstsein'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'die Skepsis'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'hervorbringen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'das Leitbild'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'der Zwischenstopp'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'abseits der Touristenpfade'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'die Herausforderung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'ausgebucht'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'die Nachtverbindung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'B2',
    'grenzüberschreitend'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'das Marktphänomen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'die Verschiebung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'aufgeladen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'emittieren'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'befördern'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'zur Verfügung stellen'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'die Mobilitätsförderung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'die Identitätsbildung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'der gelebte Raum'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'offenbaren'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'das Schienennetz'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'umständlich'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'dünn gesät'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'die Preisgestaltung'
  ),
  (
    'interrail-mit-dem-zug-durch-ganz-europa',
    'C1',
    'die Investitionsbereitschaft'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'die Ostsee'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'Spaß machen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'ruhig'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'der Anfänger'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'wohnen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'Freunde kennenlernen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'A2',
    'das Erlebnis'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'die Ostseeküste'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'ausgebucht'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'die Nachfrage'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'die Teilnehmer'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'das Wellenreiten'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'die Wellenhöhe'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'erfahren'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'die Herausforderung'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'schätzen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B1',
    'betreut'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'eine klare Sprache sprechen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'der Betreiber'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'die Hauptsaison'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'der Branchenkenner'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'der Nachholeffekt'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'zurückführen auf'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'die Verpflegung'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'der Anbieter'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'die Gemeinschaft'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'die Naturnähe'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'B2',
    'digitallastig'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'vorhersehbar'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'zusammenlaufend'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'die Freizeitgestaltung'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'das Naturerleben'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'die Vermittlung'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'die Bindung'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'stützen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'unterliegen'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'die zahlungskräftige Klientel'
  ),
  (
    'surfen-an-der-ostsee-ein-sommersport-fuer-jugendliche',
    'C1',
    'die Mittelschicht'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'kosten'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'praktisch'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'benutzen'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'die Berge'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'umweltfreundlich'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'kündigen'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'flexibel'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'A2',
    'toll'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'die Einführung'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'das Nahverkehrsprojekt'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'der Inhaber'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'der Aufpreis'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'das Inland'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'die Geduld'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'erkunden'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'inbegriffen'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'bemängeln'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B1',
    'strukturschwach'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'die Bilanz'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'auf der Habenseite'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'der Rückgang'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'die einkommensschwächere Bevölkerungsgruppe'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'auf der Sollseite'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'ermäßigt'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'die Umsteigezeit'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'außerhalb der Reichweite'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'streiten'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'B2',
    'die Mobilitätswende'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'auf der Kippe stehen'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'die strukturelle Spannung'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'angebotsneutral'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'voraussetzen'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'eröffnen'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'der Umgang mit'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'das kulturpolitische Instrument'
  ),
  (
    'das-deutschlandticket-guenstig-mit-dem-zug-durch-deutschland',
    'C1',
    'jährlich neu verhandelt'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'betreuen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'der Sommerjob'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'der Betreuer'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'die Unterkunft'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'mindestens'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'der Erste-Hilfe-Kurs'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'notwendig'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'A2',
    'die Semesterferien'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'der Jugendreiseveranstalter'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'verantwortungsvoll'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'abwechslungsreich'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'rund um die Uhr'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'Konflikte lösen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'die Bezahlung'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'das Taschengeld'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'die Verpflegung'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'die Persönlichkeit'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'Verantwortung übernehmen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B1',
    'die Fähigkeit'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'der Bedarf'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'die Saisonkraft'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'übersteigen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'erfordern'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'die interkulturelle Kompetenz'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'die Schulung'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'zuzüglich'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'die Bewerberin / der Bewerber'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'die Personalverantwortlichen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'B2',
    'prägend'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'das informelle Lernen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'die transformative Erfahrung'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'schlichten'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'auffangen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'kanalisieren'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'empirisch gut belegt'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'unterschätzen'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'die Niedriglöhne'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'die Care-Ökonomie'
  ),
  (
    'sommerjob-im-feriencamp-geld-verdienen-und-spass-haben',
    'C1',
    'bereit sein'
  )
) as m(
  slug,
  level,
  german
)
join texts t on t.slug = m.slug
join text_versions tv on tv.text_id = t.id and tv.level = m.level
join vocabulario v on lower(v.german) = lower(m.german)
where not exists (
  select 1
  from text_version_vocabulary existing
  where existing.text_version_id = tv.id
    and existing.vocabulario_id = v.id
);

