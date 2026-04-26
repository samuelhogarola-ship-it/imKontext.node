-- ============================================================
-- Seed generated from structured TXT
-- Source: /Users/sam/Documents/imKontext/backend/anadir_a_supabase/imKontext Jugend Gesellschaft April2026.txt
-- Tables: texts, text_versions, vocabulario, text_version_vocabulary
-- ============================================================

-- Theme 1: Jugendstudie: Viele junge Menschen sind gestresst
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Jugendstudie: Viele junge Menschen sind gestresst',
  null,
  'premium',
  now(),
  'jugendstudie-viele-junge-menschen-sind-gestresst'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'jugendstudie-viele-junge-menschen-sind-gestresst'),
  'A2',
  'Eine neue Studie zeigt: Viele junge Menschen in Deutschland sind sehr gestresst. Sie haben Angst vor der Zukunft. Das sind die Ergebnisse der Jugendstudie 2026.

30 Prozent der jungen Menschen brauchen psychologische Hilfe. Das ist ein Rekord. Die größten Sorgen sind: Krieg, Wohnungspreise und die Wirtschaft.

41 Prozent der 14- bis 29-Jährigen denken darüber nach, Deutschland zu verlassen. Sie wollen in einem anderen Land leben. Das ist ein wichtiges Signal für die Politik.'
),
(
  (select id from texts where slug = 'jugendstudie-viele-junge-menschen-sind-gestresst'),
  'B1',
  'Die neue Trendstudie „Jugend in Deutschland 2026 – Zukunft unter Druck" zeichnet ein besorgniserregendes Bild. Rund 2.000 junge Menschen zwischen 14 und 29 Jahren wurden befragt. Das Ergebnis: Psychischer Stress, finanzielle Sorgen und Zweifel an der Zukunft prägen den Alltag vieler Jugendlicher.

Besonders auffallend: 41 Prozent der Befragten können sich vorstellen, künftig lieber in einem anderen Land zu leben. Als Gründe werden vor allem die Wohnungsnot, unsichere Jobperspektiven und das allgemeine politische Klima genannt.

Jugendforscher Klaus Hurrelmann von der Hertie School Berlin fordert mehr Beteiligung junger Menschen in der Politik. Die Gesellschaft müsse der jungen Generation mehr Vertrauen schenken – sonst drohe eine dauerhafte politische Entfremdung.'
),
(
  (select id from texts where slug = 'jugendstudie-viele-junge-menschen-sind-gestresst'),
  'B2',
  'Die neunte Ausgabe der Trendstudie „Jugend in Deutschland" liefert alarmante Befunde. Unter den 2.012 befragten 14- bis 29-Jährigen gibt jeder Dritte an, psychologische Unterstützung zu benötigen – ein historischer Höchstwert. Die Hauptsorgen der Befragten: Kriege in Europa und Nahost (62 Prozent), teure Wohnungen (58 Prozent) und wirtschaftliche Unsicherheit.

Besonders bemerkenswert ist die gestiegene Auswanderungsbereitschaft. 41 Prozent der jungen Deutschen können sich vorstellen, dauerhaft im Ausland zu leben – ein Wert, der vor fünf Jahren noch bei unter 25 Prozent lag. Als Hauptmotiv wird neben der Wohnungsnot auch das Gefühl genannt, in Deutschland politisch nicht gehört zu werden.

Bildungsforscherin Nina Kolleck von der Universität Potsdam sieht die Ergebnisse als politischen Weckruf: Junge Menschen seien nicht apathisch, sondern enttäuscht. Wer sie zurückgewinnen wolle, müsse echte Beteiligungsformen schaffen – keine Symbolpolitik.'
),
(
  (select id from texts where slug = 'jugendstudie-viele-junge-menschen-sind-gestresst'),
  'C1',
  'Die Trendstudie „Jugend in Deutschland 2026" ist kein bloßer Stimmungsbericht – sie ist eine Strukturdiagnose. Dass 41 Prozent der 14- bis 29-Jährigen ernsthaft über Auswanderung nachdenken, ist nicht primär ein Zeichen individueller Unzufriedenheit, sondern ein Indikator für kollektive Erfahrungen: Wohnungsnot, Jobmarktprekarität, politische Exklusion und die Kumulation von Krisenwahrnehmungen, die seit der Pandemie nicht mehr abgeebbt ist.

Besonders aufschlussreich ist der Befund zur psychischen Gesundheit. 30 Prozent der Befragten geben an, psychologische Unterstützung zu benötigen – ein Wert, der die Versorgungskapazitäten des deutschen Gesundheitssystems strukturell in Frage stellt. Wartezeiten von sechs bis achtzehn Monaten für einen Therapieplatz sind in vielen Regionen Realität. Die Nachfrage wächst, das Angebot nicht.

Was die Studie auch zeigt: Die vielzitierte politische Apathie junger Menschen ist eine Fehldiagnose. Die Daten belegen eher das Gegenteil – ein hohes Problembewusstsein, verbunden mit tiefer Skepsis gegenüber der Fähigkeit politischer Institutionen, diese Probleme zu lösen. Das ist keine Gleichgültigkeit, sondern rational begründete Entfremdung.

Eine Gesellschaft, die 41 Prozent ihrer jüngsten Generation als potenzielle Emigranten verliert, sollte weniger fragen, was mit der Jugend nicht stimmt – und mehr, was mit den Verhältnissen nicht stimmt.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 2: Artemis: Menschen wollen wieder zum Mond fliegen
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Artemis: Menschen wollen wieder zum Mond fliegen',
  null,
  'premium',
  now(),
  'artemis-menschen-wollen-wieder-zum-mond-fliegen'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'artemis-menschen-wollen-wieder-zum-mond-fliegen'),
  'A2',
  'Die NASA hat ein neues Programm. Es heißt Artemis. Das Ziel ist: Menschen sollen wieder zum Mond fliegen. Das letzte Mal war 1972.

Die Rakete ist sehr groß und stark. Sie heißt SLS. Die Astronauten leben im Raumschiff Orion. Die Reise zum Mond dauert mehrere Tage.

Viele Kinder und Jugendliche finden das Programm spannend. Vielleicht fliegt eines Tages ein Mensch auch zum Mars. Das ist der Traum der NASA.'
),
(
  (select id from texts where slug = 'artemis-menschen-wollen-wieder-zum-mond-fliegen'),
  'B1',
  'Das Artemis-Programm der NASA macht Fortschritte. Nach mehreren Testflügen soll in den nächsten Monaten erstmals wieder ein Mensch die Mondoberfläche betreten – zum ersten Mal seit der Apollo-17-Mission im Jahr 1972. Besonders historisch: Diesmal soll auch eine Frau auf dem Mond landen.

Das Programm ist technisch sehr komplex. Die Rakete SLS ist die leistungsstärkste, die die NASA je gebaut hat. Das Raumschiff Orion kann vier Astronautinnen und Astronauten transportieren. Zusätzlich ist eine kleine Raumstation namens Gateway in der Mondumgebung geplant.

Auch Europa ist beteiligt: Das Servicemodul des Orion-Raumschiffs wurde von der Europäischen Raumfahrtagentur ESA entwickelt. Für viele junge Menschen ist Artemis ein Zeichen, dass die Erforschung des Weltraums weitergeht – und dass der Mars als nächstes Ziel näher rückt.'
),
(
  (select id from texts where slug = 'artemis-menschen-wollen-wieder-zum-mond-fliegen'),
  'B2',
  'Das Artemis-Programm der NASA ist mehr als ein Prestigeprojekt – es ist die Grundlage für die langfristige Erforschung des Sonnensystems. Nach dem erfolgreichen unbemannten Artemis-I-Flug 2022 und dem Umflug mit Besatzung bei Artemis II soll die Mission Artemis III erstmals seit über 50 Jahren wieder Menschen auf dem Mond landen lassen, diesmal in der Nähe des südlichen Pols.

Der südliche Pol ist wissenschaftlich besonders interessant: Dort vermuten Forscher große Mengen Wassereis in dauerhaft beschatteten Kratern. Wasser ist nicht nur zum Trinken wichtig – es könnte auch als Treibstoff für künftige Missionen dienen. Das Ziel ist eine dauerhafte menschliche Präsenz auf dem Mond als Sprungbrett für Marsflüge in den 2040er Jahren.

Die europäische Raumfahrtagentur ESA ist über das Servicemodul des Orion-Raumschiffs tief in das Programm eingebunden. Für Deutschland ist das Artemis-Programm auch industriepolitisch relevant: Deutsche Unternehmen wie Airbus Defence and Space liefern Schlüsselkomponenten und profitieren vom wachsenden Weltraummarkt.'
),
(
  (select id from texts where slug = 'artemis-menschen-wollen-wieder-zum-mond-fliegen'),
  'C1',
  'Das Artemis-Programm der NASA ist, je nach Perspektive, ein wissenschaftlicher Meilenstein, ein geopolitisches Statement oder ein Geschäftsmodell – und in Wirklichkeit ist es alle drei gleichzeitig. Die Rückkehr zum Mond nach über fünfzig Jahren ist nicht bloß eine Frage technischer Leistungsfähigkeit, sondern Ausdruck einer veränderten geopolitischen Konstellation, in der die USA, China und zunehmend auch Europa um Einfluss im erdnahen Weltraum konkurrieren.

China hat mit seinem Chang''e-Programm zuletzt mehrfach die Mondoberfläche erkundet und kündigt eine bemannte Mission für die späten 2020er Jahre an. Für Washington ist Artemis damit auch eine Antwort auf Pekings Weltraumambitionen – und auf die Frage, wer die Regeln für die Nutzung lunarer Ressourcen wie Wassereis und Helium-3 setzen wird.

Die europäische Beteiligung über ESA und Industriepartner wie Airbus ist strategisch klug, aber strukturell schwach. Europa liefert Technologie, hat aber kaum Einfluss auf programmatische Entscheidungen. Eine eigenständige europäische Mondstrategie fehlt bis heute – ein Defizit, das angesichts des wachsenden kommerziellen Weltraummarkts zunehmend ins Gewicht fällt.

Für eine Generation junger Menschen, die mit dem Internet aufgewachsen ist, hat Artemis eine besondere Resonanz: Es ist das erste große kollektive Zukunftsprojekt, das ihnen nicht als Problemlösung präsentiert wird, sondern als Horizont.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 3: Abiturienten feiern Party – und räumen danach auf
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Abiturienten feiern Party – und räumen danach auf',
  null,
  'premium',
  now(),
  'abiturienten-feiern-party-und-raeumen-danach-auf'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'abiturienten-feiern-party-und-raeumen-danach-auf'),
  'A2',
  'In Berlin haben Abiturientinnen und Abiturienten eine Party gefeiert. Die Party war am Planetarium in Prenzlauer Berg. Sie haben viel Lärm gemacht und Müll hinterlassen.

