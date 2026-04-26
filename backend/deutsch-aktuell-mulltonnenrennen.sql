-- ============================================================
-- Deutsch aktuell – 9. April 2026
-- Das Lausitzer Mülltonnenrennen
-- Adapted to current imKontext Supabase schema
-- ============================================================

-- Current schema confirmed:
-- texts(id, title, text_content, topic, access_status, published_at, created_at, slug)
-- text_versions(id, text_id, level, content, created_at)
-- vocabulario(id, german, word_type, spanish, example_sentence_de, level, article, plural_form, infinitive, example_sentence_es, past_simple, past_participle)

-- 1. Upsert base text into texts
insert into texts (
  title,
  text_content,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Das Lausitzer Mülltonnenrennen',
  'In Sellessen in Brandenburg findet jedes Jahr ein originelles Mülltonnenrennen statt. Das Fest zeigt, wie Gemeinschaft, Humor und lokale Tradition ein kleines Dorf weit über die Region hinaus bekannt machen können.',
  'Gesellschaft & Kultur',
  'free',
  now(),
  'das-lausitzer-mulltonnenrennen'
)
on conflict (slug) do update set
  title = excluded.title,
  text_content = excluded.text_content,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

-- 2. Upsert level versions
insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'das-lausitzer-mulltonnenrennen'),
  'A2',
  'In Deutschland gibt es viele lustige Traditionen. Eine davon ist das Mülltonnenrennen. Es findet in Sellessen statt. Sellessen ist ein kleines Dorf in Brandenburg. Das Dorf hat weniger als 1000 Einwohner.

Beim Rennen braucht man eine leere Mülltonne. Zwei Personen bilden ein Team. Eine Person schiebt die Mülltonne einen Berg hoch. Das ist sehr anstrengend! Dann legt sich die zweite Person auf die Tonne. Sie fährt den Berg runter.

Das erste Rennen hat 2019 stattgefunden. Die Idee kam an Silvester. Ein paar Freunde haben zusammen geredet. Dann haben sie das Rennen geplant. Es war ein großer Erfolg.

Inzwischen kommen Teams aus ganz Deutschland. Ein Team ist 600 Kilometer gereist! Es gibt Preise für das schnellste Team. Es gibt auch einen Preis für das lustigste Kostüm.

