-- ============================================================
-- Seed generated from structured TXT
-- Source: /Users/sam/Documents/imKontext/backend/anadir_a_supabase/imKontext RegionaleNachrichten April2026.txt
-- Tables: texts, text_versions, vocabulario, text_version_vocabulary
-- ============================================================

-- Theme 1: Das Abitur 2026 beginnt
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Das Abitur 2026 beginnt',
  null,
  'premium',
  now(),
  'das-abitur-2026-beginnt'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'das-abitur-2026-beginnt'),
  'A2',
  'In Deutschland schreiben viele Schülerinnen und Schüler ab dem 16. April ihre Abiturprüfungen. Das Abitur ist sehr wichtig. Es ist die letzte Prüfung in der Schule.

Die Prüfungen sind für alle Schüler gleich schwer. Es gibt Prüfungen in Deutsch, Mathematik und Englisch. Die Schüler müssen viel lernen.

Nach dem Abitur können die Schüler zur Universität gehen oder einen Beruf lernen. Viele Familien feiern das Abitur. Es ist ein großer Tag für die Familie.'
),
(
  (select id from texts where slug = 'das-abitur-2026-beginnt'),
  'B1',
  'Am Donnerstag, dem 16. April, beginnen in Nordrhein-Westfalen die Abiturprüfungen 2026. Mehr als 90.000 Schülerinnen und Schüler nehmen in diesem Jahr am Abitur teil. Die erste Prüfung ist in Deutsch.

In diesem Jahr gibt es eine wichtige Änderung: Erstmals dürfen Schüler in manchen Fächern digitale Hilfsmittel benutzen, aber keine KI-Programme. Das Ministerium will so die digitalen Kompetenzen der Schüler fördern, ohne dass Maschinen die Arbeit übernehmen.

Viele Schülerinnen und Schüler sind nervos, aber auch stolz. Die Schulen haben in den letzten Wochen intensive Vorbereitungskurse angeboten. Lehrerinnen und Lehrer empfehlen: genügend schlafen, gut essen und keine Panik.'
),
(
  (select id from texts where slug = 'das-abitur-2026-beginnt'),
  'B2',
  'Mit dem 16. April startet in Nordrhein-Westfalen die Abiturphase 2026. Rund 92.000 Abiturientinnen und Abiturienten treten zu den Prüfungen an – so viele wie seit fünf Jahren nicht mehr. Bildungsexperten führen den Anstieg auf stärkere Geburtsjahrgänge und eine gestiegene Bildungsbeteiligung zurück.

Neu in diesem Jahr ist die begrenzte Zulassung digitaler Endgeräte in ausgewählten Fächern. Erlaubt sind etwa Tabellenkalkulationsprogramme in Mathematik und Wirtschaft, verboten bleibt hingegen jede Form von KI-gestützter Textgenerierung. Das Schulministerium betont, dass Eigenleistung und kritisches Denken weiterhin im Mittelpunkt stehen.

Kritiker bemonsieren jedoch, dass die Regelungen uneinheitlich und für Schüler schwer nachzuvollziehen sind. Lehrerverbände fordern eine klarere bundesweite Linie, da die föderale Struktur des deutschen Bildungssystems zu erheblichen Unterschieden zwischen den Bundesländern führt.'
),
(
  (select id from texts where slug = 'das-abitur-2026-beginnt'),
  'C1',
  'Mit dem Beginn der Abiturprüfungen 2026 in Nordrhein-Westfalen steht das deutsche Bildungssystem einmal mehr vor der Frage, wie es den Spagat zwischen tradiertem Leistungsanspruch und der Realität einer durchdigitalisierten Gesellschaft bewältigen soll. Die vorsichtige Zulassung digitaler Hilfsmittel in einzelnen Fächern ist ein tastender Schritt – mehr Experiment als Reform.

Das strukturelle Dilemma ist bekannt: Während Schülerinnen und Schüler im Alltag selbstverständlich mit KI-Werkzeugen arbeiten, müssen sie im Prüfungsraum so tun, als existierten diese nicht. Die Legitimation des Abiturs als Befähigungsnachweis für Universität und Beruf setzt voraus, dass die gemessenen Kompetenzen auch gesellschaftlich relevant sind – eine Voraussetzung, die zunehmend in Frage gestellt wird.

Bildungsforscher plädieren seit Jahren für eine Neudefinition von Prüfungskompetenzen: Nicht die fehlerfreie Reproduktion von Wissen, sondern die Fähigkeit zur kritischen Einordnung, Quellenprüfung und kreativen Problemlösung sollte im Vordergrund stehen. Ob die Politik bereit ist, das Abitur grundlegend neu zu denken, bleibt angesichts der föderalen Zersplitterung und des politischen Konservativismus im Bildungsbereich fraglich.

Das Abitur 2026 ist damit nicht nur eine Prüfung für Schülerinnen und Schüler, sondern auch ein Test für das System selbst.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 2: Frauenfußball beim FC St. Pauli hat Probleme
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Frauenfußball beim FC St. Pauli hat Probleme',
  null,
  'premium',
  now(),
  'frauenfussball-beim-fc-st-pauli-hat-probleme'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'frauenfussball-beim-fc-st-pauli-hat-probleme'),
  'A2',
  'Der FC St. Pauli ist ein bekannter Fußballverein in Hamburg. Er ist bekannt für seine besonderen Werte: Gleichheit und Solidarität. Aber die Frauenmannschaft hat große Probleme.

Es gibt nicht genug Trainingsplätze für die Frauen. Auch das Geld ist ein Problem. Die Männermannschaft bekommt viel mehr Geld als die Frauenmannschaft.

Viele Fans sind traurig. Sie fragen: Kann ein Verein wie St. Pauli so ungerecht sein? Der Verein muss jetzt eine Lösung finden.'
),
(
  (select id from texts where slug = 'frauenfussball-beim-fc-st-pauli-hat-probleme'),
  'B1',
  'Der FC St. Pauli gilt als einer der progressivsten Vereine Deutschlands. Antirassismus, Feminismus und Solidarität gehören zum offiziellen Selbstverständnis des Hamburger Klubs. Doch die Realität der Frauenfußballabteilung sieht anders aus.

Die Frauenmannschaft trainiert auf schlechten Plätzen und hat kaum Budget. Gleichzeitig boomt der Frauenfußball in Deutschland: Die Nationalmannschaft erreicht immer mehr Fans, und die Bundesliga zieht mehr Zuschauer an. St. Pauli scheint diesen Trend zu verschlafen.

Fans und Spielerinnen fordern mehr Investitionen und bessere Bedingungen. Der Verein hat angekündigt, die Situation zu verbessern – aber konkrete Pläne gibt es noch nicht. Für viele ist das ein Widerspruch zu den Werten, die St. Pauli nach außen kommuniziert.'
),
(
  (select id from texts where slug = 'frauenfussball-beim-fc-st-pauli-hat-probleme'),
  'B2',
  'Der FC St. Pauli inszeniert sich seit Jahrzehnten als Gegenentwurf zum kommerzialisierten Profisport: basisdemokratisch, feministisch, antifaschistisch. Umso auffälliger ist der Kontrast zur Lage der vereinseigenen Frauenfußballabteilung, die trotz des Booms im deutschen Frauenfußball mit veralteter Infrastruktur, knappem Budget und mangelnder öffentlicher Aufmerksamkeit kämpft.

Dabei wäre das Potenzial vorhanden: Der Verein hat eine treue und engagierte Fangemeinde, die für progressive Werte einsteht. Doch zwischen Bekenntnissen und strukturellen Investitionen klafft eine Lücke, die auch im deutschen Frauenfußball insgesamt zu beobachten ist. Selbst in der Frauen-Bundesliga erhalten die Spielerinnen im Schnitt weniger als ein Zehntel der Gehälter ihrer männlichen Kollegen.

Kritikerinnen werfen dem Verein vor, Feminismus als Marketinginstrument zu nutzen, ohne die entsprechenden Ressourcen bereitzustellen. Die Vereinsführung räumt Handlungsbedarf ein, verweist jedoch auf begrenzte finanzielle Spielräume. Eine glaubwürdige Antwort steht noch aus.'
),
(
  (select id from texts where slug = 'frauenfussball-beim-fc-st-pauli-hat-probleme'),
  'C1',
  'Der FC St. Pauli ist ein Sonderfall im deutschen Fußball – und das nicht nur wegen der Totenkopf-Fahnen auf den Rängen. Der Klub hat sich über Jahrzehnte ein Image aufgebaut, das politische Haltung und Vereinsidentität untrennbar miteinander verknüpft. Antikapitalismus, Queerfreundlichkeit und Geschlechtergleichstellung sind keine bloßen Marketingversprechen, sondern Teil einer lebendigen Fankultur.

Genau deshalb wiegt die strukturelle Benachteiligung der Frauenfußballabteilung besonders schwer. Während der Verein öffentlichkeitswirksam für Gleichstellung eintritt, trainiert die Frauenmannschaft auf Plätzen, die internationalen Standards nicht genügen, und verfügt über ein Budget, das mit dem der Männerabteilung nicht annähernd vergleichbar ist. Dieser Widerspruch ist kein Zufall – er ist das Ergebnis jahrelanger Priorisierungsentscheidungen.

Die Debatte bei St. Pauli steht stellvertretend für eine gesamtgesellschaftliche Frage: Wie viel kostet strukturelle Gleichstellung tatsächlich, und wer ist bereit, den Preis zu zahlen? Der Boom des Frauenfußballs in Deutschland – sichtbar gemacht durch stetig wachsende Zuschauerzahlen und mediale Präsenz – bietet eine Chance zur Neujustierung. Ob sie ergriffen wird, wird sich nicht an Bekenntnissen messen lassen, sondern an Haushaltsposten.

Für den FC St. Pauli ist das mehr als eine sportpolitische Frage. Es ist eine Frage der Glaubwürdigkeit.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 3: Neue Regeln für die Rente in Deutschland
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Neue Regeln für die Rente in Deutschland',
  null,
  'premium',
  now(),
  'neue-regeln-fuer-die-rente-in-deutschland'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'neue-regeln-fuer-die-rente-in-deutschland'),
  'A2',
  'In Deutschland gibt es ab 2026 neue Regeln für die Rente. Wer viel verdient, bekommt nicht mehr Rente. Das ist das Gesetz.

Die Rente ist Geld für alte Menschen. Man bekommt Rente, wenn man nicht mehr arbeitet. Je mehr man gearbeitet hat, desto mehr Rente bekommt man – aber nur bis zu einem Limit.

Viele Menschen in Deutschland haben Angst vor der Rente. Sie fragen: Habe ich genug Geld im Alter? Die Regierung sagt: Das System ist stabil. Aber viele Menschen glauben das nicht.'
),
(
  (select id from texts where slug = 'neue-regeln-fuer-die-rente-in-deutschland'),
  'B1',
  'Ab 2026 gelten in Deutschland neue Rentenwerte. Der aktuelle Rentenwert steigt leicht an – das bedeutet, dass Rentnerinnen und Rentner etwas mehr Geld bekommen. Gleichzeitig gibt es aber eine klare Grenze: Wer ein bestimmtes Einkommen überschreitet, bekommt nicht mehr Rente.

Das Rentensystem in Deutschland ist kompliziert. Jeder, der arbeitet, zahlt jeden Monat einen Teil seines Gehalts in die Rentenkasse. Später bekommt man dieses Geld zurück – aber die Höhe hängt von vielen Faktoren ab: wie lange man gearbeitet hat, wie viel man verdient hat und wann man in Rente geht.

Experten warnen, dass das System langfristig Probleme haben wird. Es gibt immer mehr alte Menschen und immer weniger junge Arbeitnehmer. Die Bundesregierung diskutiert verschiedene Reformen, aber eine Lösung ist noch nicht in Sicht.'
),
(
  (select id from texts where slug = 'neue-regeln-fuer-die-rente-in-deutschland'),
  'B2',
  'Mit dem 1. Juli 2026 steigen die Rentenbezüge um 3,74 Prozent – eine Erhöhung, die angesichts der zuletzt zurückgegangenen Inflationsrate als real spürbar gilt. Gleichzeitig tritt eine neue Einkommensgrenze in Kraft: Wer über dem sogenannten Rentenhochstbetrag verdient, erhält keine zusätzlichen Rentenanwürche mehr – ein Mechanismus, der politisch umstritten ist.

Im Zentrum der Debatte steht die demografische Schieflage: Deutschland altert schnell. Der Anteil der über 67-Jährigen an der Gesamtbevölkerung wird bis 2040 auf rund 23 Prozent steigen. Gleichzeitig schrumpft die Zahl der Beitragszahler. Das umlagefinanzierte Rentensystem gerät damit strukturell unter Druck.

Die Bundesregierung hat ein Rentenpaket angekündigt, das unter anderem eine kapitalgedeckte Komponente einführen soll. Kritiker bezweifeln jedoch, ob die Fondslösung sozial gerecht ausgestaltet werden kann und ob sie rechtzeitig greift, um die absehbare Finanzierungslücke zu schließen.'
),
(
  (select id from texts where slug = 'neue-regeln-fuer-die-rente-in-deutschland'),
  'C1',
  'Die jährliche Rentenanpassung ist in Deutschland ein politisches Ritual: Die Zahl wird verkündet, die Opposition kritisiert sie als zu gering, die Regierung lobt sie als Zeichen der Stabilität, und die tatsächlichen Probleme des Systems bleiben unangetastet. Die Erhöhung um 3,74 Prozent zum 1. Juli 2026 folgt diesem Muster.

Die strukturelle Herausforderung ist seit Jahrzehnten bekannt: Das Umlageverfahren, bei dem die Beiträge der Erwerbstätigen direkt zur Finanzierung der laufenden Renten verwendet werden, setzt eine ausgewogene Altersstruktur voraus. Diese existiert in Deutschland längst nicht mehr. Die Altenquote – das Verhältnis von Rentnern zu Beitragszahlern – verschlechtert sich jährlich, ohne dass politische Reformen mit der demografischen Realität Schritt halten.

Das angekündigte Generationenkapital, eine staatlich verwaltete Fondslösung nach skandinavischem Vorbild, ist konzeptionell nicht ungünstig – allerdings zu spät und zu klein dimensioniert, um die absehbare Finanzierungslücke in den 2030er Jahren zu schließen. Hinzu kommt das Verteilungsproblem: Eine kapitalgedeckte Komponente begünstigt systematisch diejenigen, die ohnehin über private Ersparnisse verfügen.

Was das Rentensystem braucht, ist kein weiteres Anpassungspaket, sondern eine ehrliche gesellschaftliche Debatte über Lebensarbeitszeit, Einwanderung als demografische Ressource und die Frage, was Solidarität zwischen den Generationen im 21. Jahrhundert bedeutet.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 4: Brand in einem Krankenhaus in Aachen
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Brand in einem Krankenhaus in Aachen',
  null,
  'premium',
  now(),
  'brand-in-einem-krankenhaus-in-aachen'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'brand-in-einem-krankenhaus-in-aachen'),
  'A2',
  'Am Dienstag hat es in einem Krankenhaus in Aachen gebrannt. Das Krankenhaus heißt Alexianer. Die Feuerwehr ist schnell gekommen.

Das Feuer war groß. Aber die Patienten waren in Sicherheit. Die Krankenschwestern und Krankenpfleger haben gute Arbeit gemacht. Niemand ist gestorben.