Danach haben sich die Schülerinnen und Schüler getroffen. Sie haben sich entschuldigt. Und sie haben den Park sauber gemacht. Das fanden viele Menschen gut.

Der Schulleiter war stolz auf seine Schüler. Er sagte: Das war ein Fehler – aber die Reaktion war richtig. Die Jugendlichen haben Verantwortung übernommen.'
),
(
  (select id from texts where slug = 'abiturienten-feiern-party-und-raeumen-danach-auf'),
  'B1',
  'Am vergangenen Wochenende eskalierte eine Abiturfeier am Planetarium in Berlin-Prenzlauer Berg. Mehrere hundert Schülerinnen und Schüler feierten bis in die Nacht – laut, mit viel Müll und Schäden an Pflanzen und Bänken im Park. Anwohner riefen die Polizei.

Was danach passierte, sorgte für positive Aufmerksamkeit: Die Klassen organisierten eigenständig eine Wiedergutmachungsaktion. Am folgenden Samstag kamen Dutzende Schülerinnen und Schüler mit Handschuhen und Müllbeuteln in den Park, räumten auf und entschuldigten sich bei Parkbesuchern.

Ein Anwohner sagte dem Tagesspiegel, er sei positiv überrascht gewesen. Der Schulleiter erklärte: Die Party war ein Fehler. Aber die Bereitschaft zur Wiedergutmachung zeigt, dass diese Jugendlichen gelernt haben, Verantwortung zu übernehmen.'
),
(
  (select id from texts where slug = 'abiturienten-feiern-party-und-raeumen-danach-auf'),
  'B2',
  'Was als klassische Nachbarschaftsbeschwerde begann, wurde zu einem kleinen Lehrstück über Verantwortung und Gemeinschaft. Die Abiturienten-Party am Planetarium in Prenzlauer Berg hatte am vergangenen Wochenende Spuren hinterlassen: zerstörte Beete, herumliegender Müll, erboster Anwohner. Die Polizei wurde gerufen, die Feier aufgelöst.

Was folgte, war ungewohnt: Ohne Aufforderung durch Schulleitung oder Eltern organisierten die betroffenen Klassen selbst eine Wiedergutmachungsaktion. Rund sechzig Schülerinnen und Schüler erschienen am Samstag mit Arbeitshandschuhen, beseitigten die Schäden und führten Gespräche mit Parkbesuchern. Einige hatten selbstgeschriebene Entschuldigungskarten mitgebracht.

Der Vorfall wirft ein interessantes Licht auf eine Generation, der häufig vorgeworfen wird, kein Gefühl für Gemeinschaft zu haben. Die Reaktion der Abiturienten deutet auf das Gegenteil hin: Sie haben einen Fehler gemacht – und ihn auf eine Weise korrigiert, die über das Minimum hinausging.'
),
(
  (select id from texts where slug = 'abiturienten-feiern-party-und-raeumen-danach-auf'),
  'C1',
  'Der Vorfall am Berliner Planetarium hat in den sozialen Medien mehr Aufmerksamkeit erhalten als erwartet – und das liegt nicht an der Party, sondern an der Reaktion auf sie. Dass eine Gruppe junger Menschen, ohne institutionellen Druck, eigenständig eine Wiedergutmachungsaktion organisiert und dabei öffentliche Gespräche mit den Betroffenen gesucht hat, ist in einer Zeit, in der die Diskussion über das Wertebewusstsein der jungen Generation oft von Pauschalurteilen geprägt ist, bemerkenswert.

Aus entwicklungspsychologischer Perspektive ist das Ereignis lehrreich. Moralisches Handeln entsteht selten durch Belehrung – es entsteht durch Erfahrung, durch das Erleben von Konsequenzen und durch die Entscheidung, Verantwortung zu übernehmen, auch wenn niemand zuschaut. Genau das haben die Abiturienten demonstriert. Ihre Reaktion war nicht perfekt und kam nicht ohne Anlass – aber sie war echt.

Der Schulleiter sagte in einem Interview mit dem Tagesspiegel, er sei stolz, aber nicht überrascht: Seine Schülerinnen und Schüler hätten in den Jahren zuvor gelernt, dass Fehler zum Leben gehören – und dass der Umgang mit ihnen mehr über einen Menschen aussagt als die Fehler selbst.

Das klingt banal. Es ist es nicht.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 4: Viele junge Deutsche wollen ins Ausland
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Viele junge Deutsche wollen ins Ausland',
  null,
  'premium',
  now(),
  'viele-junge-deutsche-wollen-ins-ausland'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'viele-junge-deutsche-wollen-ins-ausland'),
  'A2',
  'Eine neue Studie zeigt: Viele junge Menschen in Deutschland wollen in ein anderes Land ziehen. 41 von 100 jungen Menschen denken darüber nach.

Warum wollen sie weg? Es gibt zu wenige günstige Wohnungen. Die Jobs sind oft unsicher. Und viele fühlen sich von der Politik nicht gehört.

