-- ============================================================
-- Seed generated from structured TXT
-- Source: /Users/sam/Documents/imKontext/backend/anadir_a_supabase/imKontext Variado April2026.txt
-- Tables: texts, text_versions, vocabulario, text_version_vocabulary
-- ============================================================

-- Theme 1: Benzin ist teuer – immer mehr Menschen kaufen E-Autos
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Benzin ist teuer – immer mehr Menschen kaufen E-Autos',
  null,
  'premium',
  now(),
  'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos'),
  'A2',
  'In Deutschland kostet Benzin gerade sehr viel Geld. Der Preis ist auf einem Rekord. Viele Menschen müssen mehr bezahlen, wenn sie Auto fahren.

Deshalb kaufen immer mehr Menschen ein Elektroauto. Das Elektroauto braucht keinen Benzin. Es braucht nur Strom. Das ist billiger.

Die Bundesregierung möchte, dass mehr Menschen Elektroautos kaufen. Es gibt Geld vom Staat für neue E-Autos. Viele Automarken haben neue Elektromodelle.'
),
(
  (select id from texts where slug = 'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos'),
  'B1',
  'Die Benzin- und Dieselpreise in Deutschland haben im April 2026 einen neuen Höchststand erreicht. Ein Liter Super kostet an vielen Tankstellen mehr als 2,10 Euro. Verbraucher spüren das besonders beim Pendeln und auf langen Fahrten.

Die hohen Spritpreise haben eine direkte Folge: Die Nachfrage nach Elektroautos steigt. Im ersten Quartal 2026 wurden in Deutschland rund 18 Prozent mehr E-Autos verkauft als im gleichen Zeitraum des Vorjahres. Besonders beliebt sind günstigere Modelle aus Deutschland und aus China.

Experten sagen, dass der Trend anhalten wird, wenn die Ladeinfrastruktur weiter verbessert wird. Derzeit fehlen in vielen ländlichen Regionen noch ausreichend Ladesäulen. Die Bundesregierung hat ein Ausbauprogramm angekündigt, das bis 2027 eine Million öffentliche Ladepunkte schaffen soll.'
),
(
  (select id from texts where slug = 'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos'),
  'B2',
  'Deutschland erlebt im April 2026 die höchsten Kraftstoffpreise seit Beginn der Aufzeichnungen. Ein Liter Superbenzin kostet bundesweit im Schnitt 2,14 Euro, Diesel liegt knapp darunter. Ursache ist eine Kombination aus globalen Rohstoffengpässen, der anhaltenden geopolitischen Lage im Nahen Osten und der CO2-Bepreisung, die zum Jahresanfang erneut angehoben wurde.

Die wirtschaftliche Belastung für Pendlerinnen und Pendler ist erheblich: Wer täglich 30 Kilometer zur Arbeit fährt, gibt inzwischen rund 180 Euro monatlich allein für Benzin aus. Das verstärkt den Druck, auf emissionsfreie Alternativen umzusteigen. Die Neuzulassungen von Elektrofahrzeugen stiegen im ersten Quartal um 18,4 Prozent – erstmals überholten E-Autos die Dieselfahrzeuge in den Verkaufszahlen.

Dennoch bleibt der Hochlauf des E-Auto-Marktes fragil. Die Ladeinfrastruktur in strukturschwachen Regionen ist nach wie vor lückenhaft, und viele Haushalte können sich die Anschaffungskosten nicht leisten, selbst bei staatlicher Förderung. Der Umstieg auf Elektromobilität vollzieht sich bislang vor allem in städtischen Haushalten mit höheren Einkommen.'
),
(
  (select id from texts where slug = 'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos'),
  'C1',
  'Der Rekordstand der Kraftstoffpreise im April 2026 hat eine bekannte Debatte neu entfacht: Sind hohe Energiepreise das wirksamste Instrument zur Beschleunigung der Mobiliätswende – oder sind sie primär eine Belastung für einkommensschwache Haushalte, die auf das Auto angewiesen sind und keine Möglichkeit haben, kurzfristig auf Elektromobilität umzusteigen?

Die Antwort ist, wie so oft in der Klimapolitik, verteilungspolitisch komplex. Wer in einer gut erschlossenen Stadt wohnt, über ein ausreichendes Einkommen verfügt und eine Garage mit Lademoglichkeit hat, dem eröffnen hohe Spritpreise einen rationalen Umstiegsanreiz. Für Pendlerinnen ohne diese Voraussetzungen sind dieselben Preise schlicht eine Kostensteigerung ohne Alternative.

Die Zulassungszahlen spiegeln dieses Bild: Das Wachstum im E-Auto-Segment konzentriert sich auf Großstädte und wohlhabende Regionen. In strukturschwachen ländlichen Kreisen stagniert der Elektroanteil, während die Verkehrsbelastung durch hohe Spritkosten wächst. Eine Mobiliätswende, die diese Spaltung vertieft, ist sozial nicht nachhaltig.

Was fehlt, ist eine Gesamtpolitik, die Preisinstrumente mit Infrastrukturinvestitionen, OPNV-Ausbau und gezielter sozialer Kompensation verbindet. Ohne diesen Rahmen bleibt die Verkehrswende ein Projekt der Privilegierten.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 2: SC Freiburg spielt in Europa
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'SC Freiburg spielt in Europa',
  null,
  'premium',
  now(),
  'sc-freiburg-spielt-in-europa'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'sc-freiburg-spielt-in-europa'),
  'A2',
  'Der SC Freiburg ist ein Fußballverein aus Baden-Württemberg. Er spielt in der Europa League. Das ist ein wichtiger Wettbewerb in Europa.

Am 9. April hat Freiburg gegen Celta Vigo aus Spanien gespielt. Das Spiel war das Viertelfinal-Hinspiel. Viele Fans haben das Spiel im Stadion und im Fernsehen gesehen.

Freiburg ist ein kleiner Verein, aber er spielt sehr gut. Die Fans sind sehr stolz. Das Spiel war spannend und wichtig für die nächste Runde.'
),
(
  (select id from texts where slug = 'sc-freiburg-spielt-in-europa'),
  'B1',
  'Der SC Freiburg hat am Mittwochabend das Viertelfinal-Hinspiel der Europa League gegen den spanischen Club Celta Vigo bestritten. Das Spiel fand im Freiburger Europa-Park Stadion statt und wurde live auf RTL übertragen.

Für den SC Freiburg ist es eine historische Saison: Zum zweiten Mal überhaupt hat sich der Verein für ein europäisches Viertelfinale qualifiziert. Besonderes Augenmerk lag auf dem 20-jährigen Talent Johan Manzambi, der in dieser Saison mit starken Leistungen auf sich aufmerksam gemacht hat.

Das Rückspiel findet in zwei Wochen in Vigo statt. Freiburg gilt als Außenseiter, hat aber in dieser Saison mehrfach bewiesen, dass es mit großen Vereinen mithalten kann. Die Fans in der Region fiebern mit.'
),
(
  (select id from texts where slug = 'sc-freiburg-spielt-in-europa'),
  'B2',
  'Mit dem Anpfiff gegen Celta Vigo hat der SC Freiburg ein weiteres Kapitel seiner bemerkenswerten europäischen Geschichte aufgeschlagen. Das Viertelfinal-Hinspiel der Europa League war für den badischen Bundesligisten nicht nur sportlich, sondern auch wirtschaftlich von erheblicher Bedeutung – ein Halbfinaleinzug würde Millioneneinnahmen bedeuten, die dem Verein weiteren strukturellen Aufbau ermöglichen könnten.

Im Mittelpunkt der Aufmerksamkeit stand einmal mehr Johan Manzambi, 20 Jahre alt, in dieser Saison mit zwölf Toren und sieben Vorlagen der auffälligste Spieler im Kader von Trainer Julian Brechtel. Mehrere europäische Topklubs sollen Interesse signalisiert haben, doch Freiburg hält bislang an seinem Jungstar fest.

Der Verein symbolisiert ein Modell, das in der modernen Fußballwirtschaft als fast anachronistisch gilt: solide Haushaltsführung, Nachwuchsförderung statt Transferwahnsinn, Kontinuität im Trainerteam. Dass dieses Modell europäische Viertelfinales produziert, ist für die Skeptiker des Geldfußballs ein starkes Argument.'
),
(
  (select id from texts where slug = 'sc-freiburg-spielt-in-europa'),
  'C1',
  'Das Viertelfinale der Europa League ist für den SC Freiburg mehr als ein sportliches Ereignis. Es ist der vorläufige Höhepunkt eines Vereinsprojekts, das in der zunehmend finanzdominierten Welt des europäischen Fußballs einen strukturellen Gegenentwurf repräsentiert – und damit eine Frage aufwirft, die über den Sport hinausgeht: Ist nachhaltiges Wirtschaften und sportlicher Erfolg vereinbar?

Die Zahlen legen nahe: unter bestimmten Bedingungen ja. Freiburg betreibt seit Jahren eine der effizientesten Nachwuchsabteilungen der Bundesliga, hält die Personalkosten relativ zur Einnahmenstruktur niedrig und setzt auf Trainerkontinuität als Wettbewerbsvorteil. Das Ergebnis ist kein Zufall, sondern die Frucht eines institutionellen Geduldigkeit, die im modernen Fußball selten geworden ist.

Johan Manzambi, 20 Jahre, steht symptomatisch für diesen Ansatz: entwickelt im eigenen Nachwuchs, gezielt gefördert, jetzt auf internationalem Niveau angekommen. Sein Marktwert wird auf über 40 Millionen Euro geschätzt. Der Verein steht vor der Entscheidung, die fast jeder Bundesligist kennt: Verkaufen und finanzieren, oder halten und riskieren.

Was Freiburg in dieser Saison zeigt, ist keine Blaupause für alle, aber ein Beweis, dass strukturelle Klugheit auch ohne Petrodollar wettbewerbsfähig sein kann – zumindest bis zu einem gewissen Punkt.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 3: Viele Jugendliche sind süchtig nach ihrem Handy
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Viele Jugendliche sind süchtig nach ihrem Handy',
  null,
  'premium',
  now(),
  'viele-jugendliche-sind-suechtig-nach-ihrem-handy'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'viele-jugendliche-sind-suechtig-nach-ihrem-handy'),
  'A2',
  'Viele Kinder und Jugendliche in Deutschland benutzen ihr Handy sehr viel. Manchmal zu viel. Das nennt man Handysucht.

Handysucht ist ein Problem. Die Kinder schlafen schlecht, lernen weniger und treffen sich seltener mit Freunden. Die Eltern machen sich Sorgen.

Experten sagen: Man soll das Handy nicht mehr als zwei Stunden pro Tag benutzen. Und am Abend soll man das Handy früh weglegen. Das ist gesund.'
),
(
  (select id from texts where slug = 'viele-jugendliche-sind-suechtig-nach-ihrem-handy'),
  'B1',
  'Eine neue Studie der Bundeszentrale für gesundheitliche Aufklärung zeigt: Mehr als ein Drittel der Jugendlichen in Deutschland zwischen 12 und 17 Jahren zeigt Anzeichen von problematischem Smartphone-Nutzung. Sie greifen durchschnittlich alle sieben Minuten zum Handy – auch nachts.

Die Folgen sind deutlich: Schlafmangel, schlechtere Schulleistungen und weniger soziale Kontakte in der realen Welt. Besonders Social-Media-Apps und Videoplattformen sind für die langen Nutzungszeiten verantwortlich. Die Algorithmen dieser Plattformen sind darauf ausgelegt, die Aufmerksamkeit so lange wie möglich zu halten.

Viele Eltern wissen nicht, wie sie das Thema ansprechen sollen. Experten empfehlen: gemeinsame Regeln statt Verbote, handyfreie Zeiten beim Essen und keine Bildschirme im Schlafzimmer. Schulen sollen das Thema Medienkompetenzen stärker in den Unterricht integrieren.'
),
(
  (select id from texts where slug = 'viele-jugendliche-sind-suechtig-nach-ihrem-handy'),
  'B2',
  'Die jüngste Erhebung der Bundeszentrale für gesundheitliche Aufklärung zeichnet ein beunruhigendes Bild: 34 Prozent der 12- bis 17-Jährigen in Deutschland erfüllen Kriterien, die auf eine problematische Smartphone-Nutzung hindeuten. Durchschnittlich verbringen Jugendliche mehr als fünf Stunden täglich mit ihrem Gerät – davon ein beträchtlicher Teil nach Mitternacht.

Die psychologischen Auswirkungen sind gut dokumentiert: Schlafstörungen, erhöhte Angstzustände, verringerte Fähigkeit zur Konzentration und eine Schwächung realer sozialer Bindungen. Besonders problematisch gilt die sogenannte variable Verstärkung, die Social-Media-Algorithmen einsetzen: Unvorhersehbare Belohnungen – Likes, neue Inhalte, Benachrichtigungen – aktivieren dasselbe neurologische Belohnungssystem wie Glücksspiele.

Präventionskonzepte stoßen in der Praxis auf strukturelle Hindernisse. Schulen haben kaum zeitliche Ressourcen für Medienkompetenzunterricht, und viele Eltern fühlen sich überfordert. Einige Bundesländer diskutieren gesetzliche Einschränkungen für unter 16-Jährige, analog zu Ländern wie Frankreich und Australien.'
),
(
  (select id from texts where slug = 'viele-jugendliche-sind-suechtig-nach-ihrem-handy'),
  'C1',
  'Die Debatte über Handysucht bei Jugendlichen leidet an einer grundlegenden Rahmungsverzerrung: Sie wird häufig als Frage individueller Selbstkontrolle oder elterlicher Aufsicht behandelt, während die strukturellen Ursachen – nämlich die bewusste Konstruktion maximaler Nutzerbindung durch Technologiekonzerne – im Hintergrund bleiben.

Die Mechanismen sind bekannt und gut erforscht. Variable Verstärkung, Endlosscroll, personalisierte Inhaltsströme und algorithmische Eskalation emotionaler Inhalte sind keine Nebenprodukte digitaler Plattformen, sondern deren Geschäftsgrundlage. Sie sind darauf ausgelegt, Aufmerksamkeit zu monopolisieren – und sie funktionieren bei Jugendlichen besonders effektiv, da das präfrontale Kortex, der für Impulskontrolle zuständig ist, erst um das 25. Lebensjahr vollständig reift.

Vor diesem Hintergrund greift die Forderung nach mehr Medienkompetenz zu kurz. Nicht weil sie falsch wäre, sondern weil sie die Asymmetrie zwischen individuellen Nutzern und institutionalisierten Verhaltensingenieuren ignoriert. Ein 13-Jähriger soll kognitive Resilienz gegen Systeme entwickeln, in deren Design Teams von Verhaltensökonomen und Neurowissenschaftlern investiert haben.

Was fehlt, ist eine Regulierungspolitik, die Plattformanbieter in die Pflicht nimmt: Altersverifikation, transparente Algorithmen, standardmäßige Nutzungsgrenzen für Minderjährige. Nicht als Bevormundung, sondern als Setzung von Marktregeln in einem Bereich, in dem der Markt klare negative Externalitäten produziert.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 4: Frieden zwischen den USA und Iran: Was bedeutet das für Deutschland?
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Frieden zwischen den USA und Iran: Was bedeutet das für Deutschland?',
  null,
  'premium',
  now(),
  'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland'),
  'A2',
  'Es gibt eine Waffenruhe zwischen den USA und dem Iran. Das bedeutet: Die beiden Länder kämpfen gerade nicht. Das ist eine gute Nachricht.