Die Feuerwehr hat das Feuer gelöscht. Danach hat die Polizei untersucht, warum das Feuer begonnen hat. Das Krankenhaus muss jetzt repariert werden.'
),
(
  (select id from texts where slug = 'brand-in-einem-krankenhaus-in-aachen'),
  'B1',
  'Am Dienstagvormittag ist in der psychiatrischen Klinik Alexianer in Aachen ein Feuer ausgebrochen. Die Feuerwehr rückte mit einem Großaufgebot aus: Mehr als 80 Einsatzkräfte waren vor Ort. Das Feuer konnte nach rund zwei Stunden gelöscht werden.

Dank des schnellen Handelns des Pflegepersonals konnten alle Patientinnen und Patienten rechtzeitig evakuiert werden. Niemand wurde ernsthaft verletzt. Aachener Zeitung-Redakteur Kian Tabatabaei, der vor Ort war, berichtete von einer ruhigen und professionellen Evakuierung.

Die Brandursache ist noch nicht abschließend geklärt. Die Polizei hat Ermittlungen aufgenommen. Der betroffene Gebäudeflügel bleibt bis auf Weiteres gesperrt. Die Klinikleitung hat den Einsatzkräften für ihr schnelles Handeln gedankt.'
),
(
  (select id from texts where slug = 'brand-in-einem-krankenhaus-in-aachen'),
  'B2',
  'Ein Großbrand in der psychiatrischen Fachklinik Alexianer hat am Dienstagvormittag in Aachen einen Großeinsatz der Feuerwehr ausgelöst. Rund 85 Einsatzkräfte rückten an, nachdem gegen 10:30 Uhr Rauch aus dem Nordflügel des Gebäudes gemeldet worden war. Das Feuer konnte nach etwa zwei Stunden unter Kontrolle gebracht werden.

Besonders heikel war die Situation wegen der Patientenstruktur: In der psychiatrischen Klinik befinden sich Menschen, die auf Orientierung und Begleitung angewiesen sind. Die Evakuierung verlief dennoch geordnet. Das Personal hatte zuvor regelmäßig Brandschutzübungen absolviert – ein Umstand, dem Feuerwehrsprecher Thomas Hensel ausdrücklich Bedeutung beigemass.

Der Sachschaden wird auf mehrere hunderttausend Euro geschätzt. Die Brandursache ist noch Gegenstand der Ermittlungen; Brandstiftung wird nicht ausgeschlossen. Der betroffene Trakt bleibt bis zur Freigabe durch die Baubehörde geschlossen, die Patienten wurden in anderen Bereichen der Klinik untergebracht.'
),
(
  (select id from texts where slug = 'brand-in-einem-krankenhaus-in-aachen'),
  'C1',
  'Der Großbrand in der Aachener Alexianer-Klinik am Dienstag ist glimpflich ausgegangen – dank einer schnellen Feuerwehr, gut geschultem Personal und offenbar funktionierender Evakuierungspläne. Doch der Einsatz wirft Fragen auf, die über den konkreten Einzelfall hinausgehen: Wie gut sind psychiatrische Einrichtungen in Deutschland für Brandschutzszenarien aufgestellt?

Die Antwort ist keine eindeutige. Während große Kliniken wie die Alexianer regelmäßige Brandschutzübungen nachweisen können, fehlen kleineren psychiatrischen Einrichtungen und Pflegeheimen häufig die personellen Ressourcen für eine systematische Notfallvorbereitung. Das ist strukturell problematisch, denn gerade in der Psychiatrie stellt die Evakuierung eine besondere Herausforderung dar: Patienten können desorientiert, medikamentenbedingt reaktionsverzögert oder in akuten Krisen sein.

Die Ermittlungen zur Brandursache dauern an. Brandstiftung ist nicht ausgeschlossen – ein Hinweis auf eine weitere Vulnerabilität psychiatrischer Einrichtungen, die in der Öffentlichkeit selten thematisiert wird: die Sicherheit nach innen. Spannungsfelder zwischen Therapiefreiheit und Schutzpflicht, zwischen offener Stationsführung und Sicherheitserfordernissen sind in der Psychiatrie strukturell angelegt.

Der Brand in Aachen hat niemanden das Leben gekostet. Er sollte dennoch Anlass sein, Brandschutz in sensiblen Einrichtungen nicht als selbstverständlich vorauszusetzen.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 5: El Niño: Was ist das und was bedeutet es für Europa?
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'El Niño: Was ist das und was bedeutet es für Europa?',
  null,
  'premium',
  now(),
  'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa'),
  'A2',
  'El Niño ist ein Wetterphänomen im Pazifik. Das warme Wasser im Ozean verändert das Wetter auf der ganzen Welt. In manchen Jahren ist El Niño sehr stark.

Wissenschaftler sagen: Im Jahr 2026 könnte El Niño wieder sehr stark werden. Das bedeutet: In Europa kann es sehr heiß und trocken werden. Es kann auch mehr Sturm geben.