Aber viele junge Menschen bleiben auch in Deutschland. Sie lieben ihre Familie, ihre Freunde und ihre Heimat. Das Ausland ist ein Traum – aber nicht für alle.'
),
(
  (select id from texts where slug = 'viele-junge-deutsche-wollen-ins-ausland'),
  'B1',
  'Laut der neuen Jugendstudie 2026 kann sich jeder Fünfte junge Deutsche konkret vorstellen, Deutschland dauerhaft zu verlassen. 41 Prozent schließen es zumindest nicht aus. Das sind die höchsten Werte seit Beginn der Erhebung.

Die Gründe sind vielfältig. Viele nennen die hohen Wohnkosten, vor allem in Großstädten. Andere sehen im Ausland bessere Berufsmöglichkeiten oder ein angenehmeres Lebensgefühl. Beliebt sind Ziele wie Kanada, die Niederlande, Portugal und skandinavische Länder.

Experten warnen vor einem Brain Drain: Wenn gut ausgebildete junge Menschen Deutschland verlassen, fehlen sie später als Fachkräfte. Die Politik müsse dringend die Lebensbedingungen für junge Menschen verbessern – besonders beim Wohnen und bei der politischen Beteiligung.'
),
(
  (select id from texts where slug = 'viele-junge-deutsche-wollen-ins-ausland'),
  'B2',
  'Die Zahl ist politisch brisant: 41 Prozent der 14- bis 29-Jährigen in Deutschland können sich laut Jugendstudie 2026 vorstellen, künftig im Ausland zu leben. Noch alarmierender ist, dass jeder Fünfte dies konkret plant. Im Vergleich zu 2020 ist die Auswanderungsbereitschaft um mehr als 15 Prozentpunkte gestiegen.

Die Motive sind vielschichtig. An erster Stelle steht die Wohnungsfrage: In Metropolen wie München, Frankfurt und Berlin ist bezahlbarer Wohnraum für junge Erwachsene kaum verfügbar. Hinzu kommen unsichere Berufsaussichten in sich wandelnden Branchen und das Gefühl, in einem Land zu leben, das Probleme benennt, aber nicht löst.

Ökonomen warnen vor den langfristigen Folgen. Deutschland ist bereits heute vom Fachkräftemangel geprägt – eine zusätzliche Emigrationswelle unter gut ausgebildeten Jungen würde die Situation weiter verschlechtern. Die Antwort kann nicht Appell sein, sondern muss strukturpolitisch sein: Wohnungsbau, Lohnentwicklung und echte politische Partizipation.'
),
(
  (select id from texts where slug = 'viele-junge-deutsche-wollen-ins-ausland'),
  'C1',
  'Wenn 41 Prozent einer Alterskohorte ernsthaft über das Verlassen ihres Landes nachdenken, ist das kein individuelles Phänomen mehr – es ist eine gesellschaftliche Diagnose. Die Daten der Jugendstudie 2026 legen nahe, dass ein erheblicher Teil der jüngeren Generation das implizite Versprechen des deutschen Gesellschaftsvertrags – wer arbeitet und sich einbringt, wird am Wohlstand teilhaben – als gekündigt betrachtet.

Die Ursachen sind strukturell und akkumuliert. Die Wohnungskrise trifft junge Erwachsene überproportional, weil sie selten von Erbschaften profitieren können und auf dem Mietmarkt den härtesten Bedingungen ausgesetzt sind. Der Arbeitsmarkt bietet zwar Beschäftigung, aber zunehmend in projektförmigen, befristeten oder plattformvermittelten Verhältnissen, die Planungssicherheit erschweren. Hinzu kommt eine generationale Ungleichheit in der politischen Repräsentation: Unter-30-Jährige sind in Parlamenten und Führungspositionen chronisch unterrepräsentiert.

Die Emigrationsbereitschaft ist insofern kein Zeichen von Globalität oder Mobilitätsfreude, sondern rationaler Kalkül: Wer jung und qualifiziert ist, hat Optionen. Und wer Optionen hat, vergleicht.

Die eigentliche Frage ist, ob Deutschland bereit ist, die Bedingungen zu schaffen, unter denen junge Menschen nicht abwägen müssen, ob sie bleiben wollen – sondern es einfach wollen.'
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
    'abebben',
    'verb',
    'menguar, remitir',
    'Dass 41 Prozent der 14- bis 29-Jährigen ernsthaft über Auswanderung nachdenken, ist nicht primär ein Zeichen individueller Unzufriedenheit, sondern ein Indikator für kollektive Erfahrungen: Wohnungsnot, Jobmarktprekarität, politische Exklusion und die Kumulation von Krisenwahrnehmungen, die seit der Pandemie nicht mehr abgeebbt ist.',
    'C1',
    null,
    null,
    'abebben',
    null,
    null,
    null,
    null
  ),
  (
    'abwägen',
    'verb',
    'sopesar, ponderar',
    'Die eigentliche Frage ist, ob Deutschland bereit ist, die Bedingungen zu schaffen, unter denen junge Menschen nicht abwägen müssen, ob sie bleiben wollen – sondern es einfach wollen.',
    'C1',
    null,
    null,
    'abwägen',
    null,
    null,
    null,
    null
  ),
  (
    'akkumuliert',
    'adjective',
    'acumulado',
    'Die Ursachen sind strukturell und akkumuliert.',
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
    'angeben',
    'verb',
    'indicar, declarar',
    'Unter den 2.012 befragten 14- bis 29-Jährigen gibt jeder Dritte an, psychologische Unterstützung zu benötigen – ein historischer Höchstwert.',
    'B2',
    null,
    null,
    'angeben',
    null,
    null,
    null,
    null
  ),
  (
    'apathisch',
    'adjective',
    'apático',
    'Bildungsforscherin Nina Kolleck von der Universität Potsdam sieht die Ergebnisse als politischen Weckruf: Junge Menschen seien nicht apathisch, sondern enttäuscht.',
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
    'auf etwas hindeuten',
    'verb',
    'apuntar a algo, indicar',
    'Die Reaktion der Abiturienten deutet auf das Gegenteil hin: Sie haben einen Fehler gemacht – und ihn auf eine Weise korrigiert, die über das Minimum hinausging.',
    'B2',
    null,
    null,
    'auf etwas hindeuten',
    null,
    null,
    null,
    null
  ),
  (
    'auffallend',
    'adjective',
    'llamativo, destacable',
    'Besonders auffallend: 41 Prozent der Befragten können sich vorstellen, künftig lieber in einem anderen Land zu leben.',
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
    'auflösen',
    'verb',
    'disolver, dispersar',
    'Die Polizei wurde gerufen, die Feier aufgelöst.',
    'B2',
    null,
    null,
    'auflösen',
    null,
    null,
    null,
    null
  ),
  (
    'aufräumen',
    'verb',
    'recoger, ordenar',
    'Am folgenden Samstag kamen Dutzende Schülerinnen und Schüler mit Handschuhen und Müllbeuteln in den Park, räumten auf und entschuldigten sich bei Parkbesuchern.',
    'B1',
    null,
    null,
    'aufräumen',
    null,
    null,
    null,
    null
  ),
  (
    'aufschlussreich',
    'adjective',
    'revelador, esclarecedor',
    'Besonders aufschlussreich ist der Befund zur psychischen Gesundheit.',
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
    'banal',
    'adjective',
    'banal, trivial',
    'Das klingt banal.',
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
    'befragen',
    'verb',
    'encuestar, entrevistar',
    'Rund 2.000 junge Menschen zwischen 14 und 29 Jahren wurden befragt.',
    'B1',
    null,
    null,
    'befragen',
    null,
    null,
    null,
    null
  ),
  (
    'befristet',
    'adjective',
    'temporal, de duración limitada',
    'Der Arbeitsmarkt bietet zwar Beschäftigung, aber zunehmend in projektförmigen, befristeten oder plattformvermittelten Verhältnissen, die Planungssicherheit erschweren.',
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
    'belegen',
    'verb',
    'demostrar, constatar',
    'Die Daten belegen eher das Gegenteil – ein hohes Problembewusstsein, verbunden mit tiefer Skepsis gegenüber der Fähigkeit politischer Institutionen, diese Probleme zu lösen.',
    'C1',
    null,
    null,
    'belegen',
    null,
    null,
    null,
    null
  ),
  (
    'bemerkenswert',
    'adjective',
    'notable, digno de atención',
    'Besonders bemerkenswert ist die gestiegene Auswanderungsbereitschaft.',
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
    'beschattet',
    'adjective',
    'en sombra permanente',
    'Der südliche Pol ist wissenschaftlich besonders interessant: Dort vermuten Forscher große Mengen Wassereis in dauerhaft beschatteten Kratern.',
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
    'beseitigen',
    'verb',
    'eliminar, reparar',
    'Rund sechzig Schülerinnen und Schüler erschienen am Samstag mit Arbeitshandschuhen, beseitigten die Schäden und führten Gespräche mit Parkbesuchern.',
    'B2',
    null,
    null,
    'beseitigen',
    null,
    null,
    null,
    null
  ),
  (
    'besorgniserregend',
    'adjective',
    'preocupante, alarmante',
    'Die neue Trendstudie „Jugend in Deutschland 2026 – Zukunft unter Druck" zeichnet ein besorgniserregendes Bild.',
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
    'beteiligt sein',
    'adjective',
    'estar involucrado, participar',
    'Auch Europa ist beteiligt: Das Servicemodul des Orion-Raumschiffs wurde von der Europäischen Raumfahrtagentur ESA entwickelt.',
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
    'brisant',
    'adjective',
    'explosivo, políticamente delicado',
    'Die Zahl ist politisch brisant: 41 Prozent der 14- bis 29-Jährigen in Deutschland können sich laut Jugendstudie 2026 vorstellen, künftig im Ausland zu leben.',
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
    'darüber nachdenken',
    'verb',
    'plantearse algo, pensar en ello',
    '41 Prozent der 14- bis 29-Jährigen denken darüber nach, Deutschland zu verlassen.',
    'A2',
    null,
    null,
    'darüber nachdenken',
    null,
    null,
    null,
    null
  ),
  (
    'das Ausland',
    'noun',
    'el extranjero',
    'Das Ausland ist ein Traum – aber nicht für alle.',
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
    'das Beet',
    'noun',
    'el arriate, el parterre',
    'Die Abiturienten-Party am Planetarium in Prenzlauer Berg hatte am vergangenen Wochenende Spuren hinterlassen: zerstörte Beete, herumliegender Müll, erboster Anwohner.',
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
    'das Defizit',
    'noun',
    'el déficit, la carencia',
    'Eine eigenständige europäische Mondstrategie fehlt bis heute – ein Defizit, das angesichts des wachsenden kommerziellen Weltraummarkts zunehmend ins Gewicht fällt.',
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
    'das Ergebnis',
    'noun',
    'el resultado',
    'Das sind die Ergebnisse der Jugendstudie 2026.',
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
    'das Lebensgefühl',
    'noun',
    'la sensación de bienestar, la calidad de vida percibida',
    'Andere sehen im Ausland bessere Berufsmöglichkeiten oder ein angenehmeres Lebensgefühl.',
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
    'das Lehrstück',
    'noun',
    'la lección ejemplar',
    'Was als klassische Nachbarschaftsbeschwerde begann, wurde zu einem kleinen Lehrstück über Verantwortung und Gemeinschaft.',
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
    'das Pauschalurteil',
    'noun',
    'el juicio generalizado, el estereotipo',
    'Dass eine Gruppe junger Menschen, ohne institutionellen Druck, eigenständig eine Wiedergutmachungsaktion organisiert und dabei öffentliche Gespräche mit den Betroffenen gesucht hat, ist in einer Zeit, in der die Diskussion über das Wertebewusstsein der jungen Generation oft von Pauschalurteilen geprägt ist, bemerkenswert.',
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
    'das Planetarium',
    'noun',
    'el planetario',
    'Die Party war am Planetarium in Prenzlauer Berg.',
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
    'das Prestigeprojekt',
    'noun',
    'el proyecto de prestigio',
    'Das Artemis-Programm der NASA ist mehr als ein Prestigeprojekt – es ist die Grundlage für die langfristige Erforschung des Sonnensystems.',
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
    'das Problembewusstsein',
    'noun',
    'la conciencia del problema',
    'Die Daten belegen eher das Gegenteil – ein hohes Problembewusstsein, verbunden mit tiefer Skepsis gegenüber der Fähigkeit politischer Institutionen, diese Probleme zu lösen.',
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
    'das Programm',
    'noun',
    'el programa',
    'Die NASA hat ein neues Programm.',
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
    'das Raumschiff',
    'noun',
    'la nave espacial',
    'Die Astronauten leben im Raumschiff Orion.',
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
    'das Servicemodul',
    'noun',
    'el módulo de servicio',
    'Auch Europa ist beteiligt: Das Servicemodul des Orion-Raumschiffs wurde von der Europäischen Raumfahrtagentur ESA entwickelt.',
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
    'das Signal',
    'noun',
    'la señal',
    'Das ist ein wichtiges Signal für die Politik.',
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
    'das Sonnensystem',
    'noun',
    'el sistema solar',
    'Das Artemis-Programm der NASA ist mehr als ein Prestigeprojekt – es ist die Grundlage für die langfristige Erforschung des Sonnensystems.',
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
    'das Sprungbrett',
    'noun',
    'el trampolín',
    'Das Ziel ist eine dauerhafte menschliche Präsenz auf dem Mond als Sprungbrett für Marsflüge in den 2040er Jahren.',
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
    'das Vertrauen',
    'noun',
    'la confianza',
    'Die Gesellschaft müsse der jungen Generation mehr Vertrauen schenken – sonst drohe eine dauerhafte politische Entfremdung.',
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
    'das Wertebewusstsein',
    'noun',
    'la conciencia de los valores',
    'Dass eine Gruppe junger Menschen, ohne institutionellen Druck, eigenständig eine Wiedergutmachungsaktion organisiert und dabei öffentliche Gespräche mit den Betroffenen gesucht hat, ist in einer Zeit, in der die Diskussion über das Wertebewusstsein der jungen Generation oft von Pauschalurteilen geprägt ist, bemerkenswert.',
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
    'das Ziel',
    'noun',
    'el objetivo',
    'Das Ziel ist: Menschen sollen wieder zum Mond fliegen.',
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
    'dauerhaft',
    'adjective',
    'permanente, duradera',
    'Die Gesellschaft müsse der jungen Generation mehr Vertrauen schenken – sonst drohe eine dauerhafte politische Entfremdung.',
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
    'dauern',
    'verb',
    'durar',
    'Die Reise zum Mond dauert mehrere Tage.',
    'A2',
    null,
    null,
    'dauern',
    null,
    null,
    null,
    null
  ),
  (
    'der Alltag',
    'noun',
    'el día a día, la cotidianidad',
    'Das Ergebnis: Psychischer Stress, finanzielle Sorgen und Zweifel an der Zukunft prägen den Alltag vieler Jugendlicher.',
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
    'der Anwohner',
    'noun',
    'el vecino del barrio',
    'Anwohner riefen die Polizei.',
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
    'der Appell',
    'noun',
    'la apelación, el llamamiento',
    'Die Antwort kann nicht Appell sein, sondern muss strukturpolitisch sein: Wohnungsbau, Lohnentwicklung und echte politische Partizipation.',
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
    'der Astronaut',
    'noun',
    'el astronauta',
    'Die Astronauten leben im Raumschiff Orion.',
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
    'der Befund',
    'noun',
    'el hallazgo, el resultado',
    'Die neunte Ausgabe der Trendstudie „Jugend in Deutschland" liefert alarmante Befunde.',
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
    'der Brain Drain',
    'noun',
    'la fuga de cerebros',
    'Experten warnen vor einem Brain Drain: Wenn gut ausgebildete junge Menschen Deutschland verlassen, fehlen sie später als Fachkräfte.',
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
    'der Fachkräftemangel',
    'noun',
    'la escasez de mano de obra cualificada',
    'Deutschland ist bereits heute vom Fachkräftemangel geprägt – eine zusätzliche Emigrationswelle unter gut ausgebildeten Jungen würde die Situation weiter verschlechtern.',
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
    'der Fehler',
    'noun',
    'el error',
    'Er sagte: Das war ein Fehler – aber die Reaktion war richtig.',
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
    'der Fortschritt',
    'noun',
    'el avance, el progreso',
    'Das Artemis-Programm der NASA macht Fortschritte.',
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
    'der Gesellschaftsvertrag',
    'noun',
    'el contrato social',
    'Die Daten der Jugendstudie 2026 legen nahe, dass ein erheblicher Teil der jüngeren Generation das implizite Versprechen des deutschen Gesellschaftsvertrags – wer arbeitet und sich einbringt, wird am Wohlstand teilhaben – als gekündigt betrachtet.',
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
    'der Höchstwert',
    'noun',
    'el valor máximo, el récord',
    'Unter den 2.012 befragten 14- bis 29-Jährigen gibt jeder Dritte an, psychologische Unterstützung zu benötigen – ein historischer Höchstwert.',
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
    'der Jugendforscher',
    'noun',
    'el investigador sobre juventud',
    'Jugendforscher Klaus Hurrelmann von der Hertie School Berlin fordert mehr Beteiligung junger Menschen in der Politik.',
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
    'der Kalkül',
    'noun',
    'el cálculo racional',
    'Die Emigrationsbereitschaft ist insofern kein Zeichen von Globalität oder Mobilitätsfreude, sondern rationaler Kalkül: Wer jung und qualifiziert ist, hat Optionen.',
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
    'der Krieg',
    'noun',
    'la guerra',
    'Die größten Sorgen sind: Krieg, Wohnungspreise und die Wirtschaft.',
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
    'der Lärm',
    'noun',
    'el ruido, el escándalo',
    'Sie haben viel Lärm gemacht und Müll hinterlassen.',
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
    'der Mars',
    'noun',
    'Marte',
    'Vielleicht fliegt eines Tages ein Mensch auch zum Mars.',
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
    'der Meilenstein',
    'noun',
    'el hito',
    'Das Artemis-Programm der NASA ist, je nach Perspektive, ein wissenschaftlicher Meilenstein, ein geopolitisches Statement oder ein Geschäftsmodell – und in Wirklichkeit ist es alle drei gleichzeitig.',
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
    'der Mond',
    'noun',
    'la Luna',
    'Das Ziel ist: Menschen sollen wieder zum Mond fliegen.',
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
    'der Müll',
    'noun',
    'la basura',
    'Sie haben viel Lärm gemacht und Müll hinterlassen.',
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
    'der Müllbeutel',
    'noun',
    'la bolsa de basura',
    'Am folgenden Samstag kamen Dutzende Schülerinnen und Schüler mit Handschuhen und Müllbeuteln in den Park, räumten auf und entschuldigten sich bei Parkbesuchern.',
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
    'der Nahe Osten',
    'noun',
    'Oriente Próximo',
    'Die Hauptsorgen der Befragten: Kriege in Europa und Nahost (62 Prozent), teure Wohnungen (58 Prozent) und wirtschaftliche Unsicherheit.',
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
    'der Rekord',
    'noun',
    'el récord',
    'Das ist ein Rekord.',
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
    'der Schaden',
    'noun',
    'el daño, el desperfecto',
    'Mehrere hundert Schülerinnen und Schüler feierten bis in die Nacht – laut, mit viel Müll und Schäden an Pflanzen und Bänken im Park.',
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
    'der Schulleiter',
    'noun',
    'el director del colegio',
    'Der Schulleiter war stolz auf seine Schüler.',
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
    'der Stimmungsbericht',
    'noun',
    'el informe de opinión',
    'Die Trendstudie „Jugend in Deutschland 2026" ist kein bloßer Stimmungsbericht – sie ist eine Strukturdiagnose.',
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
    'der Testflug',
    'noun',
    'el vuelo de prueba',
    'Nach mehreren Testflügen soll in den nächsten Monaten erstmals wieder ein Mensch die Mondoberfläche betreten – zum ersten Mal seit der Apollo-17-Mission im Jahr 1972.',
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
    'der Traum',
    'noun',
    'el sueño',
    'Das ist der Traum der NASA.',
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
    'der Treibstoff',
    'noun',
    'el combustible',
    'Wasser ist nicht nur zum Trinken wichtig – es könnte auch als Treibstoff für künftige Missionen dienen.',
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
    'der Umgang mit etwas',
    'noun',
    'la manera de gestionar algo',
    'Der Schulleiter sagte in einem Interview mit dem Tagesspiegel, er sei stolz, aber nicht überrascht: Seine Schülerinnen und Schüler hätten in den Jahren zuvor gelernt, dass Fehler zum Leben gehören – und dass der Umgang mit ihnen mehr über einen Menschen aussagt als die Fehler selbst.',
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
    'der Vorfall',
    'noun',
    'el incidente',
    'Der Vorfall wirft ein interessantes Licht auf eine Generation, der häufig vorgeworfen wird, kein Gefühl für Gemeinschaft zu haben.',
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
    'der Weckruf',
    'noun',
    'el toque de atención, la llamada de alerta',
    'Bildungsforscherin Nina Kolleck von der Universität Potsdam sieht die Ergebnisse als politischen Weckruf: Junge Menschen seien nicht apathisch, sondern enttäuscht.',
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
    'der Wohnraum',
    'noun',
    'el espacio habitable, la vivienda',
    'An erster Stelle steht die Wohnungsfrage: In Metropolen wie München, Frankfurt und Berlin ist bezahlbarer Wohnraum für junge Erwachsene kaum verfügbar.',
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
    'der Wohnungspreis',
    'noun',
    'el precio de la vivienda',
    'Die größten Sorgen sind: Krieg, Wohnungspreise und die Wirtschaft.',
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
    'der Zweifel',
    'noun',
    'la duda',
    'Das Ergebnis: Psychischer Stress, finanzielle Sorgen und Zweifel an der Zukunft prägen den Alltag vieler Jugendlicher.',
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
    'der/die Abiturient/in',
    'adjective',
    'el/la estudiante que acaba de hacer la selectividad',
    'In Berlin haben Abiturientinnen und Abiturienten eine Party gefeiert.',
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
    'der/die Jugendliche',
    'adjective',
    'el/la joven',
    'Viele Kinder und Jugendliche finden das Programm spannend.',
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
    'die Abiturfeier',
    'noun',
    'la fiesta del bachillerato',
    'Am vergangenen Wochenende eskalierte eine Abiturfeier am Planetarium in Berlin-Prenzlauer Berg.',
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
    'die Alterskohorte',
    'noun',
    'la cohorte de edad, la franja generacional',
    'Wenn 41 Prozent einer Alterskohorte ernsthaft über das Verlassen ihres Landes nachdenken, ist das kein individuelles Phänomen mehr – es ist eine gesellschaftliche Diagnose.',
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
    'die Angst',
    'noun',
    'el miedo',
    'Sie haben Angst vor der Zukunft.',
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
    'die Aufforderung',
    'noun',
    'el requerimiento, la petición',
    'Was folgte, war ungewohnt: Ohne Aufforderung durch Schulleitung oder Eltern organisierten die betroffenen Klassen selbst eine Wiedergutmachungsaktion.',
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
    'die Aufmerksamkeit',
    'noun',
    'la atención',
    'Was danach passierte, sorgte für positive Aufmerksamkeit: Die Klassen organisierten eigenständig eine Wiedergutmachungsaktion.',
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
    'die Ausgabe',
    'noun',
    'la edición',
    'Die neunte Ausgabe der Trendstudie „Jugend in Deutschland" liefert alarmante Befunde.',
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
    'die Auswanderungsbereitschaft',
    'noun',
    'la disposición a emigrar',
    'Besonders bemerkenswert ist die gestiegene Auswanderungsbereitschaft.',
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
    'die Befragten',
    'noun',
    'los encuestados',
    'Besonders auffallend: 41 Prozent der Befragten können sich vorstellen, künftig lieber in einem anderen Land zu leben.',
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
    'die Belehrung',
    'noun',
    'el adoctrinamiento, la enseñanza impuesta',
    'Moralisches Handeln entsteht selten durch Belehrung – es entsteht durch Erfahrung, durch das Erleben von Konsequenzen und durch die Entscheidung, Verantwortung zu übernehmen, auch wenn niemand zuschaut.',
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
    'die Bereitschaft',
    'noun',
    'la disposición, la voluntad',
    'Aber die Bereitschaft zur Wiedergutmachung zeigt, dass diese Jugendlichen gelernt haben, Verantwortung zu übernehmen.',
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
    'die Berufsaussichten',
    'noun',
    'las perspectivas profesionales',
    'Hinzu kommen unsichere Berufsaussichten in sich wandelnden Branchen und das Gefühl, in einem Land zu leben, das Probleme benennt, aber nicht löst.',
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
    'die Berufsmöglichkeit',
    'noun',
    'las oportunidades profesionales',
    'Andere sehen im Ausland bessere Berufsmöglichkeiten oder ein angenehmeres Lebensgefühl.',
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
    'die Besatzung',
    'noun',
    'la tripulación',
    'Nach dem erfolgreichen unbemannten Artemis-I-Flug 2022 und dem Umflug mit Besatzung bei Artemis II soll die Mission Artemis III erstmals seit über 50 Jahren wieder Menschen auf dem Mond landen lassen, diesmal in der Nähe des südlichen Pols.',
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
    'die Beteiligung',
    'noun',
    'la participación',
    'Jugendforscher Klaus Hurrelmann von der Hertie School Berlin fordert mehr Beteiligung junger Menschen in der Politik.',
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
    'die Bildungsforscherin',
    'noun',
    'la investigadora en educación',
    'Bildungsforscherin Nina Kolleck von der Universität Potsdam sieht die Ergebnisse als politischen Weckruf: Junge Menschen seien nicht apathisch, sondern enttäuscht.',
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
    'die Branche',
    'noun',
    'el sector, la industria',
    'Hinzu kommen unsichere Berufsaussichten in sich wandelnden Branchen und das Gefühl, in einem Land zu leben, das Probleme benennt, aber nicht löst.',
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
    'die Emigrationswelle',
    'noun',
    'la ola migratoria',
    'Deutschland ist bereits heute vom Fachkräftemangel geprägt – eine zusätzliche Emigrationswelle unter gut ausgebildeten Jungen würde die Situation weiter verschlechtern.',
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
    'die Entfremdung',
    'noun',
    'el distanciamiento, la alienación',
    'Die Gesellschaft müsse der jungen Generation mehr Vertrauen schenken – sonst drohe eine dauerhafte politische Entfremdung.',
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
    'die Entschuldigungskarte',
    'noun',
    'la tarjeta de disculpa',
    'Einige hatten selbstgeschriebene Entschuldigungskarten mitgebracht.',
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
    'die Erbschaft',
    'noun',
    'la herencia',
    'Die Wohnungskrise trifft junge Erwachsene überproportional, weil sie selten von Erbschaften profitieren können und auf dem Mietmarkt den härtesten Bedingungen ausgesetzt sind.',
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
    'die Erforschung',
    'noun',
    'la exploración, la investigación',
    'Für viele junge Menschen ist Artemis ein Zeichen, dass die Erforschung des Weltraums weitergeht – und dass der Mars als nächstes Ziel näher rückt.',
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
    'die Erhebung',
    'noun',
    'el sondeo, la encuesta estadística',
    'Das sind die höchsten Werte seit Beginn der Erhebung.',
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
    'die Exklusion',
    'noun',
    'la exclusión',
    'Dass 41 Prozent der 14- bis 29-Jährigen ernsthaft über Auswanderung nachdenken, ist nicht primär ein Zeichen individueller Unzufriedenheit, sondern ein Indikator für kollektive Erfahrungen: Wohnungsnot, Jobmarktprekarität, politische Exklusion und die Kumulation von Krisenwahrnehmungen, die seit der Pandemie nicht mehr abgeebbt ist.',
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
    'die Fachkraft',
    'noun',
    'el profesional cualificado',
    'Experten warnen vor einem Brain Drain: Wenn gut ausgebildete junge Menschen Deutschland verlassen, fehlen sie später als Fachkräfte.',
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
    'die Fehldiagnose',
    'noun',
    'el diagnóstico erróneo',
    'Was die Studie auch zeigt: Die vielzitierte politische Apathie junger Menschen ist eine Fehldiagnose.',
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
    'die Gemeinschaft',
    'noun',
    'la comunidad',
    'Was als klassische Nachbarschaftsbeschwerde begann, wurde zu einem kleinen Lehrstück über Verantwortung und Gemeinschaft.',
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
    'die Gleichgültigkeit',
    'noun',
    'la indiferencia',
    'Das ist keine Gleichgültigkeit, sondern rational begründete Entfremdung.',
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
    'die Grundlage',
    'noun',
    'la base, el fundamento',
    'Das Artemis-Programm der NASA ist mehr als ein Prestigeprojekt – es ist die Grundlage für die langfristige Erforschung des Sonnensystems.',
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
    'die Heimat',
    'noun',
    'la patria, el lugar de origen',
    'Sie lieben ihre Familie, ihre Freunde und ihre Heimat.',
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
    'die Hilfe',
    'noun',
    'la ayuda',
    '30 Prozent der jungen Menschen brauchen psychologische Hilfe.',
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
    'die Jobmarktprekarität',
    'noun',
    'la precariedad del mercado laboral',
    'Dass 41 Prozent der 14- bis 29-Jährigen ernsthaft über Auswanderung nachdenken, ist nicht primär ein Zeichen individueller Unzufriedenheit, sondern ein Indikator für kollektive Erfahrungen: Wohnungsnot, Jobmarktprekarität, politische Exklusion und die Kumulation von Krisenwahrnehmungen, die seit der Pandemie nicht mehr abgeebbt ist.',
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
    'die Jobperspektive',
    'noun',
    'las perspectivas laborales',
    'Als Gründe werden vor allem die Wohnungsnot, unsichere Jobperspektiven und das allgemeine politische Klima genannt.',
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
    'die Jugendstudie',
    'noun',
    'el estudio sobre la juventud',
    'Das sind die Ergebnisse der Jugendstudie 2026.',
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
    'die Konstellation',
    'noun',
    'la constelación, la configuración',
    'Die Rückkehr zum Mond nach über fünfzig Jahren ist nicht bloß eine Frage technischer Leistungsfähigkeit, sondern Ausdruck einer veränderten geopolitischen Konstellation, in der die USA, China und zunehmend auch Europa um Einfluss im erdnahen Weltraum konkurrieren.',
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
    'die Kumulation',
    'noun',
    'la acumulación',
    'Dass 41 Prozent der 14- bis 29-Jährigen ernsthaft über Auswanderung nachdenken, ist nicht primär ein Zeichen individueller Unzufriedenheit, sondern ein Indikator für kollektive Erfahrungen: Wohnungsnot, Jobmarktprekarität, politische Exklusion und die Kumulation von Krisenwahrnehmungen, die seit der Pandemie nicht mehr abgeebbt ist.',
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
    'die Lebensbedingungen',
    'noun',
    'las condiciones de vida',
    'Die Politik müsse dringend die Lebensbedingungen für junge Menschen verbessern – besonders beim Wohnen und bei der politischen Beteiligung.',
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
    'die Leistungsfähigkeit',
    'noun',
    'la capacidad de rendimiento',
    'Die Rückkehr zum Mond nach über fünfzig Jahren ist nicht bloß eine Frage technischer Leistungsfähigkeit, sondern Ausdruck einer veränderten geopolitischen Konstellation, in der die USA, China und zunehmend auch Europa um Einfluss im erdnahen Weltraum konkurrieren.',
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
    'die Mondoberfläche',
    'noun',
    'la superficie lunar',
    'Nach mehreren Testflügen soll in den nächsten Monaten erstmals wieder ein Mensch die Mondoberfläche betreten – zum ersten Mal seit der Apollo-17-Mission im Jahr 1972.',
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
    'die Nachbarschaftsbeschwerde',
    'noun',
    'la queja vecinal',
    'Was als klassische Nachbarschaftsbeschwerde begann, wurde zu einem kleinen Lehrstück über Verantwortung und Gemeinschaft.',
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
    'die Partizipation',
    'noun',
    'la participación',
    'Die Antwort kann nicht Appell sein, sondern muss strukturpolitisch sein: Wohnungsbau, Lohnentwicklung und echte politische Partizipation.',
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
    'die Planungssicherheit',
    'noun',
    'la seguridad a largo plazo, la capacidad de planificar el futuro',
    'Der Arbeitsmarkt bietet zwar Beschäftigung, aber zunehmend in projektförmigen, befristeten oder plattformvermittelten Verhältnissen, die Planungssicherheit erschweren.',
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
    'die Politik',
    'noun',
    'la política',
    'Das ist ein wichtiges Signal für die Politik.',
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
    'die Rakete',
    'noun',
    'el cohete',
    'Die Rakete ist sehr groß und stark.',
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
    'die Raumfahrtagentur',
    'noun',
    'la agencia espacial',
    'Auch Europa ist beteiligt: Das Servicemodul des Orion-Raumschiffs wurde von der Europäischen Raumfahrtagentur ESA entwickelt.',
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
    'die Raumstation',
    'noun',
    'la estación espacial',
    'Zusätzlich ist eine kleine Raumstation namens Gateway in der Mondumgebung geplant.',
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
    'die Reaktion',
    'noun',
    'la reacción',
    'Er sagte: Das war ein Fehler – aber die Reaktion war richtig.',
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
    'die Reise',
    'noun',
    'el viaje',
    'Die Reise zum Mond dauert mehrere Tage.',
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
    'die Resonanz',
    'noun',
    'la resonancia, el eco',
    'Für eine Generation junger Menschen, die mit dem Internet aufgewachsen ist, hat Artemis eine besondere Resonanz: Es ist das erste große kollektive Zukunftsprojekt, das ihnen nicht als Problemlösung präsentiert wird, sondern als Horizont.',
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
    'die Schlüsselkomponente',
    'noun',
    'el componente clave',
    'Für Deutschland ist das Artemis-Programm auch industriepolitisch relevant: Deutsche Unternehmen wie Airbus Defence and Space liefern Schlüsselkomponenten und profitieren vom wachsenden Weltraummarkt.',
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
    'die Sorge',
    'noun',
    'la preocupación',
    'Die größten Sorgen sind: Krieg, Wohnungspreise und die Wirtschaft.',
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
    'die Strukturdiagnose',
    'noun',
    'el diagnóstico estructural',
    'Die Trendstudie „Jugend in Deutschland 2026" ist kein bloßer Stimmungsbericht – sie ist eine Strukturdiagnose.',
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
    'die Studie',
    'noun',
    'el estudio',
    'Eine neue Studie zeigt: Viele junge Menschen in Deutschland sind sehr gestresst.',
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
    'die Symbolpolitik',
    'noun',
    'la política de gestos vacíos',
    'Wer sie zurückgewinnen wolle, müsse echte Beteiligungsformen schaffen – keine Symbolpolitik.',
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
    'die Trendstudie',
    'noun',
    'el estudio de tendencias',
    'Die neue Trendstudie „Jugend in Deutschland 2026 – Zukunft unter Druck" zeichnet ein besorgniserregendes Bild.',
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
    'die Unsicherheit',
    'noun',
    'la incertidumbre',
    'Die Hauptsorgen der Befragten: Kriege in Europa und Nahost (62 Prozent), teure Wohnungen (58 Prozent) und wirtschaftliche Unsicherheit.',
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
    'die Verantwortung',
    'noun',
    'la responsabilidad',
    'Die Jugendlichen haben Verantwortung übernommen.',
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
    'die Verhältnisse',
    'noun',
    'las condiciones, la situación estructural',
    'Eine Gesellschaft, die 41 Prozent ihrer jüngsten Generation als potenzielle Emigranten verliert, sollte weniger fragen, was mit der Jugend nicht stimmt – und mehr, was mit den Verhältnissen nicht stimmt.',
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
    'die Versorgungskapazität',
    'noun',
    'la capacidad de atención sanitaria',
    '30 Prozent der Befragten geben an, psychologische Unterstützung zu benötigen – ein Wert, der die Versorgungskapazitäten des deutschen Gesundheitssystems strukturell in Frage stellt.',
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
    'die Weltraumabitionen',
    'noun',
    'las ambiciones espaciales',
    'Für Washington ist Artemis damit auch eine Antwort auf Pekings Weltraumambitionen – und auf die Frage, wer die Regeln für die Nutzung lunarer Ressourcen wie Wassereis und Helium-3 setzen wird.',
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
    'die Wiedergutmachungsaktion',
    'noun',
    'la acción de reparación del daño',
    'Was danach passierte, sorgte für positive Aufmerksamkeit: Die Klassen organisierten eigenständig eine Wiedergutmachungsaktion.',
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
    'die Wirtschaft',
    'noun',
    'la economía',
    'Die größten Sorgen sind: Krieg, Wohnungspreise und die Wirtschaft.',
    'A2',
    'die',
    null,
    null,
    'Das ist ein gutes Zeichen für die Wirtschaft.',
    null,
    null,
    null
  ),
  (
    'die Wohnkosten',
    'noun',
    'los costes de la vivienda',
    'Viele nennen die hohen Wohnkosten, vor allem in Großstädten.',
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
    'die Wohnungsnot',
    'noun',
    'la escasez de vivienda',
    'Als Gründe werden vor allem die Wohnungsnot, unsichere Jobperspektiven und das allgemeine politische Klima genannt.',
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
    'die Zukunft',
    'noun',
    'el futuro',
    'Sie haben Angst vor der Zukunft.',
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
    'drohen',
    'verb',
    'amenazar',
    'Die Gesellschaft müsse der jungen Generation mehr Vertrauen schenken – sonst drohe eine dauerhafte politische Entfremdung.',
    'B1',
    null,
    null,
    'drohen',
    null,
    null,
    null,
    null
  ),
  (
    'eigenständig',
    'adjective',
    'de forma autónoma, por iniciativa propia',
    'Was danach passierte, sorgte für positive Aufmerksamkeit: Die Klassen organisierten eigenständig eine Wiedergutmachungsaktion.',
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
    'eingebunden sein',
    'adjective',
    'estar integrado, implicado',
    'Die europäische Raumfahrtagentur ESA ist über das Servicemodul des Orion-Raumschiffs tief in das Programm eingebunden.',
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
    'enttäuscht',
    'adjective',
    'decepcionado',
    'Bildungsforscherin Nina Kolleck von der Universität Potsdam sieht die Ergebnisse als politischen Weckruf: Junge Menschen seien nicht apathisch, sondern enttäuscht.',
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
    'entwicklungspsychologisch',
    'adjective',
    'desde la perspectiva de la psicología evolutiva',
    'Aus entwicklungspsychologischer Perspektive ist das Ereignis lehrreich.',
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
    'erbost',
    'adjective',
    'indignado, irritado',
    'Die Abiturienten-Party am Planetarium in Prenzlauer Berg hatte am vergangenen Wochenende Spuren hinterlassen: zerstörte Beete, herumliegender Müll, erboster Anwohner.',
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
    'erscheinen',
    'verb',
    'aparecer, presentarse',
    'Rund sechzig Schülerinnen und Schüler erschienen am Samstag mit Arbeitshandschuhen, beseitigten die Schäden und führten Gespräche mit Parkbesuchern.',
    'B2',
    null,
    null,
    'erscheinen',
    null,
    null,
    null,
    null
  ),
  (
    'eskalieren',
    'verb',
    'escalar, desbordarse',
    'Am vergangenen Wochenende eskalierte eine Abiturfeier am Planetarium in Berlin-Prenzlauer Berg.',
    'B1',
    null,
    null,
    'eskalieren',
    null,
    null,
    null,
    null
  ),
  (
    'etwas nicht ausschließen',
    'verb',
    'no descartar algo',
    '41 Prozent schließen es zumindest nicht aus.',
    'B1',
    null,
    null,
    'etwas nicht ausschließen',
    null,
    null,
    null,
    null
  ),
  (
    'fordern',
    'verb',
    'exigir, reclamar',
    'Jugendforscher Klaus Hurrelmann von der Hertie School Berlin fordert mehr Beteiligung junger Menschen in der Politik.',
    'B1',
    null,
    null,
    'fordern',
    null,
    null,
    null,
    null
  ),
  (
    'gehört werden',
    'verb',
    'ser escuchado',
    'Als Hauptmotiv wird neben der Wohnungsnot auch das Gefühl genannt, in Deutschland politisch nicht gehört zu werden.',
    'B2',
    null,
    null,
    'gehört werden',
    null,
    null,
    null,
    null
  ),
  (
    'gestresst',
    'adjective',
    'estresado',
    'Eine neue Studie zeigt: Viele junge Menschen in Deutschland sind sehr gestresst.',
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
    'gut ausgebildet',
    'adjective',
    'bien formado, altamente cualificado',
    'Experten warnen vor einem Brain Drain: Wenn gut ausgebildete junge Menschen Deutschland verlassen, fehlen sie später als Fachkräfte.',
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
    'günstig',
    'adjective',
    'asequible, barato',
    'Es gibt zu wenige günstige Wohnungen.',
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
    'hinterlassen',
    'verb',
    'dejar atrás',
    'Sie haben viel Lärm gemacht und Müll hinterlassen.',
    'A2',
    null,
    null,
    'hinterlassen',
    null,
    null,
    null,
    null
  ),
  (
    'industriepolitisch',
    'adjective',
    'en términos de política industrial',
    'Für Deutschland ist das Artemis-Programm auch industriepolitisch relevant: Deutsche Unternehmen wie Airbus Defence and Space liefern Schlüsselkomponenten und profitieren vom wachsenden Weltraummarkt.',
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
    'ins Gewicht fallen',
    'verb',
    'cobrar peso, tener importancia',
    'Eine eigenständige europäische Mondstrategie fehlt bis heute – ein Defizit, das angesichts des wachsenden kommerziellen Weltraummarkts zunehmend ins Gewicht fällt.',
    'C1',
    null,
    null,
    'ins Gewicht fallen',
    null,
    null,
    null,
    null
  ),
  (
    'jemandem etwas vorwerfen',
    'verb',
    'reprochar algo a alguien',
    'Der Vorfall wirft ein interessantes Licht auf eine Generation, der häufig vorgeworfen wird, kein Gefühl für Gemeinschaft zu haben.',
    'B2',
    null,
    null,
    'jemandem etwas vorwerfen',
    null,
    null,
    null,
    null
  ),
  (
    'komplex',
    'adjective',
    'complejo',
    'Das Programm ist technisch sehr komplex.',
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
    'kündigen',
    'verb',
    'rescindir, dar por terminado',
    'Die Daten der Jugendstudie 2026 legen nahe, dass ein erheblicher Teil der jüngeren Generation das implizite Versprechen des deutschen Gesellschaftsvertrags – wer arbeitet und sich einbringt, wird am Wohlstand teilhaben – als gekündigt betrachtet.',
    'C1',
    null,
    null,
    'kündigen',
    null,
    null,
    null,
    null
  ),
  (
    'künftig',
    'adjective',
    'en el futuro, a partir de ahora',
    'Besonders auffallend: 41 Prozent der Befragten können sich vorstellen, künftig lieber in einem anderen Land zu leben.',
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
    'landen',
    'verb',
    'aterrizar',
    'Besonders historisch: Diesmal soll auch eine Frau auf dem Mond landen.',
    'B1',
    null,
    null,
    'landen',
    null,
    null,
    null,
    null
  ),
  (
    'leistungsstark',
    'adjective',
    'potente, de gran rendimiento',
    'Die Rakete SLS ist die leistungsstärkste, die die NASA je gebaut hat.',
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
    'liefern',
    'verb',
    'aportar, entregar',
    'Die neunte Ausgabe der Trendstudie „Jugend in Deutschland" liefert alarmante Befunde.',
    'B2',
    null,
    null,
    'liefern',
    null,
    null,
    null,
    null
  ),
  (
    'lunare Ressourcen',
    'verb',
    'los recursos lunares',
    'Für Washington ist Artemis damit auch eine Antwort auf Pekings Weltraumambitionen – und auf die Frage, wer die Regeln für die Nutzung lunarer Ressourcen wie Wassereis und Helium-3 setzen wird.',
    'C1',
    null,
    null,
    'lunare Ressourcen',
    null,
    null,
    null,
    null
  ),
  (
    'nahelegen',
    'verb',
    'sugerir, apuntar a',
    'Die Daten der Jugendstudie 2026 legen nahe, dass ein erheblicher Teil der jüngeren Generation das implizite Versprechen des deutschen Gesellschaftsvertrags – wer arbeitet und sich einbringt, wird am Wohlstand teilhaben – als gekündigt betrachtet.',
    'C1',
    null,
    null,
    'nahelegen',
    null,
    null,
    null,
    null
  ),
  (
    'näher rücken',
    'verb',
    'acercarse',
    'Für viele junge Menschen ist Artemis ein Zeichen, dass die Erforschung des Weltraums weitergeht – und dass der Mars als nächstes Ziel näher rückt.',
    'B1',
    null,
    null,
    'näher rücken',
    null,
    null,
    null,
    null
  ),
  (
    'programmatisch',
    'adjective',
    'programático, de definición estratégica',
    'Europa liefert Technologie, hat aber kaum Einfluss auf programmatische Entscheidungen.',
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
    'prägen',
    'verb',
    'marcar, caracterizar',
    'Das Ergebnis: Psychischer Stress, finanzielle Sorgen und Zweifel an der Zukunft prägen den Alltag vieler Jugendlicher.',
    'B1',
    null,
    null,
    'prägen',
    null,
    null,
    null,
    null
  ),
  (
    'psychologisch',
    'adjective',
    'psicológico',
    '30 Prozent der jungen Menschen brauchen psychologische Hilfe.',
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
    'sauber machen',
    'verb',
    'limpiar',
    'Und sie haben den Park sauber gemacht.',
    'A2',
    null,
    null,
    'sauber machen',
    null,
    null,
    null,
    null
  ),
  (
    'sich entschuldigen',
    'verb',
    'disculparse',
    'Sie haben sich entschuldigt.',
    'A2',
    null,
    null,
    'sich entschuldigen',
    null,
    null,
    null,
    null
  ),
  (
    'sich vorstellen',
    'verb',
    'imaginarse, plantearse',
    'Besonders auffallend: 41 Prozent der Befragten können sich vorstellen, künftig lieber in einem anderen Land zu leben.',
    'B1',
    null,
    null,
    'sich vorstellen',
    null,
    null,
    null,
    null
  ),
  (
    'spannend',
    'adjective',
    'emocionante, apasionante',
    'Viele Kinder und Jugendliche finden das Programm spannend.',
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
    'stolz',
    'adjective',
    'orgulloso',
    'Der Schulleiter war stolz auf seine Schüler.',
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
    'strukturpolitisch',
    'adjective',
    'de política estructural',
    'Die Antwort kann nicht Appell sein, sondern muss strukturpolitisch sein: Wohnungsbau, Lohnentwicklung und echte politische Partizipation.',
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
    'transportieren',
    'verb',
    'transportar',
    'Das Raumschiff Orion kann vier Astronautinnen und Astronauten transportieren.',
    'B1',
    null,
    null,
    'transportieren',
    null,
    null,
    null,
    null
  ),
  (
    'unbemannt',
    'adjective',
    'no tripulado',
    'Nach dem erfolgreichen unbemannten Artemis-I-Flug 2022 und dem Umflug mit Besatzung bei Artemis II soll die Mission Artemis III erstmals seit über 50 Jahren wieder Menschen auf dem Mond landen lassen, diesmal in der Nähe des südlichen Pols.',
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
    'ungewohnt',
    'adjective',
    'inusual, poco habitual',
    'Was folgte, war ungewohnt: Ohne Aufforderung durch Schulleitung oder Eltern organisierten die betroffenen Klassen selbst eine Wiedergutmachungsaktion.',
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
    'unsicher',
    'adjective',
    'inseguro, inestable',
    'Die Jobs sind oft unsicher.',
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
    'unterrepräsentiert',
    'adjective',
    'subrepresentado',
    'Hinzu kommt eine generationale Ungleichheit in der politischen Repräsentation: Unter-30-Jährige sind in Parlamenten und Führungspositionen chronisch unterrepräsentiert.',
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
    'verfügbar',
    'adjective',
    'disponible',
    'An erster Stelle steht die Wohnungsfrage: In Metropolen wie München, Frankfurt und Berlin ist bezahlbarer Wohnraum für junge Erwachsene kaum verfügbar.',
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
    'verlassen',
    'verb',
    'abandonar, marcharse de',
    '41 Prozent der 14- bis 29-Jährigen denken darüber nach, Deutschland zu verlassen.',
    'A2',
    null,
    null,
    'verlassen',
    null,
    null,
    null,
    null
  ),
  (
    'vermuten',
    'verb',
    'suponer, sospechar',
    'Der südliche Pol ist wissenschaftlich besonders interessant: Dort vermuten Forscher große Mengen Wassereis in dauerhaft beschatteten Kratern.',
    'B2',
    null,
    null,
    'vermuten',
    null,
    null,
    null,
    null
  ),
  (
    'vielfältig',
    'adjective',
    'variado, múltiple',
    'Die Gründe sind vielfältig.',
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
    'vielschichtig',
    'adjective',
    'complejo, de múltiples capas',
    'Die Motive sind vielschichtig.',
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
    'vielzitiert',
    'adjective',
    'muy citado, repetidamente mencionado',
    'Was die Studie auch zeigt: Die vielzitierte politische Apathie junger Menschen ist eine Fehldiagnose.',
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
    'zeichnen',
    'verb',
    'trazar, dibujar',
    'Die neue Trendstudie „Jugend in Deutschland 2026 – Zukunft unter Druck" zeichnet ein besorgniserregendes Bild.',
    'B1',
    null,
    null,
    'zeichnen',
    null,
    null,
    null,
    null
  ),
  (
    'ziehen',
    'verb',
    'mudarse, trasladarse',
    'Eine neue Studie zeigt: Viele junge Menschen in Deutschland wollen in ein anderes Land ziehen.',
    'A2',
    null,
    null,
    'ziehen',
    null,
    null,
    null,
    null
  ),
  (
    'zurückgewinnen',
    'verb',
    'recuperar',
    'Wer sie zurückgewinnen wolle, müsse echte Beteiligungsformen schaffen – keine Symbolpolitik.',
    'B2',
    null,
    null,
    'zurückgewinnen',
    null,
    null,
    null,
    null
  ),
  (
    'zuschauen',
    'verb',
    'observar, mirar',
    'Moralisches Handeln entsteht selten durch Belehrung – es entsteht durch Erfahrung, durch das Erleben von Konsequenzen und durch die Entscheidung, Verantwortung zu übernehmen, auch wenn niemand zuschaut.',
    'C1',
    null,
    null,
    'zuschauen',
    null,
    null,
    null,
    null
  ),
  (
    'über das Minimum hinausgehen',
    'verb',
    'ir más allá del mínimo',
    'Die Reaktion der Abiturienten deutet auf das Gegenteil hin: Sie haben einen Fehler gemacht – und ihn auf eine Weise korrigiert, die über das Minimum hinausging.',
    'B2',
    null,
    null,
    'über das Minimum hinausgehen',
    null,
    null,
    null,
    null
  ),
  (
    'übernehmen',
    'verb',
    'asumir',
    'Die Jugendlichen haben Verantwortung übernommen.',
    'A2',
    null,
    null,
    'übernehmen',
    null,
    null,
    null,
    null
  ),
  (
    'überproportional',
    'adjective',
    'de forma desproporcionada',
    'Die Wohnungskrise trifft junge Erwachsene überproportional, weil sie selten von Erbschaften profitieren können und auf dem Mietmarkt den härtesten Bedingungen ausgesetzt sind.',
    'C1',
    null,
    null,
    null,
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
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Studie'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'gestresst'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Angst'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Zukunft'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'das Ergebnis'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Jugendstudie'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'psychologisch'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Hilfe'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'der Rekord'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Sorge'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'der Krieg'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'der Wohnungspreis'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Wirtschaft'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'darüber nachdenken'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'verlassen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'das Signal'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'A2',
    'die Politik'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'die Trendstudie'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'zeichnen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'besorgniserregend'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'befragen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'der Zweifel'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'prägen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'der Alltag'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'auffallend'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'die Befragten'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'sich vorstellen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'künftig'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'die Wohnungsnot'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'die Jobperspektive'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'der Jugendforscher'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'fordern'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'die Beteiligung'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'das Vertrauen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'drohen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'dauerhaft'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B1',
    'die Entfremdung'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'die Ausgabe'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'liefern'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'der Befund'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'angeben'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'der Höchstwert'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'der Nahe Osten'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'die Unsicherheit'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'bemerkenswert'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'die Auswanderungsbereitschaft'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'gehört werden'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'die Bildungsforscherin'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'der Weckruf'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'apathisch'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'enttäuscht'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'zurückgewinnen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'B2',
    'die Symbolpolitik'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'der Stimmungsbericht'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Strukturdiagnose'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Jobmarktprekarität'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Exklusion'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Kumulation'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'abebben'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'aufschlussreich'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Versorgungskapazität'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'vielzitiert'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Fehldiagnose'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'belegen'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'das Problembewusstsein'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Gleichgültigkeit'
  ),
  (
    'jugendstudie-viele-junge-menschen-sind-gestresst',
    'C1',
    'die Verhältnisse'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'das Programm'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'das Ziel'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'der Mond'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'die Rakete'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'der Astronaut'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'das Raumschiff'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'die Reise'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'dauern'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'der/die Jugendliche'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'spannend'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'der Mars'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'A2',
    'der Traum'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'der Fortschritt'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'der Testflug'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'die Mondoberfläche'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'landen'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'komplex'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'leistungsstark'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'transportieren'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'die Raumstation'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'beteiligt sein'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'das Servicemodul'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'die Raumfahrtagentur'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'die Erforschung'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B1',
    'näher rücken'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'das Prestigeprojekt'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'die Grundlage'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'das Sonnensystem'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'unbemannt'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'die Besatzung'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'vermuten'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'beschattet'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'der Treibstoff'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'das Sprungbrett'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'eingebunden sein'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'industriepolitisch'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'B2',
    'die Schlüsselkomponente'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'der Meilenstein'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'die Leistungsfähigkeit'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'die Konstellation'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'die Weltraumabitionen'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'lunare Ressourcen'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'programmatisch'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'das Defizit'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'ins Gewicht fallen'
  ),
  (
    'artemis-menschen-wollen-wieder-zum-mond-fliegen',
    'C1',
    'die Resonanz'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'der/die Abiturient/in'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'das Planetarium'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'der Lärm'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'der Müll'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'hinterlassen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'sich entschuldigen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'sauber machen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'der Schulleiter'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'stolz'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'der Fehler'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'die Reaktion'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'die Verantwortung'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'A2',
    'übernehmen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'eskalieren'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'die Abiturfeier'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'der Schaden'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'der Anwohner'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'die Aufmerksamkeit'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'eigenständig'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'die Wiedergutmachungsaktion'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'der Müllbeutel'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'aufräumen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B1',
    'die Bereitschaft'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'die Nachbarschaftsbeschwerde'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'das Lehrstück'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'die Gemeinschaft'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'das Beet'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'erbost'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'auflösen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'ungewohnt'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'die Aufforderung'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'erscheinen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'beseitigen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'die Entschuldigungskarte'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'der Vorfall'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'jemandem etwas vorwerfen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'auf etwas hindeuten'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'B2',
    'über das Minimum hinausgehen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'das Wertebewusstsein'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'das Pauschalurteil'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'entwicklungspsychologisch'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'die Belehrung'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'zuschauen'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'der Umgang mit etwas'
  ),
  (
    'abiturienten-feiern-party-und-raeumen-danach-auf',
    'C1',
    'banal'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'A2',
    'ziehen'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'A2',
    'günstig'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'A2',
    'unsicher'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'A2',
    'gehört werden'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'A2',
    'die Heimat'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'A2',
    'das Ausland'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'etwas nicht ausschließen'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'die Erhebung'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'vielfältig'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'die Wohnkosten'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'die Berufsmöglichkeit'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'das Lebensgefühl'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'der Brain Drain'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'gut ausgebildet'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'die Fachkraft'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B1',
    'die Lebensbedingungen'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'brisant'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'die Auswanderungsbereitschaft'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'vielschichtig'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'der Wohnraum'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'verfügbar'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'die Berufsaussichten'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'die Branche'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'der Fachkräftemangel'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'die Emigrationswelle'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'der Appell'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'strukturpolitisch'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'B2',
    'die Partizipation'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'die Alterskohorte'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'nahelegen'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'der Gesellschaftsvertrag'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'kündigen'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'akkumuliert'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'überproportional'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'die Erbschaft'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'befristet'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'die Planungssicherheit'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'unterrepräsentiert'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'der Kalkül'
  ),
  (
    'viele-junge-deutsche-wollen-ins-ausland',
    'C1',
    'abwägen'
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