Der Krieg hat den deutschen Firmen Probleme gemacht. Es war schwer, Waren in andere Länder zu verkaufen. Das nennt man Export.

Jetzt hoffen viele deutsche Firmen, dass es wieder besser wird. Aber die Experten sagen: Es braucht noch Zeit.'
),
(
  (select id from texts where slug = 'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland'),
  'B1',
  'Die Waffenruhe zwischen den USA und dem Iran, die Ende März 2026 vereinbart wurde, hat bei deutschen Unternehmen Hoffnung geweckt. Der Krieg, der am 28. Februar begonnen hatte, hatte den globalen Handel stark belastet – besonders durch die Blockade der Straße von Hormus, einer der wichtigsten Schifffahrtsrouten der Welt.

Der Bundesverband Großhandel, Außenhandel, Dienstleistungen (BGA) rechnet jedoch damit, dass die wirtschaftlichen Folgen noch längere Zeit spürbar bleiben werden. Viele Verträge wurden storniert, Lieferketten unterbrochen und Versicherungsprämien für Seefrachten stark erhöht.

Das Statistische Bundesamt veröffentlichte neue Daten zu den deutschen Exporten im Februar 2026: Sie lagen um 8,3 Prozent unter dem Vorjahreswert. Branchen wie Maschinenbau, Chemie und Automobil sind besonders betroffen. Eine schnelle Erholung ist möglich, aber nicht garantiert.'
),
(
  (select id from texts where slug = 'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland'),
  'B2',
  'Die am 28. März vereinbarte Waffenruhe zwischen den USA und dem Iran hat die unmittelbarste Bedrohung für die globalen Handelsrouten vorerst entschärft. Die Straße von Hormus, durch die rund 20 Prozent des weltweiten Öl- und Flüssiggastransports fließen, ist wieder passierbar – ein Umstand, der die internationalen Energiemärkte bereits stabilisiert hat.

Für die deutsche Exportwirtschaft kommt die Entspannung zu einem kritischen Zeitpunkt. Der Einbruch der Auslandsumsätze im Februar 2026 um 8,3 Prozent gegenüber dem Vorjahr hat die konjunkturelle Erholung, die sich seit Herbst 2025 abzeichnete, jäh unterbrochen. Besonders der Maschinenbau und die chemische Industrie melden Auftragsverschiebungen in Milliardengrößenordnung.

Der BGA warnt jedoch vor verfrühtem Optimismus. Eine Waffenruhe ist kein Friedensvertrag, und die geopolitische Lage im Nahen Osten bleibt strukturell instabil. Unternehmen, die ihre Lieferketten resilienter gestalten wollen, sollten die aktuelle Pause nicht als Grund sehen, auf Diversifizierung zu verzichten.'
),
(
  (select id from texts where slug = 'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland'),
  'C1',
  'Die Waffenruhe im Iran-Konflikt illustriert einmal mehr eine strukturelle Verwundbarkeit des deutschen Wirtschaftsmodells: seine tiefe Abhängigkeit von offenen Handelswegen, stabilen Lieferketten und geopolitischer Vorhersehbarkeit. Der Rückgang der Exporte um 8,3 Prozent im Februar 2026 ist kein statistisches Rauschen – er ist ein symptomatischer Ausdruck der Kosten, die eine exportorientierte Volkswirtschaft trägt, wenn die geopolitische Ordnung fragil wird.

Deutschland exportiert rund 47 Prozent seines Bruttoinlandsprodukts – ein Wert, der international kaum vergleichbar ist. Diese Exportstärke ist historisch das Fundament des deutschen Wohlstands, aber zugleich sein größtes systemisches Risiko. Die Konzentration auf wenige Schlüsselmärkte und globale Wertschöpfungsketten, die über Kontinente gespannt sind, macht das Land anfällig für Schocks, die es selbst kaum beeinflussen kann.

Die wirtschaftspolitische Reaktion auf diese Erkenntnis ist bislang zarögerlich. Nearshoring und Lieferkettenresilienz sind als Konzepte längst bekannt, die Umsetzung jedoch kostspielig und langsam. Zudem stehen wirtschaftliche und sicherheitspolitische Interessen nicht immer in Deckung: Eine zu starke Abkopplung von Risikoregionen schwächt die eigene wirtschaftliche Basis, während eine zu starke Verflechtung die geopolitische Verwundbarkeit erhöht.

Die Waffenruhe gibt Deutschland eine Atempause – keine Lösung. Die Frage, wie eine exportabhängige Volkswirtschaft im Zeitalter geopolitischer Fragmentierung strukturell widerstandsfähiger wird, bleibt drängend und unbeantwortet.'
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
    'abkoppeln',
    'verb',
    'desconectar / desvincular',
    'Eine zu starke Abkopplung von Risikoregionen schwächt die wirtschaftliche Basis.',
    'C1',
    null,
    null,
    'abkoppeln',
    'Una desconexión demasiado fuerte de las regiones de riesgo debilita la base económica.',
    'Eine vollständige Abkopplung von China ist nicht realistisch.',
    'koppelte ab',
    'abgekoppelt'
  ),
  (
    'abzeichnen',
    'verb',
    'perfilarse / apuntarse',
    'Die konjunkturelle Erholung, die sich seit Herbst 2025 abzeichnete.',
    'B2',
    null,
    null,
    'abzeichnen',
    'La recuperación económica que se perfilaba desde el otoño de 2025.',
    'Eine Erholung zeichnet sich langsam ab.',
    'zeichnete ab',
    'abgezeichnet'
  ),
  (
    'aktivieren',
    'verb',
    'activar',
    'Belohnungen aktivieren dasselbe neurologische Belohnungssystem wie Glücksspiele.',
    'B2',
    null,
    null,
    'aktivieren',
    'Las recompensas activan el mismo sistema neurológico de recompensa que los juegos de azar.',
    'Likes aktivieren das Belohnungssystem im Gehirn.',
    'aktivierte',
    'aktiviert'
  ),
  (
    'algorithmisch',
    'adjective',
    'algorítmico',
    'La escalada algorítmica de contenidos emocionales es la base del negocio.',
    'C1',
    null,
    null,
    null,
    null,
    'Algorithmische Systeme steuern den Konsum digitaler Inhalte.',
    null,
    'Algorithmische Eskalation emotionaler Inhalte ist die Geschäftsgrundlage.'
  ),
  (
    'anachronistisch',
    'adjective',
    'anacrónico',
    'El modelo se considera casi anacrónico en la economía del fútbol moderno.',
    'B2',
    null,
    null,
    null,
    null,
    'Solide Haushaltsführung wirkt heute fast anachronistisch.',
    null,
    'Das Modell gilt in der modernen Fußballwirtschaft als fast anachronistisch.'
  ),
  (
    'anfällig',
    'adjective',
    'vulnerable / susceptible',
    'La concentración en pocos mercados hace al país vulnerable a los choques.',
    'C1',
    null,
    null,
    null,
    null,
    'Die deutsche Wirtschaft ist anfällig für externe Schocks.',
    null,
    'Die Konzentration auf wenige Märkte macht das Land anfällig für Schocks.'
  ),
  (
    'anhalten',
    'verb',
    'continuar / persistir',
    'Experten sagen, dass der Trend anhalten wird.',
    'B1',
    null,
    null,
    'anhalten',
    'Los expertos dicen que la tendencia continuará.',
    'Der Trend zum E-Auto hält an.',
    'hielt an',
    'angehalten'
  ),
  (
    'ankündigen',
    'verb',
    'anunciar',
    'Die Bundesregierung hat ein Ausbauprogramm angekündigt.',
    'B1',
    null,
    null,
    'ankündigen',
    'El gobierno federal ha anunciado un programa de expansión.',
    'Die Regierung hat neue Maßnahmen angekündigt.',
    'kündigte an',
    'angekündigt'
  ),
  (
    'ansprechen',
    'verb',
    'abordar / hablar de',
    'Viele Eltern wissen nicht, wie sie das Thema ansprechen sollen.',
    'B1',
    null,
    null,
    'ansprechen',
    'Muchos padres no saben cómo abordar el tema.',
    'Eltern müssen das Thema offen ansprechen.',
    'sprach an',
    'angesprochen'
  ),
  (
    'auffällig',
    'adjective',
    'llamativo / destacado',
    'Johan Manzambi es el jugador más destacado de la plantilla.',
    'B2',
    null,
    null,
    null,
    null,
    'Er war der auffälligste Spieler des Abends.',
    null,
    'Johan Manzambi ist der auffälligste Spieler im Kader.'
  ),
  (
    'aufschlagen',
    'verb',
    'abrir / comenzar',
    'Freiburg hat ein weiteres Kapitel seiner Geschichte aufgeschlagen.',
    'B2',
    null,
    null,
    'aufschlagen',
    'Freiburg ha abierto otro capítulo de su historia.',
    'Der Verein schlägt ein neues Kapitel in seiner Geschichte auf.',
    'schlug auf',
    'aufgeschlagen'
  ),
  (
    'aufwerfen',
    'verb',
    'plantear',
    'Das wirft eine Frage auf, die über den Sport hinausgeht.',
    'C1',
    null,
    null,
    'aufwerfen',
    'Eso plantea una pregunta que va más allá del deporte.',
    'Der Erfolg wirft grundlegende Fragen über den Fußball auf.',
    'warf auf',
    'aufgeworfen'
  ),
  (
    'beide',
    'adjective',
    'ambos',
    'Los dos países no están combatiendo por ahora.',
    'A2',
    null,
    null,
    null,
    null,
    'Beide Länder haben die Waffenruhe vereinbart.',
    null,
    'Die beiden Länder kämpfen gerade nicht.'
  ),
  (
    'bemerkenswert',
    'adjective',
    'notable / destacado',
    'El SC Freiburg tiene una notable historia europea.',
    'B2',
    null,
    null,
    null,
    null,
    'Das ist eine bemerkenswerte Leistung für einen kleinen Verein.',
    null,
    'Der SC Freiburg hat eine bemerkenswerte europäische Geschichte.'
  ),
  (
    'benutzen',
    'verb',
    'usar',
    'Viele Jugendliche benutzen ihr Handy sehr viel.',
    'A2',
    null,
    null,
    'benutzen',
    'Muchos jóvenes usan su móvil muchísimo.',
    'Er benutzt das Handy zu viel.',
    'benutzte',
    'benutzt'
  ),
  (
    'besser',
    'adjective',
    'mejor',
    'Muchas empresas esperan que las cosas mejoren.',
    'A2',
    null,
    null,
    null,
    null,
    'Die Lage wird langsam besser.',
    null,
    'Viele Firmen hoffen, dass es wieder besser wird.'
  ),
  (
    'bestreiten',
    'verb',
    'disputar',
    'Der SC Freiburg hat das Hinspiel gegen Celta Vigo bestritten.',
    'B1',
    null,
    null,
    'bestreiten',
    'El SC Freiburg disputó el partido de ida contra el Celta de Vigo.',
    'Der Verein hat das Spiel gegen einen starken Gegner bestritten.',
    'bestritt',
    'bestritten'
  ),
  (
    'beträchtlich',
    'adjective',
    'considerable',
    'Una parte considerable del uso tiene lugar después de medianoche.',
    'B2',
    null,
    null,
    null,
    null,
    'Ein beträchtlicher Teil der Jugendlichen nutzt das Handy nachts.',
    null,
    'Ein beträchtlicher Teil der Nutzung findet nach Mitternacht statt.'
  ),
  (
    'beunruhigend',
    'adjective',
    'preocupante',
    'El estudio más reciente presenta un panorama preocupante.',
    'B2',
    null,
    null,
    null,
    null,
    'Das ist eine beunruhigende Entwicklung.',
    null,
    'Die jüngste Erhebung zeichnet ein beunruhigendes Bild.'
  ),
  (
    'bewusst',
    'adjective',
    'consciente / deliberado',
    'La construcción consciente de la máxima fidelización del usuario por parte de las tecnológicas.',
    'C1',
    null,
    null,
    null,
    null,
    'Die bewusste Manipulation der Nutzer ist das eigentliche Problem.',
    null,
    'Die bewusste Konstruktion maximaler Nutzerbindung durch Technologiekonzerne.'
  ),
  (
    'bezahlen',
    'verb',
    'pagar',
    'Viele Menschen müssen mehr bezahlen, wenn sie Auto fahren.',
    'A2',
    null,
    null,
    'bezahlen',
    'Muchas personas tienen que pagar más cuando conducen.',
    'Er bezahlt jeden Monat mehr für Benzin.',
    'bezahlte',
    'bezahlt'
  ),
  (
    'billig',
    'adjective',
    'barato',
    'La electricidad es más barata.',
    'A2',
    null,
    null,
    null,
    null,
    'Elektroautos sind im Betrieb billiger als Benziner.',
    null,
    'Strom ist billiger.'
  ),
  (
    'brauchen',
    'verb',
    'necesitar',
    'Das Elektroauto braucht nur Strom.',
    'A2',
    null,
    null,
    'brauchen',
    'El coche eléctrico solo necesita electricidad.',
    'Wir brauchen mehr Ladesäulen.',
    'brauchte',
    'gebraucht'
  ),
  (
    'das Auto',
    'noun',
    'el coche',
    'Viele Menschen müssen mehr bezahlen, wenn sie Auto fahren.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Auto fährt mit Benzin oder Strom.',
    null,
    null
  ),
  (
    'das Benzin',
    'noun',
    'la gasolina',
    'In Deutschland kostet Benzin gerade sehr viel Geld.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Benzin ist diese Woche sehr teuer.',
    null,
    null
  ),
  (
    'das Elektroauto',
    'noun',
    'el coche eléctrico',
    'Immer mehr Menschen kaufen ein Elektroauto.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Elektroauto braucht keinen Benzin.',
    null,
    null
  ),
  (
    'das Handy',
    'noun',
    'el móvil',
    'Viele Jugendliche benutzen ihr Handy sehr viel.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Handy ist immer dabei.',
    null,
    null
  ),
  (
    'das Hindernis',
    'noun',
    'el obstáculo',
    'Präventionskonzepte stoßen auf strukturelle Hindernisse.',
    'B2',
    'das',
    null,
    null,
    null,
    'Strukturelle Hindernisse erschweren die Prävention.',
    null,
    null
  ),
  (
    'das Hinspiel',
    'noun',
    'el partido de ida',
    'Der SC Freiburg hat das Viertelfinal-Hinspiel gegen Celta Vigo bestritten.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Hinspiel fand in Freiburg statt.',
    null,
    null
  ),
  (
    'das Nearshoring',
    'noun',
    'el nearshoring',
    'Nearshoring und Lieferkettenresilienz sind als Konzepte längst bekannt.',
    'C1',
    'das',
    null,
    null,
    null,
    'Nearshoring kann die Abhängigkeit von fernen Märkten reduzieren.',
    null,
    null
  ),
  (
    'das Preisinstrument',
    'noun',
    'el instrumento de precios',
    'Eine Gesamtpolitik, die Preisinstrumente mit Infrastrukturinvestitionen verbindet.',
    'C1',
    'das',
    null,
    null,
    null,
    'Preisinstrumente allein reichen für die Verkehrswende nicht aus.',
    null,
    null
  ),
  (
    'das Problem',
    'noun',
    'el problema',
    'Handysucht ist ein Problem.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das ist ein großes Problem für viele Familien.',
    null,
    null
  ),
  (
    'das Quartal',
    'noun',
    'el trimestre',
    'Im ersten Quartal 2026 wurden mehr E-Autos verkauft.',
    'B1',
    'das',
    null,
    null,
    null,
    'Im ersten Quartal stiegen die Verkäufe um 18 Prozent.',
    null,
    null
  ),
  (
    'das Rückspiel',
    'noun',
    'el partido de vuelta',
    'Das Rückspiel findet in zwei Wochen in Vigo statt.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Rückspiel in Vigo wird schwierig.',
    null,
    null
  ),
  (
    'das Spiel',
    'noun',
    'el partido',
    'Das Spiel war spannend und wichtig für die nächste Runde.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Spiel beginnt um 20 Uhr.',
    null,
    null
  ),
  (
    'das Stadion',
    'noun',
    'el estadio',
    'Viele Fans haben das Spiel im Stadion gesehen.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Stadion war voll mit Fans.',
    null,
    null
  ),
  (
    'das Talent',
    'noun',
    'el talento',
    'Besonderes Augenmerk lag auf dem 20-jährigen Talent Johan Manzambi.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das junge Talent hat eine starke Saison gespielt.',
    null,
    null
  ),
  (
    'das Verbot',
    'noun',
    'la prohibición',
    'Experten empfehlen gemeinsame Regeln statt Verbote.',
    'B1',
    'das',
    null,
    null,
    null,
    'Verbote allein lösen das Problem nicht.',
    null,
    null
  ),
  (
    'das Viertelfinale',
    'noun',
    'los cuartos de final',
    'Zum zweiten Mal hat sich der Verein für ein europäisches Viertelfinale qualifiziert.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Viertelfinale ist die wichtigste Runde der Saison für Freiburg.',
    null,
    null
  ),
  (
    'der Abend',
    'noun',
    'la tarde / la noche',
    'Am Abend soll man das Handy früh weglegen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Am Abend legt er sein Handy weg.',
    null,
    null
  ),
  (
    'der Außenseiter',
    'noun',
    'el equipo sin favoritismo',
    'Freiburg gilt als Außenseiter.',
    'B1',
    'der',
    null,
    null,
    null,
    'Als Außenseiter hat Freiburg nichts zu verlieren.',
    null,
    null
  ),
  (
    'der Einbruch',
    'noun',
    'la caída brusca / el desplome',
    'Der Einbruch der Auslandsumsätze beträgt 8,3 Prozent.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Einbruch der Exporte hat die Wirtschaft getroffen.',
    null,
    null
  ),
  (
    'der Experte',
    'noun',
    'el experto',
    'Experten sagen: Man soll das Handy nicht mehr als zwei Stunden benutzen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Experte empfiehlt eine Bildschirmzeit-Grenze.',
    null,
    null
  ),
  (
    'der Export',
    'noun',
    'la exportación',
    'Es war schwer, Waren in andere Länder zu verkaufen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Export ist sehr wichtig für Deutschland.',
    null,
    null
  ),
  (
    'der Exporteur',
    'noun',
    'el exportador',
    'Die Waffenruhe hat bei deutschen Exporteuren Hoffnung geweckt.',
    'B1',
    'der',
    null,
    null,
    null,
    'Viele Exporteure hoffen auf eine schnelle Erholung.',
    null,
    null
  ),
  (
    'der Fan',
    'noun',
    'el aficionado',
    'Viele Fans haben das Spiel im Stadion gesehen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Die Fans sind sehr stolz auf ihren Verein.',
    null,
    null
  ),
  (
    'der Freund',
    'noun',
    'el amigo',
    'Die Kinder treffen sich seltener mit Freunden.',
    'A2',
    'der',
    null,
    null,
    null,
    'Er trifft sich weniger mit seinen Freunden.',
    null,
    null
  ),
  (
    'der Friedensvertrag',
    'noun',
    'el tratado de paz',
    'Eine Waffenruhe ist kein Friedensvertrag.',
    'B2',
    'der',
    null,
    null,
    null,
    'Ohne Friedensvertrag bleibt die Lage instabil.',
    null,
    null
  ),
  (
    'der Fußballverein',
    'noun',
    'el club de fútbol',
    'Der SC Freiburg ist ein Fußballverein aus Baden-Württemberg.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Fußballverein hat viele treue Fans.',
    null,
    null
  ),
  (
    'der Gegenentwurf',
    'noun',
    'el modelo alternativo',
    'Das Vereinsprojekt repräsentiert einen strukturellen Gegenentwurf im europäischen Fußball.',
    'C1',
    'der',
    null,
    null,
    null,
    'Freiburg gilt als Gegenentwurf zum Geldfußball.',
    null,
    null
  ),
  (
    'der Halbfinaleinzug',
    'noun',
    'el pase a las semifinales',
    'Ein Halbfinaleinzug würde Millioneneinnahmen bedeuten.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Halbfinaleinzug wäre historisch für den Verein.',
    null,
    null
  ),
  (
    'der Höchststand',
    'noun',
    'el máximo histórico',
    'Die Benzin- und Dieselpreise haben einen neuen Höchststand erreicht.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Höchststand wurde im April erreicht.',
    null,
    null
  ),
  (
    'der Inhaltsstream',
    'noun',
    'el flujo de contenido',
    'Personalisierte Inhaltsströme sind die Geschäftsgrundlage digitaler Plattformen.',
    'C1',
    'der',
    null,
    null,
    null,
    'Personalisierte Inhaltsströme halten Nutzer stundenlang aktiv.',
    null,
    null
  ),
  (
    'der Kader',
    'noun',
    'la plantilla',
    'Er ist der auffälligste Spieler im Kader von Trainer Brechtel.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Kader des Vereins ist nicht der teuerste, aber einer der besten.',
    null,
    null
  ),
  (
    'der Kraftstoffpreis',
    'noun',
    'el precio del combustible',
    'Deutschland erlebt die höchsten Kraftstoffpreise seit Beginn der Aufzeichnungen.',
    'B2',
    'der',
    null,
    null,
    null,
    'Die Kraftstoffpreise steigen wegen der geopolitischen Lage.',
    null,
    null
  ),
  (
    'der Krieg',
    'noun',
    'la guerra',
    'Der Krieg hat den deutschen Firmen Probleme gemacht.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Krieg hat den Export stark belastet.',
    null,
    null
  ),
  (
    'der Marktwert',
    'noun',
    'el valor de mercado',
    'Sein Marktwert wird auf über 40 Millionen Euro geschätzt.',
    'C1',
    'der',
    null,
    null,
    null,
    'Der Marktwert von Manzambi ist in dieser Saison explodiert.',
    null,
    null
  ),
  (
    'der Maschinenbau',
    'noun',
    'la ingeniería mecánica',
    'Branchen wie Maschinenbau, Chemie und Automobil sind besonders betroffen.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Maschinenbau leidet besonders unter den Exportrückgängen.',
    null,
    null
  ),
  (
    'der Optimismus',
    'noun',
    'el optimismo',
    'Der BGA warnt vor verfrühtem Optimismus.',
    'B2',
    'der',
    null,
    null,
    null,
    'Verfrühter Optimismus wäre ein Fehler.',
    null,
    null
  ),
  (
    'der Petrodollar',
    'noun',
    'el petrodólar',
    'Strukturelle Klugheit kann auch ohne Petrodollar wettbewerbsfähig sein.',
    'C1',
    'der',
    null,
    null,
    null,
    'Nicht jeder Verein hat Zugang zu Petrodollars.',
    null,
    null
  ),
  (
    'der Preis',
    'noun',
    'el precio',
    'Der Preis ist auf einem Rekord.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Preis für Benzin steigt immer weiter.',
    null,
    null
  ),
  (
    'der Provinzklub',
    'noun',
    'el club de provincias',
    'Der SC Freiburg ist ein Provinzklub auf großer Bühne.',
    'B2',
    'der',
    null,
    null,
    null,
    'Als Provinzklub hat Freiburg alle überrascht.',
    null,
    null
  ),
  (
    'der Rohstoffengpass',
    'noun',
    'la escasez de materias primas',
    'Ursache ist eine Kombination aus globalen Rohstoffengpässen.',
    'B2',
    'der',
    null,
    null,
    null,
    'Rohstoffengpässe treiben die Energiepreise in die Höhe.',
    null,
    null
  ),
  (
    'der Schlafmangel',
    'noun',
    'la falta de sueño',
    'Die Folgen sind deutlich: Schlafmangel und schlechtere Schulleistungen.',
    'B1',
    'der',
    null,
    null,
    null,
    'Schlafmangel ist eine häufige Folge der Handysucht.',
    null,
    null
  ),
  (
    'der Spritpreis',
    'noun',
    'el precio de la gasolina',
    'Die Spritpreise haben einen neuen Höchststand erreicht.',
    'B1',
    'der',
    null,
    null,
    null,
    'Die Spritpreise steigen jeden Monat.',
    null,
    null
  ),
  (
    'der Staat',
    'noun',
    'el Estado',
    'Es gibt Geld vom Staat für neue E-Autos.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Staat hilft beim Kauf von Elektroautos.',
    null,
    null
  ),
  (
    'der Strom',
    'noun',
    'la electricidad',
    'Das Elektroauto braucht nur Strom.',
    'A2',
    'der',
    null,
    null,
    null,
    'Strom ist billiger als Benzin.',
    null,
    null
  ),
  (
    'der Umstiegsanreiz',
    'noun',
    'el incentivo para cambiar',
    'Hohe Spritpreise eröffnen einen rationalen Umstiegsanreiz.',
    'C1',
    'der',
    null,
    null,
    null,
    'Ohne Umstiegsanreize bleibt die Verkehrswende ein Wunsch.',
    null,
    null
  ),
  (
    'der Verbraucher',
    'noun',
    'el consumidor',
    'Verbraucher spüren das besonders beim Pendeln.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Verbraucher zahlt mehr für Benzin.',
    null,
    null
  ),
  (
    'der Wettbewerb',
    'noun',
    'la competición',
    'Die Europa League ist ein wichtiger Wettbewerb in Europa.',
    'A2',
    'der',
    null,
    null,
    null,
    'Das ist ein großer Wettbewerb für kleine Vereine.',
    null,
    null
  ),
  (
    'der Wettbewerbsvorteil',
    'noun',
    'la ventaja competitiva',
    'Freiburg setzt auf Trainerkontinuität als Wettbewerbsvorteil.',
    'C1',
    'der',
    null,
    null,
    null,
    'Kontinuität ist ihr wichtigster Wettbewerbsvorteil.',
    null,
    null
  ),
  (
    'deutsch',
    'adjective',
    'alemán',
    'La guerra ha causado problemas a las empresas alemanas.',
    'A2',
    null,
    null,
    null,
    null,
    'Die deutschen Firmen sind betroffen.',
    null,
    'Der Krieg hat den deutschen Firmen Probleme gemacht.'
  ),
  (
    'die Abhängigkeit',
    'noun',
    'la dependencia / la adicción',
    'Digitale Abhängigkeit: Wenn das Smartphone Jugendliche steuert.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die digitale Abhängigkeit nimmt bei Jugendlichen zu.',
    null,
    null
  ),
  (
    'die Anschaffungskosten',
    'noun',
    'el coste de adquisición',
    'Viele Haushalte können sich die Anschaffungskosten nicht leisten.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Anschaffungskosten für E-Autos sind noch hoch.',
    null,
    null
  ),
  (
    'die Asymmetrie',
    'noun',
    'la asimetría',
    'Die Forderung ignoriert die Asymmetrie zwischen Nutzern und Verhaltenseningenieuren.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Asymmetrie zwischen Nutzer und Plattform ist strukturell.',
    null,
    null
  ),
  (
    'die Atempause',
    'noun',
    'la pausa / el respiro',
    'Die Waffenruhe gibt Deutschland eine Atempause – keine Lösung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Diese Atempause sollte für strukturelle Reformen genutzt werden.',
    null,
    null
  ),
  (
    'die Aufmerksamkeit',
    'noun',
    'la atención',
    'Die Algorithmen sind darauf ausgelegt, die Aufmerksamkeit so lange wie möglich zu halten.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Aufmerksamkeit der Jugendlichen wird von Apps gesteuert.',
    null,
    null
  ),
  (
    'die Auftragsverschiebung',
    'noun',
    'el aplazamiento de pedidos',
    'Der Maschinenbau meldet Auftragsverschiebungen in Milliardengrößenordnung.',
    'B2',
    'die',
    null,
    null,
    null,
    'Auftragsverschiebungen belasten die Industrie stark.',
    null,
    null
  ),
  (
    'die Bedrohung',
    'noun',
    'la amenaza',
    'Die Waffenruhe hat die unmittelbarste Bedrohung für die Handelsrouten entschärft.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Bedrohung für den globalen Handel bleibt real.',
    null,
    null
  ),
  (
    'die Belastung',
    'noun',
    'la carga / el peso',
    'Die wirtschaftliche Belastung für Pendler ist erheblich.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Belastung durch hohe Spritpreise trifft ärmere Haushalte stärker.',
    null,
    null
  ),
  (
    'die Benachrichtigung',
    'noun',
    'la notificación',
    'Unvorhersehbare Belohnungen – Likes, neue Inhalte, Benachrichtigungen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Benachrichtigungen unterbrechen die Konzentration ständig.',
    null,
    null
  ),
  (
    'die Blaupause',
    'noun',
    'el modelo / el plano',
    'Was Freiburg zeigt, ist keine Blaupause für alle.',
    'C1',
    'die',
    null,
    null,
    null,
    'Das Freiburg-Modell ist keine Blaupause für jeden Verein.',
    null,
    null
  ),
  (
    'die Blockade',
    'noun',
    'el bloqueo',
    'Besonders durch die Blockade der Straße von Hormus.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Blockade hat den Welthandel stark belastet.',
    null,
    null
  ),
  (
    'die Bundesregierung',
    'noun',
    'el gobierno federal',
    'Die Bundesregierung möchte, dass mehr Menschen Elektroautos kaufen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Bundesregierung plant neue Maßnahmen.',
    null,
    null
  ),
  (
    'die CO2-Bepreisung',
    'noun',
    'el precio del CO2',
    'Die CO2-Bepreisung wurde zum Jahresanfang erneut angehoben.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die CO2-Bepreisung macht fossile Energie teurer.',
    null,
    null
  ),
  (
    'die Diversifizierung',
    'noun',
    'la diversificación',
    'Unternehmen sollten auf Diversifizierung nicht verzichten.',
    'B2',
    'die',
    null,
    null,
    null,
    'Diversifizierung schützt vor geopolitischen Schocks.',
    null,
    null
  ),
  (
    'die Einnahmenstruktur',
    'noun',
    'la estructura de ingresos',
    'Freiburg hält die Personalkosten relativ zur Einnahmenstruktur niedrig.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Einnahmenstruktur des Vereins ist auf Nachhaltigkeit ausgelegt.',
    null,
    null
  ),
  (
    'die Einschränkung',
    'noun',
    'la restricción',
    'Einige Bundesländer diskutieren gesetzliche Einschränkungen für unter 16-Jährige.',
    'B2',
    'die',
    null,
    null,
    null,
    'Gesetzliche Einschränkungen werden in mehreren Ländern diskutiert.',
    null,
    null
  ),
  (
    'die Elektromobilität',
    'noun',
    'la movilidad eléctrica',
    'Der Umstieg auf Elektromobilität vollzieht sich vor allem in Städten.',
    'B2',
    'die',
    null,
    null,
    null,
    'Elektromobilität ist kein Thema für strukturschwache Regionen.',
    null,
    null
  ),
  (
    'die Entspannung',
    'noun',
    'la distensión / la relajación',
    'Die Entspannung kommt für die deutsche Exportwirtschaft zu einem kritischen Zeitpunkt.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Entspannung der geopolitischen Lage hilft der Wirtschaft.',
    null,
    null
  ),
  (
    'die Erhebung',
    'noun',
    'el estudio / la encuesta',
    'Die jüngste Erhebung der Bundeszentrale zeichnet ein beunruhigendes Bild.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Erhebung zeigt alarmierende Zahlen zur Handynutzung.',
    null,
    null
  ),
  (
    'die Erholung',
    'noun',
    'la recuperación',
    'Eine schnelle Erholung ist möglich, aber nicht garantiert.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die wirtschaftliche Erholung wird Zeit brauchen.',
    null,
    null
  ),
  (
    'die Externalität',
    'noun',
    'la externalidad',
    'Der Markt produziert klare negative Externalitäten.',
    'C1',
    'die',
    null,
    null,
    null,
    'Negative Externalitäten rechtfertigen staatliche Regulierung.',
    null,
    null
  ),
  (
    'die Firma',
    'noun',
    'la empresa',
    'Der Krieg hat den deutschen Firmen Probleme gemacht.',
    'A2',
    'die',
    null,
    null,
    null,
    'Viele Firmen haben wegen des Krieges Verluste gemacht.',
    null,
    null
  ),
  (
    'die Fragmentierung',
    'noun',
    'la fragmentación',
    'Die Frage, wie eine Volkswirtschaft im Zeitalter geopolitischer Fragmentierung widerstandsfähiger wird.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die geopolitische Fragmentierung stellt das Exportmodell in Frage.',
    null,
    null
  ),
  (
    'die Geduldigkeit',
    'noun',
    'la paciencia institucional',
    'Das Ergebnis ist die Frucht institutioneller Geduldigkeit.',
    'C1',
    'die',
    null,
    null,
    null,
    'Institutionelle Geduldigkeit ist im modernen Fußball selten.',
    null,
    null
  ),
  (
    'die Gewohnheit',
    'noun',
    'el hábito',
    'Das Smartphone wird zur Gewohnheit.',
    'B1',
    'die',
    null,
    null,
    null,
    'Das Handy täglich zu benutzen ist eine schlechte Gewohnheit.',
    null,
    null
  ),
  (
    'die Handysucht',
    'noun',
    'la adicción al móvil',
    'Das nennt man Handysucht.',
    'A2',
    'die',
    null,
    null,
    null,
    'Handysucht ist ein großes Problem bei Jugendlichen.',
    null,
    null
  ),
  (
    'die Haushaltsführung',
    'noun',
    'la gestión presupuestaria',
    'Das Modell steht für solide Haushaltsführung.',
    'B2',
    'die',
    null,
    null,
    null,
    'Solide Haushaltsführung ermöglicht nachhaltigen Erfolg.',
    null,
    null
  ),
  (
    'die Impulskontrolle',
    'noun',
    'el control de impulsos',
    'Das präfrontale Kortex ist für Impulskontrolle zuständig.',
    'C1',
    'die',
    null,
    null,
    null,
    'Jugendliche haben noch wenig entwickelte Impulskontrolle.',
    null,
    null
  ),
  (
    'die Kompensation',
    'noun',
    'la compensación',
    'Was fehlt, ist eine Gesamtpolitik mit gezielter sozialer Kompensation.',
    'C1',
    'die',
    null,
    null,
    null,
    'Soziale Kompensation ist nötig, damit die Wende gerecht ist.',
    null,
    null
  ),
  (
    'die Kontinuität',
    'noun',
    'la continuidad',
    'Das Modell setzt auf Kontinuität im Trainerteam.',
    'B2',
    'die',
    null,
    null,
    null,
    'Kontinuität ist ein Wettbewerbsvorteil für Freiburg.',
    null,
    null
  ),
  (
    'die Kostensteigerung',
    'noun',
    'el aumento de costes',
    'Für Pendlerinnen sind dieselben Preise schlicht eine Kostensteigerung ohne Alternative.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Kostensteigerung trifft einkommensschwache Haushalte am härtesten.',
    null,
    null
  ),
  (
    'die Ladeinfrastruktur',
    'noun',
    'la infraestructura de carga',
    'Der Trend wird anhalten, wenn die Ladeinfrastruktur verbessert wird.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Ladeinfrastruktur muss ausgebaut werden.',
    null,
    null
  ),
  (
    'die Ladesäule',
    'noun',
    'el punto de carga',
    'In vielen ländlichen Regionen fehlen noch ausreichend Ladesäulen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Es braucht mehr Ladesäulen auf dem Land.',
    null,
    null
  ),
  (
    'die Leistung',
    'noun',
    'el rendimiento',
    'Johan Manzambi hat mit starken Leistungen auf sich aufmerksam gemacht.',
    'B1',
    'die',
    null,
    null,
    null,
    'Seine Leistungen in dieser Saison sind beeindruckend.',
    null,
    null
  ),
  (
    'die Lieferkette',
    'noun',
    'la cadena de suministro',
    'Viele Lieferketten wurden unterbrochen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Lieferketten sind durch den Krieg stark gestört worden.',
    null,
    null
  ),
  (
    'die Marktkorrektur',
    'noun',
    'la corrección de mercado',
    'Rekordspritpreise 2026: Marktkorrektur oder strukturelle Verkehrswende?',
    'C1',
    'die',
    null,
    null,
    null,
    'Hohe Preise können eine Marktkorrektur auslösen.',
    null,
    null
  ),
  (
    'die Medienkompetenz',
    'noun',
    'la competencia mediática',
    'Schulen sollen das Thema Medienkompetenzen stärker in den Unterricht integrieren.',
    'B1',
    'die',
    null,
    null,
    null,
    'Medienkompetenz ist heute eine wichtige Fähigkeit.',
    null,
    null
  ),
  (
    'die Nachfrage',
    'noun',
    'la demanda',
    'Die Nachfrage nach Elektroautos steigt.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Nachfrage nach E-Autos wächst stark.',
    null,
    null
  ),
  (
    'die Nachricht',
    'noun',
    'la noticia',
    'Das ist eine gute Nachricht.',
    'A2',
    'die',
    null,
    null,
    null,
    'Das ist eine gute Nachricht für die Wirtschaft.',
    null,
    null
  ),
  (
    'die Nachwuchsförderung',
    'noun',
    'el fomento de la cantera',
    'Das Modell setzt auf Nachwuchsförderung statt Transferwahnsinn.',
    'B2',
    'die',
    null,
    null,
    null,
    'Nachwuchsförderung ist der Schlüssel zum Erfolg in Freiburg.',
    null,
    null
  ),
  (
    'die Neuzulassung',
    'noun',
    'la nueva matriculación',
    'Die Neuzulassungen von Elektrofahrzeugen stiegen um 18,4 Prozent.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Neuzulassungen von E-Autos erreichen einen Rekord.',
    null,
    null
  ),
  (
    'die Nutzerbindung',
    'noun',
    'la fidelización del usuario',
    'Die strukturellen Ursachen sind die bewusste Konstruktion maximaler Nutzerbindung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Nutzerbindung ist das Geschäftsmodell der Plattformen.',
    null,
    null
  ),
  (
    'die Nutzungszeit',
    'noun',
    'el tiempo de uso',
    'Social-Media-Apps sind für die langen Nutzungszeiten verantwortlich.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die durchschnittliche Nutzungszeit steigt jedes Jahr.',
    null,
    null
  ),
  (
    'die Rahmungsverzerrung',
    'noun',
    'la distorsión del encuadre',
    'Die Debatte leidet an einer grundlegenden Rahmungsverzerrung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Rahmungsverzerrung verdeckt die eigentlichen Ursachen.',
    null,
    null
  ),
  (
    'die Resilienz',
    'noun',
    'la resiliencia',
    'Ein 13-Jähriger soll kognitive Resilienz gegen diese Systeme entwickeln.',
    'C1',
    'die',
    null,
    null,
    null,
    'Kognitive Resilienz kann durch Medienkompetenz gestärkt werden.',
    null,
    null
  ),
  (
    'die Runde',
    'noun',
    'la ronda',
    'Das Spiel war wichtig für die nächste Runde.',
    'A2',
    'die',
    null,
    null,
    null,
    'Freiburg kommt in die nächste Runde.',
    null,
    null
  ),
  (
    'die Saison',
    'noun',
    'la temporada',
    'Für den SC Freiburg ist es eine historische Saison.',
    'B1',
    'die',
    null,
    null,
    null,
    'In dieser Saison hat der Verein alle überrascht.',
    null,
    null
  ),
  (
    'die Schifffahrtsroute',
    'noun',
    'la ruta marítima',
    'Die Straße von Hormus ist eine der wichtigsten Schifffahrtsrouten der Welt.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Blockade wichtiger Schifffahrtsrouten schadet dem Handel.',
    null,
    null
  ),
  (
    'die Schlafstörung',
    'noun',
    'el trastorno del sueño',
    'Die psychologischen Auswirkungen sind: Schlafstörungen und erhöhte Angstzustände.',
    'B2',
    'die',
    null,
    null,
    null,
    'Schlafstörungen sind eine häufige Folge exzessiver Handynutzung.',
    null,
    null
  ),
  (
    'die Sorge',
    'noun',
    'la preocupación',
    'Die Eltern machen sich Sorgen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Eltern haben große Sorgen wegen des Handys.',
    null,
    null
  ),
  (
    'die Spaltung',
    'noun',
    'la brecha / la división',
    'Eine Mobilitätswende, die diese Spaltung vertieft, ist sozial nicht nachhaltig.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Spaltung zwischen Stadt und Land wächst.',
    null,
    null
  ),
  (
    'die Studie',
    'noun',
    'el estudio',
    'Eine neue Studie zeigt: Mehr als ein Drittel der Jugendlichen zeigt Anzeichen von Handysucht.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Studie zeigt alarmierende Ergebnisse.',
    null,
    null
  ),
  (
    'die Verflechtung',
    'noun',
    'la interdependencia / el entrelazamiento',
    'Eine zu starke Verflechtung erhöht die geopolitische Verwundbarkeit.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die wirtschaftliche Verflechtung mit Risikoregionen ist ein strukturelles Risiko.',
    null,
    null
  ),
  (
    'die Verkehrswende',
    'noun',
    'la transición del transporte',
    'Sind hohe Energiepreise das wirksamste Instrument zur Beschleunigung der Mobilitätswende?',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Verkehrswende braucht mehr als hohe Spritpreise.',
    null,
    null
  ),
  (
    'die Versicherungsprämie',
    'noun',
    'la prima de seguro',
    'Die Versicherungsprämien für Seefrachten wurden stark erhöht.',
    'B1',
    'die',
    null,
    null,
    null,
    'Hohe Versicherungsprämien belasten die Exporteure zusätzlich.',
    null,
    null
  ),
  (
    'die Verstärkung',
    'noun',
    'el refuerzo',
    'Besonders problematisch gilt die sogenannte variable Verstärkung.',
    'B2',
    'die',
    null,
    null,
    null,
    'Variable Verstärkung macht Apps besonders suchterzeugende.',
    null,
    null
  ),
  (
    'die Verwundbarkeit',
    'noun',
    'la vulnerabilidad',
    'Die Waffenruhe illustriert eine strukturelle Verwundbarkeit des deutschen Wirtschaftsmodells.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Verwundbarkeit exportorientierter Volkswirtschaften ist systemisch.',
    null,
    null
  ),
  (
    'die Vorhersehbarkeit',
    'noun',
    'la previsibilidad',
    'Das Modell hängt von geopolitischer Vorhersehbarkeit ab.',
    'C1',
    'die',
    null,
    null,
    null,
    'Geopolitische Vorhersehbarkeit ist die Grundlage des Exportmodells.',
    null,
    null
  ),
  (
    'die Vorlage',
    'noun',
    'la asistencia',
    'Johan Manzambi hat zwölf Tore und sieben Vorlagen erzielt.',
    'B2',
    'die',
    null,
    null,
    null,
    'Er hat in dieser Saison sieben Vorlagen gegeben.',
    null,
    null
  ),
  (
    'die Waffenruhe',
    'noun',
    'el alto el fuego',
    'Es gibt eine Waffenruhe zwischen den USA und dem Iran.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Waffenruhe ist eine gute Nachricht für die Wirtschaft.',
    null,
    null
  ),
  (
    'die Ware',
    'noun',
    'la mercancía',
    'Es war schwer, Waren in andere Länder zu verkaufen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Waren konnten nicht exportiert werden.',
    null,
    null
  ),
  (
    'die Wertschöpfungskette',
    'noun',
    'la cadena de valor',
    'Die Konzentration auf globale Wertschöpfungsketten macht das Land anfällig.',
    'C1',
    'die',
    null,
    null,
    null,
    'Globale Wertschöpfungsketten erhöhen das geopolitische Risiko.',
    null,
    null
  ),
  (
    'direkt',
    'adjective',
    'directo',
    'Los altos precios de la gasolina tienen una consecuencia directa.',
    'B1',
    null,
    null,
    null,
    null,
    'Das hat eine direkte Auswirkung auf die Nachfrage.',
    null,
    'Die hohen Spritpreise haben eine direkte Folge.'
  ),
  (
    'drängend',
    'adjective',
    'urgente / apremiante',
    'La pregunta sigue siendo urgente y sin respuesta.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine drängende wirtschaftspolitische Frage.',
    null,
    'Die Frage bleibt drängend und unbeantwortet.'
  ),
  (
    'durchschnittlich',
    'adjective',
    'de media / en promedio',
    'Recurren al móvil de media cada siete minutos.',
    'B1',
    null,
    null,
    null,
    null,
    'Jugendliche nutzen ihr Handy durchschnittlich fünf Stunden täglich.',
    null,
    'Sie greifen durchschnittlich alle sieben Minuten zum Handy.'
  ),
  (
    'effizient',
    'adjective',
    'eficiente',
    'Freiburg gestiona una de las secciones de cantera más eficientes de la Bundesliga.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Nachwuchsarbeit ist sehr effizient organisiert.',
    null,
    'Freiburg betreibt eine der effizientesten Nachwuchsabteilungen der Bundesliga.'
  ),
  (
    'einkommensschwach',
    'adjective',
    'con pocos ingresos',
    'Los altos precios perjudican a los hogares con pocos ingresos.',
    'C1',
    null,
    null,
    null,
    null,
    'Einkommensschwache Haushalte können sich kein E-Auto leisten.',
    null,
    'Hohe Preise belasten einkommensschwache Haushalte.'
  ),
  (
    'emissionsfrei',
    'adjective',
    'sin emisiones',
    'Eso intensifica la presión para pasarse a alternativas sin emisiones.',
    'B2',
    null,
    null,
    null,
    null,
    'E-Autos gelten als emissionsfreie Alternative.',
    null,
    'Das verstärkt den Druck, auf emissionsfreie Alternativen umzusteigen.'
  ),
  (
    'entfachen',
    'verb',
    'avivar / desencadenar',
    'Der Rekordstand hat eine bekannte Debatte neu entfacht.',
    'C1',
    null,
    null,
    'entfachen',
    'El récord ha avivado de nuevo un conocido debate.',
    'Die Krise hat die Diskussion über Energiepreise neu entfacht.',
    'entfachte',
    'entfacht'
  ),
  (
    'entschärfen',
    'verb',
    'neutralizar / desactivar',
    'Die Waffenruhe hat die unmittelbarste Bedrohung entschärft.',
    'B2',
    null,
    null,
    'entschärfen',
    'El alto el fuego ha neutralizado la amenaza más inmediata.',
    'Die Einigung hat die Lage etwas entschärft.',
    'entschärfte',
    'entschärft'
  ),
  (
    'erheblich',
    'adjective',
    'considerable',
    'El partido tuvo también una importancia económica considerable.',
    'B2',
    null,
    null,
    null,
    null,
    'Der Halbfinaleinzug wäre von erheblicher Bedeutung.',
    null,
    'Das Spiel war auch wirtschaftlich von erheblicher Bedeutung.'
  ),
  (
    'europäisch',
    'adjective',
    'europeo',
    'Por segunda vez el club se ha clasificado para unos cuartos de final europeos.',
    'B1',
    null,
    null,
    null,
    null,
    'Der Verein spielt auf europäischer Bühne.',
    null,
    'Zum zweiten Mal hat sich der Verein für ein europäisches Viertelfinale qualifiziert.'
  ),
  (
    'exportorientiert',
    'adjective',
    'orientado a la exportación',
    'Una economía orientada a la exportación soporta altos costes en caso de inestabilidad geopolítica.',
    'C1',
    null,
    null,
    null,
    null,
    'Deutschland ist eine stark exportorientierte Volkswirtschaft.',
    null,
    'Eine exportorientierte Volkswirtschaft trägt hohe Kosten bei geopolitischer Instabilität.'
  ),
  (
    'festhalten an',
    'verb',
    'mantenerse fiel a / aferrarse a',
    'Freiburg hält bislang an seinem Jungstar fest.',
    'B2',
    null,
    null,
    'festhalten an',
    'Freiburg sigue siendo fiel a su joven estrella.',
    'Der Verein hält an seinem Modell fest.',
    'hielt fest',
    'festgehalten'
  ),
  (
    'finanzdominiert',
    'adjective',
    'dominado por el dinero',
    'En el mundo del fútbol europeo cada vez más dominado por el dinero.',
    'C1',
    null,
    null,
    null,
    null,
    'Der moderne Fußball ist zunehmend finanzdominiert.',
    null,
    'In der zunehmend finanzdominierten Welt des europäischen Fußballs.'
  ),
  (
    'fragil',
    'adjective',
    'frágil',
    'El despegue del mercado de coches eléctricos sigue siendo frágil.',
    'B2',
    null,
    null,
    null,
    null,
    'Das Wachstum ist noch fragil und hängt von der Politik ab.',
    null,
    'Der Hochlauf des E-Auto-Marktes bleibt fragil.'
  ),
  (
    'garantiert',
    'adjective',
    'garantizado',
    'Una recuperación rápida es posible, pero no está garantizada.',
    'B1',
    null,
    null,
    null,
    null,
    'Eine schnelle Erholung ist nicht garantiert.',
    null,
    'Eine schnelle Erholung ist möglich, aber nicht garantiert.'
  ),
  (
    'gemeinsam',
    'adjective',
    'conjunto / compartido',
    'Los expertos recomiendan reglas conjuntas en lugar de prohibiciones.',
    'B1',
    null,
    null,
    null,
    null,
    'Gemeinsame Regeln helfen mehr als Verbote.',
    null,
    'Experten empfehlen gemeinsame Regeln statt Verbote.'
  ),
  (
    'geopolitisch',
    'adjective',
    'geopolítico',
    'La causa es la situación geopolítica persistente en Oriente Próximo.',
    'B2',
    null,
    null,
    null,
    null,
    'Die geopolitische Lage beeinflusst die Energiepreise stark.',
    null,
    'Ursache ist die anhaltende geopolitische Lage im Nahen Osten.'
  ),
  (
    'gesetzlich',
    'adjective',
    'legal / por ley',
    'Algunos estados federales debaten restricciones legales.',
    'B2',
    null,
    null,
    null,
    null,
    'Gesetzliche Maßnahmen werden diskutiert.',
    null,
    'Einige Bundesländer diskutieren gesetzliche Einschränkungen.'
  ),
  (
    'gesund',
    'adjective',
    'sano / saludable',
    'Eso es saludable.',
    'A2',
    null,
    null,
    null,
    null,
    'Weniger Handyzeit ist gesund.',
    null,
    'Das ist gesund.'
  ),
  (
    'gezielt',
    'adjective',
    'intencionado / específico',
    'Manzambi fue promovido de forma específica en la propia cantera.',
    'C1',
    null,
    null,
    null,
    null,
    'Er wurde gezielt auf die große Bühne vorbereitet.',
    null,
    'Manzambi wurde im eigenen Nachwuchs gezielt gefördert.'
  ),
  (
    'global',
    'adjective',
    'global',
    'La guerra había perjudicado gravemente el comercio global.',
    'B1',
    null,
    null,
    null,
    null,
    'Der globale Handel ist durch den Konflikt gestört.',
    null,
    'Der Krieg hatte den globalen Handel stark belastet.'
  ),
  (
    'greifen zu',
    'verb',
    'recurrir a / coger',
    'Sie greifen durchschnittlich alle sieben Minuten zum Handy.',
    'B1',
    null,
    null,
    'greifen zu',
    'Recurren al móvil de media cada siete minutos.',
    'Er greift zum Handy, sobald er eine Minute frei hat.',
    'griff zu',
    'zugegriffen'
  ),
  (
    'gut',
    'adjective',
    'bien',
    'Freiburg juega muy bien.',
    'A2',
    null,
    null,
    null,
    null,
    'Der Verein spielt gut, obwohl er klein ist.',
    null,
    'Freiburg spielt sehr gut.'
  ),
  (
    'günstig',
    'adjective',
    'asequible / económico',
    'Especialmente populares son los modelos más económicos.',
    'B1',
    null,
    null,
    null,
    null,
    'Günstige E-Autos sind sehr gefragt.',
    null,
    'Besonders beliebt sind günstigere Modelle.'
  ),
  (
    'handyfrei',
    'adjective',
    'sin móvil',
    'Los expertos recomiendan momentos sin móvil durante las comidas.',
    'B1',
    null,
    null,
    null,
    null,
    'Handyfreie Zeiten sind wichtig für die Familie.',
    null,
    'Experten empfehlen handyfreie Zeiten beim Essen.'
  ),
  (
    'hindeuten auf',
    'verb',
    'apuntar a / indicar',
    '34 Prozent erfüllen Kriterien, die auf problematische Nutzung hindeuten.',
    'B2',
    null,
    null,
    'hindeuten auf',
    'El 34 por ciento cumple criterios que apuntan a un uso problemático.',
    'Die Daten deuten auf ein wachsendes Problem hin.',
    'deutete hin',
    'hingedeutet'
  ),
  (
    'historisch',
    'adjective',
    'histórico',
    'Es un partido histórico para el club.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist ein historischer Moment für Freiburg.',
    null,
    'Das ist ein historisches Spiel für den Verein.'
  ),
  (
    'hoffen',
    'verb',
    'esperar',
    'Viele Firmen hoffen, dass es wieder besser wird.',
    'A2',
    null,
    null,
    'hoffen',
    'Muchas empresas esperan que las cosas mejoren.',
    'Wir hoffen auf eine schnelle Erholung.',
    'hoffte',
    'gehofft'
  ),
  (
    'illustrieren',
    'verb',
    'ilustrar',
    'Die Waffenruhe illustriert eine strukturelle Verwundbarkeit.',
    'C1',
    null,
    null,
    'illustrieren',
    'El alto el fuego ilustra una vulnerabilidad estructural.',
    'Dieser Fall illustriert das systemische Risiko des Modells.',
    'illustrierte',
    'illustriert'
  ),
  (
    'in die Pflicht nehmen',
    'verb',
    'hacer responsable / obligar',
    'Was fehlt, ist eine Regulierungspolitik, die Plattformanbieter in die Pflicht nimmt.',
    'C1',
    null,
    null,
    'in die Pflicht nehmen',
    'Lo que falta es una política regulatoria que haga responsables a los proveedores de plataformas.',
    'Der Staat muss Technologiekonzerne in die Pflicht nehmen.',
    'nahm in die Pflicht',
    'in die Pflicht genommen'
  ),
  (
    'individuell',
    'adjective',
    'individual',
    'El debate se trata como una cuestión de autocontrol individual.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist keine individuelle Schwäche, sondern ein strukturelles Problem.',
    null,
    'Die Debatte wird als Frage individueller Selbstkontrolle behandelt.'
  ),
  (
    'instabil',
    'adjective',
    'inestable',
    'La situación geopolítica sigue siendo estructuralmente inestable.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Region bleibt instabil trotz der Waffenruhe.',
    null,
    'Die geopolitische Lage bleibt strukturell instabil.'
  ),
  (
    'institutionalisiert',
    'adjective',
    'institucionalizado',
    'La asimetría entre usuarios e ingenieros del comportamiento institucionalizados.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Manipulation durch institutionalisierte Systeme ist schwer zu erkennen.',
    null,
    'Die Asymmetrie zwischen Nutzern und institutionalisierten Verhaltenseningenieuren.'
  ),
  (
    'institutionell',
    'adjective',
    'institucional',
    'El resultado es el fruto de la paciencia institucional.',
    'C1',
    null,
    null,
    null,
    null,
    'Das institutionelle Modell von Freiburg ist einzigartig.',
    null,
    'Das Ergebnis ist die Frucht institutioneller Geduldigkeit.'
  ),
  (
    'integrieren',
    'verb',
    'integrar',
    'Schulen sollen das Thema stärker in den Unterricht integrieren.',
    'B1',
    null,
    null,
    'integrieren',
    'Las escuelas deben integrar más el tema en las clases.',
    'Das Thema sollte in den Unterricht integriert werden.',
    'integrierte',
    'integriert'
  ),
  (
    'jung',
    'adjective',
    'joven',
    'Muchos niños y jóvenes usan su móvil muchísimo.',
    'A2',
    null,
    null,
    null,
    null,
    'Junge Menschen sind besonders betroffen.',
    null,
    'Viele Kinder und Jugendliche benutzen ihr Handy sehr viel.'
  ),
  (
    'kaufen',
    'verb',
    'comprar',
    'Immer mehr Menschen kaufen ein Elektroauto.',
    'A2',
    null,
    null,
    'kaufen',
    'Cada vez más personas compran un coche eléctrico.',
    'Sie kauft ein neues Elektroauto.',
    'kaufte',
    'gekauft'
  ),
  (
    'klein',
    'adjective',
    'pequeño',
    'Freiburg es un club pequeño pero juega muy bien.',
    'A2',
    null,
    null,
    null,
    null,
    'Es ist ein kleiner Verein mit großem Herz.',
    null,
    'Freiburg ist ein kleiner Verein, aber er spielt sehr gut.'
  ),
  (
    'kognitiv',
    'adjective',
    'cognitivo',
    'Un chico de 13 años debe desarrollar resiliencia cognitiva.',
    'C1',
    null,
    null,
    null,
    null,
    'Die kognitiven Fähigkeiten junger Menschen werden durch Handysucht beeinträchtigt.',
    null,
    'Ein 13-Jähriger soll kognitive Resilienz entwickeln.'
  ),
  (
    'konjunkturell',
    'adjective',
    'coyuntural',
    'La recuperación coyuntural fue bruscamente interrumpida.',
    'B2',
    null,
    null,
    null,
    null,
    'Die konjunkturelle Lage hat sich verschlechtert.',
    null,
    'Die konjunkturelle Erholung wurde jäh unterbrochen.'
  ),
  (
    'kostspielig',
    'adjective',
    'costoso',
    'La implementación del nearshoring es costosa y lenta.',
    'C1',
    null,
    null,
    null,
    null,
    'Strukturelle Anpassungen sind oft kostspielig.',
    null,
    'Die Umsetzung von Nearshoring ist kostspielig und langsam.'
  ),
  (
    'kurzfristig',
    'adjective',
    'a corto plazo',
    'Muchos no tienen posibilidad de cambiar a corto plazo.',
    'C1',
    null,
    null,
    null,
    null,
    'Ein kurzfristiger Umstieg ist für viele nicht möglich.',
    null,
    'Viele haben keine Möglichkeit, kurzfristig umzusteigen.'
  ),
  (
    'kämpfen',
    'verb',
    'luchar / combatir',
    'Die beiden Länder kämpfen gerade nicht.',
    'A2',
    null,
    null,
    'kämpfen',
    'Los dos países no están combatiendo por ahora.',
    'Die Länder haben lange gekämpft.',
    'kämpfte',
    'gekämpft'
  ),
  (
    'live',
    'adjective',
    'en directo',
    'El partido fue retransmitido en directo por RTL.',
    'B1',
    null,
    null,
    null,
    null,
    'Das Spiel ist live im Fernsehen zu sehen.',
    null,
    'Das Spiel wurde live auf RTL übertragen.'
  ),
  (
    'ländlich',
    'adjective',
    'rural',
    'En muchas regiones rurales faltan puntos de carga.',
    'B1',
    null,
    null,
    null,
    null,
    'In ländlichen Gebieten gibt es weniger Ladesäulen.',
    null,
    'In vielen ländlichen Regionen fehlen Ladesäulen.'
  ),
  (
    'lückenhaft',
    'adjective',
    'incompleto / con lagunas',
    'La infraestructura de carga sigue siendo incompleta.',
    'B2',
    null,
    null,
    null,
    null,
    'Das Ladenetz in ländlichen Regionen ist noch sehr lückenhaft.',
    null,
    'Die Ladeinfrastruktur ist nach wie vor lückenhaft.'
  ),
  (
    'mehr',
    'adjective',
    'más',
    'Cada vez más personas compran un coche eléctrico.',
    'A2',
    null,
    null,
    null,
    null,
    'Immer mehr Leute kaufen E-Autos.',
    null,
    'Immer mehr Menschen kaufen ein Elektroauto.'
  ),
  (
    'mithalten',
    'verb',
    'mantenerse al nivel / competir',
    'Freiburg hat bewiesen, dass es mit großen Vereinen mithalten kann.',
    'B1',
    null,
    null,
    'mithalten',
    'Freiburg ha demostrado que puede competir con clubes grandes.',
    'Der kleine Verein kann mit den Großen mithalten.',
    'hielt mit',
    'mitgehalten'
  ),
  (
    'monopolisieren',
    'verb',
    'monopolizar',
    'Die Mechanismen sind darauf ausgelegt, Aufmerksamkeit zu monopolisieren.',
    'C1',
    null,
    null,
    'monopolisieren',
    'Los mecanismos están diseñados para monopolizar la atención.',
    'Plattformen monopolisieren die Zeit der Nutzer.',
    'monopolisierte',
    'monopolisiert'
  ),
  (
    'nachhaltig',
    'adjective',
    'sostenible',
    'Una transición del transporte que profundiza esta brecha no es socialmente sostenible.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine sozial nachhaltige Lösung muss alle einschließen.',
    null,
    'Eine Mobilitätswende, die diese Spaltung vertieft, ist sozial nicht nachhaltig.'
  ),
  (
    'nahelegen',
    'verb',
    'sugerir / apuntar a',
    'Die Zahlen legen nahe: unter bestimmten Bedingungen ja.',
    'C1',
    null,
    null,
    'nahelegen',
    'Los datos sugieren: bajo ciertas condiciones, sí.',
    'Die Ergebnisse legen nahe, dass das Modell funktioniert.',
    'legte nahe',
    'nahegelegt'
  ),
  (
    'negativ',
    'adjective',
    'negativo',
    'El mercado produce claras externalidades negativas.',
    'C1',
    null,
    null,
    null,
    null,
    'Die negativen Auswirkungen auf Jugendliche sind gut belegt.',
    null,
    'Der Markt produziert klare negative Externalitäten.'
  ),
  (
    'neu',
    'adjective',
    'nuevo',
    'Muchas marcas de coches tienen modelos eléctricos nuevos.',
    'A2',
    null,
    null,
    null,
    null,
    'Es gibt viele neue E-Autos auf dem Markt.',
    null,
    'Viele Automarken haben neue Elektromodelle.'
  ),
  (
    'neurologisch',
    'adjective',
    'neurológico',
    'Las recompensas activan el mismo sistema neurológico de recompensa.',
    'B2',
    null,
    null,
    null,
    null,
    'Das neurologische Belohnungssystem reagiert auf Likes.',
    null,
    'Belohnungen aktivieren dasselbe neurologische Belohnungssystem.'
  ),
  (
    'nächst-',
    'adjective',
    'siguiente',
    'El partido fue importante para la siguiente ronda.',
    'A2',
    null,
    null,
    null,
    null,
    'In der nächsten Runde spielt Freiburg auswärts.',
    null,
    'Das Spiel war wichtig für die nächste Runde.'
  ),
  (
    'passierbar',
    'adjective',
    'transitable',
    'El estrecho de Ormuz vuelve a ser transitable.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Schifffahrtsroute ist wieder passierbar.',
    null,
    'Die Straße von Hormus ist wieder passierbar.'
  ),
  (
    'pendeln',
    'verb',
    'ir al trabajo (en coche)',
    'Verbraucher spüren das besonders beim Pendeln.',
    'B1',
    null,
    null,
    'pendeln',
    'Los consumidores lo notan especialmente al ir al trabajo.',
    'Er pendelt jeden Tag 40 Kilometer zur Arbeit.',
    'pendelte',
    'gependelt'
  ),
  (
    'privilegiert',
    'adjective',
    'privilegiado',
    'Sin este marco la transición del transporte sigue siendo un proyecto de los privilegiados.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Verkehrswende darf kein Projekt der Privilegierten bleiben.',
    null,
    'Ohne diesen Rahmen bleibt die Verkehrswende ein Projekt der Privilegierten.'
  ),
  (
    'problematisch',
    'adjective',
    'problemático',
    'Más de un tercio muestra señales de uso problemático del smartphone.',
    'B1',
    null,
    null,
    null,
    null,
    'Das ist eine problematische Entwicklung.',
    null,
    'Mehr als ein Drittel zeigt Anzeichen von problematischer Smartphone-Nutzung.'
  ),
  (
    'präfrontal',
    'adjective',
    'prefrontal',
    'La corteza prefrontal es responsable del control de impulsos.',
    'C1',
    null,
    null,
    null,
    null,
    'Der präfrontale Kortex reift bei Jugendlichen noch.',
    null,
    'Das präfrontale Kortex ist für Impulskontrolle zuständig.'
  ),
  (
    'qualifizieren',
    'verb',
    'clasificarse',
    'Zum zweiten Mal hat sich der Verein für ein Viertelfinale qualifiziert.',
    'B1',
    null,
    null,
    'qualifizieren',
    'Por segunda vez el club se ha clasificado para unos cuartos de final.',
    'Freiburg hat sich für das Viertelfinale qualifiziert.',
    'qualifizierte',
    'qualifiziert'
  ),
  (
    'rational',
    'adjective',
    'racional',
    'Los altos precios de la gasolina abren un incentivo racional para cambiar.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine rationale Entscheidung in dieser Situation.',
    null,
    'Hohe Spritpreise eröffnen einen rationalen Umstiegsanreiz.'
  ),
  (
    'rechnen mit',
    'verb',
    'contar con / esperar',
    'Der BGA rechnet damit, dass die Folgen noch spürbar bleiben.',
    'B1',
    null,
    null,
    'rechnen mit',
    'La BGA cuenta con que las consecuencias aún se notarán.',
    'Experten rechnen mit einer langsamen Erholung.',
    'rechnete',
    'gerechnet'
  ),
  (
    'reifen',
    'verb',
    'madurar',
    'Das präfrontale Kortex reift erst um das 25. Lebensjahr vollständig.',
    'C1',
    null,
    null,
    'reifen',
    'La corteza prefrontal madura completamente hacia los 25 años.',
    'Das Gehirn reift bei Jugendlichen noch.',
    'reifte',
    'gereift'
  ),
  (
    'repräsentieren',
    'verb',
    'representar',
    'Das Vereinsprojekt repräsentiert einen strukturellen Gegenentwurf.',
    'C1',
    null,
    null,
    'repräsentieren',
    'El proyecto del club representa un modelo alternativo estructural.',
    'Freiburg repräsentiert eine andere Art, Fußball zu betreiben.',
    'repräsentierte',
    'repräsentiert'
  ),
  (
    'resilient',
    'adjective',
    'resiliente',
    'Las empresas quieren hacer sus cadenas de suministro más resilientes.',
    'B2',
    null,
    null,
    null,
    null,
    'Resiliente Lieferketten sind heute wichtiger denn je.',
    null,
    'Unternehmen wollen ihre Lieferketten resilienter gestalten.'
  ),
  (
    'schaffen',
    'verb',
    'crear / lograr',
    'Das Programm soll eine Million Ladepunkte schaffen.',
    'B1',
    null,
    null,
    'schaffen',
    'El programa debe crear un millón de puntos de carga.',
    'Die Regierung will mehr Ladepunkte schaffen.',
    'schuf',
    'geschaffen'
  ),
  (
    'schlafen',
    'verb',
    'dormir',
    'Die Kinder schlafen schlecht.',
    'A2',
    null,
    null,
    'schlafen',
    'Los niños duermen mal.',
    'Sie schläft schlecht wegen des Handys.',
    'schlief',
    'geschlafen'
  ),
  (
    'schlecht',
    'adjective',
    'mal',
    'Los niños duermen mal.',
    'A2',
    null,
    null,
    null,
    null,
    'Schlechter Schlaf ist ein Problem.',
    null,
    'Die Kinder schlafen schlecht.'
  ),
  (
    'schwer',
    'adjective',
    'difícil',
    'Era difícil vender mercancías a otros países.',
    'A2',
    null,
    null,
    null,
    null,
    'Der Export war sehr schwer.',
    null,
    'Es war schwer, Waren in andere Länder zu verkaufen.'
  ),
  (
    'sehen',
    'verb',
    'ver',
    'Viele Fans haben das Spiel gesehen.',
    'A2',
    null,
    null,
    'sehen',
    'Muchos aficionados vieron el partido.',
    'Ich habe das Spiel im Fernsehen gesehen.',
    'sah',
    'gesehen'
  ),
  (
    'selten',
    'adjective',
    'poco frecuente / raramente',
    'Los niños se ven menos con amigos.',
    'A2',
    null,
    null,
    null,
    null,
    'Er trifft Freunde immer seltener.',
    null,
    'Die Kinder treffen sich seltener mit Freunden.'
  ),
  (
    'solide',
    'adjective',
    'sólido',
    'El modelo representa una gestión presupuestaria sólida.',
    'B2',
    null,
    null,
    null,
    null,
    'Der Verein hat eine solide finanzielle Basis.',
    null,
    'Das Modell steht für solide Haushaltsführung.'
  ),
  (
    'sozial',
    'adjective',
    'social',
    'Hay menos contactos sociales en el mundo real.',
    'B1',
    null,
    null,
    null,
    null,
    'Soziale Kontakte leiden unter der Handysucht.',
    null,
    'Es gibt weniger soziale Kontakte in der realen Welt.'
  ),
  (
    'spannend',
    'adjective',
    'emocionante',
    'El partido fue emocionante e importante.',
    'A2',
    null,
    null,
    null,
    null,
    'Das war ein sehr spannendes Spiel.',
    null,
    'Das Spiel war spannend und wichtig.'
  ),
  (
    'spielen',
    'verb',
    'jugar',
    'Freiburg hat gegen Celta Vigo gespielt.',
    'A2',
    null,
    null,
    'spielen',
    'Freiburg jugó contra el Celta Vigo.',
    'Der Verein spielt heute in Europa.',
    'spielte',
    'gespielt'
  ),
  (
    'spürbar',
    'adjective',
    'perceptible / notorio',
    'Las consecuencias económicas siguen siendo perceptibles.',
    'B1',
    null,
    null,
    null,
    null,
    'Der Rückgang der Exporte ist deutlich spürbar.',
    null,
    'Die wirtschaftlichen Folgen bleiben noch spürbar.'
  ),
  (
    'stagnieren',
    'verb',
    'estancarse',
    'In strukturschwachen Kreisen stagniert der Elektroanteil.',
    'C1',
    null,
    null,
    'stagnieren',
    'En las comarcas desfavorecidas el porcentaje eléctrico se estanca.',
    'Das Wachstum stagniert in ländlichen Regionen.',
    'stagnierte',
    'stagniert'
  ),
  (
    'standardmäßig',
    'adjective',
    'por defecto / estándar',
    'Lo que falta son límites de uso estándar para menores.',
    'C1',
    null,
    null,
    null,
    null,
    'Standardmäßige Grenzen schützen Minderjährige besser.',
    null,
    'Was fehlt, sind standardmäßige Nutzungsgrenzen für Minderjährige.'
  ),
  (
    'stark',
    'adjective',
    'fuerte / destacado',
    'Johan Manzambi ha llamado la atención con sus actuaciones destacadas.',
    'B1',
    null,
    null,
    null,
    null,
    'Er hat eine sehr starke Saison gespielt.',
    null,
    'Johan Manzambi hat mit starken Leistungen auf sich aufmerksam gemacht.'
  ),
  (
    'statistisch',
    'adjective',
    'estadístico',
    'La caída no es ruido estadístico.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist kein statistisches Rauschen, sondern ein realer Einbruch.',
    null,
    'Der Rückgang ist kein statistisches Rauschen.'
  ),
  (
    'steuern',
    'verb',
    'controlar / dirigir',
    'Wenn das Smartphone Jugendliche steuert.',
    'B2',
    null,
    null,
    'steuern',
    'Cuando el smartphone controla a los jóvenes.',
    'Algorithmen steuern das Verhalten der Nutzer.',
    'steuerte',
    'gesteuert'
  ),
  (
    'stolz',
    'adjective',
    'orgulloso',
    'Los aficionados están muy orgullosos.',
    'A2',
    null,
    null,
    null,
    null,
    'Die Fans sind stolz auf ihren kleinen Verein.',
    null,
    'Die Fans sind sehr stolz.'
  ),
  (
    'stornieren',
    'verb',
    'cancelar',
    'Viele Verträge wurden storniert.',
    'B1',
    null,
    null,
    'stornieren',
    'Muchos contratos fueron cancelados.',
    'Die Aufträge wurden wegen des Krieges storniert.',
    'stornierte',
    'storniert'
  ),
  (
    'strukturell',
    'adjective',
    'estructural',
    'Precios récord: ¿corrección de mercado o transición estructural del transporte?',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist ein strukturelles Problem, kein kurzfristiges.',
    null,
    'Rekordspritpreise: Marktkorrektur oder strukturelle Verkehrswende?'
  ),
  (
    'strukturschwach',
    'adjective',
    'con poca infraestructura / desfavorecido',
    'La infraestructura de carga en regiones desfavorecidas es incompleta.',
    'B2',
    null,
    null,
    null,
    null,
    'In strukturschwachen Regionen fehlen Ladesäulen besonders.',
    null,
    'Die Ladeinfrastruktur in strukturschwachen Regionen ist lückenhaft.'
  ),
  (
    'symbolisieren',
    'verb',
    'simbolizar',
    'Der Verein symbolisiert ein Modell, das als anachronistisch gilt.',
    'B2',
    null,
    null,
    'symbolisieren',
    'El club simboliza un modelo considerado anacrónico.',
    'Freiburg symbolisiert nachhaltigen Fußball.',
    'symbolisierte',
    'symbolisiert'
  ),
  (
    'symptomatisch',
    'adjective',
    'sintomático',
    'Johan Manzambi es sintomático de este enfoque.',
    'C1',
    null,
    null,
    null,
    null,
    'Sein Fall ist symptomatisch für das Freiburg-Modell.',
    null,
    'Johan Manzambi steht symptomatisch für diesen Ansatz.'
  ),
  (
    'systemisch',
    'adjective',
    'sistémico',
    'Esta fortaleza exportadora es al mismo tiempo el mayor riesgo sistémico.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist ein systemisches Risiko, kein vorübergehendes.',
    null,
    'Diese Exportstärke ist zugleich das größte systemische Risiko.'
  ),
  (
    'süchtig',
    'adjective',
    'adicto',
    'Muchos jóvenes son adictos a su móvil.',
    'A2',
    null,
    null,
    null,
    null,
    'Er ist süchtig nach Social Media.',
    null,
    'Viele Jugendliche sind süchtig nach ihrem Handy.'
  ),
  (
    'teuer',
    'adjective',
    'caro',
    'La gasolina es cara.',
    'A2',
    null,
    null,
    null,
    null,
    'Das Benzin wird immer teurer.',
    null,
    'Benzin ist teuer.'
  ),
  (
    'transparent',
    'adjective',
    'transparente',
    'Lo que falta son algoritmos transparentes.',
    'C1',
    null,
    null,
    null,
    null,
    'Plattformen sollten transparente Algorithmen verwenden.',
    null,
    'Was fehlt, sind transparente Algorithmen.'
  ),
  (
    'umsteigen',
    'verb',
    'cambiar / pasarse',
    'Das verstärkt den Druck, auf emissionsfreie Alternativen umzusteigen.',
    'B2',
    null,
    null,
    'umsteigen',
    'Eso intensifica la presión para pasarse a alternativas sin emisiones.',
    'Viele Pendler wollen auf E-Autos umsteigen.',
    'stieg um',
    'umgestiegen'
  ),
  (
    'unterbrechen',
    'verb',
    'interrumpir',
    'Viele Lieferketten wurden unterbrochen.',
    'B1',
    null,
    null,
    'unterbrechen',
    'Muchas cadenas de suministro fueron interrumpidas.',
    'Der Krieg hat die Lieferketten unterbrochen.',
    'unterbrach',
    'unterbrochen'
  ),
  (
    'verbinden',
    'verb',
    'conectar / combinar',
    'Eine Gesamtpolitik, die Preisinstrumente mit Infrastrukturinvestitionen verbindet.',
    'C1',
    null,
    null,
    'verbinden',
    'Una política global que combina instrumentos de precios con inversiones en infraestructura.',
    'Man muss Preisinstrumente mit sozialen Maßnahmen verbinden.',
    'verband',
    'verbunden'
  ),
  (
    'vereinbar',
    'adjective',
    'compatible',
    '¿Son compatibles la gestión sostenible y el éxito deportivo?',
    'C1',
    null,
    null,
    null,
    null,
    'Nachhaltigkeit und Erfolg sind vereinbar.',
    null,
    'Ist nachhaltiges Wirtschaften und sportlicher Erfolg vereinbar?'
  ),
  (
    'verfrüht',
    'adjective',
    'prematuro',
    'La BGA advierte contra el optimismo prematuro.',
    'B2',
    null,
    null,
    null,
    null,
    'Verfrühter Optimismus wäre jetzt fehl am Platz.',
    null,
    'Der BGA warnt vor verfrühtem Optimismus.'
  ),
  (
    'verkaufen',
    'verb',
    'vender',
    'Es war schwer, Waren in andere Länder zu verkaufen.',
    'A2',
    null,
    null,
    'verkaufen',
    'Era difícil vender mercancías a otros países.',
    'Deutschland verkauft viele Waren ins Ausland.',
    'verkaufte',
    'verkauft'
  ),
  (
    'verstärken',
    'verb',
    'intensificar',
    'Das verstärkt den Druck, auf Alternativen umzusteigen.',
    'B2',
    null,
    null,
    'verstärken',
    'Eso intensifica la presión para pasarse a alternativas.',
    'Hohe Preise verstärken den Trend zum E-Auto.',
    'verstärkte',
    'verstärkt'
  ),
  (
    'verteilungspolitisch',
    'adjective',
    'en cuanto a distribución / distributivo',
    'La respuesta es distributivamente compleja.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine verteilungspolitisch heikle Frage.',
    null,
    'Die Antwort ist verteilungspolitisch komplex.'
  ),
  (
    'vertiefen',
    'verb',
    'profundizar / ahondar',
    'Eine Mobilitätswende, die diese Spaltung vertieft, ist nicht nachhaltig.',
    'C1',
    null,
    null,
    'vertiefen',
    'Una transición que ahonda esta brecha no es sostenible.',
    'Hohe Preise vertiefen die soziale Ungleichheit.',
    'vertiefte',
    'vertieft'
  ),
  (
    'verzichten auf',
    'verb',
    'renunciar a',
    'Unternehmen sollten nicht auf Diversifizierung verzichten.',
    'B2',
    null,
    null,
    'verzichten auf',
    'Las empresas no deben renunciar a la diversificación.',
    'Man sollte nicht auf Resilienz verzichten.',
    'verzichtete',
    'verzichtet'
  ),
  (
    'viel',
    'adjective',
    'mucho',
    'En Alemania la gasolina cuesta ahora mucho dinero.',
    'A2',
    null,
    null,
    null,
    null,
    'Er fährt sehr viel mit dem Auto.',
    null,
    'In Deutschland kostet Benzin gerade sehr viel Geld.'
  ),
  (
    'vorläufig',
    'adjective',
    'provisional / por ahora',
    'Este es el punto álgido provisional del proyecto del club.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist der vorläufige Höhepunkt einer bemerkenswerten Saison.',
    null,
    'Das ist der vorläufige Höhepunkt des Vereinsprojekts.'
  ),
  (
    'wecken',
    'verb',
    'despertar',
    'Die Waffenruhe hat bei deutschen Unternehmen Hoffnung geweckt.',
    'B1',
    null,
    null,
    'wecken',
    'El alto el fuego ha despertado esperanza en las empresas alemanas.',
    'Die Nachricht hat Hoffnung geweckt.',
    'weckte',
    'geweckt'
  ),
  (
    'weglegen',
    'verb',
    'dejar / apartar',
    'Am Abend soll man das Handy früh weglegen.',
    'A2',
    null,
    null,
    'weglegen',
    'Por la noche se debe dejar el móvil pronto.',
    'Leg das Handy weg und schlaf!',
    'legte weg',
    'weggelegt'
  ),
  (
    'wettbewerbsfähig',
    'adjective',
    'competitivo',
    'La inteligencia estructural puede ser competitiva también sin petrodólares.',
    'C1',
    null,
    null,
    null,
    null,
    'Freiburg ist wettbewerbsfähig ohne große Investitionen.',
    null,
    'Strukturelle Klugheit kann auch ohne Petrodollar wettbewerbsfähig sein.'
  ),
  (
    'wichtig',
    'adjective',
    'importante',
    'El partido fue importante para la siguiente ronda.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist ein sehr wichtiges Spiel für den Verein.',
    null,
    'Das Spiel war wichtig für die nächste Runde.'
  ),
  (
    'widerstandsfähig',
    'adjective',
    'resistente',
    'La pregunta sobre cómo una economía se vuelve estructuralmente más resistente.',
    'C1',
    null,
    null,
    null,
    null,
    'Deutschland muss widerstandsfähiger gegenüber Krisen werden.',
    null,
    'Die Frage, wie eine Volkswirtschaft strukturell widerstandsfähiger wird.'
  ),
  (
    'wirksam',
    'adjective',
    'eficaz',
    '¿Son los altos precios de la energía el instrumento más eficaz?',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist das wirksamste Mittel zur Beschleunigung der Wende.',
    null,
    'Sind hohe Energiepreise das wirksamste Instrument?'
  ),
  (
    'wirtschaftlich',
    'adjective',
    'económico',
    'Las consecuencias económicas siguen siendo perceptibles.',
    'B1',
    null,
    null,
    null,
    null,
    'Die wirtschaftlichen Folgen des Krieges sind erheblich.',
    null,
    'Die wirtschaftlichen Folgen bleiben noch spürbar.'
  ),
  (
    'wirtschaftspolitisch',
    'adjective',
    'de política económica',
    'La respuesta de política económica ha sido hasta ahora vacilante.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine klare wirtschaftspolitische Strategie fehlt noch.',
    null,
    'Die wirtschaftspolitische Reaktion ist bislang zögerlich.'
  ),
  (
    'wohlhabend',
    'adjective',
    'acomodado / próspero',
    'El crecimiento se concentra en regiones prósperas.',
    'C1',
    null,
    null,
    null,
    null,
    'Wohlhabende Haushalte profitieren mehr von der Verkehrswende.',
    null,
    'Das Wachstum konzentriert sich auf wohlhabende Regionen.'
  ),
  (
    'zögerlich',
    'adjective',
    'vacilante / titubeante',
    'La respuesta de política económica ha sido hasta ahora vacilante.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Reaktion der Regierung ist zu zögerlich.',
    null,
    'Die wirtschaftspolitische Reaktion ist bislang zögerlich.'
  ),
  (
    'öffentlich',
    'adjective',
    'público',
    'El programa debe crear un millón de puntos de carga públicos.',
    'B1',
    null,
    null,
    null,
    null,
    'Es braucht mehr öffentliche Lademöglichkeiten.',
    null,
    'Das Programm soll eine Million öffentliche Ladepunkte schaffen.'
  ),
  (
    'überfordert',
    'adjective',
    'superado / desbordado',
    'Muchos padres se sienten desbordados.',
    'B2',
    null,
    null,
    null,
    null,
    'Viele Eltern sind mit dem Thema überfordert.',
    null,
    'Viele Eltern fühlen sich überfordert.'
  ),
  (
    'überholen',
    'verb',
    'superar / adelantar',
    'Erstmals überholten E-Autos die Dieselfahrzeuge in den Verkaufszahlen.',
    'B2',
    null,
    null,
    'überholen',
    'Por primera vez los coches eléctricos superaron a los diésel en cifras de ventas.',
    'E-Autos haben Diesel in den Neuzulassungen überholt.',
    'überholte',
    'überholt'
  ),
  (
    'übertragen',
    'verb',
    'retransmitir',
    'Das Spiel wurde live auf RTL übertragen.',
    'B1',
    null,
    null,
    'übertragen',
    'El partido fue retransmitido en directo por RTL.',
    'Das Spiel wurde auf mehreren Sendern übertragen.',
    'übertrug',
    'übertragen'
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
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'das Benzin'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'der Preis'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'das Elektroauto'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'der Strom'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'der Staat'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'die Bundesregierung'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'das Auto'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'bezahlen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'kaufen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'brauchen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'teuer'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'billig'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'neu'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'viel'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'A2',
    'mehr'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'der Spritpreis'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'der Höchststand'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'die Nachfrage'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'die Ladesäule'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'die Ladeinfrastruktur'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'der Verbraucher'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'das Quartal'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'pendeln'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'anhalten'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'schaffen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'ankündigen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'direkt'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'ländlich'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'öffentlich'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B1',
    'günstig'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'der Kraftstoffpreis'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'die Neuzulassung'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'die Belastung'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'die Anschaffungskosten'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'der Rohstoffengpass'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'die CO2-Bepreisung'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'die Elektromobilität'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'umsteigen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'überholen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'verstärken'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'lückenhaft'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'fragil'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'emissionsfrei'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'strukturschwach'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'B2',
    'geopolitisch'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'die Verkehrswende'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'der Umstiegsanreiz'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'die Kostensteigerung'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'die Spaltung'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'die Kompensation'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'das Preisinstrument'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'die Marktkorrektur'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'entfachen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'stagnieren'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'vertiefen'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'verbinden'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'verteilungspolitisch'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'einkommensschwach'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'nachhaltig'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'privilegiert'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'wirksam'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'kurzfristig'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'wohlhabend'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'rational'
  ),
  (
    'benzin-ist-teuer-immer-mehr-menschen-kaufen-e-autos',
    'C1',
    'strukturell'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'der Fußballverein'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'der Wettbewerb'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'das Spiel'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'das Stadion'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'der Fan'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'die Runde'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'spielen'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'sehen'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'spannend'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'stolz'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'wichtig'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'klein'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'gut'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'nächst-'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'A2',
    'historisch'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'das Viertelfinale'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'das Hinspiel'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'das Rückspiel'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'der Außenseiter'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'das Talent'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'die Saison'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'die Leistung'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'bestreiten'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'qualifizieren'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'mithalten'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'übertragen'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'historisch'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'europäisch'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'live'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B1',
    'stark'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'der Provinzklub'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'die Nachwuchsförderung'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'die Haushaltsführung'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'die Kontinuität'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'die Vorlage'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'der Kader'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'der Halbfinaleinzug'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'aufschlagen'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'symbolisieren'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'festhalten an'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'bemerkenswert'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'auffällig'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'anachronistisch'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'solide'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'B2',
    'erheblich'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'der Gegenentwurf'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'die Einnahmenstruktur'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'der Wettbewerbsvorteil'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'die Blaupause'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'die Geduldigkeit'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'der Marktwert'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'der Petrodollar'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'nahelegen'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'repräsentieren'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'aufwerfen'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'symptomatisch'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'finanzdominiert'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'wettbewerbsfähig'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'vorläufig'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'gezielt'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'institutionell'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'effizient'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'vereinbar'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'nachhaltig'
  ),
  (
    'sc-freiburg-spielt-in-europa',
    'C1',
    'strukturell'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'das Handy'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'die Handysucht'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'das Problem'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'die Sorge'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'der Freund'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'der Experte'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'der Abend'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'benutzen'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'schlafen'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'weglegen'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'süchtig'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'gesund'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'schlecht'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'selten'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'A2',
    'jung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'die Studie'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'der Schlafmangel'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'die Aufmerksamkeit'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'die Medienkompetenz'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'das Verbot'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'die Nutzungszeit'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'die Gewohnheit'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'ansprechen'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'integrieren'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'greifen zu'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'problematisch'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'sozial'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'gemeinsam'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'durchschnittlich'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B1',
    'handyfrei'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'die Abhängigkeit'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'die Schlafstörung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'die Verstärkung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'die Benachrichtigung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'das Hindernis'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'die Einschränkung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'die Erhebung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'hindeuten auf'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'aktivieren'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'steuern'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'beunruhigend'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'neurologisch'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'beträchtlich'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'überfordert'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'B2',
    'gesetzlich'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'die Rahmungsverzerrung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'die Nutzerbindung'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'der Inhaltsstream'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'die Asymmetrie'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'die Impulskontrolle'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'die Resilienz'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'die Externalität'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'monopolisieren'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'reifen'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'in die Pflicht nehmen'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'algorithmisch'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'institutionalisiert'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'präfrontal'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'kognitiv'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'standardmäßig'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'transparent'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'strukturell'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'bewusst'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'negativ'
  ),
  (
    'viele-jugendliche-sind-suechtig-nach-ihrem-handy',
    'C1',
    'individuell'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'die Waffenruhe'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'der Krieg'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'die Ware'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'der Export'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'die Firma'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'die Nachricht'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'kämpfen'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'hoffen'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'verkaufen'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'gut'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'schwer'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'beide'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'deutsch'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'besser'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'A2',
    'wichtig'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'der Exporteur'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'die Lieferkette'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'die Schifffahrtsroute'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'die Blockade'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'die Versicherungsprämie'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'die Erholung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'der Maschinenbau'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'wecken'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'stornieren'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'unterbrechen'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'rechnen mit'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'wirtschaftlich'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'global'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'spürbar'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B1',
    'garantiert'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'die Entspannung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'die Bedrohung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'der Einbruch'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'die Diversifizierung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'der Friedensvertrag'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'die Auftragsverschiebung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'der Optimismus'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'entschärfen'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'abzeichnen'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'verzichten auf'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'passierbar'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'konjunkturell'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'resilient'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'verfrüht'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'B2',
    'instabil'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'die Verwundbarkeit'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'die Wertschöpfungskette'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'die Vorhersehbarkeit'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'die Atempause'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'die Fragmentierung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'die Verflechtung'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'das Nearshoring'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'illustrieren'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'abkoppeln'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'drängend'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'exportorientiert'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'anfällig'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'symptomatisch'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'systemisch'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'kostspielig'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'zögerlich'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'widerstandsfähig'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'geopolitisch'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'statistisch'
  ),
  (
    'frieden-zwischen-den-usa-und-iran-was-bedeutet-das-fuer-deutschland',
    'C1',
    'wirtschaftspolitisch'
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