Die Menschen sollen sich vorbereiten. Mehr Wasser trinken, die Natur schützen und Energie sparen sind wichtige Maßnahmen. Das Klima verändert sich, und wir müssen damit umgehen.'
),
(
  (select id from texts where slug = 'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa'),
  'B1',
  'Wissenschaftler warnen vor einem starken El-Niño-Ereignis im Jahr 2026. El Niño ist eine Erwärmung des Pazifischen Ozeans, die das Wetter weltweit beeinflusst. Veränderte Wind- und Meeresströmungen sprechen dafür, dass das Phänomen in diesem Jahr besonders intensiv sein könnte.

Für Europa bedeutet das: höhere Temperaturen, weniger Regen und eine größere Gefahr von Waldbränden im Sommer. Südeuropa ist besonders betroffen – aber auch Deutschland und seine Nachbarländer spüren die Auswirkungen. Der vergangene April mit seinen Rekordtemperaturen könnte ein Vorbote sein.

Klimaforscher betonen, dass El Niño allein nicht für die Erwärmung verantwortlich ist. Der menschengemachte Klimawandel verstärkt die Effekte zusätzlich. Regierungen und Bürger sollten sich jetzt auf einen heißen Sommer vorbereiten.'
),
(
  (select id from texts where slug = 'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa'),
  'B2',
  'Ozeanographische Messdaten deuten auf ein stärkeres El-Niño-Ereignis im zweiten Halbjahr 2026 hin. Die Oberflächentemperaturen im äquatorialen Pazifik liegen bereits deutlich über dem langjährigen Mittel – ein Muster, das Klimamodelle mit einer erhöhten Wahrscheinlichkeit für extreme Hitzesommer in Teilen Europas verknüpfen.

El Niño verändert atmosphärische Zirkulationsmuster, was in Europa vor allem zu Trockenheit im Mittelmeerraum und verändertem Niederschlagsverhalten in Mitteleuropa führen kann. In Kombination mit dem bereits bestehenden Klimawandel werden diese Effekte verstärkt – Wissenschaftler sprechen von einem sogenannten Klimaverstärker-Effekt.

Für Deutschland sind besonders Landwirtschaft und Wasserversorgung gefährdet. Der Deutsche Wetterdienst hat angekündigt, seine Hitzefrühwarnsysteme frühzeitig zu aktivieren. Ob die politischen und infrastrukturellen Vorbereitungen ausreichen, wird sich im Sommer zeigen.'
),
(
  (select id from texts where slug = 'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa'),
  'C1',
  'El Niño ist kein neues Phänomen – die irreguläre Erwärmung des äquatorialen Pazifiks wurde bereits im 19. Jahrhundert von südamerikanischen Fischern beschrieben. Was sich verändert hat, ist der Kontext: In einer um 1,3 Grad wärmeren Welt entfaltet El Niño andere, in der Regel extremere Wirkungen als in vorindustrieller Zeit.

Die aktuellen Messdaten sind beunruhigend. Ozeanographische Bojen im Pazifik registrieren Abweichungen vom mittleren Niveau, die mit starken historischen El-Niño-Ereignissen wie 1997/98 oder 2015/16 vergleichbar sind – Ereignissen, die damals zu schweren Dürren in Ostafrika, überschwemmungen in Südamerika und Hitzewellen in Europa führten. Die Modelle des Potsdam-Instituts für Klimafolgenforschung prognostizieren für Mitteleuropa eine überdurchschnittlich hohe Wahrscheinlichkeit extremer Temperaturen im Sommer 2026.

Das wissenschaftlich Schwierige ist die Zurechnung: Welche konkreten Extremereignisse sind auf El Niño zurückzuführen, welche auf den anthropogenen Klimawandel, und wo verstärken sich beide Phänomene gegenseitig? Die Attributionsforschung hat hier in den letzten Jahren erhebliche Fortschritte gemacht – sie kann heute mit hoher statistischer Sicherheit sagen, wie viel wahrscheinlicher ein bestimmtes Ereignis durch den Klimawandel geworden ist.

Was bleibt, ist die politische Frage: Wie bereitet sich eine Gesellschaft auf Extremwetter vor, das mit zunehmender Häufigkeit und Intensität zu erwarten ist? Die Antwort kann nicht allein meteorologisch sein. Sie muss infrastrukturell, sozial und letztlich demokratisch sein.'
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
    'abhängen von',
    'verb',
    'depender de',
    'Die Höhe hängt von vielen Faktoren ab.',
    'B1',
    null,
    null,
    'abhängen von',
    'La cuantía depende de muchos factores.',
    'Das Ergebnis hängt von deiner Vorbereitung ab.',
    'hing ab',
    'abgehangen'
  ),
  (
    'absehbar',
    'adjective',
    'previsible',
    'Los críticos dudan de si actúa a tiempo para cerrar la brecha previsible.',
    'B2',
    null,
    null,
    null,
    null,
    'Die absehbaren Probleme werden nicht ernst genommen.',
    null,
    'Kritiker bezweifeln, ob sie rechtzeitig greift, um die absehbare Lücke zu schließen.'
  ),
  (
    'absolvieren',
    'verb',
    'completar / realizar',
    'Das Personal hatte regelmäßig Brandschutzübungen absolviert.',
    'B2',
    null,
    null,
    'absolvieren',
    'El personal había realizado regularmente simulacros de incendio.',
    'Er hat seine Ausbildung erfolgreich absolviert.',
    'absolvierte',
    'absolviert'
  ),
  (
    'aktivieren',
    'verb',
    'activar',
    'Der Deutsche Wetterdienst will seine Warnsysteme frühzeitig aktivieren.',
    'B2',
    null,
    null,
    'aktivieren',
    'El Servicio Meteorológico alemán quiere activar pronto sus sistemas de alerta.',
    'Das Frühwarnsystem wurde rechtzeitig aktiviert.',
    'aktivierte',
    'aktiviert'
  ),
  (
    'aktuell',
    'adjective',
    'actual / vigente',
    'El valor de pensión vigente sube ligeramente.',
    'B1',
    null,
    null,
    null,
    null,
    'Der aktuelle Stand ist noch nicht bekannt.',
    null,
    'Der aktuelle Rentenwert steigt leicht an.'
  ),
  (
    'alt',
    'adjective',
    'mayor / viejo',
    'La pensión es dinero para las personas mayores.',
    'A2',
    null,
    null,
    null,
    null,
    'Alte Menschen brauchen besondere Unterstützung.',
    null,
    'Die Rente ist Geld für alte Menschen.'
  ),
  (
    'altern',
    'verb',
    'envejecer',
    'Deutschland altert schnell.',
    'B2',
    null,
    null,
    'altern',
    'Alemania envejece rápido.',
    'Die Gesellschaft altert, und das Rentensystem muss sich anpassen.',
    'alterte',
    'gealtert'
  ),
  (
    'ankündigen',
    'verb',
    'anunciar',
    'Der Verein hat angekündigt, die Situation zu verbessern.',
    'B1',
    null,
    null,
    'ankündigen',
    'El club ha anunciado que mejorará la situación.',
    'Die Regierung hat neue Maßnahmen angekündigt.',
    'kündigte an',
    'angekündigt'
  ),
  (
    'annähernd',
    'adjective',
    'aproximadamente / ni remotamente',
    'El presupuesto no es ni remotamente comparable al de la sección masculina.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist nicht annähernd genug.',
    null,
    'Das Budget ist mit dem der Männerabteilung nicht annähernd vergleichbar.'
  ),
  (
    'anthropogen',
    'adjective',
    'antropogénico',
    '¿Qué eventos son atribuibles al cambio climático antropogénico?',
    'C1',
    null,
    null,
    null,
    null,
    'Der anthropogene Klimawandel ist die größte Herausforderung unserer Zeit.',
    null,
    'Welche Ereignisse sind auf den anthropogenen Klimawandel zurückzuführen?'
  ),
  (
    'antreten',
    'verb',
    'presentarse / enfrentarse',
    '92.000 Abiturientinnen und Abiturienten treten zu den Prüfungen an.',
    'B2',
    null,
    null,
    'antreten',
    '92.000 estudiantes se presentan a los exámenes.',
    'Morgen tritt er zur Abschlussprüfung an.',
    'trat an',
    'angetreten'
  ),
  (
    'arbeiten',
    'verb',
    'trabajar',
    'Man bekommt Rente, wenn man nicht mehr arbeitet.',
    'A2',
    null,
    null,
    'arbeiten',
    'Se recibe pensión cuando ya no se trabaja.',
    'Sie arbeitet seit zwanzig Jahren in diesem Unternehmen.',
    'arbeitete',
    'gearbeitet'
  ),
  (
    'atmosphärisch',
    'adjective',
    'atmosférico',
    'El Niño modifica los patrones de circulación atmosférica.',
    'B2',
    null,
    null,
    null,
    null,
    'Atmosphärische Veränderungen beeinflussen das globale Klima.',
    null,
    'El Niño verändert atmosphärische Zirkulationsmuster.'
  ),
  (
    'auffällig',
    'adjective',
    'llamativo / notable',
    'Tanto más llamativo es el contraste con la situación de la sección femenina.',
    'B2',
    null,
    null,
    null,
    'Johan Manzambi es el jugador más destacado de la plantilla.',
    'Der Unterschied ist besonders auffällig.',
    null,
    'Umso auffälliger ist der Kontrast zur Lage der Frauenabteilung.'
  ),
  (
    'aufwerfen',
    'verb',
    'plantear',
    'Der Einsatz wirft Fragen auf, die über den Einzelfall hinausgehen.',
    'C1',
    null,
    null,
    'aufwerfen',
    'El operativo plantea preguntas que van más allá del caso concreto.',
    'Der Vorfall wirft grundlegende Fragen auf.',
    'warf auf',
    'aufgeworfen'
  ),
  (
    'ausbrechen',
    'verb',
    'desencadenarse / declararse',
    'In der psychiatrischen Klinik ist ein Feuer ausgebrochen.',
    'B1',
    null,
    null,
    'ausbrechen',
    'En la clínica psiquiátrica se declaró un incendio.',
    'Ein Feuer brach mitten in der Nacht aus.',
    'brach aus',
    'ausgebrochen'
  ),
  (
    'ausdrücklich',
    'adjective',
    'expresamente',
    'El portavoz de bomberos Hensel dio expresamente importancia a la circunstancia.',
    'B2',
    null,
    null,
    null,
    null,
    'Er hat ausdrücklich darauf hingewiesen.',
    null,
    'Feuerwehrsprecher Hensel beimaß dem Umstand ausdrücklich Bedeutung.'
  ),
  (
    'ausgewogen',
    'adjective',
    'equilibrado',
    'El sistema de reparto presupone una estructura de edades equilibrada.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine ausgewogene Altersstruktur ist für das System entscheidend.',
    null,
    'Das Umlageverfahren setzt eine ausgewogene Altersstruktur voraus.'
  ),
  (
    'auslösen',
    'verb',
    'desencadenar',
    'Ein Großbrand hat einen Großeinsatz der Feuerwehr ausgelöst.',
    'B2',
    null,
    null,
    'auslösen',
    'Un gran incendio desencadenó un gran operativo de los bomberos.',
    'Der Alarm wurde durch Rauch ausgelöst.',
    'löste aus',
    'ausgelöst'
  ),
  (
    'ausschließen',
    'verb',
    'descartar / excluir',
    'Brandstiftung wird nicht ausgeschlossen.',
    'B2',
    null,
    null,
    'ausschließen',
    'No se descarta el incendio provocado.',
    'Eine technische Ursache kann nicht ausgeschlossen werden.',
    'schloss aus',
    'ausgeschlossen'
  ),
  (
    'beeinflussen',
    'verb',
    'influir en',
    'El Niño ist eine Erwärmung, die das Wetter weltweit beeinflusst.',
    'B1',
    null,
    null,
    'beeinflussen',
    'El Niño es un calentamiento que influye en el tiempo en todo el mundo.',
    'Das Wetter beeinflusst unser Wohlbefinden.',
    'beeinflusste',
    'beeinflusst'
  ),
  (
    'begrenzt',
    'adjective',
    'limitado',
    'Lo nuevo es la autorización limitada de dispositivos digitales.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Nutzung ist auf eine begrenzte Zeit erlaubt.',
    null,
    'Neu ist die begrenzte Zulassung digitaler Endgeräte.'
  ),
  (
    'begünstigen',
    'verb',
    'favorecer',
    'Eine kapitalgedeckte Komponente begünstigt diejenigen mit privaten Ersparnissen.',
    'C1',
    null,
    null,
    'begünstigen',
    'Un componente de capitalización favorece a quienes tienen ahorros privados.',
    'Das neue System begünstigt höhere Einkommensgruppen.',
    'begünstigte',
    'begünstigt'
  ),
  (
    'bekannt',
    'adjective',
    'conocido',
    'El FC St. Pauli es un conocido club de fútbol.',
    'A2',
    null,
    null,
    null,
    null,
    'Er ist in ganz Deutschland bekannt.',
    null,
    'Der FC St. Pauli ist ein bekannter Fußballverein.'
  ),
  (
    'bekommen',
    'verb',
    'recibir',
    'Die Männermannschaft bekommt viel mehr Geld.',
    'A2',
    null,
    null,
    'bekommen',
    'El equipo masculino recibe mucho más dinero.',
    'Sie bekommt jeden Monat ihr Gehalt.',
    'bekam',
    'bekommen'
  ),
  (
    'besonder-',
    'adjective',
    'especial',
    'Es conocido por sus valores especiales.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist ein besonderer Moment.',
    null,
    'Er ist bekannt für seine besonderen Werte.'
  ),
  (
    'bestimmt',
    'adjective',
    'determinado / concreto',
    'Quien supera unos ingresos determinados.',
    'B1',
    null,
    null,
    null,
    null,
    'Es gibt eine bestimmte Grenze für alle.',
    null,
    'Wer ein bestimmtes Einkommen überschreitet.'
  ),
  (
    'betonen',
    'verb',
    'subrayar / destacar',
    'Das Schulministerium betont, dass Eigenleistung im Mittelpunkt steht.',
    'B2',
    null,
    null,
    'betonen',
    'El ministerio de educación subraya que el rendimiento propio está en el centro.',
    'Die Lehrerin betont die Wichtigkeit des Lesens.',
    'betonte',
    'betont'
  ),
  (
    'betroffen',
    'adjective',
    'afectado',
    'El ala del edificio afectada permanece cerrada.',
    'B1',
    null,
    null,
    null,
    null,
    'Die betroffenen Patienten wurden verlegt.',
    null,
    'Der betroffene Gebäudeflügel bleibt gesperrt.'
  ),
  (
    'beunruhigend',
    'adjective',
    'preocupante',
    'Los datos de medición actuales son preocupantes.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Entwicklung der Klimadaten ist beunruhigend.',
    null,
    'Die aktuellen Messdaten sind beunruhigend.'
  ),
  (
    'bewältigen',
    'verb',
    'afrontar / superar',
    'Das Bildungssystem muss den Spagat bewältigen.',
    'C1',
    null,
    null,
    'bewältigen',
    'El sistema educativo debe afrontar el equilibrio.',
    'Die Gesellschaft muss neue Herausforderungen bewältigen.',
    'bewältigte',
    'bewältigt'
  ),
  (
    'bezweifeln',
    'verb',
    'dudar de',
    'Kritiker bezweifeln, ob die Fondslösung sozial gerecht sein kann.',
    'B2',
    null,
    null,
    'bezweifeln',
    'Los críticos dudan de que la solución mediante fondos pueda ser socialmente justa.',
    'Viele bezweifeln die Wirksamkeit dieser Maßnahme.',
    'bezweifelte',
    'bezweifelt'
  ),
  (
    'bloß',
    'adjective',
    'mero / simple',
    'El anticapitalismo no es una mera promesa de marketing.',
    'C1',
    null,
    null,
    null,
    null,
    'Das sind keine bloßen Worte.',
    null,
    'Antikapitalismus ist kein bloßes Marketingversprechen.'
  ),
  (
    'boomen',
    'verb',
    'estar en auge',
    'Gleichzeitig boomt der Frauenfußball in Deutschland.',
    'B1',
    null,
    null,
    'boomen',
    'Al mismo tiempo el fútbol femenino está en auge en Alemania.',
    'Die Branche boomt seit Jahren.',
    'boomte',
    'gebomt'
  ),
  (
    'das Abitur',
    'noun',
    'bachillerato',
    'Das Abitur ist sehr wichtig.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Abitur beginnt im April.',
    null,
    null
  ),
  (
    'das Alter',
    'noun',
    'la vejez / la edad',
    'Habe ich genug Geld im Alter?',
    'A2',
    'das',
    null,
    null,
    null,
    'Im Alter ist Gesundheit sehr wichtig.',
    null,
    null
  ),
  (
    'das Bekenntnis',
    'noun',
    'la declaración / el compromiso',
    'Doch zwischen Bekenntnissen und strukturellen Investitionen klafft eine Lücke.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Bekenntnis zur Gleichstellung bleibt ohne Folgen.',
    null,
    null
  ),
  (
    'das Dilemma',
    'noun',
    'el dilema',
    'Das strukturelle Dilemma ist bekannt.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Dilemma zwischen Freiheit und Kontrolle bleibt ungelöst.',
    null,
    null
  ),
  (
    'das Einkommen',
    'noun',
    'los ingresos',
    'Wer ein bestimmtes Einkommen überschreitet, bekommt nicht mehr Rente.',
    'B1',
    'das',
    null,
    null,
    null,
    'Sein Einkommen reicht für ein gutes Leben.',
    null,
    null
  ),
  (
    'das Endgerät',
    'noun',
    'el dispositivo',
    'Die begrenzte Zulassung digitaler Endgeräte in ausgewählten Fächern.',
    'B2',
    'das',
    null,
    null,
    null,
    'Schüler dürfen ihr Endgerät in der Prüfung benutzen.',
    null,
    null
  ),
  (
    'das Feuer',
    'noun',
    'el fuego / el incendio',
    'Das Feuer war groß.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Feuer begann am Morgen.',
    null,
    null
  ),
  (
    'das Flickwerk',
    'noun',
    'el parche / la solución provisional',
    'Das Rentensystem 2026: Zwischen Flickwerk und strukturellem Umbau.',
    'C1',
    'das',
    null,
    null,
    null,
    'Die bisherigen Reformen sind nur Flickwerk.',
    null,
    null
  ),
  (
    'das Gehalt',
    'noun',
    'el sueldo',
    'Jeder zahlt einen Teil seines Gehalts in die Rentenkasse.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Gehalt wird am Ende des Monats überwiesen.',
    null,
    null
  ),
  (
    'das Geld',
    'noun',
    'el dinero',
    'Auch das Geld ist ein Problem.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Geld ist für den Verein wichtig.',
    null,
    null
  ),
  (
    'das Generationenkapital',
    'noun',
    'el capital intergeneracional',
    'Das angekündigte Generationenkapital ist eine staatlich verwaltete Fondslösung.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Generationenkapital soll langfristig die Renten sichern.',
    null,
    null
  ),
  (
    'das Gesetz',
    'noun',
    'la ley',
    'Das ist das Gesetz.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das neue Gesetz gilt ab 2026.',
    null,
    null
  ),
  (
    'das Hilfsmittel',
    'noun',
    'el recurso auxiliar',
    'Erstmals dürfen Schüler digitale Hilfsmittel benutzen.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Hilfsmittel ist im Unterricht erlaubt.',
    null,
    null
  ),
  (
    'das Hitzefrühwarnsystem',
    'noun',
    'el sistema de alerta temprana por calor',
    'Der Deutsche Wetterdienst will seine Hitzefrühwarnsysteme frühzeitig aktivieren.',
    'B2',
    'das',
    null,
    null,
    null,
    'Hitzefrühwarnsysteme können Leben retten.',
    null,
    null
  ),
  (
    'das Klima',
    'noun',
    'el clima',
    'Das Klima verändert sich, und wir müssen damit umgehen.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Klima in Europa verändert sich.',
    null,
    null
  ),
  (
    'das Krankenhaus',
    'noun',
    'el hospital',
    'Am Dienstag hat es in einem Krankenhaus in Aachen gebrannt.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Krankenhaus ist sehr groß.',
    null,
    null
  ),
  (
    'das Marketinginstrument',
    'noun',
    'el instrumento de marketing',
    'Kritikerinnen werfen dem Verein vor, Feminismus als Marketinginstrument zu nutzen.',
    'B2',
    'das',
    null,
    null,
    null,
    'Nachhaltigkeit wird oft als Marketinginstrument missbraucht.',
    null,
    null
  ),
  (
    'das Messdatum',
    'noun',
    'el dato de medición',
    'Ozeanographische Messdaten deuten auf ein stärkeres El-Niño-Ereignis hin.',
    'B2',
    'das',
    null,
    null,
    null,
    'Die Messdaten zeigen einen klaren Trend zur Erwärmung.',
    null,
    null
  ),
  (
    'das Ministerium',
    'noun',
    'el ministerio',
    'Das Ministerium will so die digitalen Kompetenzen fördern.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Ministerium hat eine neue Regel eingeführt.',
    null,
    null
  ),
  (
    'das Niederschlagsverhalten',
    'noun',
    'el comportamiento de las precipitaciones',
    'El Niño kann zu verändertem Niederschlagsverhalten in Mitteleuropa führen.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das veränderte Niederschlagsverhalten bedroht die Landwirtschaft.',
    null,
    null
  ),
  (
    'das Pflegepersonal',
    'noun',
    'el personal de enfermería',
    'Dank des schnellen Handelns des Pflegepersonals konnten alle evakuiert werden.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Pflegepersonal hat in der Krise hervorragend reagiert.',
    null,
    null
  ),
  (
    'das Selbstbild',
    'noun',
    'la autoimagen',
    'St. Pauli: Über die Grenzen des progressiven Selbstbildes.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Selbstbild des Vereins stimmt nicht mit der Realität überein.',
    null,
    null
  ),
  (
    'das Selbstverständnis',
    'noun',
    'la identidad / la autocomprensión',
    'Antirassismus und Feminismus gehören zum offiziellen Selbstverständnis des Klubs.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das soziale Engagement gehört zum Selbstverständnis des Vereins.',
    null,
    null
  ),
  (
    'das Spannungsfeld',
    'noun',
    'el campo de tensión / la área conflictiva',
    'Spannungsfelder zwischen Therapiefreiheit und Schutzpflicht sind strukturell angelegt.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Spannungsfeld zwischen Sicherheit und Freiheit ist komplex.',
    null,
    null
  ),
  (
    'das System',
    'noun',
    'el sistema',
    'Die Regierung sagt: Das System ist stabil.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Rentensystem ist kompliziert.',
    null,
    null
  ),
  (
    'das Umlageverfahren',
    'noun',
    'el sistema de reparto',
    'Das Umlageverfahren setzt eine ausgewogene Altersstruktur voraus.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Umlageverfahren funktioniert nur mit genügend Beitragszahlern.',
    null,
    null
  ),
  (
    'das Verteilungsproblem',
    'noun',
    'el problema de distribución',
    'Hinzu kommt das Verteilungsproblem.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Verteilungsproblem betrifft alle kapitalgedeckten Systeme.',
    null,
    null
  ),
  (
    'das Vorbild',
    'noun',
    'el modelo / el referente',
    'Eine Fondslösung nach skandinavischem Vorbild.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das skandinavische System gilt als Vorbild für viele Länder.',
    null,
    null
  ),
  (
    'das Wetter',
    'noun',
    'el tiempo (meteorológico)',
    'Das warme Wasser verändert das Wetter auf der ganzen Welt.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Wetter in Europa wird heißer.',
    null,
    null
  ),
  (
    'das Zirkulationsmuster',
    'noun',
    'el patrón de circulación',
    'El Niño verändert atmosphärische Zirkulationsmuster.',
    'B2',
    'das',
    null,
    null,
    null,
    'Die Veränderung der Zirkulationsmuster beeinflusst das Wetter weltweit.',
    null,
    null
  ),
  (
    'demografisch',
    'adjective',
    'demográfico',
    'En el centro del debate está el desequilibrio demográfico.',
    'B2',
    null,
    null,
    null,
    null,
    'Der demografische Wandel ist eine große Herausforderung.',
    null,
    'Im Zentrum der Debatte steht die demografische Schieflage.'
  ),
  (
    'demokratisch',
    'adjective',
    'democrático',
    'La respuesta debe ser infraestructural, social y en última instancia democrática.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Klimaanpassung muss demokratisch legitimiert sein.',
    null,
    'Die Antwort muss infrastrukturell, sozial und letztlich demokratisch sein.'
  ),
  (
    'der Arbeitnehmer',
    'noun',
    'el trabajador',
    'Es gibt immer weniger junge Arbeitnehmer.',
    'B1',
    'der',
    null,
    null,
    null,
    'Jeder Arbeitnehmer zahlt Beiträge in die Rentenkasse.',
    null,
    null
  ),
  (
    'der Befähigungsnachweis',
    'noun',
    'el certificado de aptitud',
    'Die Legitimation des Abiturs als Befähigungsnachweis für Universität und Beruf.',
    'C1',
    'der',
    null,
    null,
    null,
    'Das Abitur gilt als wichtiger Befähigungsnachweis.',
    null,
    null
  ),
  (
    'der Beitragszahler',
    'noun',
    'el cotizante',
    'Gleichzeitig schrumpft die Zahl der Beitragszahler.',
    'B2',
    'der',
    null,
    null,
    null,
    'Immer weniger Beitragszahler müssen immer mehr Rentner finanzieren.',
    null,
    null
  ),
  (
    'der Beruf',
    'noun',
    'la profesión',
    'Nach dem Abitur können die Schüler einen Beruf lernen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Welchen Beruf möchtest du lernen?',
    null,
    null
  ),
  (
    'der Einzelfall',
    'noun',
    'el caso individual / el caso concreto',
    'Der Einsatz wirft Fragen auf, die über den konkreten Einzelfall hinausgehen.',
    'C1',
    'der',
    null,
    null,
    null,
    'Man darf nicht jeden Einzelfall verallgemeinern.',
    null,
    null
  ),
  (
    'der Gebäudeflügel',
    'noun',
    'el ala del edificio',
    'Der betroffene Gebäudeflügel bleibt gesperrt.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der beschädigte Gebäudeflügel muss repariert werden.',
    null,
    null
  ),
  (
    'der Gegenentwurf',
    'noun',
    'el modelo alternativo / la contrapropuesta',
    'Der FC St.',
    'B2',
    'der',
    null,
    null,
    'Der FC St. Pauli inszeniert sich als Gegenentwurf zum kommerzialisierten Profisport.',
    'Der Verein versteht sich als Gegenentwurf zum Mainstream.',
    null,
    null
  ),
  (
    'der Großbrand',
    'noun',
    'el gran incendio',
    'Großbrand im Alexianer-Krankenhaus Aachen.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Großbrand dauerte mehrere Stunden.',
    null,
    null
  ),
  (
    'der Großeinsatz',
    'noun',
    'el gran operativo',
    'Ein Großbrand hat einen Großeinsatz der Feuerwehr ausgelöst.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Großeinsatz der Polizei dauerte mehrere Stunden.',
    null,
    null
  ),
  (
    'der Handlungsbedarf',
    'noun',
    'la necesidad de actuar',
    'Die Vereinsführung räumt Handlungsbedarf ein.',
    'B2',
    'der',
    null,
    null,
    null,
    'Es gibt dringenden Handlungsbedarf in diesem Bereich.',
    null,
    null
  ),
  (
    'der Haushaltsposten',
    'noun',
    'la partida presupuestaria',
    'Ob sie ergriffen wird, wird sich an Haushaltsposten messen lassen.',
    'C1',
    'der',
    null,
    null,
    null,
    'Die Gleichstellung muss sich in konkreten Haushaltsposten zeigen.',
    null,
    null
  ),
  (
    'der Klimawandel',
    'noun',
    'el cambio climático',
    'Der menschengemachte Klimawandel verstärkt die Effekte zusätzlich.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Klimawandel ist eine der größten Herausforderungen unserer Zeit.',
    null,
    null
  ),
  (
    'der Lehrerverband',
    'noun',
    'la asociación de docentes',
    'Lehrerverbände fordern eine klarere bundesweite Linie.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Lehrerverband hat eine Stellungnahme veröffentlicht.',
    null,
    null
  ),
  (
    'der Leistungsanspruch',
    'noun',
    'la exigencia de rendimiento',
    'Das Abitur steht zwischen tradiertem Leistungsanspruch und digitaler Realität.',
    'C1',
    'der',
    null,
    null,
    null,
    'Der hohe Leistungsanspruch belastet viele Schüler.',
    null,
    null
  ),
  (
    'der Leistungsdruck',
    'noun',
    'la presión por el rendimiento',
    'Abitur 2026: Zwischen digitalem Wandel und klassischem Leistungsdruck.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Leistungsdruck in der Schule ist sehr hoch.',
    null,
    null
  ),
  (
    'der Ozean',
    'noun',
    'el océano',
    'Das warme Wasser im Ozean verändert das Wetter.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Pazifik ist der größte Ozean.',
    null,
    null
  ),
  (
    'der Patient',
    'noun',
    'el paciente',
    'Die Patienten waren in Sicherheit.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Patient muss im Bett bleiben.',
    null,
    null
  ),
  (
    'der Rentenanspruch',
    'noun',
    'el derecho a pensión',
    'Wer über dem Rentenhöchstbetrag verdient, erhält keine zusätzlichen Rentenansprüche mehr.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Rentenanspruch hängt von der Beitragsdauer ab.',
    null,
    null
  ),
  (
    'der Rentenwert',
    'noun',
    'el valor de la pensión',
    'Ab 2026 gelten in Deutschland neue Rentenwerte.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Rentenwert steigt dieses Jahr leicht an.',
    null,
    null
  ),
  (
    'der Sachschaden',
    'noun',
    'los daños materiales',
    'Der Sachschaden wird auf mehrere hunderttausend Euro geschätzt.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Sachschaden nach dem Brand ist enorm.',
    null,
    null
  ),
  (
    'der Schüler',
    'noun',
    'el alumno',
    'Die Schüler müssen viel lernen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Schüler lernt jeden Tag.',
    null,
    null
  ),
  (
    'der Spielraum',
    'noun',
    'el margen de maniobra',
    'Die Vereinsführung verweist auf begrenzte finanzielle Spielräume.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der finanzielle Spielraum des Vereins ist gering.',
    null,
    null
  ),
  (
    'der Sturm',
    'noun',
    'la tormenta',
    'Es kann auch mehr Sturm geben.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Sturm war sehr stark.',
    null,
    null
  ),
  (
    'der Tag',
    'noun',
    'el día',
    'Es ist ein großer Tag für die Familie.',
    'A2',
    'der',
    null,
    null,
    null,
    'Heute ist ein schöner Tag.',
    null,
    null
  ),
  (
    'der Trainingsplatz',
    'noun',
    'el campo de entrenamiento',
    'Es gibt nicht genug Trainingsplätze für die Frauen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Trainingsplatz ist zu klein.',
    null,
    null
  ),
  (
    'der Trend',
    'noun',
    'la tendencia',
    'St.',
    'B1',
    'der',
    null,
    null,
    'St. Pauli scheint diesen Trend zu verschlafen.',
    'Der Trend im Frauenfußball ist sehr positiv.',
    null,
    null
  ),
  (
    'der Verein',
    'noun',
    'el club',
    'Der FC St.',
    'A2',
    'der',
    null,
    null,
    'Der FC St. Pauli ist ein bekannter Fußballverein in Hamburg.',
    'Der Verein hat viele treue Fans.',
    null,
    null
  ),
  (
    'der Vorbereitungskurs',
    'noun',
    'el curso de preparación',
    'Die Schulen haben intensive Vorbereitungskurse angeboten.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Vorbereitungskurs hilft den Schülern sehr.',
    null,
    null
  ),
  (
    'der Vorbote',
    'noun',
    'el precursor / la señal',
    'Der vergangene April könnte ein Vorbote sein.',
    'B1',
    'der',
    null,
    null,
    null,
    'Diese Hitzewelle war ein Vorbote für den Sommer.',
    null,
    null
  ),
  (
    'der Waldband',
    'noun',
    'el incendio forestal',
    'Es gibt eine größere Gefahr von Waldbränden im Sommer.',
    'B1',
    'der',
    null,
    null,
    null,
    'Waldbrände werden durch Trockenheit begünstigt.',
    null,
    null
  ),
  (
    'der Wert',
    'noun',
    'el valor',
    'Er ist bekannt für seine besonderen Werte: Gleichheit und Solidarität.',
    'A2',
    'der',
    null,
    null,
    null,
    'Solidarität ist ein wichtiger Wert.',
    null,
    null
  ),
  (
    'der Widerspruch',
    'noun',
    'la contradicción',
    'St.',
    'B1',
    'der',
    null,
    null,
    'Für viele ist das ein Widerspruch zu den Werten, die St. Pauli kommuniziert.',
    'Es gibt einen klaren Widerspruch zwischen Worten und Taten.',
    null,
    null
  ),
  (
    'der Wissenschaftler',
    'noun',
    'el científico',
    'Wissenschaftler sagen: Im Jahr 2026 könnte El Niño stark werden.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Wissenschaftler erklärt das Phänomen.',
    null,
    null
  ),
  (
    'der Zuschauer',
    'noun',
    'el espectador',
    'Die Bundesliga zieht mehr Zuschauer an.',
    'B1',
    'der',
    null,
    null,
    null,
    'Die Zahl der Zuschauer steigt jedes Jahr.',
    null,
    null
  ),
  (
    'desorientiert',
    'adjective',
    'desorientado',
    'Los pacientes pueden estar desorientados o en crisis agudas.',
    'C1',
    null,
    null,
    null,
    null,
    'Ältere Patienten sind im Notfall oft desorientiert.',
    null,
    'Patienten können desorientiert oder in akuten Krisen sein.'
  ),
  (
    'die Abteilung',
    'noun',
    'el departamento / la sección',
    'Die Realität der Frauenfußballabteilung sieht anders aus.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Frauenabteilung braucht mehr Unterstützung.',
    null,
    null
  ),
  (
    'die Abweichung',
    'noun',
    'la desviación / la anomalía',
    'Ozeanographische Bojen registrieren Abweichungen vom mittleren Niveau.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Abweichungen von der Norm sind statistisch signifikant.',
    null,
    null
  ),
  (
    'die Altenquote',
    'noun',
    'la tasa de envejecimiento',
    'Die Altenquote – das Verhältnis von Rentnern zu Beitragszahlern – verschlechtert sich jährlich.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die steigende Altenquote belastet das Rentensystem erheblich.',
    null,
    null
  ),
  (
    'die Arbeit',
    'noun',
    'el trabajo',
    'Die Krankenpfleger haben gute Arbeit gemacht.',
    'A2',
    'die',
    null,
    null,
    null,
    'Sie macht gute Arbeit in ihrem Beruf.',
    null,
    null
  ),
  (
    'die Attributionsforschung',
    'noun',
    'la investigación de atribución',
    'Die Attributionsforschung hat in den letzten Jahren erhebliche Fortschritte gemacht.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Attributionsforschung ist ein relativ neues Wissenschaftsfeld.',
    null,
    null
  ),
  (
    'die Auswirkung',
    'noun',
    'el efecto / la consecuencia',
    'Deutschland und seine Nachbarländer spüren die Auswirkungen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Auswirkungen des Klimawandels sind spürbar.',
    null,
    null
  ),
  (
    'die Bedingung',
    'noun',
    'la condición',
    'Fans und Spielerinnen fordern bessere Bedingungen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Arbeitsbedingungen im Sport müssen besser werden.',
    null,
    null
  ),
  (
    'die Begleitung',
    'noun',
    'el acompañamiento',
    'Menschen, die auf Orientierung und Begleitung angewiesen sind.',
    'B2',
    'die',
    null,
    null,
    null,
    'Patienten brauchen manchmal Begleitung und Unterstützung.',
    null,
    null
  ),
  (
    'die Benachteiligung',
    'noun',
    'la discriminación / la desventaja',
    'Die strukturelle Benachteiligung der Frauenfußballabteilung wiegt besonders schwer.',
    'C1',
    'die',
    null,
    null,
    null,
    'Strukturelle Benachteiligung lässt sich nicht ignorieren.',
    null,
    null
  ),
  (
    'die Bildungsbeteiligung',
    'noun',
    'la participación educativa',
    'Eine gestiegene Bildungsbeteiligung führt zu mehr Abiturienten.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Bildungsbeteiligung ist in den letzten Jahren gestiegen.',
    null,
    null
  ),
  (
    'die Boje',
    'noun',
    'la boya',
    'Ozeanographische Bojen im Pazifik registrieren Abweichungen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Bojen messen die Wassertemperatur in Echtzeit.',
    null,
    null
  ),
  (
    'die Brandschutzübung',
    'noun',
    'el simulacro de incendio',
    'Das Personal hatte regelmäßig Brandschutzübungen absolviert.',
    'B2',
    'die',
    null,
    null,
    null,
    'Brandschutzübungen sind in Krankenhäusern Pflicht.',
    null,
    null
  ),
  (
    'die Brandstiftung',
    'noun',
    'el incendio provocado',
    'Brandstiftung wird nicht ausgeschlossen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Polizei ermittelt wegen Brandstiftung.',
    null,
    null
  ),
  (
    'die Brandursache',
    'noun',
    'la causa del incendio',
    'Die Brandursache ist noch nicht abschließend geklärt.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Brandursache wird noch untersucht.',
    null,
    null
  ),
  (
    'die Dürre',
    'noun',
    'la sequía',
    'Starke El-Niño-Ereignisse führten zu schweren Dürren in Ostafrika.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Dürre bedroht die Landwirtschaft in vielen Regionen.',
    null,
    null
  ),
  (
    'die Eigenleistung',
    'noun',
    'el rendimiento propio',
    'Das Schulministerium betont, dass Eigenleistung im Mittelpunkt steht.',
    'B2',
    'die',
    null,
    null,
    null,
    'Eigenleistung ist beim Abitur entscheidend.',
    null,
    null
  ),
  (
    'die Einflussnahme',
    'noun',
    'la intervención / la influencia',
    'Wenn natürliche Variabilität auf menschliche Einflussnahme trifft.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die menschliche Einflussnahme auf das Klima ist wissenschaftlich belegt.',
    null,
    null
  ),
  (
    'die Einrichtung',
    'noun',
    'el centro / la institución',
    'Wie gut sind psychiatrische Einrichtungen für Brandschutzszenarien aufgestellt?',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Einrichtung verfügt über moderne Sicherheitsstandards.',
    null,
    null
  ),
  (
    'die Einsatzkraft',
    'noun',
    'el efectivo / el rescatista',
    'Mehr als 80 Einsatzkräfte waren vor Ort.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Einsatzkräfte haben professionell gehandelt.',
    null,
    null
  ),
  (
    'die Energie',
    'noun',
    'la energía',
    'Energie sparen ist eine wichtige Maßnahme.',
    'A2',
    'die',
    null,
    null,
    null,
    'Wir müssen Energie sparen.',
    null,
    null
  ),
  (
    'die Ermittlung',
    'noun',
    'la investigación',
    'Die Polizei hat Ermittlungen aufgenommen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Ermittlungen der Polizei dauern noch an.',
    null,
    null
  ),
  (
    'die Ersparnisse',
    'noun',
    'los ahorros',
    'Eine kapitalgedeckte Komponente begünstigt diejenigen, die über private Ersparnisse verfügen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Ohne private Ersparnisse ist die Altersvorsorge schwieriger.',
    null,
    null
  ),
  (
    'die Erwärmung',
    'noun',
    'el calentamiento',
    'El Niño ist eine Erwärmung des Pazifischen Ozeans.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Erwärmung der Meere ist ein ernstes Problem.',
    null,
    null
  ),
  (
    'die Evakuierung',
    'noun',
    'la evacuación',
    'Alle Patienten konnten rechtzeitig evakuiert werden.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Evakuierung verlief ruhig und professionell.',
    null,
    null
  ),
  (
    'die Familie',
    'noun',
    'la familia',
    'Viele Familien feiern das Abitur.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Familie ist sehr wichtig.',
    null,
    null
  ),
  (
    'die Fangemeinde',
    'noun',
    'la comunidad de seguidores',
    'Der Verein hat eine treue und engagierte Fangemeinde.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Fangemeinde unterstützt die Mannschaft leidenschaftlich.',
    null,
    null
  ),
  (
    'die Fankultur',
    'noun',
    'la cultura fan',
    'Geschlechtergleichstellung ist Teil einer lebendigen Fankultur.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Fankultur bei St. Pauli ist einzigartig.',
    null,
    null
  ),
  (
    'die Feuerwehr',
    'noun',
    'los bomberos',
    'Die Feuerwehr ist schnell gekommen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Feuerwehr hat das Feuer gelöscht.',
    null,
    null
  ),
  (
    'die Finanzierungslücke',
    'noun',
    'la brecha de financiación',
    'Kritiker bezweifeln, ob die Fondslösung die absehbare Finanzierungslücke schließen kann.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Finanzierungslücke wird in den 2030er Jahren sehr groß sein.',
    null,
    null
  ),
  (
    'die Fondslösung',
    'noun',
    'la solución mediante fondos',
    'Kritiker bezweifeln, ob die Fondslösung sozial gerecht ausgestaltet werden kann.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Fondslösung ist politisch umstritten.',
    null,
    null
  ),
  (
    'die Freigabe',
    'noun',
    'la autorización / el visto bueno',
    'Der Trakt bleibt bis zur Freigabe durch die Baubehörde geschlossen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Freigabe durch die Behörde steht noch aus.',
    null,
    null
  ),
  (
    'die Geschlechtergleichstellung',
    'noun',
    'la igualdad de género',
    'Antikapitalismus und Geschlechtergleichstellung sind Teil einer lebendigen Fankultur.',
    'C1',
    'die',
    null,
    null,
    null,
    'Geschlechtergleichstellung ist ein politisches Ziel.',
    null,
    null
  ),
  (
    'die Glaubwürdigkeit',
    'noun',
    'la credibilidad',
    'Für den FC St.',
    'C1',
    'die',
    null,
    null,
    'Für den FC St. Pauli ist das eine Frage der Glaubwürdigkeit.',
    'Die Glaubwürdigkeit des Vereins steht auf dem Spiel.',
    null,
    null
  ),
  (
    'die Grenze',
    'noun',
    'el límite',
    'Es gibt aber eine klare Grenze: Wer ein bestimmtes Einkommen überschreitet.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die neue Grenze gilt ab diesem Jahr.',
    null,
    null
  ),
  (
    'die Hitzewelle',
    'noun',
    'la ola de calor',
    'Droht Europa eine neue Hitzewelle?',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Hitzewelle im Sommer war ungewöhnlich lang.',
    null,
    null
  ),
  (
    'die Häufigkeit',
    'noun',
    'la frecuencia',
    'Extremwetter, das mit zunehmender Häufigkeit zu erwarten ist.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Häufigkeit von Extremwetterereignissen nimmt zu.',
    null,
    null
  ),
  (
    'die Inflationsrate',
    'noun',
    'la tasa de inflación',
    'Eine Erhöhung, die angesichts der zuletzt zurückgegangenen Inflationsrate als spürbar gilt.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Inflationsrate ist in den letzten Monaten gesunken.',
    null,
    null
  ),
  (
    'die Infrastruktur',
    'noun',
    'la infraestructura',
    'Die Frauenabteilung kämpft mit veralteter Infrastruktur.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Infrastruktur des Vereins muss modernisiert werden.',
    null,
    null
  ),
  (
    'die Investition',
    'noun',
    'la inversión',
    'Fans und Spielerinnen fordern mehr Investitionen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Der Verein braucht mehr Investitionen in die Infrastruktur.',
    null,
    null
  ),
  (
    'die Kompetenz',
    'noun',
    'la competencia',
    'Das Ministerium will die digitalen Kompetenzen der Schüler fördern.',
    'B1',
    'die',
    null,
    null,
    null,
    'Digitale Kompetenzen sind heute sehr wichtig.',
    null,
    null
  ),
  (
    'die Lebensarbeitszeit',
    'noun',
    'la vida laboral',
    'Was das Rentensystem braucht, ist eine ehrliche Debatte über Lebensarbeitszeit.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Lebensarbeitszeit wird in Deutschland immer kürzer diskutiert.',
    null,
    null
  ),
  (
    'die Legitimation',
    'noun',
    'la legitimación',
    'Die Legitimation des Abiturs als Befähigungsnachweis wird in Frage gestellt.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Legitimation dieser Regelung ist fraglich.',
    null,
    null
  ),
  (
    'die Lösung',
    'noun',
    'la solución',
    'Der Verein muss jetzt eine Lösung finden.',
    'A2',
    'die',
    null,
    null,
    null,
    'Wir brauchen eine gute Lösung.',
    null,
    null
  ),
  (
    'die Lücke',
    'noun',
    'la brecha / el vacío',
    'Zwischen Bekenntnissen und Investitionen klafft eine Lücke.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Lücke zwischen Männer- und Frauengehältern ist riesig.',
    null,
    null
  ),
  (
    'die Mannschaft',
    'noun',
    'el equipo',
    'Die Männermannschaft bekommt viel mehr Geld als die Frauenmannschaft.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Mannschaft trainiert jeden Tag.',
    null,
    null
  ),
  (
    'die Maßnahme',
    'noun',
    'la medida',
    'Mehr Wasser trinken und Energie sparen sind wichtige Maßnahmen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Regierung plant neue Maßnahmen.',
    null,
    null
  ),
  (
    'die Meeresströmung',
    'noun',
    'la corriente marina',
    'Veränderte Wind- und Meeresströmungen sprechen dafür.',
    'B1',
    'die',
    null,
    null,
    null,
    'Meeresströmungen beeinflussen das Klima weltweit.',
    null,
    null
  ),
  (
    'die Neudefinition',
    'noun',
    'la redefinición',
    'Bildungsforscher plädieren für eine Neudefinition von Prüfungskompetenzen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Eine Neudefinition des Lernbegriffs ist notwendig.',
    null,
    null
  ),
  (
    'die Neujustierung',
    'noun',
    'el reajuste',
    'Der Boom bietet eine Chance zur Neujustierung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Eine Neujustierung der Strategie ist dringend nötig.',
    null,
    null
  ),
  (
    'die Notfallvorbereitung',
    'noun',
    'la preparación para emergencias',
    'Kleineren Einrichtungen fehlen Ressourcen für eine systematische Notfallvorbereitung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Eine gute Notfallvorbereitung kann Leben retten.',
    null,
    null
  ),
  (
    'die Oberflächentemperatur',
    'noun',
    'la temperatura superficial',
    'Die Oberflächentemperaturen im äquatorialen Pazifik liegen über dem Mittel.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Oberflächentemperaturen der Meere steigen weiter an.',
    null,
    null
  ),
  (
    'die Panik',
    'noun',
    'el pánico',
    'Lehrerinnen und Lehrer empfehlen keine Panik.',
    'B1',
    'die',
    null,
    null,
    null,
    'Keine Panik – die Prüfung geht gut.',
    null,
    null
  ),
  (
    'die Patientenstruktur',
    'noun',
    'la composición del paciente',
    'Besonders heikel war die Situation wegen der Patientenstruktur.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Patientenstruktur macht die Evakuierung schwieriger.',
    null,
    null
  ),
  (
    'die Polizei',
    'noun',
    'la policía',
    'Die Polizei hat untersucht, warum das Feuer begonnen hat.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Polizei ist sofort gekommen.',
    null,
    null
  ),
  (
    'die Priorisierungsentscheidung',
    'noun',
    'la decisión de priorización',
    'Dieser Widerspruch ist das Ergebnis jahrelanger Priorisierungsentscheidungen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Priorisierungsentscheidungen spiegeln die wahren Werte wider.',
    null,
    null
  ),
  (
    'die Prüfung',
    'noun',
    'el examen',
    'Es ist die letzte Prüfung in der Schule.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Prüfung ist morgen.',
    null,
    null
  ),
  (
    'die Prüfungsphase',
    'noun',
    'la fase de exámenes',
    'Tausende Schüler starten in die Prüfungsphase.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Prüfungsphase dauert mehrere Wochen.',
    null,
    null
  ),
  (
    'die Quellenprüfung',
    'noun',
    'la verificación de fuentes',
    'Die Fähigkeit zur kritischen Einordnung und Quellenprüfung sollte im Vordergrund stehen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Quellenprüfung ist eine wichtige digitale Kompetenz.',
    null,
    null
  ),
  (
    'die Reform',
    'noun',
    'la reforma',
    'Die Bundesregierung diskutiert verschiedene Reformen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Eine grundlegende Reform des Systems ist nötig.',
    null,
    null
  ),
  (
    'die Regel',
    'noun',
    'la norma / la regla',
    'In Deutschland gibt es neue Regeln für die Rente.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die neue Regel ist für alle gleich.',
    null,
    null
  ),
  (
    'die Regierung',
    'noun',
    'el gobierno',
    'Die Regierung sagt: Das System ist stabil.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Regierung plant neue Reformen.',
    null,
    null
  ),
  (
    'die Rente',
    'noun',
    'la pensión',
    'Die Rente ist Geld für alte Menschen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Meine Oma bekommt jeden Monat ihre Rente.',
    null,
    null
  ),
  (
    'die Rentenanpassung',
    'noun',
    'el ajuste de la pensión',
    'Die jährliche Rentenanpassung ist in Deutschland ein politisches Ritual.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Rentenanpassung wird jedes Jahr politisch diskutiert.',
    null,
    null
  ),
  (
    'die Rentenkasse',
    'noun',
    'la caja de pensiones',
    'Jeder zahlt jeden Monat einen Teil seines Gehalts in die Rentenkasse.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Rentenkasse ist durch die Demografie unter Druck.',
    null,
    null
  ),
  (
    'die Reproduktion',
    'noun',
    'la reproducción',
    'Nicht die fehlerfreie Reproduktion von Wissen sollte im Vordergrund stehen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Bloße Reproduktion ersetzt kein kritisches Denken.',
    null,
    null
  ),
  (
    'die Schieflage',
    'noun',
    'el desequilibrio',
    'Im Zentrum der Debatte steht die demografische Schieflage.',
    'B2',
    'die',
    null,
    null,
    null,
    'Das System befindet sich in einer ernsthaften Schieflage.',
    null,
    null
  ),
  (
    'die Schule',
    'noun',
    'la escuela',
    'Es ist die letzte Prüfung in der Schule.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Schule beginnt um acht Uhr.',
    null,
    null
  ),
  (
    'die Schutzpflicht',
    'noun',
    'el deber de protección',
    'Spannungsfelder zwischen Therapiefreiheit und Schutzpflicht.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Schutzpflicht des Staates gegenüber Patienten ist klar.',
    null,
    null
  ),
  (
    'die Sicherheit',
    'noun',
    'la seguridad',
    'Die Patienten waren in Sicherheit.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Sicherheit der Patienten ist sehr wichtig.',
    null,
    null
  ),
  (
    'die Stationsführung',
    'noun',
    'la gestión de la planta',
    'Spannungsfelder zwischen offener Stationsführung und Sicherheitserfordernissen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die offene Stationsführung ist ein Prinzip der modernen Psychiatrie.',
    null,
    null
  ),
  (
    'die Strukturkrise',
    'noun',
    'la crisis estructural',
    'Rente 2026: Mehr Geld, aber keine Lösung für die Strukturkrise.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Strukturkrise des Rentensystems ist seit Jahren bekannt.',
    null,
    null
  ),
  (
    'die Textgenerierung',
    'noun',
    'la generación de texto',
    'Verboten bleibt jede Form von KI-gestützter Textgenerierung.',
    'B2',
    'die',
    null,
    null,
    null,
    'KI-gestützte Textgenerierung ist in Prüfungen nicht erlaubt.',
    null,
    null
  ),
  (
    'die Universität',
    'noun',
    'la universidad',
    'Nach dem Abitur können die Schüler zur Universität gehen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Er geht an die Universität.',
    null,
    null
  ),
  (
    'die Variabilität',
    'noun',
    'la variabilidad',
    'El Niño und der Klimawandel: Wenn natürliche Variabilität auf menschliche Einflussnahme trifft.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die natürliche Variabilität des Klimas erschwert genaue Prognosen.',
    null,
    null
  ),
  (
    'die Vulnerabilität',
    'noun',
    'la vulnerabilidad',
    'Brandstiftung ist ein Hinweis auf eine weitere Vulnerabilität psychiatrischer Einrichtungen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Vulnerabilität dieser Einrichtungen wird oft unterschätzt.',
    null,
    null
  ),
  (
    'die Wahrscheinlichkeit',
    'noun',
    'la probabilidad',
    'Klimamodelle verknüpfen das Muster mit einer erhöhten Wahrscheinlichkeit für Hitzesommer.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Wahrscheinlichkeit eines heißen Sommers ist hoch.',
    null,
    null
  ),
  (
    'die Wasserversorgung',
    'noun',
    'el suministro de agua',
    'Für Deutschland ist besonders die Wasserversorgung gefährdet.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Wasserversorgung in Südeuropa ist durch Trockenheit bedroht.',
    null,
    null
  ),
  (
    'die Zersplitterung',
    'noun',
    'la fragmentación',
    'Angesichts der föderalen Zersplitterung bleibt es fraglich.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Zersplitterung des Systems erschwert Reformen.',
    null,
    null
  ),
  (
    'die Zulassung',
    'noun',
    'la autorización',
    'Neu ist die begrenzte Zulassung digitaler Endgeräte.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Zulassung neuer Hilfsmittel ist umstritten.',
    null,
    null
  ),
  (
    'die Zurechnung',
    'noun',
    'la atribución',
    'Das wissenschaftlich Schwierige ist die Zurechnung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Zurechnung von Extremereignissen zum Klimawandel ist komplex.',
    null,
    null
  ),
  (
    'die Änderung',
    'noun',
    'el cambio',
    'In diesem Jahr gibt es eine wichtige Änderung.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die neue Änderung betrifft alle Schüler.',
    null,
    null
  ),
  (
    'digital',
    'adjective',
    'digital',
    'Por primera vez los alumnos pueden usar recursos auxiliares digitales.',
    'B1',
    null,
    null,
    null,
    null,
    'Wir leben in einer digitalen Welt.',
    null,
    'Erstmals dürfen Schüler digitale Hilfsmittel benutzen.'
  ),
  (
    'dimensioniert',
    'adjective',
    'dimensionado',
    'El capital intergeneracional está dimensionado de forma demasiado pequeña.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Paket ist zu klein dimensioniert, um wirksam zu sein.',
    null,
    'Das Generationenkapital ist zu klein dimensioniert.'
  ),
  (
    'durchdigitalisiert',
    'adjective',
    'completamente digitalizado',
    'La realidad de una sociedad completamente digitalizada.',
    'C1',
    null,
    null,
    null,
    null,
    'Wir leben in einer durchdigitalisierten Welt.',
    null,
    'Die Realität einer durchdigitalisierten Gesellschaft.'
  ),
  (
    'ehrlich',
    'adjective',
    'honesto',
    'Lo que el sistema de pensiones necesita es un debate social honesto.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine ehrliche Debatte über das Thema ist überfällig.',
    null,
    'Was das Rentensystem braucht, ist eine ehrliche gesellschaftliche Debatte.'
  ),
  (
    'eindeutig',
    'adjective',
    'inequívoco / claro',
    'La respuesta no es inequívoca.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine eindeutige Antwort gibt es in diesem Fall nicht.',
    null,
    'Die Antwort ist keine eindeutige.'
  ),
  (
    'einführen',
    'verb',
    'introducir',
    'Die Bundesregierung will eine kapitalgedeckte Komponente einführen.',
    'B2',
    null,
    null,
    'einführen',
    'El gobierno federal quiere introducir un componente de capitalización.',
    'Die neue Regelung wurde Anfang des Jahres eingeführt.',
    'führte ein',
    'eingeführt'
  ),
  (
    'einräumen',
    'verb',
    'admitir / reconocer',
    'Die Vereinsführung räumt Handlungsbedarf ein.',
    'B2',
    null,
    null,
    'einräumen',
    'La dirección del club admite la necesidad de actuar.',
    'Er räumte ein, dass Fehler gemacht wurden.',
    'räumte ein',
    'eingeräumt'
  ),
  (
    'eintreten für',
    'verb',
    'defender / abogar por',
    'Während der Verein öffentlichkeitswirksam für Gleichstellung eintritt.',
    'C1',
    null,
    null,
    'eintreten für',
    'Mientras el club defiende públicamente la igualdad.',
    'Die Organisation tritt für die Rechte von Frauen ein.',
    'trat ein',
    'eingetreten'
  ),
  (
    'empfehlen',
    'verb',
    'recomendar',
    'Lehrerinnen und Lehrer empfehlen: genügend schlafen.',
    'B1',
    null,
    null,
    'empfehlen',
    'Los profesores recomiendan dormir suficiente.',
    'Ich empfehle dir, früh aufzustehen.',
    'empfahl',
    'empfohlen'
  ),
  (
    'entfalten',
    'verb',
    'desplegar / manifestar',
    'In einer wärmeren Welt entfaltet El Niño extremere Wirkungen.',
    'C1',
    null,
    null,
    'entfalten',
    'En un mundo más cálido El Niño manifiesta efectos más extremos.',
    'Der Klimawandel entfaltet seine vollen Wirkungen erst mit Verzögerung.',
    'entfaltete',
    'entfaltet'
  ),
  (
    'ergreifen',
    'verb',
    'aprovechar / tomar',
    'Ob sie ergriffen wird, wird sich nicht an Bekenntnissen messen lassen.',
    'C1',
    null,
    null,
    'ergreifen',
    'Si se aprovecha no se medirá en declaraciones.',
    'Diese Chance muss ergriffen werden.',
    'ergriff',
    'ergriffen'
  ),
  (
    'erheblich',
    'adjective',
    'considerable / significativo',
    'La estructura federal lleva a diferencias considerables.',
    'B2',
    null,
    null,
    null,
    null,
    'Es gibt erhebliche Unterschiede zwischen den Ländern.',
    null,
    'Die föderale Struktur führt zu erheblichen Unterschieden.'
  ),
  (
    'ernsthaft',
    'adjective',
    'seriamente / gravemente',
    'Nadie resultó gravemente herido.',
    'B1',
    null,
    null,
    null,
    null,
    'Niemand wurde ernsthaft verletzt.',
    null,
    'Niemand wurde ernsthaft verletzt.'
  ),
  (
    'evakuieren',
    'verb',
    'evacuar',
    'Alle Patientinnen und Patienten konnten rechtzeitig evakuiert werden.',
    'B1',
    null,
    null,
    'evakuieren',
    'Todos los pacientes pudieron ser evacuados a tiempo.',
    'Das Gebäude wurde sofort evakuiert.',
    'evakuierte',
    'evakuiert'
  ),
  (
    'feiern',
    'verb',
    'celebrar',
    'Viele Familien feiern das Abitur.',
    'A2',
    null,
    null,
    'feiern',
    'Muchas familias celebran el bachillerato.',
    'Wir feiern heute zusammen.',
    'feierte',
    'gefeiert'
  ),
  (
    'finden',
    'verb',
    'encontrar',
    'Der Verein muss jetzt eine Lösung finden.',
    'A2',
    null,
    null,
    'finden',
    'El club tiene que encontrar ahora una solución.',
    'Kannst du eine Lösung finden?',
    'fand',
    'gefunden'
  ),
  (
    'fordern',
    'verb',
    'exigir',
    'Lehrerverbände fordern eine klarere bundesweite Linie.',
    'B2',
    null,
    null,
    'fordern',
    'Las asociaciones de docentes exigen una línea nacional más clara.',
    'Die Schüler fordern mehr Zeit für die Prüfung.',
    'forderte',
    'gefordert'
  ),
  (
    'fragen',
    'verb',
    'preguntar',
    'Viele Fans fragen: Kann ein Verein so ungerecht sein?',
    'A2',
    null,
    null,
    'fragen',
    'Muchos aficionados preguntan: ¿puede un club ser tan injusto?',
    'Er fragt, wann das Spiel beginnt.',
    'fragte',
    'gefragt'
  ),
  (
    'fraglich',
    'adjective',
    'dudoso / cuestionable',
    'Si la política está dispuesta a ello sigue siendo dudoso.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Wirksamkeit dieser Maßnahme ist fraglich.',
    null,
    'Ob die Politik bereit ist, bleibt fraglich.'
  ),
  (
    'frühzeitig',
    'adjective',
    'con antelación / pronto',
    'El Servicio Meteorológico alemán quiere activar sus sistemas pronto.',
    'B2',
    null,
    null,
    null,
    null,
    'Man sollte frühzeitig auf Extremwetter reagieren.',
    null,
    'Der Deutsche Wetterdienst will seine Systeme frühzeitig aktivieren.'
  ),
  (
    'föderál',
    'adjective',
    'federal',
    'La estructura federal del sistema educativo alemán.',
    'B2',
    null,
    null,
    null,
    null,
    'Das föderale System hat Vor- und Nachteile.',
    null,
    'Die föderale Struktur des deutschen Bildungssystems.'
  ),
  (
    'fördern',
    'verb',
    'fomentar',
    'Das Ministerium will die digitalen Kompetenzen der Schüler fördern.',
    'B1',
    null,
    null,
    'fördern',
    'El ministerio quiere fomentar las competencias digitales de los alumnos.',
    'Die Schule fördert kreatives Denken.',
    'förderte',
    'gefördert'
  ),
  (
    'gefährden',
    'verb',
    'poner en peligro',
    'Für Deutschland sind besonders Landwirtschaft und Wasserversorgung gefährdet.',
    'B2',
    null,
    null,
    'gefährden',
    'Para Alemania la agricultura y el suministro de agua están especialmente en peligro.',
    'Trockenheit gefährdet die Ernte in vielen Regionen.',
    'gefährdete',
    'gefährdet'
  ),
  (
    'gegenseitig',
    'adjective',
    'mutuamente',
    'Ambos fenómenos se amplifican mutuamente.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Effekte verstärken sich gegenseitig und werden extremer.',
    null,
    'Beide Phänomene verstärken sich gegenseitig.'
  ),
  (
    'gehen',
    'verb',
    'ir',
    'Nach dem Abitur können die Schüler zur Universität gehen.',
    'A2',
    null,
    null,
    'gehen',
    'Después del bachillerato los alumnos pueden ir a la universidad.',
    'Sie geht morgen zur Schule.',
    'ging',
    'gegangen'
  ),
  (
    'genug',
    'adjective',
    'suficiente',
    'No hay suficientes campos de entrenamiento para las mujeres.',
    'A2',
    null,
    null,
    null,
    null,
    'Wir haben genug Zeit.',
    null,
    'Es gibt nicht genug Trainingsplätze für die Frauen.'
  ),
  (
    'geordnet',
    'adjective',
    'ordenado',
    'La evacuación se desarrolló de forma ordenada.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Evakuierung verlief geordnet und ohne Panik.',
    null,
    'Die Evakuierung verlief dennoch geordnet.'
  ),
  (
    'gesamtgesellschaftlich',
    'adjective',
    'de toda la sociedad',
    'El debate representa una cuestión de toda la sociedad.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine gesamtgesellschaftliche Herausforderung.',
    null,
    'Die Debatte steht für eine gesamtgesellschaftliche Frage.'
  ),
  (
    'gesellschaftlich',
    'adjective',
    'social / de la sociedad',
    'Las competencias medidas deben ser socialmente relevantes.',
    'C1',
    null,
    null,
    null,
    null,
    'Bildung ist eine gesellschaftliche Verantwortung.',
    null,
    'Die gemessenen Kompetenzen müssen gesellschaftlich relevant sein.'
  ),
  (
    'glauben',
    'verb',
    'creer',
    'Viele Menschen glauben das nicht.',
    'A2',
    null,
    null,
    'glauben',
    'Mucha gente no lo cree.',
    'Er glaubt, dass das System fair ist.',
    'glaubte',
    'geglaubt'
  ),
  (
    'glaubwürdig',
    'adjective',
    'creíble',
    'Una respuesta creíble aún está pendiente.',
    'B2',
    null,
    null,
    null,
    null,
    'Der Verein muss eine glaubwürdige Strategie vorlegen.',
    null,
    'Eine glaubwürdige Antwort steht noch aus.'
  ),
  (
    'gleichzeitig',
    'adjective',
    'al mismo tiempo',
    'Al mismo tiempo el fútbol femenino está en auge en Alemania.',
    'B1',
    null,
    null,
    null,
    null,
    'Das kann man nicht gleichzeitig machen.',
    null,
    'Gleichzeitig boomt der Frauenfußball in Deutschland.'
  ),
  (
    'glimpflich',
    'adjective',
    'sin consecuencias graves',
    'El gran incendio tuvo un desenlace sin consecuencias graves.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Unglück ist noch glimpflich ausgegangen.',
    null,
    'Der Großbrand ist glimpflich ausgegangen.'
  ),
  (
    'groß',
    'adjective',
    'grande',
    'Es un gran día para la familia.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist ein großes Fest.',
    null,
    'Es ist ein großer Tag für die Familie.'
  ),
  (
    'grundlegend',
    'adjective',
    'fundamental / de base',
    'Si la política está dispuesta a repensar fundamentalmente el bachillerato.',
    'C1',
    null,
    null,
    null,
    null,
    'Das System braucht eine grundlegende Reform.',
    null,
    'Ob die Politik bereit ist, das Abitur grundlegend neu zu denken.'
  ),
  (
    'gut',
    'adjective',
    'bueno',
    'Los enfermeros hicieron un buen trabajo.',
    'A2',
    null,
    null,
    null,
    'Es una buena noticia.',
    'Das Team hat gute Arbeit geleistet.',
    null,
    'Die Krankenpfleger haben gute Arbeit gemacht.'
  ),
  (
    'heikel',
    'adjective',
    'delicado',
    'La situación era especialmente delicada por la composición de los pacientes.',
    'B2',
    null,
    null,
    null,
    null,
    'Das Thema ist politisch sehr heikel.',
    null,
    'Besonders heikel war die Situation wegen der Patientenstruktur.'
  ),
  (
    'heiß',
    'adjective',
    'caluroso',
    'En Europa puede volverse muy caluroso y seco.',
    'A2',
    null,
    null,
    null,
    null,
    'Der Sommer ist in Spanien sehr heiß.',
    null,
    'In Europa kann es sehr heiß und trocken werden.'
  ),
  (
    'hinausgehen über',
    'verb',
    'ir más allá de',
    'Der Einsatz wirft Fragen auf, die über den Einzelfall hinausgehen.',
    'C1',
    null,
    null,
    'hinausgehen über',
    'El operativo plantea preguntas que van más allá del caso concreto.',
    'Die Auswirkungen gehen weit über die Region hinaus.',
    'ging hinaus',
    'hinausgegangen'
  ),
  (
    'hindeuten auf',
    'verb',
    'apuntar a / indicar',
    'Ozeanographische Messdaten deuten auf ein stärkeres El-Niño-Ereignis hin.',
    'B2',
    null,
    null,
    'hindeuten auf',
    'Los datos de medición oceanográficos apuntan a un evento de El Niño más intenso.',
    'Die Daten deuten auf eine Trendwende hin.',
    'deutete hin',
    'hingedeutet'
  ),
  (
    'in Frage stellen',
    'verb',
    'cuestionar',
    'Eine Voraussetzung, die zunehmend in Frage gestellt wird.',
    'C1',
    null,
    null,
    'in Frage stellen',
    'Un requisito que se cuestiona cada vez más.',
    'Der Sinn dieser Regelung wird von vielen in Frage gestellt.',
    'stellte in Frage',
    'in Frage gestellt'
  ),
  (
    'infrastrukturell',
    'adjective',
    'infraestructural',
    'Si las preparaciones infraestructurales son suficientes se verá.',
    'B2',
    null,
    null,
    null,
    null,
    'Infrastrukturelle Maßnahmen sind für die Klimaanpassung notwendig.',
    null,
    'Ob die infrastrukturellen Vorbereitungen ausreichen, wird sich zeigen.'
  ),
  (
    'inszenieren',
    'verb',
    'escenificar / presentarse',
    'Der FC St.',
    'B2',
    null,
    null,
    'inszenieren',
    'El FC St. Pauli se presenta como un modelo alternativo al deporte profesional.',
    'Der Politiker inszeniert sich als Vertreter des Volkes.',
    'inszenierte',
    'inszeniert'
  ),
  (
    'intensiv',
    'adjective',
    'intensivo',
    'Las escuelas han ofrecido cursos de preparación intensivos.',
    'B1',
    null,
    null,
    null,
    null,
    'Sie hat intensiv für die Prüfung gelernt.',
    null,
    'Die Schulen haben intensive Vorbereitungskurse angeboten.'
  ),
  (
    'irregulär',
    'adjective',
    'irregular',
    'El calentamiento irregular del Pacífico ecuatorial fue descrito en el siglo XIX.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Phänomen ist von Natur aus irregulär.',
    null,
    'Die irreguläre Erwärmung des äquatorialen Pazifiks wurde im 19. Jahrhundert beschrieben.'
  ),
  (
    'kapitalgedeckt',
    'adjective',
    'de capitalización',
    'El gobierno federal quiere introducir un componente de capitalización.',
    'B2',
    null,
    null,
    null,
    null,
    'Ein kapitalgedecktes System verteilt das Risiko anders.',
    null,
    'Die Bundesregierung will eine kapitalgedeckte Komponente einführen.'
  ),
  (
    'klaften',
    'verb',
    'abrirse / existir',
    'Zwischen Bekenntnissen und Investitionen klafft eine Lücke.',
    'B2',
    null,
    null,
    'klaften',
    'Entre las declaraciones y las inversiones hay una brecha.',
    'Zwischen Anspruch und Wirklichkeit klafft oft eine Lücke.',
    'klaffte',
    'geklafft'
  ),
  (
    'kommunizieren',
    'verb',
    'comunicar',
    'St.',
    'B1',
    null,
    null,
    'kommunizieren',
    'St. Pauli comunica sus valores al exterior.',
    'Der Verein kommuniziert seine Ziele klar.',
    'kommunizierte',
    'kommuniziert'
  ),
  (
    'kompliziert',
    'adjective',
    'complicado',
    'El sistema de pensiones en Alemania es complicado.',
    'B1',
    null,
    null,
    null,
    null,
    'Das Thema ist sehr kompliziert.',
    null,
    'Das Rentensystem in Deutschland ist kompliziert.'
  ),
  (
    'konkret',
    'adjective',
    'concreto',
    'Pero aún no hay planes concretos.',
    'B1',
    null,
    null,
    null,
    null,
    'Wir brauchen konkrete Maßnahmen, keine leeren Versprechen.',
    null,
    'Aber konkrete Pläne gibt es noch nicht.'
  ),
  (
    'konzeptionell',
    'adjective',
    'conceptualmente',
    'El capital intergeneracional no es conceptualmente desfavorable.',
    'C1',
    null,
    null,
    null,
    null,
    'Der Ansatz ist konzeptionell interessant, aber schlecht umgesetzt.',
    null,
    'Das Generationenkapital ist konzeptionell nicht ungünstig.'
  ),
  (
    'langfristig',
    'adjective',
    'a largo plazo',
    'Los expertos advierten de que el sistema tendrá problemas a largo plazo.',
    'B1',
    null,
    null,
    null,
    null,
    'Langfristig ist diese Lösung nicht nachhaltig.',
    null,
    'Experten warnen, dass das System langfristig Probleme haben wird.'
  ),
  (
    'laufend',
    'adjective',
    'corriente / en curso',
    'Las cotizaciones de los trabajadores se usan para financiar las pensiones corrientes.',
    'C1',
    null,
    null,
    null,
    null,
    'Die laufenden Kosten werden durch Beiträge gedeckt.',
    null,
    'Die Beiträge der Erwerbstätigen werden zur Finanzierung der laufenden Renten verwendet.'
  ),
  (
    'lebendig',
    'adjective',
    'vivo / dinámico',
    'La igualdad de género forma parte de una cultura fan viva.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Fankultur bei St. Pauli ist sehr lebendig.',
    null,
    'Geschlechtergleichstellung ist Teil einer lebendigen Fankultur.'
  ),
  (
    'lernen',
    'verb',
    'aprender',
    'Die Schüler müssen viel lernen.',
    'A2',
    null,
    null,
    'lernen',
    'Los alumnos tienen que aprender mucho.',
    'Ich lerne jeden Abend Deutsch.',
    'lernte',
    'gelernt'
  ),
  (
    'löschen',
    'verb',
    'extinguir',
    'Die Feuerwehr hat das Feuer gelöscht.',
    'A2',
    null,
    null,
    'löschen',
    'Los bomberos extinguieron el fuego.',
    'Die Feuerwehr konnte das Feuer schnell löschen.',
    'löschte',
    'gelöscht'
  ),
  (
    'mangelnde',
    'adjective',
    'insuficiente / escaso',
    'La sección lucha con insuficiente atención pública.',
    'B2',
    null,
    null,
    null,
    null,
    'Mangelnde Investitionen sind das zentrale Problem.',
    null,
    'Die Abteilung kämpft mit mangelnder öffentlicher Aufmerksamkeit.'
  ),
  (
    'medikamentenbedingt',
    'adjective',
    'debido a medicamentos',
    'Los pacientes pueden tener reacciones retardadas debido a los medicamentos.',
    'C1',
    null,
    null,
    null,
    null,
    'Medikamentenbedingte Nebenwirkungen können gefährlich sein.',
    null,
    'Patienten können medikamentenbedingt reaktionsverzögert sein.'
  ),
  (
    'menschengemacht',
    'adjective',
    'de origen humano',
    'El cambio climático de origen humano amplifica los efectos.',
    'B1',
    null,
    null,
    null,
    null,
    'Der menschengemachte Klimawandel ist wissenschaftlich belegt.',
    null,
    'Der menschengemachte Klimawandel verstärkt die Effekte.'
  ),
  (
    'meteorologisch',
    'adjective',
    'meteorológico',
    'La respuesta no puede ser únicamente meteorológica.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine rein meteorologische Antwort reicht nicht aus.',
    null,
    'Die Antwort kann nicht allein meteorologisch sein.'
  ),
  (
    'nervös',
    'adjective',
    'nervioso',
    'Muchos alumnos están nerviosos.',
    'B1',
    null,
    null,
    null,
    null,
    'Er ist vor der Prüfung sehr nervös.',
    null,
    'Viele Schülerinnen und Schüler sind nervös.'
  ),
  (
    'neu',
    'adjective',
    'nuevo',
    'En Alemania hay nuevas normas para la pensión.',
    'A2',
    null,
    null,
    null,
    null,
    'Die neuen Regeln gelten ab Januar.',
    null,
    'In Deutschland gibt es neue Regeln für die Rente.'
  ),
  (
    'niemand',
    'adjective',
    'nadie',
    'Nadie murió.',
    'A2',
    null,
    null,
    null,
    null,
    'Zum Glück wurde niemand verletzt.',
    null,
    'Niemand ist gestorben.'
  ),
  (
    'offiziell',
    'adjective',
    'oficial',
    'El antirracismo forma parte de la identidad oficial del club.',
    'B1',
    null,
    null,
    null,
    null,
    'Das ist die offizielle Position des Vereins.',
    null,
    'Antirassismus gehört zum offiziellen Selbstverständnis des Klubs.'
  ),
  (
    'ozeanographisch',
    'adjective',
    'oceanográfico',
    'Los datos de medición oceanográficos apuntan a un evento de El Niño más intenso.',
    'B2',
    null,
    null,
    null,
    null,
    'Ozeanographische Forschung ist für das Klimaverständnis entscheidend.',
    null,
    'Ozeanographische Messdaten deuten auf ein stärkeres El-Niño-Ereignis hin.'
  ),
  (
    'personell',
    'adjective',
    'en cuanto a personal',
    'A los centros más pequeños les faltan los recursos de personal.',
    'C1',
    null,
    null,
    null,
    null,
    'Die personellen Ressourcen reichen nicht aus.',
    null,
    'Kleineren Einrichtungen fehlen die personellen Ressourcen.'
  ),
  (
    'plädieren',
    'verb',
    'abogar',
    'Bildungsforscher plädieren für eine Neudefinition von Prüfungskompetenzen.',
    'C1',
    null,
    null,
    'plädieren',
    'Los investigadores educativos abogan por una redefinición de las competencias de examen.',
    'Experten plädieren für eine grundlegende Schulreform.',
    'plädierte',
    'plädiert'
  ),
  (
    'professionell',
    'adjective',
    'profesional',
    'El Aachener Zeitung informó de una evacuación tranquila y profesional.',
    'B1',
    null,
    null,
    null,
    null,
    'Das Team handelte sehr professionell.',
    null,
    'Aachener Zeitung berichtete von einer ruhigen und professionellen Evakuierung.'
  ),
  (
    'prognostizieren',
    'verb',
    'pronosticar',
    'Die Modelle prognostizieren eine hohe Wahrscheinlichkeit extremer Temperaturen.',
    'C1',
    null,
    null,
    'prognostizieren',
    'Los modelos pronostican una alta probabilidad de temperaturas extremas.',
    'Wissenschaftler prognostizieren einen heißen Sommer.',
    'prognostizierte',
    'prognostiziert'
  ),
  (
    'progressiv',
    'adjective',
    'progresista',
    'St.',
    'B1',
    null,
    null,
    null,
    'El FC St. Pauli se considera uno de los clubes más progresistas de Alemania.',
    'Die Partei hat ein progressives Programm.',
    null,
    'Der FC St. Pauli gilt als einer der progressivsten Vereine Deutschlands.'
  ),
  (
    'rechtzeitig',
    'adjective',
    'a tiempo',
    'Todos los pacientes pudieron ser evacuados a tiempo.',
    'B1',
    null,
    null,
    null,
    null,
    'Zum Glück kam die Feuerwehr rechtzeitig.',
    null,
    'Alle Patienten konnten rechtzeitig evakuiert werden.'
  ),
  (
    'regelmäßig',
    'adjective',
    'regularmente',
    'El personal había realizado regularmente simulacros de incendio.',
    'B2',
    null,
    null,
    null,
    null,
    'Sie trainiert regelmäßig für Notfallsituationen.',
    null,
    'Das Personal hatte regelmäßig Brandschutzübungen absolviert.'
  ),
  (
    'registrieren',
    'verb',
    'registrar / detectar',
    'Ozeanographische Bojen registrieren Abweichungen vom mittleren Niveau.',
    'C1',
    null,
    null,
    'registrieren',
    'Las boyas oceanográficas registran desviaciones del nivel medio.',
    'Die Messstationen registrieren steigende Temperaturen.',
    'registrierte',
    'registriert'
  ),
  (
    'reparieren',
    'verb',
    'reparar',
    'Das Krankenhaus muss jetzt repariert werden.',
    'A2',
    null,
    null,
    'reparieren',
    'El hospital tiene que ser reparado ahora.',
    'Das Gebäude muss repariert werden.',
    'reparierte',
    'repariert'
  ),
  (
    'schnell',
    'adjective',
    'rápido',
    'Los bomberos llegaron rápido.',
    'A2',
    null,
    null,
    null,
    null,
    'Die Feuerwehr reagierte sehr schnell.',
    null,
    'Die Feuerwehr ist schnell gekommen.'
  ),
  (
    'schreiben',
    'verb',
    'escribir',
    'Viele Schüler schreiben ihre Abiturprüfungen.',
    'A2',
    null,
    null,
    'schreiben',
    'Muchos alumnos escriben sus exámenes de bachillerato.',
    'Er schreibt einen langen Text.',
    'schrieb',
    'geschrieben'
  ),
  (
    'schritt halten mit',
    'verb',
    'seguir el ritmo de',
    'Politische Reformen halten nicht mit der demografischen Realität Schritt.',
    'C1',
    null,
    null,
    'schritt halten mit',
    'Las reformas políticas no siguen el ritmo de la realidad demográfica.',
    'Die Gesetzgebung hält nicht mit dem technologischen Wandel Schritt.',
    'hielt Schritt',
    'Schritt gehalten'
  ),
  (
    'schrumpfen',
    'verb',
    'reducirse / menguar',
    'Gleichzeitig schrumpft die Zahl der Beitragszahler.',
    'B2',
    null,
    null,
    'schrumpfen',
    'Al mismo tiempo se reduce el número de cotizantes.',
    'Die Bevölkerung in einigen Regionen schrumpft.',
    'schrumpfte',
    'geschrumpft'
  ),
  (
    'schwer',
    'adjective',
    'difícil',
    'Los exámenes son igual de difíciles para todos los alumnos.',
    'A2',
    null,
    null,
    null,
    null,
    'Die Aufgabe ist sehr schwer.',
    null,
    'Die Prüfungen sind für alle Schüler gleich schwer.'
  ),
  (
    'selbstverständlich',
    'adjective',
    'obvio / natural',
    'La protección contra incendios no debería darse por obvia.',
    'C1',
    null,
    null,
    null,
    null,
    'Gute Vorbereitung ist nicht selbstverständlich.',
    null,
    'Brandschutz sollte nicht als selbstverständlich vorausgesetzt werden.'
  ),
  (
    'sensibel',
    'adjective',
    'sensible / delicado',
    'No dar por sentado la protección contra incendios en instituciones delicadas.',
    'C1',
    null,
    null,
    null,
    null,
    'Psychiatrische Kliniken sind besonders sensible Einrichtungen.',
    null,
    'Brandschutz in sensiblen Einrichtungen nicht als selbstverständlich voraussetzen.'
  ),
  (
    'sicher',
    'adjective',
    'seguro',
    'Los pacientes estaban a salvo.',
    'A2',
    null,
    null,
    null,
    null,
    'Das Gebäude ist jetzt wieder sicher.',
    null,
    'Die Patienten waren in Sicherheit.'
  ),
  (
    'sparen',
    'verb',
    'ahorrar',
    'Energie sparen ist eine wichtige Maßnahme.',
    'A2',
    null,
    null,
    'sparen',
    'Ahorrar energía es una medida importante.',
    'Wir sollten mehr Wasser sparen.',
    'sparte',
    'gespart'
  ),
  (
    'sperren',
    'verb',
    'cerrar / bloquear',
    'Der betroffene Gebäudeflügel bleibt bis auf Weiteres gesperrt.',
    'B1',
    null,
    null,
    'sperren',
    'El ala del edificio afectada permanece cerrada hasta nuevo aviso.',
    'Die Straße wurde nach dem Unfall gesperrt.',
    'sperrte',
    'gesperrt'
  ),
  (
    'sportpolitisch',
    'adjective',
    'de política deportiva',
    'Para el FC St. Pauli eso es una cuestión de política deportiva.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine wichtige sportpolitische Entscheidung.',
    null,
    'Für den FC St. Pauli ist das eine sportpolitische Frage.'
  ),
  (
    'staatlich',
    'adjective',
    'estatal',
    'Una solución de fondos administrada por el Estado según el modelo escandinavo.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Programm wird staatlich gefördert.',
    null,
    'Eine staatlich verwaltete Fondslösung nach skandinavischem Vorbild.'
  ),
  (
    'stabil',
    'adjective',
    'estable',
    'El gobierno dice: el sistema es estable.',
    'A2',
    null,
    null,
    null,
    null,
    'Das System ist stabil und sicher.',
    null,
    'Die Regierung sagt: Das System ist stabil.'
  ),
  (
    'stark',
    'adjective',
    'fuerte',
    'En algunos años El Niño es muy fuerte.',
    'A2',
    null,
    null,
    null,
    null,
    'Der Sturm war sehr stark.',
    null,
    'In manchen Jahren ist El Niño sehr stark.'
  ),
  (
    'statistisch',
    'adjective',
    'estadístico',
    'La investigación de atribución puede hablar con alta certeza estadística.',
    'C1',
    null,
    null,
    null,
    null,
    'Die statistischen Belege sind eindeutig.',
    null,
    'Die Attributionsforschung kann mit hoher statistischer Sicherheit sprechen.'
  ),
  (
    'stellvertretend',
    'adjective',
    'representativo / en nombre de',
    'El debate en St. Pauli es representativo de una cuestión social global.',
    'C1',
    null,
    null,
    null,
    null,
    'Dieser Fall steht stellvertretend für viele ähnliche Situationen.',
    null,
    'Die Debatte bei St. Pauli steht stellvertretend für eine gesamtgesellschaftliche Frage.'
  ),
  (
    'stolz',
    'adjective',
    'orgulloso',
    'Muchos alumnos están nerviosos pero también orgullosos.',
    'B1',
    null,
    null,
    null,
    null,
    'Sie ist sehr stolz auf ihre Note.',
    null,
    'Viele Schülerinnen und Schüler sind nervös, aber auch stolz.'
  ),
  (
    'strukturell',
    'adjective',
    'estructural',
    'El dilema estructural es conocido.',
    'C1',
    null,
    null,
    null,
    'Precios récord: ¿corrección de mercado o transición estructural del transporte?',
    'Das ist ein strukturelles Problem im Bildungssystem.',
    null,
    'Das strukturelle Dilemma ist bekannt.'
  ),
  (
    'systematisch',
    'adjective',
    'sistemáticamente',
    'Un componente de capitalización favorece sistemáticamente a quienes tienen ahorros.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Problem wird systematisch ignoriert.',
    null,
    'Eine kapitalgedeckte Komponente begünstigt systematisch diejenigen mit Ersparnissen.'
  ),
  (
    'tastend',
    'adjective',
    'tentativo / a tientas',
    'La autorización cautelosa es un paso tentativo.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Regierung macht tastende Schritte in Richtung Reform.',
    null,
    'Die vorsichtige Zulassung ist ein tastender Schritt.'
  ),
  (
    'teilnehmen',
    'verb',
    'participar',
    'Mehr als 90.000 Schülerinnen und Schüler nehmen am Abitur teil.',
    'B1',
    null,
    null,
    'teilnehmen',
    'Más de 90.000 alumnos participan en el bachillerato.',
    'Viele Schüler nehmen an dem Kurs teil.',
    'nahm teil',
    'teilgenommen'
  ),
  (
    'thematisieren',
    'verb',
    'abordar / tratar como tema',
    'Eine Vulnerabilität, die in der Öffentlichkeit selten thematisiert wird.',
    'C1',
    null,
    null,
    'thematisieren',
    'Una vulnerabilidad que raramente se aborda en público.',
    'Das Problem wird in den Medien kaum thematisiert.',
    'thematisierte',
    'thematisiert'
  ),
  (
    'tradiert',
    'adjective',
    'tradicional / transmitido',
    'El bachillerato se encuentra entre la exigencia de rendimiento tradicional y la realidad digital.',
    'C1',
    null,
    null,
    null,
    null,
    'Tradierte Werte verlieren in der modernen Gesellschaft an Bedeutung.',
    null,
    'Das Abitur steht zwischen tradiertem Leistungsanspruch und digitaler Realität.'
  ),
  (
    'traurig',
    'adjective',
    'triste',
    'Muchos aficionados están tristes.',
    'A2',
    null,
    null,
    null,
    null,
    'Sie ist sehr traurig über das Ergebnis.',
    null,
    'Viele Fans sind traurig.'
  ),
  (
    'trocken',
    'adjective',
    'seco',
    'En Europa puede volverse muy caluroso y seco.',
    'A2',
    null,
    null,
    null,
    null,
    'Der Sommer war sehr trocken.',
    null,
    'In Europa kann es sehr heiß und trocken werden.'
  ),
  (
    'umstritten',
    'adjective',
    'controvertido',
    'Un mecanismo políticamente controvertido.',
    'B2',
    null,
    null,
    null,
    null,
    'Die neue Regelung ist sehr umstritten.',
    null,
    'Ein Mechanismus, der politisch umstritten ist.'
  ),
  (
    'unangetastet',
    'adjective',
    'intacto / sin tocar',
    'Los problemas reales del sistema permanecen intactos.',
    'C1',
    null,
    null,
    null,
    null,
    'Die strukturellen Ursachen bleiben weiterhin unangetastet.',
    null,
    'Die tatsächlichen Probleme des Systems bleiben unangetastet.'
  ),
  (
    'uneinheitlich',
    'adjective',
    'poco uniforme / inconsistente',
    'Las normativas son poco uniformes y difíciles de comprender.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Regeln sind leider sehr uneinheitlich.',
    null,
    'Die Regelungen sind uneinheitlich und schwer nachzuvollziehen.'
  ),
  (
    'ungerecht',
    'adjective',
    'injusto',
    '¿Puede un club como St. Pauli ser tan injusto?',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist wirklich ungerecht.',
    null,
    'Kann ein Verein wie St. Pauli so ungerecht sein?'
  ),
  (
    'unterbringen',
    'verb',
    'alojar / ubicar',
    'Die Patienten wurden in anderen Bereichen der Klinik untergebracht.',
    'B2',
    null,
    null,
    'unterbringen',
    'Los pacientes fueron alojados en otras zonas de la clínica.',
    'Die Evakuierten wurden in einer Sporthalle untergebracht.',
    'brachte unter',
    'untergebracht'
  ),
  (
    'untersuchen',
    'verb',
    'investigar / examinar',
    'Die Polizei hat untersucht, warum das Feuer begonnen hat.',
    'A2',
    null,
    null,
    'untersuchen',
    'La policía investigó por qué empezó el incendio.',
    'Der Arzt untersucht den Patienten.',
    'untersuchte',
    'untersucht'
  ),
  (
    'untrennbar',
    'adjective',
    'indisoluble / inseparable',
    'La posición política y la identidad del club están indisolublemente vinculadas.',
    'C1',
    null,
    null,
    null,
    null,
    'Identität und Werte sind untrennbar verbunden.',
    null,
    'Politische Haltung und Vereinsidentität sind untrennbar miteinander verknüpft.'
  ),
  (
    'veraltet',
    'adjective',
    'anticuado / obsoleto',
    'La sección lucha con infraestructura obsoleta.',
    'B2',
    null,
    null,
    null,
    null,
    'Die veraltete Technik muss ersetzt werden.',
    null,
    'Die Abteilung kämpft mit veralteter Infrastruktur.'
  ),
  (
    'verantwortlich',
    'adjective',
    'responsable',
    'El Niño por sí solo no es responsable del calentamiento.',
    'B1',
    null,
    null,
    null,
    null,
    'Wer ist für diese Entscheidung verantwortlich?',
    null,
    'El Niño allein ist nicht für die Erwärmung verantwortlich.'
  ),
  (
    'verdienen',
    'verb',
    'ganar (dinero)',
    'Wer viel verdient, bekommt nicht mehr Rente.',
    'A2',
    null,
    null,
    'verdienen',
    'Quien gana mucho no recibe más pensión.',
    'Er verdient viel Geld als Ingenieur.',
    'verdiente',
    'verdient'
  ),
  (
    'verhindern',
    'verb',
    'evitar / impedir',
    'Feuerwehr verhindert Katastrophe.',
    'B1',
    null,
    null,
    'verhindern',
    'Los bomberos evitan una catástrofe.',
    'Das schnelle Handeln verhinderte Schlimmeres.',
    'verhinderte',
    'verhindert'
  ),
  (
    'verknüpfen',
    'verb',
    'vincular / enlazar',
    'Der Klub hat politische Haltung und Vereinsidentität untrennbar miteinander verknüpft.',
    'C1',
    null,
    null,
    'verknüpfen',
    'El club ha vinculado indisolublemente la posición política y la identidad del club.',
    'Werte und Handeln müssen miteinander verknüpft sein.',
    'verknüpfte',
    'verknüpft'
  ),
  (
    'verschlechtern',
    'verb',
    'empeorar',
    'Die Altenquote verschlechtert sich jährlich.',
    'C1',
    null,
    null,
    'verschlechtern',
    'La tasa de envejecimiento empeora cada año.',
    'Die finanzielle Lage des Systems verschlechtert sich.',
    'verschlechterte',
    'verschlechtert'
  ),
  (
    'verstärken',
    'verb',
    'intensificar / amplificar',
    'Der menschengemachte Klimawandel verstärkt die Effekte zusätzlich.',
    'B1',
    null,
    null,
    'verstärken',
    'El cambio climático de origen humano amplifica adicionalmente los efectos.',
    'Der Wind verstärkt die Wirkung der Kälte.',
    'verstärkte',
    'verstärkt'
  ),
  (
    'verändern',
    'verb',
    'cambiar',
    'Das Klima verändert sich.',
    'A2',
    null,
    null,
    'verändern',
    'El clima está cambiando.',
    'Das Wetter verändert sich immer schneller.',
    'veränderte',
    'verändert'
  ),
  (
    'viel',
    'adjective',
    'mucho',
    'Quien gana mucho no recibe más pensión.',
    'A2',
    null,
    null,
    null,
    null,
    'Er hat viel gearbeitet und bekommt eine gute Rente.',
    null,
    'Wer viel verdient, bekommt nicht mehr Rente.'
  ),
  (
    'voraussetzen',
    'verb',
    'presuponer / requerir',
    'Die Legitimation setzt voraus, dass die gemessenen Kompetenzen relevant sind.',
    'C1',
    null,
    null,
    'voraussetzen',
    'La legitimación requiere que las competencias medidas sean relevantes.',
    'Gutes Schreiben setzt voraus, dass man viel liest.',
    'setzte voraus',
    'vorausgesetzt'
  ),
  (
    'vorbereiten',
    'verb',
    'prepararse',
    'Die Menschen sollen sich vorbereiten.',
    'A2',
    null,
    null,
    'vorbereiten',
    'La gente debe prepararse.',
    'Wir müssen uns auf den Sommer vorbereiten.',
    'bereitete vor',
    'vorbereitet'
  ),
  (
    'vorindustriell',
    'adjective',
    'preindustrial',
    'El Niño manifiesta efectos más extremos que en la época preindustrial.',
    'C1',
    null,
    null,
    null,
    null,
    'Die vorindustrielle Zeit kannte deutlich weniger Extremereignisse.',
    null,
    'El Niño entfaltet extremere Wirkungen als in vorindustrieller Zeit.'
  ),
  (
    'vorsichtig',
    'adjective',
    'cauteloso',
    'La autorización cautelosa de recursos auxiliares digitales.',
    'C1',
    null,
    null,
    null,
    null,
    'Man sollte vorsichtig mit neuen Technologien umgehen.',
    null,
    'Die vorsichtige Zulassung digitaler Hilfsmittel.'
  ),
  (
    'warm',
    'adjective',
    'cálido / caliente',
    'El agua caliente del océano cambia el tiempo.',
    'A2',
    null,
    null,
    null,
    null,
    'Das Wasser im Pazifik ist sehr warm.',
    null,
    'Das warme Wasser im Ozean verändert das Wetter.'
  ),
  (
    'warnen',
    'verb',
    'advertir',
    'Experten warnen, dass das System Probleme haben wird.',
    'B1',
    null,
    null,
    'warnen',
    'Los expertos advierten de que el sistema tendrá problemas.',
    'Klimaforscher warnen vor den Folgen des Klimawandels.',
    'warnte',
    'gewarnt'
  ),
  (
    'warnen vor',
    'verb',
    'advertir de',
    'Wissenschaftler warnen vor einem starken El-Niño-Ereignis.',
    'B1',
    null,
    null,
    'warnen vor',
    'Los científicos advierten de un fuerte evento de El Niño.',
    'Experten warnen vor einer langen Trockenheit.',
    'warnte',
    'gewarnt'
  ),
  (
    'wichtig',
    'adjective',
    'importante',
    'El bachillerato es muy importante.',
    'A2',
    null,
    null,
    null,
    null,
    'Lernen ist sehr wichtig.',
    null,
    'Das Abitur ist sehr wichtig.'
  ),
  (
    'zahlen',
    'verb',
    'pagar',
    'Jeder zahlt jeden Monat einen Teil seines Gehalts in die Rentenkasse.',
    'B1',
    null,
    null,
    'zahlen',
    'Cada persona paga mensualmente una parte de su sueldo a la caja de pensiones.',
    'Sie zahlt seit Jahren in die Rentenkasse.',
    'zahlte',
    'gezahlt'
  ),
  (
    'zurückführen',
    'verb',
    'atribuir',
    'Bildungsexperten führen den Anstieg auf stärkere Geburtsjahrgänge zurück.',
    'B2',
    null,
    null,
    'zurückführen',
    'Los expertos en educación atribuyen el aumento a generaciones más numerosas.',
    'Den Fehler führt man auf mangelnde Vorbereitung zurück.',
    'führte zurück',
    'zurückgeführt'
  ),
  (
    'äquatorial',
    'adjective',
    'ecuatorial',
    'Las temperaturas superficiales en el Pacífico ecuatorial están por encima de la media.',
    'B2',
    null,
    null,
    null,
    null,
    'Die äquatorialen Regionen erwärmen sich besonders stark.',
    null,
    'Die Oberflächentemperaturen im äquatorialen Pazifik liegen über dem Mittel.'
  ),
  (
    'öffentlichkeitswirksam',
    'adjective',
    'con gran impacto público',
    'Mientras el club defiende públicamente la igualdad con gran impacto.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Kampagne war sehr öffentlichkeitswirksam.',
    null,
    'Während der Verein öffentlichkeitswirksam für Gleichstellung eintritt.'
  ),
  (
    'überdurchschnittlich',
    'adjective',
    'por encima de la media',
    'Los modelos pronostican una probabilidad por encima de la media.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Temperaturen lagen überdurchschnittlich hoch.',
    null,
    'Die Modelle prognostizieren eine überdurchschnittlich hohe Wahrscheinlichkeit.'
  ),
  (
    'übernehmen',
    'verb',
    'asumir / hacerse cargo',
    'Maschinen sollen die Arbeit nicht übernehmen.',
    'B1',
    null,
    null,
    'übernehmen',
    'Las máquinas no deben hacerse cargo del trabajo.',
    'Die neue Mitarbeiterin übernimmt die Aufgabe.',
    'übernahm',
    'übernommen'
  ),
  (
    'überschreiten',
    'verb',
    'superar',
    'Wer ein bestimmtes Einkommen überschreitet, bekommt nicht mehr Rente.',
    'B1',
    null,
    null,
    'überschreiten',
    'Quien supera unos ingresos determinados no recibe más pensión.',
    'Er hat die erlaubte Grenze überschritten.',
    'überschritt',
    'überschritten'
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
    'das-abitur-2026-beginnt',
    'A2',
    'das Abitur'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'die Prüfung'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'der Schüler'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'die Schule'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'die Familie'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'die Universität'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'der Beruf'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'der Tag'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'lernen'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'schreiben'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'feiern'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'gehen'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'wichtig'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'schwer'
  ),
  (
    'das-abitur-2026-beginnt',
    'A2',
    'groß'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'die Prüfungsphase'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'die Änderung'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'das Hilfsmittel'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'die Kompetenz'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'das Ministerium'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'der Vorbereitungskurs'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'die Panik'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'teilnehmen'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'fördern'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'empfehlen'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'übernehmen'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'digital'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'intensiv'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'nervös'
  ),
  (
    'das-abitur-2026-beginnt',
    'B1',
    'stolz'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'der Leistungsdruck'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'die Zulassung'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'das Endgerät'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'die Eigenleistung'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'der Lehrerverband'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'die Bildungsbeteiligung'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'die Textgenerierung'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'antreten'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'betonen'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'fordern'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'zurückführen'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'begrenzt'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'uneinheitlich'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'föderál'
  ),
  (
    'das-abitur-2026-beginnt',
    'B2',
    'erheblich'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'der Leistungsanspruch'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'der Befähigungsnachweis'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'die Legitimation'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'die Reproduktion'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'die Neudefinition'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'die Quellenprüfung'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'die Zersplitterung'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'das Dilemma'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'bewältigen'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'plädieren'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'voraussetzen'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'in Frage stellen'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'tradiert'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'durchdigitalisiert'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'fraglich'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'strukturell'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'gesellschaftlich'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'grundlegend'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'tastend'
  ),
  (
    'das-abitur-2026-beginnt',
    'C1',
    'vorsichtig'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'der Verein'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'die Mannschaft'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'das Geld'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'der Trainingsplatz'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'die Lösung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'der Wert'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'fragen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'finden'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'bekommen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'bekannt'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'traurig'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'ungerecht'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'besonder-'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'genug'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'A2',
    'groß'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'das Selbstverständnis'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'die Investition'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'der Widerspruch'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'die Bedingung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'der Trend'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'die Abteilung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'der Zuschauer'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'ankündigen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'fordern'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'kommunizieren'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'boomen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'progressiv'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'konkret'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'offiziell'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B1',
    'gleichzeitig'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'der Gegenentwurf'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'das Bekenntnis'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'die Infrastruktur'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'das Marketinginstrument'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'der Handlungsbedarf'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'der Spielraum'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'die Lücke'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'die Fangemeinde'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'inszenieren'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'einräumen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'klaften'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'veraltet'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'glaubwürdig'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'mangelnde'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'B2',
    'auffällig'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'das Selbstbild'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'die Benachteiligung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'die Geschlechtergleichstellung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'die Priorisierungsentscheidung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'die Neujustierung'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'die Glaubwürdigkeit'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'der Haushaltsposten'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'die Fankultur'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'verknüpfen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'eintreten für'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'ergreifen'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'stellvertretend'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'untrennbar'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'öffentlichkeitswirksam'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'annähernd'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'gesamtgesellschaftlich'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'strukturell'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'sportpolitisch'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'lebendig'
  ),
  (
    'frauenfussball-beim-fc-st-pauli-hat-probleme',
    'C1',
    'bloß'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'die Rente'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'das Geld'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'das Gesetz'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'die Regel'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'das Alter'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'die Regierung'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'das System'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'verdienen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'arbeiten'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'glauben'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'stabil'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'neu'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'alt'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'genug'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'A2',
    'viel'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'der Rentenwert'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'das Einkommen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'die Rentenkasse'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'das Gehalt'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'der Arbeitnehmer'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'die Reform'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'die Grenze'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'überschreiten'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'zahlen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'warnen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'abhängen von'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'langfristig'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'aktuell'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'kompliziert'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B1',
    'bestimmt'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'die Strukturkrise'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'die Schieflage'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'der Rentenanspruch'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'die Finanzierungslücke'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'der Beitragszahler'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'die Fondslösung'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'die Inflationsrate'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'schrumpfen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'einführen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'altern'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'bezweifeln'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'umstritten'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'kapitalgedeckt'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'absehbar'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'B2',
    'demografisch'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'das Flickwerk'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'das Umlageverfahren'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'die Altenquote'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'das Generationenkapital'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'die Rentenanpassung'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'das Verteilungsproblem'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'die Lebensarbeitszeit'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'die Ersparnisse'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'das Vorbild'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'verschlechtern'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'begünstigen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'schritt halten mit'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'konzeptionell'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'ausgewogen'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'unangetastet'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'staatlich'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'systematisch'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'dimensioniert'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'ehrlich'
  ),
  (
    'neue-regeln-fuer-die-rente-in-deutschland',
    'C1',
    'laufend'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'das Krankenhaus'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'die Feuerwehr'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'das Feuer'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'der Patient'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'die Sicherheit'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'die Polizei'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'die Arbeit'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'löschen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'untersuchen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'reparieren'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'groß'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'schnell'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'sicher'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'gut'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'A2',
    'niemand'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'der Großbrand'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'die Einsatzkraft'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'die Evakuierung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'die Brandursache'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'das Pflegepersonal'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'die Ermittlung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'der Gebäudeflügel'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'ausbrechen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'verhindern'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'sperren'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'evakuieren'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'professionell'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'rechtzeitig'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'betroffen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B1',
    'ernsthaft'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'der Großeinsatz'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'die Brandschutzübung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'die Patientenstruktur'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'der Sachschaden'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'die Brandstiftung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'die Freigabe'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'die Begleitung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'absolvieren'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'ausschließen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'unterbringen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'auslösen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'heikel'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'geordnet'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'regelmäßig'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'B2',
    'ausdrücklich'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'die Vulnerabilität'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'das Spannungsfeld'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'die Schutzpflicht'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'die Notfallvorbereitung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'die Stationsführung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'der Einzelfall'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'die Einrichtung'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'aufwerfen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'hinausgehen über'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'thematisieren'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'voraussetzen'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'glimpflich'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'medikamentenbedingt'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'desorientiert'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'strukturell'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'personell'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'systematisch'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'eindeutig'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'sensibel'
  ),
  (
    'brand-in-einem-krankenhaus-in-aachen',
    'C1',
    'selbstverständlich'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'das Wetter'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'der Ozean'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'das Klima'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'die Maßnahme'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'der Sturm'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'die Energie'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'der Wissenschaftler'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'vorbereiten'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'verändern'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'sparen'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'heiß'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'trocken'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'stark'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'warm'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'A2',
    'wichtig'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'die Hitzewelle'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'die Erwärmung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'die Meeresströmung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'die Auswirkung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'der Vorbote'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'der Waldband'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'der Klimawandel'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'warnen vor'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'beeinflussen'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'verstärken'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'betonen'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'menschengemacht'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'intensiv'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'betroffen'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B1',
    'verantwortlich'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'das Messdatum'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'das Zirkulationsmuster'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'das Niederschlagsverhalten'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'die Wasserversorgung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'das Hitzefrühwarnsystem'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'die Oberflächentemperatur'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'die Wahrscheinlichkeit'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'hindeuten auf'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'aktivieren'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'gefährden'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'ozeanographisch'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'äquatorial'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'atmosphärisch'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'infrastrukturell'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'B2',
    'frühzeitig'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Variabilität'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Einflussnahme'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Zurechnung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Attributionsforschung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Abweichung'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Boje'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Dürre'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'die Häufigkeit'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'entfalten'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'prognostizieren'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'registrieren'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'anthropogen'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'vorindustriell'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'irregulär'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'beunruhigend'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'überdurchschnittlich'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'statistisch'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'meteorologisch'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'demokratisch'
  ),
  (
    'el-nino-was-ist-das-und-was-bedeutet-es-fuer-europa',
    'C1',
    'gegenseitig'
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