Alle feiern zusammen. Es ist das größte Fest des Jahres in Sellessen.'
),
(
  (select id from texts where slug = 'das-lausitzer-mulltonnenrennen'),
  'B1',
  'In dem kleinen Brandenburger Dorf Sellessen findet jedes Jahr ein ganz besonderes Rennen statt: das Lausitzer Mülltonnenrennen. Die Idee entstand an einem Silvesterabend, als ein paar Freunde zusammen eine verrückte Idee hatten.

Die Spielregeln sind einfach: Zwei Personen bilden ein Team. Eine Person schiebt eine leere Mülltonne einen steilen Weg bergauf, weil das der schwierigste Teil ist. Dann legt sich die zweite Person auf die Tonne und fährt den Berg hinunter ins Ziel.

Seit der Premiere im Jahr 2019 ist das Rennen immer größer geworden. Beim dritten Rennen 2024 traten achtzehn Teams gegeneinander an, obwohl das Dorf nur wenige hundert Einwohner hat. Ein Team reiste sogar 600 Kilometer aus dem Siegerland an.

Der Verein Grün-Weiß Sellessen organisiert das Event und sorgt dafür, dass alles reibungslos läuft. Neben dem Wanderpokal - der "Goldenen Tonne" - gibt es auch Sonderpreise, damit möglichst viele Teilnehmer eine Chance auf einen Preis haben.

Das Rennen wurde sogar im RBB-Fernsehen ausgestrahlt, weil es so originell und gesellig ist. Inzwischen ist es der Höhepunkt des Jahres in Sellessen.

Das Mülltonnenrennen zeigt, dass man keine großen Städte oder viel Geld braucht, um ein tolles Fest zu organisieren. Trotzdem zieht das Event Menschen aus ganz Deutschland an.

Das Rennen macht deutlich, wie wichtig Gemeinschaft und Humor für ein Dorf sein können.'
),
(
  (select id from texts where slug = 'das-lausitzer-mulltonnenrennen'),
  'B2',
  'Das beschauliche Dorf Sellessen in der Lausitz - Brandenburg - wäre auf keiner Touristikkarte zu finden, hätten seine Einwohner nicht eine außergewöhnliche Idee gehabt: ein Rennen, bei dem nicht Autos oder Fahrräder, sondern schlichte Mülltonnen die Hauptrolle spielen. Seit der Premiere im Jahr 2019, die an einem Silvesterabend unter Freunden ersonnen wurde, hat sich das Lausitzer Mülltonnenrennen zu einem festen Bestandteil der regionalen Festkultur entwickelt.

Die Spielregeln sind so simpel wie originell: Zwei Personen bilden ein Team, wobei eine Person - der sogenannte "Schieber" - eine leere Mülltonne auf einem rund 100 Meter langen, steilen Weg bergaufwärts schiebt. An der Wendemarke legt sich der zweite Teilnehmer, der "Fahrer", auf die Tonne und gleitet den Hang hinunter ins Ziel. Die Zeiten beider Abschnitte werden addiert, wodurch eine klare Platzierung ermöglicht wird.

Was ursprünglich als humorvoller Einfall begann, wurde rasch zu einem ernsthaft ausgetragenen Wettbewerb. Beim dritten Rennen 2024 traten achtzehn Teams gegeneinander an, während Hunderte von Zuschauern die Strecke säumten. Der Wanderpokal - die "Goldene Tonne" - wurde von Marisa und Ricardo Wanke mit einer beeindruckenden Zeit von 33,03 Sekunden gewonnen. Besonders bemerkenswert war die weiteste Anreise: Ein Team hatte eigens aus dem 600 Kilometer entfernten Siegerland die Reise auf sich genommen.

Der Wettkampf wird vom Sportverein Grün-Weiß Sellessen organisiert und durch zahlreiche regionale Sponsoren unterstützt. Neben den sportlichen Leistungen werden auch kreative Kostüme prämiert - ein Sonderpreis, der die gesellige Atmosphäre des Events unterstreicht. Das Mülltonnenrennen ist längst mehr als ein kurioses Spektakel: Es ist der Höhepunkt des dörflichen Gemeinschaftslebens geworden, ein Fest, das die Dorfgemeinschaft zusammenschweißt.

Die Veranstaltung zeigt, dass Kreativität und Gemeinschaftssinn keine großen Bühnen brauchen. Gerade die Bodenständigkeit des Konzepts macht es so beliebt - und sorgt dafür, dass es inzwischen sogar im RBB-Fernsehen übertragen wurde.

Die überregionale Strahlkraft des Rennens wächst von Jahr zu Jahr, und mit ihr das Bewusstsein für eine strukturschwache Region, die aus eigener Kraft Anlässe schafft, die Menschen zusammenbringen.'
),
(
  (select id from texts where slug = 'das-lausitzer-mulltonnenrennen'),
  'C1',
  'Dass ein kleines brandenburgisches Dorf namens Sellessen zur Pilgerstätte für Mülltonnenbegeisterte aus dem gesamten Bundesgebiet geworden ist, ließe sich als bloße Kuriosität abtun. Wer jedoch tiefer schaut, entdeckt in dem seit 2019 alljährlich ausgetragenen Lausitzer Mülltonnenrennen ein kultursoziologisch aufschlussreiches Phänomen: die Revitalisierung dörflicher Gemeinschaft durch bewusst absurden Wettkampf.

Die Spielanordnung des Rennens folgt einer archetypischen Dramaturgie - Mühe und Belohnung, Schweiß und Jubel -, die durch die karnevaleske Qualität der Mülltonne als Transportmittel noch verstärkt wird. Die alltägliche Zweckrationalität wird demonstrativ außer Kraft gesetzt; an ihre Stelle tritt ein kollektives Ritual, das Konkurrenz und Geselligkeit als komplementäre, nicht als gegensätzliche Elemente begreift.

Die Veranstaltungsgeschichte belegt den wachsenden Mobilisierungsgrad: Beim dritten Rennen 2024 reiste ein Team eigens aus dem 600 Kilometer entfernten Siegerland an, während der RBB eine Reportage ausstrahlte - ein Indiz für die überregionale Strahlkraft eines Formats, das strukturell auf Inklusion und lokale Identitätsstiftung ausgerichtet ist.

Soziologisch betrachtet erfüllt das Mülltonnenrennen mehrere Funktionen gleichzeitig: Es mobilisiert den Sportverein als institutionellen Kern, schafft mediale Sichtbarkeit für eine strukturschwache Region und bietet ein inklusives Rahmenformat, das demografischen Erosionsprozessen - Abwanderung, Überalterung, Vereinzelung - zumindest symbolisch etwas entgegensetzt.

Was dieser Fall exemplarisch zeigt, ist die strukturelle Kraft von Gemeinschaften, die aus eigener Initiative Anlässe schaffen, die Zugehörigkeit erfahrbar machen. Ob die Goldene Tonne je zum nationalen Symbol avancieren wird, sei dahingestellt - ihre Funktion als Trophäe lokalen Stolzes und kollektiver Selbstermächtigung ist hingegen unstrittig.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- 3. Insert vocabulary
-- This vocabulary table is global and not linked to a text_id.

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
  past_simple,
  past_participle
)
select *
from (
  values
  ('Rennen', 'noun', 'la carrera', 'Das Rennen findet jedes Jahr statt.', 'A2', 'das', 'die Rennen', null, 'La carrera tiene lugar cada año.', null, null),
  ('Dorf', 'noun', 'el pueblo', 'Das Dorf hat weniger als 1000 Einwohner.', 'A2', 'das', 'die Dörfer', null, 'El pueblo tiene menos de 1000 habitantes.', null, null),
  ('Mülltonne', 'noun', 'el cubo de basura', 'Die Mülltonne ist leer.', 'A2', 'die', 'die Mülltonnen', null, 'El cubo de basura está vacío.', null, null),
  ('Berg', 'noun', 'la montaña / el cerro', 'Sie schieben die Tonne den Berg hoch.', 'A2', 'der', 'die Berge', null, 'Empujan el cubo cuesta arriba.', null, null),
  ('Team', 'noun', 'el equipo', 'Zwei Personen bilden ein Team.', 'A2', 'das', 'die Teams', null, 'Dos personas forman un equipo.', null, null),
  ('Preis', 'noun', 'el premio', 'Es gibt Preise für das schnellste Team.', 'A2', 'der', 'die Preise', null, 'Hay premios para el equipo más rápido.', null, null),
  ('Fest', 'noun', 'la fiesta', 'Das ist das größte Fest des Jahres.', 'A2', 'das', 'die Feste', null, 'Esta es la fiesta más grande del año.', null, null),
  ('Einwohner', 'noun', 'el habitante', 'Das Dorf hat wenige Einwohner.', 'A2', 'der', 'die Einwohner', null, 'El pueblo tiene pocos habitantes.', null, null),
  ('Kostüm', 'noun', 'el disfraz', 'Es gibt einen Preis für das lustigste Kostüm.', 'A2', 'das', 'die Kostüme', null, 'Hay un premio para el disfraz más gracioso.', null, null),
  ('Erfolg', 'noun', 'el éxito', 'Das Rennen war ein großer Erfolg.', 'A2', 'der', 'die Erfolge', null, 'La carrera fue un gran éxito.', null, null),
  ('schieben', 'verb', 'empujar', 'Er schiebt die Tonne bergauf.', 'A2', null, null, 'schieben', 'Él empuja el cubo cuesta arriba.', 'schob', 'geschoben'),
  ('stattfinden', 'verb', 'tener lugar / celebrarse', 'Das Rennen findet in Sellessen statt.', 'A2', null, null, 'stattfinden', 'La carrera tiene lugar en Sellessen.', 'fand statt', 'stattgefunden'),
  ('gewinnen', 'verb', 'ganar', 'Wer gewinnt, bekommt einen Preis.', 'A2', null, null, 'gewinnen', 'Quien gana recibe un premio.', 'gewann', 'gewonnen'),
  ('feiern', 'verb', 'celebrar', 'Alle feiern zusammen.', 'A2', null, null, 'feiern', 'Todos celebran juntos.', 'feierte', 'gefeiert'),
  ('reisen', 'verb', 'viajar', 'Ein Team ist 600 Kilometer gereist.', 'A2', null, null, 'reisen', 'Un equipo viajó 600 kilómetros.', 'reiste', 'gereist'),
  ('lustig', 'adjective', 'gracioso / divertido', 'Das Rennen ist sehr lustig.', 'A2', null, null, null, 'La carrera es muy divertida.', null, null),
  ('anstrengend', 'adjective', 'agotador / difícil', 'Den Berg hochschieben ist sehr anstrengend.', 'A2', null, null, null, 'Empujar cuesta arriba es muy agotador.', null, null),
  ('leer', 'adjective', 'vacío', 'Die Tonne muss leer sein.', 'A2', null, null, null, 'El cubo tiene que estar vacío.', null, null),
  ('schnell', 'adjective', 'rápido', 'Das schnellste Team gewinnt.', 'A2', null, null, null, 'El equipo más rápido gana.', null, null),
  ('Tradition', 'noun', 'la tradición', 'Das Mülltonnenrennen ist eine neue Tradition.', 'B1', 'die', 'die Traditionen', null, 'La carrera de cubos es una nueva tradición.', null, null),
  ('Teilnehmer', 'noun', 'el participante', 'Viele Teilnehmer kommen aus anderen Städten.', 'B1', 'der', 'die Teilnehmer', null, 'Muchos participantes vienen de otras ciudades.', null, null),
  ('Strecke', 'noun', 'el recorrido / la ruta', 'Die Strecke ist rund 100 Meter lang.', 'B1', 'die', 'die Strecken', null, 'El recorrido mide unos 100 metros.', null, null),
  ('Verein', 'noun', 'la asociación / el club', 'Der Verein organisiert das Rennen.', 'B1', 'der', 'die Vereine', null, 'El club organiza la carrera.', null, null),
  ('Wanderpokal', 'noun', 'el trofeo itinerante', 'Der Wanderpokal heißt "die Goldene Tonne".', 'B1', 'der', 'die Wanderpokale', null, 'El trofeo itinerante se llama "el Cubo de Oro".', null, null),
  ('Zuschauer', 'noun', 'el espectador', 'Hunderte von Zuschauern kamen zum Rennen.', 'B1', 'der', 'die Zuschauer', null, 'Cientos de espectadores vinieron a la carrera.', null, null),
  ('Anreise', 'noun', 'el viaje de llegada', 'Die weiteste Anreise kam aus dem Siegerland.', 'B1', 'die', 'die Anreisen', null, 'El viaje más largo vino desde el Siegerland.', null, null),
  ('Gemeinschaft', 'noun', 'la comunidad', 'Das Fest stärkt die Gemeinschaft im Dorf.', 'B1', 'die', 'die Gemeinschaften', null, 'La fiesta fortalece la comunidad del pueblo.', null, null),
  ('Wettbewerb', 'noun', 'la competición', 'Der Wettbewerb wird jedes Jahr größer.', 'B1', 'der', 'die Wettbewerbe', null, 'La competición crece cada año.', null, null),
  ('Höhepunkt', 'noun', 'el punto culminante', 'Das Rennen ist der Höhepunkt des Jahres.', 'B1', 'der', 'die Höhepunkte', null, 'La carrera es el punto culminante del año.', null, null),
  ('Sonderpreis', 'noun', 'el premio especial', 'Es gibt einen Sonderpreis für das kreativste Kostüm.', 'B1', 'der', 'die Sonderpreise', null, 'Hay un premio especial para el disfraz más creativo.', null, null),
  ('organisieren', 'verb', 'organizar', 'Der Sportverein organisiert das Rennen.', 'B1', null, null, 'organisieren', 'El club deportivo organiza la carrera.', 'organisierte', 'organisiert'),
  ('teilnehmen', 'verb', 'participar', 'Achtzehn Teams haben teilgenommen.', 'B1', null, null, 'teilnehmen', 'Dieciocho equipos participaron.', 'nahm teil', 'teilgenommen'),
  ('prämieren', 'verb', 'premiar / galardonar', 'Kreative Kostüme werden prämiert.', 'B1', null, null, 'prämieren', 'Los disfraces creativos son premiados.', 'prämierte', 'prämiert'),
  ('entstehen', 'verb', 'surgir / nacer', 'Die Idee ist an Silvester entstanden.', 'B1', null, null, 'entstehen', 'La idea surgió en Nochevieja.', 'entstand', 'entstanden'),
  ('antreten', 'verb', 'competir / presentarse', 'Viele Teams sind gegeneinander angetreten.', 'B1', null, null, 'antreten', 'Muchos equipos compitieron entre sí.', 'trat an', 'angetreten'),
  ('originell', 'adjective', 'original / ingenioso', 'Die Spielregeln sind originell und simpel.', 'B1', null, null, null, 'Las reglas son ingeniosas y sencillas.', null, null),
  ('gesellig', 'adjective', 'sociable / festivo', 'Das Event hat eine gesellige Atmosphäre.', 'B1', null, null, null, 'El evento tiene un ambiente festivo.', null, null),
  ('beliebt', 'adjective', 'popular / querido', 'Das Rennen ist sehr beliebt in der Region.', 'B1', null, null, null, 'La carrera es muy popular en la región.', null, null),
  ('bemerkenswert', 'adjective', 'notable / destacable', 'Die weiteste Anreise war bemerkenswert.', 'B1', null, null, null, 'El viaje más largo fue notable.', null, null),
  ('auf sich nehmen', 'expression', 'asumir / tomarse la molestia', 'Ein Team hat die weite Anreise auf sich genommen.', 'B1', null, null, null, 'Un equipo se tomó la molestia del largo viaje.', null, null),
  ('Festkultur', 'noun', 'la cultura festiva', 'Das Rennen ist Teil der regionalen Festkultur.', 'B2', 'die', 'die Festkulturen', null, 'La carrera forma parte de la cultura festiva regional.', null, null),
  ('Spielregel', 'noun', 'la regla del juego', 'Die Spielregeln sind simpel und originell.', 'B2', 'die', 'die Spielregeln', null, 'Las reglas del juego son sencillas e ingeniosas.', null, null),
  ('Platzierung', 'noun', 'la clasificación', 'Die Zeiten beider Abschnitte ergeben die Platzierung.', 'B2', 'die', 'die Platzierungen', null, 'Los tiempos de ambos tramos determinan la clasificación.', null, null),
  ('Bestandteil', 'noun', 'el componente / la parte integrante', 'Das Rennen ist fester Bestandteil des Dorffestes.', 'B2', 'der', 'die Bestandteile', null, 'La carrera es parte integrante de la fiesta del pueblo.', null, null),
  ('Premiere', 'noun', 'la primera edición / el estreno', 'Die Premiere fand 2019 statt.', 'B2', 'die', 'die Premieren', null, 'La primera edición tuvo lugar en 2019.', null, null),
  ('Einfall', 'noun', 'la ocurrencia / la idea repentina', 'Der Einfall kam an einem Silvesterabend.', 'B2', 'der', 'die Einfälle', null, 'La ocurrencia surgió en una Nochevieja.', null, null),
  ('Strahlkraft', 'noun', 'el atractivo / la proyección', 'Das Rennen hat eine überregionale Strahlkraft.', 'B2', 'die', null, null, 'La carrera tiene una proyección suprarregional.', null, null),
  ('Bodenständigkeit', 'noun', 'la sencillez / los pies en la tierra', 'Die Bodenständigkeit macht das Rennen beliebt.', 'B2', 'die', null, null, 'La sencillez hace popular la carrera.', null, null),
  ('Veranstaltung', 'noun', 'el evento / el acto', 'Die Veranstaltung zieht Teams aus ganz Deutschland an.', 'B2', 'die', 'die Veranstaltungen', null, 'El evento atrae equipos de toda Alemania.', null, null),
  ('Gemeinschaftssinn', 'noun', 'el sentido comunitario', 'Das Event fördert den Gemeinschaftssinn im Dorf.', 'B2', 'der', null, null, 'El evento fomenta el sentido comunitario en el pueblo.', null, null),
  ('Sponsor', 'noun', 'el patrocinador', 'Regionale Sponsoren unterstützen das Event.', 'B2', 'der', 'die Sponsoren', null, 'Los patrocinadores regionales apoyan el evento.', null, null),
  ('zusammenschweißen', 'verb', 'unir / soldar (fig.)', 'Das Fest schweißt die Dorfgemeinschaft zusammen.', 'B2', null, null, 'zusammenschweißen', 'La fiesta une a la comunidad del pueblo.', 'schweißte zusammen', 'zusammengeschweißt'),
  ('austragen', 'verb', 'disputar / celebrar', 'Der Wettkampf wird jährlich ausgetragen.', 'B2', null, null, 'austragen', 'La competición se disputa anualmente.', 'trug aus', 'ausgetragen'),
  ('säumen', 'verb', 'bordear / flanquear', 'Hunderte Zuschauer säumten die Strecke.', 'B2', null, null, 'säumen', 'Cientos de espectadores flanquearon el recorrido.', 'säumte', 'gesäumt'),
  ('übertragen', 'verb', 'emitir / retransmitir', 'Der RBB hat das Rennen übertragen.', 'B2', null, null, 'übertragen', 'El RBB emitió la carrera.', 'übertrug', 'übertragen'),
  ('ersinnen', 'verb', 'idear / concebir', 'Die Idee wurde an Silvester ersonnen.', 'B2', null, null, 'ersinnen', 'La idea fue concebida en Nochevieja.', 'ersann', 'ersonnen'),
  ('karnevalesk', 'adjective', 'carnavalesco', 'Das Event hat einen karnavalesken Charakter.', 'B2', null, null, null, 'El evento tiene un carácter carnavalesco.', null, null),
  ('überregional', 'adjective', 'suprarregional', 'Das Rennen hat überregionale Bekanntheit erlangt.', 'B2', null, null, null, 'La carrera ha alcanzado fama suprarregional.', null, null),
  ('strukturschwach', 'adjective', 'con escasos recursos / desfavorecido', 'Sellessen liegt in einer strukturschwachen Region.', 'B2', null, null, null, 'Sellessen está en una región con escasos recursos.', null, null),
  ('beschaulich', 'adjective', 'tranquilo / apacible', 'Sellessen ist ein beschauliches Dorf in Brandenburg.', 'B2', null, null, null, 'Sellessen es un pueblo tranquilo en Brandeburgo.', null, null),
  ('fester Bestandteil sein', 'expression', 'ser parte integrante', 'Das Rennen ist fester Bestandteil der Dorfkultur.', 'B2', null, null, null, 'La carrera es parte integrante de la cultura del pueblo.', null, null),
  ('Revitalisierung', 'noun', 'la revitalización', 'Das Rennen dient der Revitalisierung der Dorfgemeinschaft.', 'C1', 'die', null, null, 'La carrera sirve para la revitalización de la comunidad.', null, null),
  ('Zweckrationalität', 'noun', 'la racionalidad instrumental', 'Das Rennen setzt die Zweckrationalität außer Kraft.', 'C1', 'die', null, null, 'La carrera suspende la racionalidad instrumental.', null, null),
  ('Selbstermächtigung', 'noun', 'la autoafirmación / el empoderamiento', 'Das Fest ist ein Ausdruck kollektiver Selbstermächtigung.', 'C1', 'die', null, null, 'La fiesta es una expresión de empoderamiento colectivo.', null, null),
  ('Zugehörigkeit', 'noun', 'la pertenencia', 'Das Rennen macht Zugehörigkeit erfahrbar.', 'C1', 'die', null, null, 'La carrera hace tangible el sentido de pertenencia.', null, null),
  ('Vereinzelung', 'noun', 'el aislamiento / la atomización social', 'Das Fest wirkt der sozialen Vereinzelung entgegen.', 'C1', 'die', null, null, 'La fiesta contrarresta el aislamiento social.', null, null),
  ('Dramaturgie', 'noun', 'la dramaturgia / la estructura narrativa', 'Das Rennen folgt einer archetypischen Dramaturgie.', 'C1', 'die', 'die Dramaturgien', null, 'La carrera sigue una dramaturgia arquetípica.', null, null),
  ('Erosionsprozess', 'noun', 'el proceso de deterioro / erosión', 'Das Rennen setzt demografischen Erosionsprozessen etwas entgegen.', 'C1', 'der', 'die Erosionsprozesse', null, 'La carrera opone algo a los procesos de erosión demográfica.', null, null),
  ('Mobilisierung', 'noun', 'la movilización', 'Das Event sorgt für die Mobilisierung der Dorfgemeinschaft.', 'C1', 'die', 'die Mobilisierungen', null, 'El evento genera la movilización de la comunidad del pueblo.', null, null),
  ('Volkskultur', 'noun', 'la cultura popular', 'Bachtin analysierte die Volkskultur des Mittelalters.', 'C1', 'die', null, null, 'Bajtín analizó la cultura popular de la Edad Media.', null, null),
  ('Kuriosität', 'noun', 'la rareza / la curiosidad', 'Das Rennen ließe sich als bloße Kuriosität abtun.', 'C1', 'die', 'die Kuriositäten', null, 'La carrera podría descartarse como mera rareza.', null, null),
  ('Identitätsstiftung', 'noun', 'la creación de identidad', 'Das Rennen dient der lokalen Identitätsstiftung.', 'C1', 'die', null, null, 'La carrera sirve a la creación de identidad local.', null, null),
  ('avancieren', 'verb', 'ascender / convertirse en', 'Das Rennen könnte zum nationalen Symbol avancieren.', 'C1', null, null, 'avancieren', 'La carrera podría convertirse en un símbolo nacional.', 'avancierte', 'avanciert'),
  ('abtun', 'verb', 'descartar / despachar', 'Man sollte das Rennen nicht als Kuriosität abtun.', 'C1', null, null, 'abtun', 'No se debería descartar la carrera como una rareza.', 'tat ab', 'abgetan'),
  ('entgegensetzen', 'verb', 'oponer / contraponer', 'Die Gemeinschaft setzt den Problemen etwas entgegen.', 'C1', null, null, 'entgegensetzen', 'La comunidad opone algo a los problemas.', 'setzte entgegen', 'entgegengesetzt'),
  ('unterstreichen', 'verb', 'subrayar / poner de relieve', 'Der RBB-Bericht unterstreicht die überregionale Bedeutung.', 'C1', null, null, 'unterstreichen', 'El reportaje del RBB pone de relieve la importancia suprarregional.', 'unterstrich', 'unterstrichen'),
  ('belegen', 'verb', 'demostrar / evidenciar', 'Die Teilnehmerzahlen belegen den Erfolg des Formats.', 'C1', null, null, 'belegen', 'Las cifras de participación evidencian el éxito del formato.', 'belegte', 'belegt'),
  ('archetypisch', 'adjective', 'arquetípico', 'Das Rennen folgt einer archetypischen Struktur.', 'C1', null, null, null, 'La carrera sigue una estructura arquetípica.', null, null),
  ('inklusiv', 'adjective', 'inclusivo', 'Das Format ist bewusst inklusiv gestaltet.', 'C1', null, null, null, 'El formato está diseñado de forma deliberadamente inclusiva.', null, null),
  ('komplementär', 'adjective', 'complementario', 'Konkurrenz und Geselligkeit sind komplementäre Elemente.', 'C1', null, null, null, 'La competición y la convivencia son elementos complementarios.', null, null),
  ('soziologisch', 'adjective', 'sociológico', 'Soziologisch betrachtet erfüllt das Rennen mehrere Funktionen.', 'C1', null, null, null, 'Desde una perspectiva sociológica, la carrera cumple varias funciones.', null, null),
  ('außer Kraft setzen', 'expression', 'suspender / dejar sin efecto', 'Das Fest setzt die alltägliche Ordnung außer Kraft.', 'C1', null, null, null, 'La fiesta deja sin efecto el orden cotidiano.', null, null),
  ('in Verbindung bringen mit', 'expression', 'relacionar con / vincular con', 'Das Rennen lässt sich mit Bachtins Theorie in Verbindung bringen.', 'C1', null, null, null, 'La carrera puede vincularse con la teoría de Bajtín.', null, null),
  ('etwas entgegensetzen', 'expression', 'oponer algo / hacer frente a algo', 'Die Dorfgemeinschaft setzt dem Wandel etwas entgegen.', 'C1', null, null, null, 'La comunidad del pueblo hace frente al cambio.', null, null)
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
  past_simple,
  past_participle
)
where not exists (
  select 1
  from vocabulario existing
  where existing.german = v.german
    and existing.word_type = v.word_type
    and existing.spanish = v.spanish
    and existing.level = v.level
);
