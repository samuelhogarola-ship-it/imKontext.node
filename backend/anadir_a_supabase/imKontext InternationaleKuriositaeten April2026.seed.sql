-- ============================================================
-- Seed generated from structured TXT
-- Source: /Users/sam/Documents/imKontext/backend/anadir_a_supabase/imKontext InternationaleKuriositaeten April2026.txt
-- Tables: texts, text_versions, vocabulario, text_version_vocabulary
-- ============================================================

-- Theme 1: Eurovision Song Contest 2026 findet in Wien statt
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Eurovision Song Contest 2026 findet in Wien statt',
  null,
  'premium',
  now(),
  'eurovision-song-contest-2026-findet-in-wien-statt'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'eurovision-song-contest-2026-findet-in-wien-statt'),
  'A2',
  'Der Eurovision Song Contest ist ein großer Musikwettbewerb in Europa. Viele Länder singen gegeneinander. Das Publikum und eine Jury wählen den Gewinner.

In diesem Jahr findet der Eurovision in Wien statt. Das ist die Hauptstadt von Österreich. Österreich hat den Wettbewerb gewonnen, weil ein österreichischer Künstler 2025 gewonnen hat.

Der Eurovision macht sehr viel Spaß. Millionen von Menschen schauen den Wettbewerb im Fernsehen. Auch viele Deutsche, Schweizer und Österreicher sind Fans.'
),
(
  (select id from texts where slug = 'eurovision-song-contest-2026-findet-in-wien-statt'),
  'B1',
  'Wien ist in diesem Jahr Gastgeberstadt des 70. Eurovision Song Contests. Nach dem Sieg des österreichischen Künstlers JJ im Vorjahr hat Österreich das Recht erhalten, den Wettbewerb auszurichten. Das Finale findet am 16. Mai in der Wiener Stadthalle statt.

Mehr als 37 Länder nehmen teil, darunter Deutschland, die Schweiz und österreich selbst. Jedes Land schickt einen Act mit einem eigenen Song. Die Abstimmung ist ein Mix aus Jury-Entscheidungen und Publikumsvoting aus ganz Europa.

Wien erwartet Hunderttausende Besucherinnen und Besucher. Die Stadt hat ein umfangreiches Rahmenprogramm geplant: kostenlose Open-Air-Konzerte, Fan-Zones und eine Eurovision-Ausstellung im Kunsthistorischen Museum. Für die Tourismusbranche ist es das wichtigste Ereignis des Jahres.'
),
(
  (select id from texts where slug = 'eurovision-song-contest-2026-findet-in-wien-statt'),
  'B2',
  'Der 70. Eurovision Song Contest, der am 16. Mai in der Wiener Stadthalle sein Finale erlebt, ist längst mehr als ein Liederwettstreit. Er ist ein jährliches Ritual europäischer Identität, eine Plattform für kulturelle Selbstdarstellung und – seit Jahren – ein zunehmend politisch aufgeladenes Ereignis.

Österreich freut sich über die Rückkehr des Contests nach Wien, wo der ESC zuletzt 2015 stattfand. Der Gastgeberstatus bringt erhebliche Einnahmen: Experten schätzen den wirtschaftlichen Effekt auf über 200 Millionen Euro für die Wiener Stadtregion. Hotels sind seit Monaten ausgebucht, und die Nachfrage nach Tickets überstieg das Angebot innerhalb von Minuten.

Für Deutschland ist der ESC eine besondere Angelegenheit. Nach Jahren schwacher Platzierungen – inklusive mehrerer letzter Plätze – hat der NDR das Auswahlverfahren reformiert und setzt 2026 auf einen Act, der in sozialen Medien bereits eine starke Fanbasis hat. Ob es reicht, um das Stigma der deutschen ESC-Misserfolge zu durchbrechen, wird sich im Mai zeigen.'
),
(
  (select id from texts where slug = 'eurovision-song-contest-2026-findet-in-wien-statt'),
  'C1',
  'Der Eurovision Song Contest ist das bestgehaltene Paradox der europäischen Kulturpolitik: ein explizit unpolitischer Wettbewerb, der seit Jahrzehnten als Seismograph für politische Spannungen, gesellschaftliche Veränderungen und nationale Selbstbilder funktioniert. Die 70. Ausgabe in Wien fügt diesem Paradox ein neues Kapitel hinzu.

Was als Radioformat der Nachkriegszeit begann – ein technisches Experiment zur Übungung europäischer Rundfunkkooperation – ist zum größten jährlichen Fernsehereignis der Welt geworden, mit bis zu 200 Millionen Zuschauerinnen und Zuschauern. Die Reichweite übertrifft die meisten Sportgroßereignisse. Der Eurovision ist damit auch eine politische Bühne: Abstimmungsverhalten zwischen Nachbarländern offenbart geopolitische Nähe, der Ausschluss Russlands 2022 war ein kulturpolitisches Statement, und die Teilnahme Israels trotz des laufenden Konflikts sorgt jährlich für Debatten.

Für Österreich ist die Austragung ein Balanceakt. Wien will als weltoffene, tolerante Metropole auftreten – und muss gleichzeitig mit Demonstrationen und politischem Gegenwind umgehen. Der ESC zwingt die Gastgeberstadt, Haltungen einzunehmen, die sie lieber vermeiden würde.

Am Ende ist der Eurovision das, was Europa selbst ist: uneinheitlich, laut, gelegentlich absurd – und erstaunlich widerstandsfähig.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 2: Enhanced Games: Ein Sportwettbewerb, bei dem Doping erlaubt ist
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Enhanced Games: Ein Sportwettbewerb, bei dem Doping erlaubt ist',
  null,
  'premium',
  now(),
  'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist'),
  'A2',
  'In Las Vegas gibt es einen neuen Sportwettbewerb. Er heißt Enhanced Games. Bei diesem Wettbewerb dürfen die Sportler Doping benutzen. Das ist bei anderen Wettkämpfen verboten.

Die Organisatoren sagen: Doping ist sowieso überall. Es ist besser, wenn es offen und sicher ist. Die Sportler sollen von Ärzten überwacht werden.

Viele Menschen finden das falsch. Sie sagen: Sport soll fair sein. Andere finden es interessant. Was denkst du?'
),
(
  (select id from texts where slug = 'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist'),
  'B1',
  'In Las Vegas haben die Enhanced Games begonnen – ein privat organisierter Sportwettbewerb, bei dem leistungssteigernde Substanzen ausdrücklich erlaubt sind. Athletinnen und Athleten aus verschiedenen Disziplinen treten gegeneinander an, ohne Dopingkontrollen befürchten zu müssen.

Die Initiatoren argumentieren, dass Doping im Hochleistungssport ohnehin verbreitet sei, aber heimlich stattfinde. Ihre Idee: Wenn Sportler unter medizinischer Aufsicht und transparent mit Substanzen arbeiten, sei das sicherer als das bestehende System. Kritiker sehen darin eine gefährliche Normalisierung.

Das Internationale Olympische Komitee und der Weltleichtathletikverband haben die Enhanced Games scharf verurteilt. Teilnehmende Sportler riskieren lebenslange Sperren für olympische Wettkämpfe. Dennoch haben sich mehrere ehemalige Profisportler angemeldet – angezogen von hohen Preisgeldversprechen.'
),
(
  (select id from texts where slug = 'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist'),
  'B2',
  'Die Enhanced Games, die seit dieser Woche in Las Vegas stattfinden, sind je nach Perspektive eine dreiste Provokation des organisierten Sports, ein konsequentes Geschäftsmodell oder ein radikales Gedankenexperiment. Erlaubtes Doping unter medizinischer Aufsicht – das klingt wie eine Satire, ist aber bitterer Ernst.

Der Gründer des Projekts, der australische Unternehmer Aron D''Souza, argumentiert mit einer libertaren Logik: Erwachsene Sportler sollten selbst entscheiden, was sie mit ihrem Körper machen. Das bestehende Anti-Doping-System sei scheinheilig, da es Spitzensport ohne substanzielle Unterstützung faktisch unmöglich mache. Diese Position ist provokant – aber nicht ohne empirische Grundlage.

Die Reaktion des etablierten Sports war erwartbar: Sperren, Verurteilungen, Distanzierungen. Was die Enhanced Games dennoch interessant macht, ist die Frage, die sie aufwerfen: Wie weit ist das bestehende Anti-Doping-System tatsächlich in der Lage, gleiche Bedingungen herzustellen – und wie ehrlich ist der Sport zu sich selbst?'
),
(
  (select id from texts where slug = 'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist'),
  'C1',
  'Die Enhanced Games sind, in ihrer provokativen Reinform, die Antwort auf eine Frage, die der organisierte Sport seit Jahrzehnten nicht stellen will: Was genau soll das Anti-Doping-System schützen – die Gesundheit der Athleten, die Fairness des Wettbewerbs oder das kommerzielle Image des Sports?

Die unbequeme Wahrheit ist, dass alle drei Ziele gegenwärtig unzureichend erfüllt werden. Athletengesundheit wird durch ein System gefährdet, das Doping zwar verbietet, aber durch den Druck zur Höchstleistung strukturell befördert. Fairness ist in einem globalen System kaum herstellbar, in dem Ressourcen, Zugang zu Sportmedizin und nationale Förderstrukturen enorm divergieren. Und das kommerzielle Image des Sports leidet weniger unter Doping als unter aufgedecktem Doping.

D''Souzas Projekt ist in seiner aktuellen Form möglicherweise nicht lebensfaehig – die Absenz etablierter Stars, die Rechtsunsicherheiten und die moralische Ablehnung des Mainstreams limitieren seine Reichweite. Was es jedoch leistet, ist die Forcierung einer Debatte, die im institutionalisierten Sport systematisch vermieden wird: Über Körperautonomie, über die Grenzen staatlicher Regulierung im Sport und über die Frage, ob ein Hochleistungssportler, der bewusst und informiert Substanzen einnimmt, tatsächlich Schutz vor sich selbst verdient oder respektiert werden sollte.

Antworten hat der Sport darauf noch keine. Die Enhanced Games zwingen ihn zumindest, die Fragen zu hören.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 3: Indigene Menschen in Brasilien protestieren
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Indigene Menschen in Brasilien protestieren',
  null,
  'premium',
  now(),
  'indigene-menschen-in-brasilien-protestieren'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'indigene-menschen-in-brasilien-protestieren'),
  'A2',
  'In Brasilien leben viele indigene Volkgruppen. Sie leben seit Tausenden von Jahren im Land. Jetzt haben Tausende von ihnen in der Hauptstadt Brasília protestiert.

Sie wollen, dass der Staat ihre Gebiete anerkennt. Diese Gebiete sind ihr Zuhause und sehr wichtig für sie. Aber der Staat gibt ihnen diese Gebiete oft nicht.

Der Protest heißt Acampamento Terra Livre – das bedeutet: Freies Land Camp. Es findet jedes Jahr statt. In diesem Jahr kamen besonders viele Menschen.'
),
(
  (select id from texts where slug = 'indigene-menschen-in-brasilien-protestieren'),
  'B1',
  'Rund 8.000 indigene Menschen aus ganz Brasilien sind Anfang April in die Hauptstadt Brasília gereist, um beim 22. Acampamento Terra Livre – dem Freien Land Camp – für die Anerkennung ihrer angestammten Gebiete zu demonstrieren. Es ist einer der größten indigenen Proteste in der Geschichte des Landes.

Im Mittelpunkt steht die Forderung nach einem gesetzlichen Schutz ihrer Territorien vor der Ausbeutung durch die Landwirtschafts- und Bergbauindustrie. Viele indigene Gemeinschaften berichten von illegaler Abholzung, Vergiftung von Flüssen und gewaltsamen Vertreibungen. Bei den Wahlen im Oktober will die Bewegung Kandidatinnen und Kandidaten unterstützen, die ihre Interessen vertreten.

Deutschland und die EU verfolgen die Lage aufmerksam, da das EU-Mercosur-Handelsabkommen an den Menschenrechtsstandards in Brasilien – einschließlich der Rechte indigener Völker – gemessen wird.'
),
(
  (select id from texts where slug = 'indigene-menschen-in-brasilien-protestieren'),
  'B2',
  'Das 22. Acampamento Terra Livre in Brasília ist in diesem Jahr von besonderer politischer Brisanz. Rund 8.000 Teilnehmende aus mehr als 200 indigenen Volksgruppen fordern nicht nur die verfässungsmäßig verankerte Demarkierung ihrer Territorien, sondern kündigen auch eine gezielte Wahlkampfstrategie für die Parlaments- und Gouverneurswahlen im Oktober an.

Der Hintergrund ist eine unvollendete Verfassungsgarantie: Obwohl die brasilianische Verfassung von 1988 den indigenen Völkern das Recht auf ihre angestammten Gebiete garantiert, sind Tausende dieser Territorien bis heute nicht offiziell abgegrenzt. Die Folge: illegale Abholzung, Goldgräbereien und Agrarbusiness dringen in Schutzgebiete ein, oft ohne strafrechtliche Konsequenzen.

Für Europa ist die Lage nicht nur humanitär relevant. Das geplante EU-Mercosur-Abkommen sieht Nachhaltigkeitsklauseln vor, die an den Umwelt- und Menschenrechtsstandards Brasiliens gemessen werden. Indigene Organisationen und europäische NGOs fordern, dass die Demarkierung von Territorien zur Bedingung für Handelsprivilegien wird.'
),
(
  (select id from texts where slug = 'indigene-menschen-in-brasilien-protestieren'),
  'C1',
  'Das Acampamento Terra Livre ist längst mehr als ein nationaler Protest – es ist ein Schnittpunkt globaler Debatten über Klimaschutz, koloniales Erbe und die Glaubwürdigkeit internationaler Handelsbeziehungen. Dass 8.000 indigene Menschen aus über 200 Volksgruppen in Brasília für ihre Landrechte demonstrieren müssen, ist nicht zuletzt ein Versagen des brasilianischen Rechtsstaats – und ein Spiegel für die Widersprüche globaler Klimapolitik.

Der Amazonas-Regenwald, dessen Schutz in internationalen Klimaabkommen als prioritär gilt, wird zu erheblichen Teilen durch indigene Gemeinschaften bewacht, die ohne staatliche Anerkennung ihrer Territorien kaum rechtliche Handhabe gegen Eindringlinge haben. Die Paradoxie ist offensichtlich: Die Welt will den Regenwald schützen, während die effektivsten Hüter dieses Waldes um Landrechte kämpfen, die auf dem Papier längst existieren.

Die europäische Dimension verschärft diese Paradoxie. Das EU-Mercosur-Abkommen, über das seit Jahrzehnten verhandelt wird, sieht Nachhaltigkeitskapitel vor – aber deren Durchsetzung bleibt schwach und die Kontrolle unzureichend. Indigene Organisationen fordern nicht Almosen, sondern strukturelle Bedingungen: Keine Handelsprivilegien ohne Demarkierungsfortschritte, kein Soja-Import aus illegal gerodeten Flächen.

Der Protest in Brasília ist damit auch eine Frage an Europa: Wie viel ist das Klimagewissen wert, wenn es an den Grenzen des eigenen Wirtschaftsinteresses endet?'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 4: BTS ist zurück: K-Pop aus Korea erobert die Welt
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'BTS ist zurück: K-Pop aus Korea erobert die Welt',
  null,
  'premium',
  now(),
  'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt'),
  'A2',
  'BTS ist eine sehr bekannte K-Pop-Gruppe aus Südkorea. Sie haben viele Fans auf der ganzen Welt. Diese Fans heißen ARMY.

Nach einer Pause ist BTS zurück. Sie haben ein neues Album. Sie machen auch eine große Welttournee. Deutschland ist auch auf dem Tourplan.

K-Pop ist Musik aus Korea. Sie ist sehr populär bei jungen Menschen. Die Sänger tanzen viel und tragen besondere Kostüme. Das ist ein großes Phänomen.'
),
(
  (select id from texts where slug = 'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt'),
  'B1',
  'Die südkoreanische Band BTS hat nach einer zweijährigen Pause, die durch den Militärdienst der Mitglieder ausgelöst wurde, ihr Rückkehr angekündigt. Ein neues Album und eine Welttournee sind geplant – mit Konzerten in Seoul, Tokyo, Los Angeles und mehreren europäischen Städten, darunter Berlin.

BTS ist mehr als eine Musikgruppe. Die sieben Sänger haben in den letzten Jahren eine globale Fangemeinde aufgebaut, die als ARMY bekannt ist und schätzungsweise über 50 Millionen aktive Mitglieder hat. Ihre Musik mischt Pop, Hip-Hop und elektronische Elemente – oft mit Texten über Selbstfindung, psychische Gesundheit und gesellschaftlichen Druck.

K-Pop ist inzwischen ein bedeutender Wirtschaftsfaktor für Südkorea. Die Musikexporte, Merchandising und Tourismuseinnahmen durch K-Pop-Fans aus aller Welt – sogenannte K-Pop-Touristen – bringen dem Land jährlich Milliarden ein. Deutschland gehört zu den wichtigsten europäischen Märkten.'
),
(
  (select id from texts where slug = 'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt'),
  'B2',
  'Die Rückkehr von BTS nach dem Abschluss des Wehrdienstes der Mitglieder ist in der Popwelt ein Ereignis von seltener Reichweite. Selten hat eine Musikgruppe über eine erzwungene Pause hinweg eine so intensive Fanbeziehung aufrechterhalten – ein Beleg für die Tiefe der emotionalen Bindung, die K-Pop-Acts mit ihrem Publikum aufbauen.

Hinter dem Phänomen steckt eine industrielle Logik. Südkorea hat seit den 1990er Jahren systematisch in die Ausbildung von Entertainern und die globale Vermarktung koreanischer Popkultur investiert – unter dem Begriff der Korean Wave oder Hallyu. Was als staatlich geförderter Kulturexport begann, hat sich zu einem autonomen globalen Markt entwickelt, der Musik, Mode, Kosmetik, Film und Sprache umfasst.

Für Deutschland ist K-Pop auch ein Spiegel veränderter Kulturrezeption. Eine Generation junger Menschen konsumiert Popkultur primär über soziale Medien, unabhängig von Sprachgrenzen und traditionellen Radioformaten. Dass eine koreanischsprachige Gruppe in Frankfurt und Berlin ausverkaufte Arenen füllt, wäre vor zwanzig Jahren undenkbar gewesen.'
),
(
  (select id from texts where slug = 'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt'),
  'C1',
  'Die Rückkehr von BTS markiert einen Moment, der über Musikgeschmack hinausweist. Er illustriert, wie grundlegend sich die globale Popkultur in den letzten zwei Jahrzehnten verschoben hat – weg von angloamerikanischer Dominanz, hin zu einem multipolaren Markt, in dem südostasiatische, lateinamerikanische und afrikanische Produktionen eine eigenständige globale Reichweite entwickeln.

Südkoreas Erfolg ist dabei kein Zufall, sondern Ergebnis einer konsistenten Kulturpolitik. Die gezielte Förderung von Entertainment-Unternehmen, die Ausbildung von Idols nach einem industrialisierten Trainingssystem und die frühzeitige Nutzung digitaler Plattformen haben eine Industrie geschaffen, die jährlich mehr als 12 Milliarden US-Dollar generiert. Hallyu – die Koreanische Welle – ist damit sowohl Soft Power als auch Wirtschaftsstrategie.

Was dabei oft übersehen wird, ist die Ambivalenz des Systems. Die Ausbildungsbedingungen in K-Pop-Agenturen sind streng, gelegentlich belastend, und die Privatsphäre von Idols strukturell eingeschränkt. Die Authentizität, die Fans erleben, ist teilweise das Produkt hochentwickelter Imageproduktion. Diese Spannung ist nicht neu in der Popindustrie – aber bei K-Pop besonders sichtbar.

BTS haben es geschafft, innerhalb dieses Systems eine eigene künstlerische Stimme zu entwickeln. Ihre Texte über psychische Gesundheit, Gesellschaftsdruck und Selbstakzeptanz treffen weltweit einen Nerv – und das auf Koreanisch. Das ist, vielleicht, das eigentlich Revolutionare.'
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
    'abgrenzen',
    'verb',
    'delimitar',
    'Tausende dieser Territorien sind bis heute nicht offiziell abgegrenzt.',
    'B2',
    null,
    null,
    'abgrenzen',
    null,
    'Das Gebiet muss klar abgegrenzt werden.',
    'grenzte ab',
    'abgegrenzt'
  ),
  (
    'Abholzung',
    'noun',
    'deforestación',
    'Viele Gemeinschaften berichten von illegaler Abholzung.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die illegale Abholzung zerstört den Wald.',
    null,
    null
  ),
  (
    'Ablehnung',
    'noun',
    'rechazo',
    'Die moralische Ablehnung des Mainstreams.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Ablehnung war einhellig.',
    null,
    null
  ),
  (
    'Absenz',
    'noun',
    'ausencia',
    'Die Absenz etablierter Stars limitiert seine Reichweite.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Absenz führender Athleten schwächt das Projekt.',
    null,
    null
  ),
  (
    'Abstimmung',
    'noun',
    'votación',
    'Die Abstimmung ist ein Mix aus Jury-Entscheidungen und Publikumsvoting.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Abstimmung beginnt nach den Auftritten.',
    null,
    null
  ),
  (
    'Abstimmungsverhalten',
    'noun',
    'comportamiento de voto',
    'Abstimmungsverhalten zwischen Nachbarländern offenbart geopolitische Nähe.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Abstimmungsverhalten ist politisch aufschlussreich.',
    null,
    null
  ),
  (
    'aktiv',
    'adjective',
    'activo',
    'Über 50 Millionen aktive Mitglieder.',
    'B1',
    null,
    null,
    null,
    null,
    'Die Fans sind sehr aktiv in sozialen Medien.',
    null,
    null
  ),
  (
    'Album',
    'noun',
    'álbum',
    'Sie haben ein neues Album.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das neue Album ist sehr beliebt.',
    null,
    null
  ),
  (
    'Almosen',
    'noun',
    'limosna',
    'Indigene Organisationen fordern nicht Almosen.',
    'C1',
    'das',
    null,
    null,
    null,
    'Sie wollen Rechte, keine Almosen.',
    null,
    null
  ),
  (
    'Ambivalenz',
    'noun',
    'ambivalencia',
    'Die Ambivalenz des Systems.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Ambivalenz zwischen Kunst und Industrie ist spürbar.',
    null,
    null
  ),
  (
    'anerkennen',
    'verb',
    'reconocer',
    'Sie wollen, dass der Staat ihre Gebiete anerkennt.',
    'A2',
    null,
    null,
    'anerkennen',
    null,
    'Der Staat muss ihre Rechte anerkennen.',
    'erkannte an',
    'anerkannt'
  ),
  (
    'Angebot',
    'noun',
    'oferta',
    'Die Nachfrage nach Tickets überstieg das Angebot innerhalb von Minuten.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Angebot an Konzerten ist groß.',
    null,
    null
  ),
  (
    'angestammt',
    'adjective',
    'ancestral',
    'Anerkennung ihrer angestammten Gebiete.',
    'B1',
    null,
    null,
    null,
    null,
    'Sie kämpfen für ihr angestammtes Land.',
    null,
    null
  ),
  (
    'ankündigen',
    'verb',
    'anunciar',
    'BTS hat ihre Rückkehr angekündigt.',
    'B1',
    null,
    null,
    'ankündigen',
    null,
    'Die Band kündigt ein neues Album an.',
    'kündigte an',
    'angekündigt'
  ),
  (
    'anmelden',
    'verb',
    'inscribirse',
    'Mehrere ehemalige Profisportler haben sich angemeldet.',
    'B1',
    null,
    null,
    'anmelden',
    null,
    'Er hat sich für den Wettkampf angemeldet.',
    'meldete an',
    'angemeldet'
  ),
  (
    'argumentieren',
    'verb',
    'argumentar',
    'Die Initiatoren argumentieren, dass Doping verbreitet sei.',
    'B1',
    null,
    null,
    'argumentieren',
    null,
    'Sie argumentieren für eine Reform des Systems.',
    'argumentierte',
    'argumentiert'
  ),
  (
    'Arzt',
    'noun',
    'médico',
    'Die Sportler sollen von Ärzten überwacht werden.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Arzt untersucht die Sportler.',
    null,
    null
  ),
  (
    'aufbauen',
    'verb',
    'construir',
    'Die Sänger haben eine globale Fangemeinde aufgebaut.',
    'B1',
    null,
    null,
    'aufbauen',
    null,
    'Sie haben eine starke Fanbasis aufgebaut.',
    'baute auf',
    'aufgebaut'
  ),
  (
    'aufrechterhalten',
    'verb',
    'mantener',
    'Eine so intensive Fanbeziehung aufrechterhalten.',
    'B2',
    null,
    null,
    'aufrechterhalten',
    null,
    'Sie haben den Kontakt zu den Fans aufrechterhalten.',
    'erhielt aufrecht',
    'aufrechterhalten'
  ),
  (
    'Aufsicht',
    'noun',
    'supervisión',
    'Wenn Sportler unter medizinischer Aufsicht mit Substanzen arbeiten.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Sportler stehen unter medizinischer Aufsicht.',
    null,
    null
  ),
  (
    'aufwerfen',
    'verb',
    'plantear',
    'Die Frage, die sie aufwerfen.',
    'B2',
    null,
    null,
    'aufwerfen',
    null,
    'Das wirft wichtige Fragen auf.',
    'warf auf',
    'aufgeworfen'
  ),
  (
    'Ausbeutung',
    'noun',
    'explotación',
    'Schutz ihrer Territorien vor der Ausbeutung durch die Landwirtschafts- und Bergbauindustrie.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Ausbeutung der Natur muss stoppen.',
    null,
    null
  ),
  (
    'ausgebucht',
    'adjective',
    'completo / lleno',
    'Hotels sind seit Monaten ausgebucht.',
    'B2',
    null,
    null,
    null,
    null,
    'Das Hotel ist für Mai ausgebucht.',
    null,
    null
  ),
  (
    'auslösen',
    'verb',
    'provocar / desencadenar',
    'Die Pause wurde durch den Militärdienst ausgelöst.',
    'B1',
    null,
    null,
    'auslösen',
    null,
    'Der Konflikt hat eine Debatte ausgelöst.',
    'löste aus',
    'ausgelöst'
  ),
  (
    'ausrichten',
    'verb',
    'organizar',
    'Österreich hat das Recht erhalten, den Wettbewerb auszurichten.',
    'B1',
    null,
    null,
    'ausrichten',
    null,
    'Die Stadt will das Konzert ausrichten.',
    'richtete aus',
    'ausgerichtet'
  ),
  (
    'Ausschluss',
    'noun',
    'exclusión',
    'Der Ausschluss Russlands 2022 war ein kulturpolitisches Statement.',
    'C1',
    'der',
    null,
    null,
    null,
    'Der Ausschluss des Landes sorgte für Diskussionen.',
    null,
    null
  ),
  (
    'Ausstellung',
    'noun',
    'exposición',
    'Eine Eurovision-Ausstellung im Kunsthistorischen Museum.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Ausstellung ist kostenlos.',
    null,
    null
  ),
  (
    'Auswahlverfahren',
    'noun',
    'proceso de selección',
    'Der NDR hat das Auswahlverfahren reformiert.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Auswahlverfahren dauert mehrere Monate.',
    null,
    null
  ),
  (
    'Authentizität',
    'noun',
    'autenticidad',
    'Die Authentizität, die Fans erleben.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Authentizität der Künstler wird oft hinterfragt.',
    null,
    null
  ),
  (
    'autonom',
    'adjective',
    'autónomo',
    'Ein autonomer globaler Markt.',
    'B2',
    null,
    null,
    null,
    null,
    'Das System funktioniert autonom.',
    null,
    null
  ),
  (
    'Balanceakt',
    'noun',
    'acto de equilibrio',
    'Für Österreich ist die Austragung ein Balanceakt.',
    'C1',
    'der',
    null,
    null,
    null,
    'Die Moderation war ein echter Balanceakt.',
    null,
    null
  ),
  (
    'bedeuten',
    'verb',
    'significar',
    'Das bedeutet: Freies Land Camp.',
    'A2',
    null,
    null,
    'bedeuten',
    null,
    'Was bedeutet dieses Wort auf Deutsch?',
    'bedeutete',
    'bedeutet'
  ),
  (
    'bedeutend',
    'adjective',
    'importante / significativo',
    'K-Pop ist ein bedeutender Wirtschaftsfaktor für Südkorea.',
    'B1',
    null,
    null,
    null,
    null,
    'Das ist ein bedeutender Schritt.',
    null,
    null
  ),
  (
    'Bedingung',
    'noun',
    'condición',
    'Gleiche Bedingungen herzustellen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Das ist eine wichtige Bedingung.',
    null,
    null
  ),
  (
    'befördern',
    'verb',
    'promover / impulsar',
    'Das System befördert Doping strukturell.',
    'C1',
    null,
    null,
    'befördern',
    null,
    'Der Druck befördert ungesundes Verhalten.',
    'beförderte',
    'befördert'
  ),
  (
    'bekannt',
    'adjective',
    'conocido',
    'BTS ist eine sehr bekannte K-Pop-Gruppe.',
    'A2',
    null,
    null,
    null,
    null,
    'Die Gruppe ist weltweit bekannt.',
    null,
    null
  ),
  (
    'belastend',
    'adjective',
    'estresante / gravoso',
    'Die Ausbildungsbedingungen sind streng, gelegentlich belastend.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Arbeitsbedingungen können sehr belastend sein.',
    null,
    null
  ),
  (
    'Beleg',
    'noun',
    'prueba / evidencia',
    'Ein Beleg für die Tiefe der emotionalen Bindung.',
    'B2',
    'der',
    null,
    null,
    null,
    'Das ist ein klarer Beleg für den Erfolg.',
    null,
    null
  ),
  (
    'benutzen',
    'verb',
    'usar',
    'Bei diesem Wettbewerb dürfen die Sportler Doping benutzen.',
    'A2',
    null,
    null,
    'benutzen',
    null,
    'Sie benutzen moderne Technik.',
    'benutzte',
    'benutzt'
  ),
  (
    'besonder',
    'adjective',
    'especial',
    'Die Sänger tragen besondere Kostüme.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist ein besonderes Ereignis.',
    null,
    null
  ),
  (
    'besonders',
    'adjective',
    'especialmente',
    'In diesem Jahr kamen besonders viele Menschen.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist besonders wichtig für sie.',
    null,
    null
  ),
  (
    'bewachen',
    'verb',
    'vigilar / custodiar',
    'Indigene Gemeinschaften bewachen den Regenwald.',
    'C1',
    null,
    null,
    'bewachen',
    null,
    'Sie bewachen ihr Territorium seit Generationen.',
    'bewachte',
    'bewacht'
  ),
  (
    'Bewegung',
    'noun',
    'movimiento',
    'Bei den Wahlen will die Bewegung Kandidaten unterstützen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Bewegung kämpft für Gerechtigkeit.',
    null,
    null
  ),
  (
    'Bindung',
    'noun',
    'vínculo',
    'Die Tiefe der emotionalen Bindung.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die emotionale Bindung ist sehr stark.',
    null,
    null
  ),
  (
    'Brisanz',
    'noun',
    'carácter explosivo / delicadeza política',
    'Das Acampamento Terra Livre ist in diesem Jahr von besonderer politischer Brisanz.',
    'B2',
    'die',
    null,
    null,
    null,
    'Das Thema hat eine hohe politische Brisanz.',
    null,
    null
  ),
  (
    'Demarkierung',
    'noun',
    'demarcación',
    'Die verfassungsmäßig verankerte Demarkierung ihrer Territorien.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Demarkierung der Gebiete steht noch aus.',
    null,
    null
  ),
  (
    'demonstrieren',
    'verb',
    'manifestarse',
    '8.000 indigene Menschen sind gereist, um zu demonstrieren.',
    'B1',
    null,
    null,
    'demonstrieren',
    null,
    'Sie demonstrieren für ihre Landrechte.',
    'demonstrierte',
    'demonstriert'
  ),
  (
    'Disziplin',
    'noun',
    'disciplina',
    'Athletinnen und Athleten aus verschiedenen Disziplinen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Er trainiert in mehreren Disziplinen.',
    null,
    null
  ),
  (
    'divergieren',
    'verb',
    'divergir',
    'Nationale Förderstrukturen enorm divergieren.',
    'C1',
    null,
    null,
    'divergieren',
    null,
    'Die Meinungen divergieren stark.',
    'divergierte',
    'divergiert'
  ),
  (
    'Dominanz',
    'noun',
    'dominancia',
    'Weg von angloamerikanischer Dominanz.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die kulturelle Dominanz verschiebt sich.',
    null,
    null
  ),
  (
    'Doping',
    'noun',
    'doping',
    'Bei diesem Wettbewerb dürfen die Sportler Doping benutzen.',
    'A2',
    'das',
    null,
    null,
    null,
    'Doping ist in vielen Sportarten verboten.',
    null,
    null
  ),
  (
    'dreist',
    'adjective',
    'descarado',
    'Eine dreiste Provokation des organisierten Sports.',
    'B2',
    null,
    null,
    null,
    null,
    'Das war eine dreiste Lüge.',
    null,
    null
  ),
  (
    'durchbrechen',
    'verb',
    'romper / superar',
    'Um das Stigma der deutschen ESC-Misserfolge zu durchbrechen.',
    'B2',
    null,
    null,
    'durchbrechen',
    null,
    'Es ist schwer, alte Muster zu durchbrechen.',
    'durchbrach',
    'durchbrochen'
  ),
  (
    'Durchsetzung',
    'noun',
    'aplicación / implementación',
    'Deren Durchsetzung bleibt schwach.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Durchsetzung der Gesetze ist unzureichend.',
    null,
    null
  ),
  (
    'dürfen',
    'verb',
    'poder / tener permitido',
    'Bei diesem Wettbewerb dürfen die Sportler Doping benutzen.',
    'A2',
    null,
    null,
    'dürfen',
    null,
    'Hier darf man nicht rauchen.',
    'durfte',
    'gedurft'
  ),
  (
    'effektiv',
    'adjective',
    'eficaz',
    'Die effektivsten Hüter dieses Waldes.',
    'C1',
    null,
    null,
    null,
    null,
    'Sie sind die effektivsten Schützer des Waldes.',
    null,
    null
  ),
  (
    'ehemalig',
    'adjective',
    'antiguo / ex',
    'Mehrere ehemalige Profisportler haben sich angemeldet.',
    'B1',
    null,
    null,
    null,
    null,
    'Ein ehemaliger Champion nimmt teil.',
    null,
    null
  ),
  (
    'eigenen',
    'adjective',
    'propio',
    'Jedes Land schickt einen Act mit einem eigenen Song.',
    'B1',
    null,
    null,
    null,
    null,
    'Sie hat ihren eigenen Stil.',
    null,
    null
  ),
  (
    'eigenständig',
    'adjective',
    'independiente / propio',
    'Eine eigenständige globale Reichweite entwickeln.',
    'C1',
    null,
    null,
    null,
    null,
    'Sie haben eine eigenständige künstlerische Stimme.',
    null,
    null
  ),
  (
    'einbringen',
    'verb',
    'generar / aportar',
    'Die Einnahmen bringen dem Land jährlich Milliarden ein.',
    'B1',
    null,
    null,
    'einbringen',
    null,
    'Der Tourismus bringt viel Geld ein.',
    'brachte ein',
    'eingebracht'
  ),
  (
    'eindringen',
    'verb',
    'penetrar / irrumpir',
    'Agrarbusiness dringt in Schutzgebiete ein.',
    'B2',
    null,
    null,
    'eindringen',
    null,
    'Fremde dringen in das Gebiet ein.',
    'drang ein',
    'eingedrungen'
  ),
  (
    'Einnahmen',
    'noun',
    'ingresos',
    'Der Gastgeberstatus bringt erhebliche Einnahmen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Einnahmen steigen jedes Jahr.',
    null,
    null
  ),
  (
    'einschränken',
    'verb',
    'restringir',
    'Die Privatsphäre von Idols strukturell eingeschränkt.',
    'C1',
    null,
    null,
    'einschränken',
    null,
    'Der Vertrag schränkt ihre Freiheit stark ein.',
    'schränkte ein',
    'eingeschränkt'
  ),
  (
    'elektronisch',
    'adjective',
    'electrónico',
    'Elektronische Elemente in der Musik.',
    'B1',
    null,
    null,
    null,
    null,
    'Die Musik hat viele elektronische Einflüsse.',
    null,
    null
  ),
  (
    'emotional',
    'adjective',
    'emocional',
    'Die Tiefe der emotionalen Bindung.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Verbindung ist sehr emotional.',
    null,
    null
  ),
  (
    'empirisch',
    'adjective',
    'empírico',
    'Nicht ohne empirische Grundlage.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Studie hat eine empirische Grundlage.',
    null,
    null
  ),
  (
    'entscheiden',
    'verb',
    'decidir',
    'Erwachsene Sportler sollten selbst entscheiden.',
    'B2',
    null,
    null,
    'entscheiden',
    null,
    'Jeder sollte selbst entscheiden dürfen.',
    'entschied',
    'entschieden'
  ),
  (
    'Ereignis',
    'noun',
    'acontecimiento',
    'Für die Tourismusbranche ist es das wichtigste Ereignis des Jahres.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das ist ein wichtiges Ereignis für die Stadt.',
    null,
    null
  ),
  (
    'erheblich',
    'adjective',
    'considerable',
    'Der Gastgeberstatus bringt erhebliche Einnahmen.',
    'B2',
    null,
    null,
    null,
    'La estructura federal lleva a diferencias considerables.',
    'Das hat erhebliche Auswirkungen auf die Stadt.',
    null,
    null
  ),
  (
    'erwarten',
    'verb',
    'esperar / prever',
    'Wien erwartet Hunderttausende Besucherinnen und Besucher.',
    'B1',
    null,
    null,
    'erwarten',
    null,
    'Die Stadt erwartet viele Touristen.',
    'erwartete',
    'erwartet'
  ),
  (
    'erzwungen',
    'adjective',
    'forzado',
    'Eine erzwungene Pause.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Pause war nicht freiwillig, sondern erzwungen.',
    null,
    null
  ),
  (
    'explizit',
    'adjective',
    'explícito',
    'Ein explizit unpolitischer Wettbewerb.',
    'C1',
    null,
    null,
    null,
    null,
    'Das wurde explizit verboten.',
    null,
    null
  ),
  (
    'fair',
    'adjective',
    'justo',
    'Sport soll fair sein.',
    'A2',
    null,
    null,
    null,
    null,
    'Das Spiel war nicht fair.',
    null,
    null
  ),
  (
    'falsch',
    'adjective',
    'incorrecto / malo',
    'Viele Menschen finden das falsch.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist falsch und gefährlich.',
    null,
    null
  ),
  (
    'Fan',
    'noun',
    'fan',
    'Auch viele Deutsche, Schweizer und Österreicher sind Fans.',
    'A2',
    'der',
    null,
    null,
    null,
    'Sie ist ein großer Fan von BTS.',
    null,
    null
  ),
  (
    'Fanbasis',
    'noun',
    'base de fans',
    'Einen Act, der in sozialen Medien bereits eine starke Fanbasis hat.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Gruppe hat eine treue Fanbasis aufgebaut.',
    null,
    null
  ),
  (
    'Fanbeziehung',
    'noun',
    'relación con los fans',
    'Eine so intensive Fanbeziehung aufrechterhalten.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Fanbeziehung von BTS ist außergewöhnlich.',
    null,
    null
  ),
  (
    'Fangemeinde',
    'noun',
    'comunidad de fans',
    'Die sieben Sänger haben eine globale Fangemeinde aufgebaut.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Fangemeinde ist sehr treu und aktiv.',
    null,
    null
  ),
  (
    'Fernsehen',
    'noun',
    'televisión',
    'Menschen schauen den Wettbewerb im Fernsehen.',
    'A2',
    'das',
    null,
    null,
    null,
    'Wir schauen abends Fernsehen.',
    null,
    null
  ),
  (
    'Finale',
    'noun',
    'final',
    'Das Finale findet am 16.',
    'B1',
    'das',
    null,
    null,
    'Das Finale findet am 16. Mai in der Wiener Stadthalle statt.',
    'Das Finale war sehr spannend.',
    null,
    null
  ),
  (
    'finden',
    'verb',
    'encontrar / considerar',
    'Viele Menschen finden das falsch.',
    'A2',
    null,
    null,
    'finden',
    'El club tiene que encontrar ahora una solución.',
    'Ich finde das sehr interessant.',
    'fand',
    'gefunden'
  ),
  (
    'Forcierung',
    'noun',
    'forzamiento / impulso',
    'Die Forcierung einer Debatte, die systematisch vermieden wird.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Forcierung der Diskussion war notwendig.',
    null,
    null
  ),
  (
    'fordern',
    'verb',
    'exigir',
    'Indigene Organisationen fordern, dass die Demarkierung zur Bedingung wird.',
    'B2',
    null,
    null,
    'fordern',
    null,
    'Sie fordern gleiche Rechte für alle.',
    'forderte',
    'gefordert'
  ),
  (
    'Forderung',
    'noun',
    'exigencia / demanda',
    'Im Mittelpunkt steht die Forderung nach einem gesetzlichen Schutz ihrer Territorien.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Forderung nach Gleichheit ist berechtigt.',
    null,
    null
  ),
  (
    'frei',
    'adjective',
    'libre',
    'Freies Land Camp.',
    'A2',
    null,
    null,
    null,
    null,
    'Sie kämpfen für ein freies Leben.',
    null,
    null
  ),
  (
    'frühzeitig',
    'adjective',
    'temprano / precoz',
    'Die frühzeitige Nutzung digitaler Plattformen.',
    'C1',
    null,
    null,
    null,
    null,
    'Die frühzeitige Investition hat sich ausgezahlt.',
    null,
    null
  ),
  (
    'Förderstruktur',
    'noun',
    'estructura de financiación',
    'Nationale Förderstrukturen enorm divergieren.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Förderstrukturen sind sehr ungleich.',
    null,
    null
  ),
  (
    'Gastgeberstadt',
    'noun',
    'ciudad anfitriona',
    'Wien ist in diesem Jahr Gastgeberstadt des 70.',
    'B1',
    'die',
    null,
    null,
    'Wien ist in diesem Jahr Gastgeberstadt des 70. Eurovision Song Contests.',
    'Die Gastgeberstadt bereitet sich gut vor.',
    null,
    null
  ),
  (
    'Gastgeberstatus',
    'noun',
    'condición de anfitrión',
    'Der Gastgeberstatus bringt erhebliche Einnahmen.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Gastgeberstatus ist eine große Ehre.',
    null,
    null
  ),
  (
    'Gebiet',
    'noun',
    'territorio',
    'Sie wollen, dass der Staat ihre Gebiete anerkennt.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Gebiet ist sehr groß.',
    null,
    null
  ),
  (
    'Gedankenexperiment',
    'noun',
    'experimento mental',
    'Ein radikales Gedankenexperiment.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das ist ein interessantes Gedankenexperiment.',
    null,
    null
  ),
  (
    'gefährden',
    'verb',
    'poner en peligro',
    'Athletengesundheit wird durch ein System gefährdet.',
    'C1',
    null,
    null,
    'gefährden',
    null,
    'Das gefährdet die Integrität des Sports.',
    'gefährdete',
    'gefährdet'
  ),
  (
    'Gegenwind',
    'noun',
    'viento en contra / resistencia',
    'Wien muss mit Demonstrationen und politischem Gegenwind umgehen.',
    'C1',
    'der',
    null,
    null,
    null,
    'Das Projekt stößt auf politischen Gegenwind.',
    null,
    null
  ),
  (
    'gelegentlich',
    'adjective',
    'ocasionalmente',
    'Uneinheitlich, laut, gelegentlich absurd.',
    'C1',
    null,
    null,
    null,
    null,
    'Das führt gelegentlich zu Missverständnissen.',
    null,
    null
  ),
  (
    'Gemeinschaft',
    'noun',
    'comunidad',
    'Viele indigene Gemeinschaften berichten von illegaler Abholzung.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Gemeinschaft lebt seit Generationen hier.',
    null,
    null
  ),
  (
    'generieren',
    'verb',
    'generar',
    'Eine Industrie, die jährlich mehr als 12 Milliarden US-Dollar generiert.',
    'C1',
    null,
    null,
    'generieren',
    null,
    'K-Pop generiert enorme Einnahmen.',
    'generierte',
    'generiert'
  ),
  (
    'geopolitisch',
    'adjective',
    'geopolítico',
    'Abstimmungsverhalten zwischen Nachbarländern offenbart geopolitische Nähe.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Lage hat eine geopolitische Dimension.',
    null,
    null
  ),
  (
    'Geschäftsmodell',
    'noun',
    'modelo de negocio',
    'Ein konsequentes Geschäftsmodell.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Geschäftsmodell ist sehr profitabel.',
    null,
    null
  ),
  (
    'gesellschaftlich',
    'adjective',
    'social',
    'Gesellschaftliche Veränderungen und nationale Selbstbilder.',
    'C1',
    null,
    null,
    null,
    'Las competencias medidas deben ser socialmente relevantes.',
    'Das ist eine gesellschaftliche Herausforderung.',
    null,
    null
  ),
  (
    'gesetzlich',
    'adjective',
    'legal / por ley',
    'Die Forderung nach einem gesetzlichen Schutz.',
    'B1',
    null,
    null,
    null,
    null,
    'Das ist gesetzlich geregelt.',
    null,
    null
  ),
  (
    'gewaltsam',
    'adjective',
    'violento',
    'Gewaltsame Vertreibungen.',
    'B1',
    null,
    null,
    null,
    null,
    'Die gewaltsame Vertreibung ist ein Verbrechen.',
    null,
    null
  ),
  (
    'gewinnen',
    'verb',
    'ganar',
    'Österreich hat den Wettbewerb gewonnen.',
    'A2',
    null,
    null,
    'gewinnen',
    null,
    'Sie will den Wettbewerb gewinnen.',
    'gewann',
    'gewonnen'
  ),
  (
    'Gewinner',
    'noun',
    'ganador',
    'Das Publikum und eine Jury wählen den Gewinner.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Gewinner bekommt einen Preis.',
    null,
    null
  ),
  (
    'Glaubwürdigkeit',
    'noun',
    'credibilidad',
    'Die Glaubwürdigkeit internationaler Handelsbeziehungen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Glaubwürdigkeit der Politik steht auf dem Spiel.',
    null,
    null
  ),
  (
    'global',
    'adjective',
    'global',
    'Ein Schnittpunkt globaler Debatten.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine globale Herausforderung.',
    null,
    null
  ),
  (
    'groß',
    'adjective',
    'grande',
    'Der Eurovision Song Contest ist ein großer Musikwettbewerb.',
    'A2',
    null,
    null,
    null,
    'Es un gran día para la familia.',
    'Es ist ein großes Fest.',
    null,
    null
  ),
  (
    'Grundlage',
    'noun',
    'base / fundamento',
    'Nicht ohne empirische Grundlage.',
    'B2',
    'die',
    null,
    null,
    null,
    'Das hat keine wissenschaftliche Grundlage.',
    null,
    null
  ),
  (
    'Gruppe',
    'noun',
    'grupo',
    'BTS ist eine sehr bekannte K-Pop-Gruppe aus Südkorea.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Gruppe hat viele Fans auf der Welt.',
    null,
    null
  ),
  (
    'Gründer',
    'noun',
    'fundador',
    'Der Gründer des Projekts, der australische Unternehmer Aron D''Souza.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Gründer erklärte seine Vision.',
    null,
    null
  ),
  (
    'Haltung',
    'noun',
    'postura',
    'Der ESC zwingt die Gastgeberstadt, Haltungen einzunehmen.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Regierung muss eine klare Haltung einnehmen.',
    null,
    null
  ),
  (
    'Handelsabkommen',
    'noun',
    'acuerdo comercial',
    'Das EU-Mercosur-Handelsabkommen.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Handelsabkommen ist umstritten.',
    null,
    null
  ),
  (
    'Handelsprivileg',
    'noun',
    'privilegio comercial',
    'Die Demarkierung soll zur Bedingung für Handelsprivilegien werden.',
    'B2',
    'das',
    null,
    null,
    null,
    'Handelsprivilegien sind an Bedingungen geknüpft.',
    null,
    null
  ),
  (
    'Handhabe',
    'noun',
    'herramienta legal / recurso',
    'Kaum rechtliche Handhabe gegen Eindringlinge.',
    'C1',
    'die',
    null,
    null,
    null,
    'Ohne Anerkennung fehlt ihnen jede rechtliche Handhabe.',
    null,
    null
  ),
  (
    'Hauptstadt',
    'noun',
    'capital',
    'Das ist die Hauptstadt von Österreich.',
    'A2',
    'die',
    null,
    null,
    null,
    'Berlin ist die Hauptstadt von Deutschland.',
    null,
    null
  ),
  (
    'heimlich',
    'adjective',
    'en secreto',
    'Doping finde heimlich statt.',
    'B1',
    null,
    null,
    null,
    null,
    'Das passiert heimlich und ohne Kontrolle.',
    null,
    null
  ),
  (
    'heißen',
    'verb',
    'llamarse',
    'Diese Fans heißen ARMY.',
    'A2',
    null,
    null,
    'heißen',
    null,
    'Die Gruppe heißt BTS.',
    'hieß',
    'geheißen'
  ),
  (
    'herstellbar',
    'adjective',
    'realizable / alcanzable',
    'Fairness ist in einem globalen System kaum herstellbar.',
    'C1',
    null,
    null,
    null,
    null,
    'Echte Gleichheit ist kaum herstellbar.',
    null,
    null
  ),
  (
    'herstellen',
    'verb',
    'establecer / producir',
    'Gleiche Bedingungen herzustellen.',
    'B2',
    null,
    null,
    'herstellen',
    null,
    'Es ist schwer, Fairness herzustellen.',
    'stellte her',
    'hergestellt'
  ),
  (
    'Heuchelei',
    'noun',
    'hipocresía',
    'Über Heuchelei, Körperautonomie und die Grenzen des Leistungssports.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Heuchelei des Systems ist offensichtlich.',
    null,
    null
  ),
  (
    'hochentwickelt',
    'adjective',
    'sofisticado / muy desarrollado',
    'Das Produkt hochentwickelter Imageproduktion.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist ein hochentwickeltes System.',
    null,
    null
  ),
  (
    'humanitär',
    'adjective',
    'humanitario',
    'Für Europa ist die Lage nicht nur humanitär relevant.',
    'B2',
    null,
    null,
    null,
    null,
    'Das ist eine humanitäre Krise.',
    null,
    null
  ),
  (
    'Höchstleistung',
    'noun',
    'rendimiento máximo',
    'Durch den Druck zur Höchstleistung.',
    'C1',
    'die',
    null,
    null,
    null,
    'Der Druck zur Höchstleistung ist enorm.',
    null,
    null
  ),
  (
    'Imageproduktion',
    'noun',
    'producción de imagen',
    'Das Produkt hochentwickelter Imageproduktion.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Imageproduktion in der K-Pop-Industrie ist komplex.',
    null,
    null
  ),
  (
    'indigen',
    'adjective',
    'indígena',
    'In Brasilien leben viele indigene Volkgruppen.',
    'A2',
    null,
    null,
    null,
    null,
    'Die indigenen Völker haben eigene Traditionen.',
    null,
    null
  ),
  (
    'industrialisiert',
    'adjective',
    'industrializado',
    'Ausbildung von Idols nach einem industrialisierten Trainingssystem.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Trainingssystem ist stark industrialisiert.',
    null,
    null
  ),
  (
    'institutionalisiert',
    'adjective',
    'institucionalizado',
    'Im institutionalisierten Sport systematisch vermieden.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist im institutionalisierten Betrieb üblich.',
    null,
    null
  ),
  (
    'investieren',
    'verb',
    'invertir',
    'Südkorea hat systematisch in die Ausbildung von Entertainern investiert.',
    'B2',
    null,
    null,
    'investieren',
    null,
    'Sie investieren viel in die Musikindustrie.',
    'investierte',
    'investiert'
  ),
  (
    'Jahr',
    'noun',
    'año',
    'In diesem Jahr findet der Eurovision in Wien statt.',
    'A2',
    'das',
    null,
    null,
    null,
    'Dieses Jahr fahren wir nach Wien.',
    null,
    null
  ),
  (
    'jung',
    'adjective',
    'joven',
    'K-Pop ist sehr populär bei jungen Menschen.',
    'A2',
    null,
    null,
    null,
    null,
    'Junge Menschen lieben K-Pop.',
    null,
    null
  ),
  (
    'Jury',
    'noun',
    'jurado',
    'Das Publikum und eine Jury wählen den Gewinner.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Jury entscheidet den Sieger.',
    null,
    null
  ),
  (
    'Klimagewissen',
    'noun',
    'conciencia climática',
    'Wie viel ist das Klimagewissen wert?',
    'C1',
    'das',
    null,
    null,
    null,
    'Das Klimagewissen der Europäer wird auf die Probe gestellt.',
    null,
    null
  ),
  (
    'kolonial',
    'adjective',
    'colonial',
    'Klimaschutz, koloniales Erbe und die Glaubwürdigkeit internationaler Handelsbeziehungen.',
    'C1',
    null,
    null,
    null,
    null,
    'Das koloniale Erbe wirkt bis heute nach.',
    null,
    null
  ),
  (
    'kommerziell',
    'adjective',
    'comercial',
    'Das kommerzielle Image des Sports.',
    'C1',
    null,
    null,
    null,
    null,
    'Der Sport hat ein kommerzielles Interesse.',
    null,
    null
  ),
  (
    'konsequent',
    'adjective',
    'coherente / consecuente',
    'Ein konsequentes Geschäftsmodell.',
    'B2',
    null,
    null,
    null,
    null,
    'Sie handeln konsequent nach ihren Regeln.',
    null,
    null
  ),
  (
    'Konsequenz',
    'noun',
    'consecuencia',
    'Oft ohne strafrechtliche Konsequenzen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Das hat schwere Konsequenzen für die Natur.',
    null,
    null
  ),
  (
    'konsistent',
    'adjective',
    'consistente',
    'Ergebnis einer konsistenten Kulturpolitik.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Strategie ist sehr konsistent.',
    null,
    null
  ),
  (
    'konsumieren',
    'verb',
    'consumir',
    'Eine Generation junger Menschen konsumiert Popkultur primär über soziale Medien.',
    'B2',
    null,
    null,
    'konsumieren',
    null,
    'Junge Menschen konsumieren Musik digital.',
    'konsumierte',
    'konsumiert'
  ),
  (
    'kostenlos',
    'adjective',
    'gratuito',
    'Kostenlose Open-Air-Konzerte.',
    'B1',
    null,
    null,
    null,
    null,
    'Der Eintritt ist kostenlos.',
    null,
    null
  ),
  (
    'Kostüm',
    'noun',
    'traje / disfraz',
    'Die Sänger tanzen viel und tragen besondere Kostüme.',
    'A2',
    'das',
    null,
    null,
    null,
    'Die Kostüme sind sehr bunt und schön.',
    null,
    null
  ),
  (
    'Kritiker',
    'noun',
    'crítico',
    'Kritiker sehen darin eine gefährliche Normalisierung.',
    'B1',
    'der',
    null,
    null,
    null,
    'Die Kritiker sind nicht überzeugt.',
    null,
    null
  ),
  (
    'Kulturexport',
    'noun',
    'exportación cultural',
    'Was als staatlich geförderter Kulturexport begann.',
    'B2',
    'der',
    null,
    null,
    null,
    'K-Pop ist ein erfolgreicher Kulturexport.',
    null,
    null
  ),
  (
    'Kulturpolitik',
    'noun',
    'política cultural',
    'Das bestgehaltene Paradox der europäischen Kulturpolitik.',
    'C1',
    'die',
    null,
    null,
    null,
    'Kulturpolitik ist ein umstrittenes Thema.',
    null,
    null
  ),
  (
    'Kulturrezeption',
    'noun',
    'recepción cultural',
    'K-Pop ist ein Spiegel veränderter Kulturrezeption.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Kulturrezeption hat sich stark verändert.',
    null,
    null
  ),
  (
    'Körper',
    'noun',
    'cuerpo',
    'Erwachsene Sportler sollten selbst entscheiden, was sie mit ihrem Körper machen.',
    'B2',
    'der',
    null,
    null,
    null,
    'Der Körper braucht Erholung nach dem Training.',
    null,
    null
  ),
  (
    'Künstler',
    'noun',
    'artista',
    'Ein österreichischer Künstler hat 2025 gewonnen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Künstler singt sehr gut.',
    null,
    null
  ),
  (
    'künstlerisch',
    'adjective',
    'artístico',
    'Eine eigene künstlerische Stimme zu entwickeln.',
    'C1',
    null,
    null,
    null,
    null,
    'Sie haben eine starke künstlerische Identität.',
    null,
    null
  ),
  (
    'Land',
    'noun',
    'país / tierra',
    'Sie leben seit Tausenden von Jahren im Land.',
    'A2',
    'das',
    null,
    null,
    null,
    'Sie kämpfen für ihr Land.',
    null,
    null
  ),
  (
    'leben',
    'verb',
    'vivir',
    'In Brasilien leben viele indigene Volkgruppen.',
    'A2',
    null,
    null,
    'leben',
    null,
    'Sie leben seit Jahrhunderten hier.',
    'lebte',
    'gelebt'
  ),
  (
    'leistungssteigernd',
    'adjective',
    'potenciador del rendimiento',
    'Leistungssteigernde Substanzen sind ausdrücklich erlaubt.',
    'B1',
    null,
    null,
    null,
    null,
    'Leistungssteigernde Mittel sind umstritten.',
    null,
    null
  ),
  (
    'limitieren',
    'verb',
    'limitar',
    'Die moralische Ablehnung des Mainstreams limitiert seine Reichweite.',
    'C1',
    null,
    null,
    'limitieren',
    null,
    'Das Budget limitiert die Möglichkeiten.',
    'limitierte',
    'limitiert'
  ),
  (
    'markieren',
    'verb',
    'marcar',
    'Die Rückkehr von BTS markiert einen Moment.',
    'C1',
    null,
    null,
    'markieren',
    null,
    'Das Ereignis markiert einen Wendepunkt.',
    'markierte',
    'markiert'
  ),
  (
    'Markt',
    'noun',
    'mercado',
    'Deutschland gehört zu den wichtigsten europäischen Märkten.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der europäische Markt ist sehr groß.',
    null,
    null
  ),
  (
    'Militärdienst',
    'noun',
    'servicio militar',
    'Die Pause wurde durch den Militärdienst der Mitglieder ausgelöst.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Militärdienst dauert in Südkorea fast zwei Jahre.',
    null,
    null
  ),
  (
    'mischen',
    'verb',
    'mezclar',
    'Ihre Musik mischt Pop, Hip-Hop und elektronische Elemente.',
    'B1',
    null,
    null,
    'mischen',
    null,
    'Die Gruppe mischt verschiedene Musikstile.',
    'mischte',
    'gemischt'
  ),
  (
    'multipolar',
    'adjective',
    'multipolar',
    'Ein multipolarer Markt.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Welt wird zunehmend multipolar.',
    null,
    null
  ),
  (
    'Musikexport',
    'noun',
    'exportación musical',
    'Die Musikexporte bringen dem Land jährlich Milliarden ein.',
    'B1',
    'der',
    null,
    null,
    null,
    'K-Pop ist ein wichtiger Musikexport.',
    null,
    null
  ),
  (
    'Nachfrage',
    'noun',
    'demanda',
    'Die Nachfrage nach Tickets überstieg das Angebot innerhalb von Minuten.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Nachfrage nach Tickets ist sehr hoch.',
    null,
    null
  ),
  (
    'Nachhaltigkeitsklausel',
    'noun',
    'cláusula de sostenibilidad',
    'Das Abkommen sieht Nachhaltigkeitsklauseln vor.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Nachhaltigkeitsklausel ist ein wichtiges Instrument.',
    null,
    null
  ),
  (
    'neu',
    'adjective',
    'nuevo',
    'In Las Vegas gibt es einen neuen Sportwettbewerb.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist eine neue Regel.',
    null,
    null
  ),
  (
    'Neuordnung',
    'noun',
    'reordenación',
    'Die Neuordnung globaler Popkultur.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Neuordnung der Musikindustrie ist im Gange.',
    null,
    null
  ),
  (
    'Normalisierung',
    'noun',
    'normalización',
    'Kritiker sehen darin eine gefährliche Normalisierung.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Normalisierung von Doping ist umstritten.',
    null,
    null
  ),
  (
    'offen',
    'adjective',
    'abierto',
    'Es ist besser, wenn es offen und sicher ist.',
    'A2',
    null,
    null,
    null,
    null,
    'Sie sprechen offen über das Thema.',
    null,
    null
  ),
  (
    'offenbaren',
    'verb',
    'revelar',
    'Abstimmungsverhalten zwischen Nachbarländern offenbart geopolitische Nähe.',
    'C1',
    null,
    null,
    'offenbaren',
    null,
    'Der Konflikt offenbart tiefe gesellschaftliche Spannungen.',
    'offenbarte',
    'offenbart'
  ),
  (
    'offensichtlich',
    'adjective',
    'evidente',
    'Die Paradoxie ist offensichtlich.',
    'C1',
    null,
    null,
    null,
    null,
    'Das Problem ist offensichtlich.',
    null,
    null
  ),
  (
    'Organisator',
    'noun',
    'organizador',
    'Die Organisatoren sagen: Doping ist sowieso überall.',
    'A2',
    'der',
    null,
    null,
    null,
    'Die Organisatoren planen das Event.',
    null,
    null
  ),
  (
    'Paradox',
    'noun',
    'paradoja',
    'Der Eurovision Song Contest ist das bestgehaltene Paradox der europäischen Kulturpolitik.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das ist ein typisches Paradox moderner Politik.',
    null,
    null
  ),
  (
    'Paradoxie',
    'noun',
    'paradoja',
    'Die Paradoxie ist offensichtlich.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Paradoxie dieser Politik ist schwer zu ignorieren.',
    null,
    null
  ),
  (
    'Pause',
    'noun',
    'pausa',
    'Nach einer Pause ist BTS zurück.',
    'A2',
    'die',
    null,
    null,
    null,
    'Nach der Pause kommen sie zurück.',
    null,
    null
  ),
  (
    'Phänomen',
    'noun',
    'fenómeno',
    'Das ist ein großes Phänomen.',
    'A2',
    'das',
    null,
    null,
    null,
    'K-Pop ist ein weltweites Phänomen.',
    null,
    null
  ),
  (
    'planen',
    'verb',
    'planificar',
    'Die Stadt hat ein umfangreiches Rahmenprogramm geplant.',
    'B1',
    null,
    null,
    'planen',
    null,
    'Sie planen ein großes Fest.',
    'plante',
    'geplant'
  ),
  (
    'Platzierung',
    'noun',
    'clasificación',
    'Nach Jahren schwacher Platzierungen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Deutschland hofft auf eine bessere Platzierung.',
    null,
    null
  ),
  (
    'populär',
    'adjective',
    'popular',
    'K-Pop ist sehr populär bei jungen Menschen.',
    'A2',
    null,
    null,
    null,
    null,
    'Diese Musik ist sehr populär.',
    null,
    null
  ),
  (
    'Preisgeld',
    'noun',
    'premio en metálico',
    'Angezogen von hohen Preisgeldversprechen.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Preisgeld ist sehr hoch.',
    null,
    null
  ),
  (
    'prioritär',
    'adjective',
    'prioritario',
    'Dessen Schutz in internationalen Klimaabkommen als prioritär gilt.',
    'C1',
    null,
    null,
    null,
    null,
    'Der Waldschutz ist prioritär.',
    null,
    null
  ),
  (
    'Privatsphäre',
    'noun',
    'privacidad',
    'Die Privatsphäre von Idols strukturell eingeschränkt.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Privatsphäre von Stars ist kaum vorhanden.',
    null,
    null
  ),
  (
    'Protest',
    'noun',
    'protesta',
    'Jetzt haben Tausende von ihnen in der Hauptstadt Brasília protestiert.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Protest findet jedes Jahr statt.',
    null,
    null
  ),
  (
    'protestieren',
    'verb',
    'protestar',
    'Tausende haben in der Hauptstadt Brasília protestiert.',
    'A2',
    null,
    null,
    'protestieren',
    null,
    'Sie protestieren für ihre Rechte.',
    'protestierte',
    'protestiert'
  ),
  (
    'Provokation',
    'noun',
    'provocación',
    'Eine dreiste Provokation des organisierten Sports.',
    'B2',
    'die',
    null,
    null,
    null,
    'Das war eine gezielte Provokation.',
    null,
    null
  ),
  (
    'provokativ',
    'adjective',
    'provocador',
    'In ihrer provokativen Reinform.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Aussage war bewusst provokativ.',
    null,
    null
  ),
  (
    'psychisch',
    'adjective',
    'psíquico / mental',
    'Texten über psychische Gesundheit.',
    'B1',
    null,
    null,
    null,
    null,
    'Psychische Gesundheit ist sehr wichtig.',
    null,
    null
  ),
  (
    'Publikum',
    'noun',
    'público',
    'Das Publikum und eine Jury wählen den Gewinner.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das Publikum klatscht laut.',
    null,
    null
  ),
  (
    'Rahmenprogramm',
    'noun',
    'programa de actividades',
    'Die Stadt hat ein umfangreiches Rahmenprogramm geplant.',
    'B1',
    'das',
    null,
    null,
    null,
    'Das Rahmenprogramm umfasst viele Konzerte.',
    null,
    null
  ),
  (
    'rechtlich',
    'adjective',
    'jurídico / legal',
    'Kaum rechtliche Handhabe gegen Eindringlinge.',
    'C1',
    null,
    null,
    null,
    null,
    'Sie haben kaum rechtliche Möglichkeiten.',
    null,
    null
  ),
  (
    'reformieren',
    'verb',
    'reformar',
    'Der NDR hat das Auswahlverfahren reformiert.',
    'B2',
    null,
    null,
    'reformieren',
    null,
    'Sie wollen das System reformieren.',
    'reformierte',
    'reformiert'
  ),
  (
    'Regulierung',
    'noun',
    'regulación',
    'Über die Grenzen staatlicher Regulierung im Sport.',
    'C1',
    'die',
    null,
    null,
    null,
    'Eine stärkere Regulierung ist nötig.',
    null,
    null
  ),
  (
    'Reichweite',
    'noun',
    'alcance',
    'Die Reichweite übertrifft die meisten Sportgroßereignisse.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Reichweite der Sendung ist enorm.',
    null,
    null
  ),
  (
    'Reinform',
    'noun',
    'forma pura',
    'In ihrer provokativen Reinform.',
    'C1',
    'die',
    null,
    null,
    null,
    'Das Konzept zeigt sich in seiner Reinform.',
    null,
    null
  ),
  (
    'riskieren',
    'verb',
    'arriesgar',
    'Teilnehmende Sportler riskieren lebenslange Sperren.',
    'B1',
    null,
    null,
    'riskieren',
    null,
    'Er riskiert seine Karriere.',
    'riskierte',
    'riskiert'
  ),
  (
    'Ritual',
    'noun',
    'ritual',
    'Er ist ein jährliches Ritual europäischer Identität.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Finale ist ein echtes Ritual für die Fans.',
    null,
    null
  ),
  (
    'roden',
    'verb',
    'deforestar / talar',
    'Kein Soja-Import aus illegal gerodeten Flächen.',
    'C1',
    null,
    null,
    'roden',
    null,
    'Große Flächen wurden illegal gerodet.',
    'rodete',
    'gerodet'
  ),
  (
    'Rundfunkkooperation',
    'noun',
    'cooperación radiofónica',
    'Ein technisches Experiment zur Übung europäischer Rundfunkkooperation.',
    'C1',
    'die',
    null,
    null,
    null,
    'Die Rundfunkkooperation zwischen den Ländern wächst.',
    null,
    null
  ),
  (
    'schauen',
    'verb',
    'ver / mirar',
    'Menschen schauen den Wettbewerb im Fernsehen.',
    'A2',
    null,
    null,
    'schauen',
    null,
    'Wir schauen das Finale gemeinsam.',
    'schaute',
    'geschaut'
  ),
  (
    'scheinheilig',
    'adjective',
    'hipócrita',
    'Das bestehende Anti-Doping-System sei scheinheilig.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Argumentation wirkt scheinheilig.',
    null,
    null
  ),
  (
    'Schnittpunkt',
    'noun',
    'punto de intersección',
    'Das Acampamento Terra Livre ist ein Schnittpunkt globaler Debatten.',
    'C1',
    'der',
    null,
    null,
    null,
    'Das Thema ist ein Schnittpunkt von Politik und Ökologie.',
    null,
    null
  ),
  (
    'Schutz',
    'noun',
    'protección',
    'Die Forderung nach einem gesetzlichen Schutz ihrer Territorien.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Schutz der Wälder ist wichtig.',
    null,
    null
  ),
  (
    'Schutzgebiet',
    'noun',
    'área protegida',
    'Agrarbusiness dringt in Schutzgebiete ein.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Schutzgebiet darf nicht abgeholzt werden.',
    null,
    null
  ),
  (
    'Seismograph',
    'noun',
    'sismógrafo',
    'Ein Wettbewerb, der seit Jahrzehnten als Seismograph für politische Spannungen funktioniert.',
    'C1',
    'der',
    null,
    null,
    null,
    'Die Presse dient als Seismograph gesellschaftlicher Stimmungen.',
    null,
    null
  ),
  (
    'Selbstakzeptanz',
    'noun',
    'autoaceptación',
    'Texte über Gesellschaftsdruck und Selbstakzeptanz.',
    'C1',
    'die',
    null,
    null,
    null,
    'Selbstakzeptanz ist ein wichtiges Thema für junge Menschen.',
    null,
    null
  ),
  (
    'Selbstdarstellung',
    'noun',
    'autopresentación',
    'Eine Plattform für kulturelle Selbstdarstellung.',
    'B2',
    'die',
    null,
    null,
    null,
    'Der ESC bietet Raum für nationale Selbstdarstellung.',
    null,
    null
  ),
  (
    'Selbstfindung',
    'noun',
    'autoconocimiento',
    'Texten über Selbstfindung, psychische Gesundheit und gesellschaftlichen Druck.',
    'B1',
    'die',
    null,
    null,
    null,
    'Das Album handelt von Selbstfindung.',
    null,
    null
  ),
  (
    'sicher',
    'adjective',
    'seguro',
    'Es ist besser, wenn es offen und sicher ist.',
    'A2',
    null,
    null,
    null,
    null,
    'Das Training soll sicher sein.',
    null,
    null
  ),
  (
    'Sieg',
    'noun',
    'victoria',
    'Nach dem Sieg des österreichischen Künstlers JJ im Vorjahr.',
    'B1',
    'der',
    null,
    null,
    null,
    'Der Sieg war eine große Überraschung.',
    null,
    null
  ),
  (
    'Soft Power',
    'noun',
    'poder blando',
    'Hallyu ist sowohl Soft Power als auch Wirtschaftsstrategie.',
    'C1',
    'die',
    null,
    null,
    null,
    'Kultur ist ein wichtiges Instrument der Soft Power.',
    null,
    null
  ),
  (
    'Spaß',
    'noun',
    'diversión',
    'Der Eurovision macht sehr viel Spaß.',
    'A2',
    'der',
    null,
    null,
    null,
    'Das Spiel macht viel Spaß.',
    null,
    null
  ),
  (
    'Sperre',
    'noun',
    'sanción / suspensión',
    'Teilnehmende Sportler riskieren lebenslange Sperren für olympische Wettkämpfe.',
    'B1',
    'die',
    null,
    null,
    null,
    'Er bekam eine zweijährige Sperre.',
    null,
    null
  ),
  (
    'Sportler',
    'noun',
    'deportista',
    'Bei diesem Wettbewerb dürfen die Sportler Doping benutzen.',
    'A2',
    'der',
    null,
    null,
    null,
    'Die Sportler trainieren jeden Tag.',
    null,
    null
  ),
  (
    'Sportwettbewerb',
    'noun',
    'competición deportiva',
    'In Las Vegas gibt es einen neuen Sportwettbewerb.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Sportwettbewerb findet jedes Jahr statt.',
    null,
    null
  ),
  (
    'Staat',
    'noun',
    'estado',
    'Aber der Staat gibt ihnen diese Gebiete oft nicht.',
    'A2',
    'der',
    null,
    null,
    null,
    'Der Staat soll die Rechte schützen.',
    null,
    null
  ),
  (
    'staatlich',
    'adjective',
    'estatal',
    'Über die Grenzen staatlicher Regulierung im Sport.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine staatliche Aufgabe.',
    null,
    null
  ),
  (
    'stattfinden',
    'verb',
    'tener lugar',
    'In diesem Jahr findet der Eurovision in Wien statt.',
    'A2',
    null,
    null,
    'stattfinden',
    null,
    'Das Konzert findet morgen statt.',
    'fand statt',
    'stattgefunden'
  ),
  (
    'Stigma',
    'noun',
    'estigma',
    'Um das Stigma der deutschen ESC-Misserfolge zu durchbrechen.',
    'B2',
    'das',
    null,
    null,
    null,
    'Das Stigma ist schwer zu überwinden.',
    null,
    null
  ),
  (
    'strafrechtlich',
    'adjective',
    'penal',
    'Oft ohne strafrechtliche Konsequenzen.',
    'B2',
    null,
    null,
    null,
    null,
    'Die Täter müssen strafrechtlich verfolgt werden.',
    null,
    null
  ),
  (
    'strukturell',
    'adjective',
    'estructural',
    'Das System befördert Doping strukturell.',
    'C1',
    null,
    null,
    null,
    'El proyecto del club representa un modelo alternativo estructural.',
    'Das ist ein strukturelles Problem.',
    null,
    null
  ),
  (
    'Substanz',
    'noun',
    'sustancia',
    'Leistungssteigernde Substanzen sind ausdrücklich erlaubt.',
    'B1',
    'die',
    null,
    null,
    null,
    'Diese Substanz ist für den Sport verboten.',
    null,
    null
  ),
  (
    'Sänger',
    'noun',
    'cantante',
    'Die Sänger tanzen viel und tragen besondere Kostüme.',
    'A2',
    'der',
    null,
    null,
    null,
    'Die Sänger sind sehr talentiert.',
    null,
    null
  ),
  (
    'tanzen',
    'verb',
    'bailar',
    'Die Sänger tanzen viel und tragen besondere Kostüme.',
    'A2',
    null,
    null,
    'tanzen',
    null,
    'Sie tanzen bei jedem Konzert.',
    'tanzte',
    'getanzt'
  ),
  (
    'teilnehmen',
    'verb',
    'participar',
    'Mehr als 37 Länder nehmen teil.',
    'B1',
    null,
    null,
    'teilnehmen',
    'Más de 90.000 alumnos participan en el bachillerato.',
    'Viele Länder nehmen am Wettbewerb teil.',
    'nahm teil',
    'teilgenommen'
  ),
  (
    'tolerant',
    'adjective',
    'tolerante',
    'Wien will als weltoffene, tolerante Metropole auftreten.',
    'C1',
    null,
    null,
    null,
    null,
    'Eine tolerante Gesellschaft respektiert alle Menschen.',
    null,
    null
  ),
  (
    'Tourismusbranche',
    'noun',
    'sector turístico',
    'Für die Tourismusbranche ist es das wichtigste Ereignis des Jahres.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Tourismusbranche profitiert vom Wettbewerb.',
    null,
    null
  ),
  (
    'tragen',
    'verb',
    'llevar / vestir',
    'Die Sänger tanzen viel und tragen besondere Kostüme.',
    'A2',
    null,
    null,
    'tragen',
    null,
    'Sie tragen bunte Kostüme auf der Bühne.',
    'trug',
    'getragen'
  ),
  (
    'umfangreich',
    'adjective',
    'extenso / amplio',
    'Die Stadt hat ein umfangreiches Rahmenprogramm geplant.',
    'B1',
    null,
    null,
    null,
    null,
    'Das Programm ist sehr umfangreich.',
    null,
    null
  ),
  (
    'umfassen',
    'verb',
    'abarcar',
    'Ein globaler Markt, der Musik, Mode, Kosmetik, Film und Sprache umfasst.',
    'B2',
    null,
    null,
    'umfassen',
    null,
    'Das Phänomen umfasst viele Bereiche.',
    'umfasste',
    'umfasst'
  ),
  (
    'unbequem',
    'adjective',
    'incómodo',
    'Die unbequeme Wahrheit.',
    'C1',
    null,
    null,
    null,
    null,
    'Das ist eine unbequeme Frage.',
    null,
    null
  ),
  (
    'undenkbar',
    'adjective',
    'impensable',
    'Das wäre vor zwanzig Jahren undenkbar gewesen.',
    'B2',
    null,
    null,
    null,
    null,
    'Solch ein Erfolg war früher undenkbar.',
    null,
    null
  ),
  (
    'uneinheitlich',
    'adjective',
    'heterogéneo / no uniforme',
    'Der Eurovision ist uneinheitlich, laut, gelegentlich absurd.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Reaktionen waren sehr uneinheitlich.',
    null,
    null
  ),
  (
    'unterstützen',
    'verb',
    'apoyar',
    'Die Bewegung will Kandidaten unterstützen.',
    'B1',
    null,
    null,
    'unterstützen',
    null,
    'Sie unterstützen die indigenen Völker.',
    'unterstützte',
    'unterstützt'
  ),
  (
    'unzureichend',
    'adjective',
    'insuficiente',
    'Alle drei Ziele werden gegenwärtig unzureichend erfüllt.',
    'C1',
    null,
    null,
    null,
    null,
    'Die Kontrolle ist völlig unzureichend.',
    null,
    null
  ),
  (
    'verankern',
    'verb',
    'consagrar / anclar',
    'Die verfassungsmäßig verankerte Demarkierung ihrer Territorien.',
    'B2',
    null,
    null,
    'verankern',
    null,
    'Das Recht ist in der Verfassung verankert.',
    'verankerte',
    'verankert'
  ),
  (
    'verboten',
    'adjective',
    'prohibido',
    'Das ist bei anderen Wettkämpfen verboten.',
    'A2',
    null,
    null,
    null,
    null,
    'Doping ist verboten.',
    null,
    null
  ),
  (
    'verbreitet',
    'adjective',
    'extendido / generalizado',
    'Doping im Hochleistungssport ohnehin verbreitet sei.',
    'B1',
    null,
    null,
    null,
    null,
    'Das Problem ist weit verbreitet.',
    null,
    null
  ),
  (
    'Verfassungsgarantie',
    'noun',
    'garantía constitucional',
    'Der Hintergrund ist eine unvollendete Verfassungsgarantie.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Verfassungsgarantie muss umgesetzt werden.',
    null,
    null
  ),
  (
    'verfassungsmäßig',
    'adjective',
    'constitucional',
    'Die verfassungsmäßig verankerte Demarkierung ihrer Territorien.',
    'B2',
    null,
    null,
    null,
    null,
    'Das ist ein verfassungsmäßiges Recht.',
    null,
    null
  ),
  (
    'verfolgen',
    'verb',
    'seguir / vigilar',
    'Deutschland und die EU verfolgen die Lage aufmerksam.',
    'B1',
    null,
    null,
    'verfolgen',
    null,
    'Die Regierung verfolgt die Entwicklung genau.',
    'verfolgte',
    'verfolgt'
  ),
  (
    'verhandeln',
    'verb',
    'negociar',
    'Das Abkommen, über das seit Jahrzehnten verhandelt wird.',
    'C1',
    null,
    null,
    'verhandeln',
    null,
    'Die Länder verhandeln über ein neues Abkommen.',
    'verhandelte',
    'verhandelt'
  ),
  (
    'Vermarktung',
    'noun',
    'comercialización',
    'Die globale Vermarktung koreanischer Popkultur.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Vermarktung des Albums war sehr erfolgreich.',
    null,
    null
  ),
  (
    'vermeiden',
    'verb',
    'evitar',
    'Haltungen einzunehmen, die sie lieber vermeiden würde.',
    'C1',
    null,
    null,
    'vermeiden',
    null,
    'Sie versucht, Konflikte zu vermeiden.',
    'vermied',
    'vermieden'
  ),
  (
    'Versagen',
    'noun',
    'fracaso / fallo',
    'Ein Versagen des brasilianischen Rechtsstaats.',
    'C1',
    'das',
    null,
    null,
    null,
    'Das ist ein Versagen der internationalen Gemeinschaft.',
    null,
    null
  ),
  (
    'verschieben',
    'verb',
    'desplazar',
    'Wie grundlegend sich die globale Popkultur verschoben hat.',
    'C1',
    null,
    null,
    'verschieben',
    null,
    'Das Gleichgewicht hat sich verschoben.',
    'verschob',
    'verschoben'
  ),
  (
    'verschärfen',
    'verb',
    'agudizar / agravar',
    'Die europäische Dimension verschärft diese Paradoxie.',
    'C1',
    null,
    null,
    'verschärfen',
    null,
    'Die Krise verschärft die sozialen Spannungen.',
    'verschärfte',
    'verschärft'
  ),
  (
    'Vertreibung',
    'noun',
    'desplazamiento / expulsión',
    'Gewaltsame Vertreibungen.',
    'B1',
    'die',
    null,
    null,
    null,
    'Die Vertreibung der Gemeinschaften ist illegal.',
    null,
    null
  ),
  (
    'vertreten',
    'verb',
    'representar',
    'Kandidaten, die ihre Interessen vertreten.',
    'B1',
    null,
    null,
    'vertreten',
    null,
    'Er vertritt die Interessen der Gemeinschaft.',
    'vertrat',
    'vertreten'
  ),
  (
    'verurteilen',
    'verb',
    'condenar',
    'Das IOC hat die Enhanced Games scharf verurteilt.',
    'B1',
    null,
    null,
    'verurteilen',
    null,
    'Die Organisation wurde scharf verurteilt.',
    'verurteilte',
    'verurteilt'
  ),
  (
    'Verurteilung',
    'noun',
    'condena',
    'Sperren, Verurteilungen, Distanzierungen.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Verurteilung kam schnell.',
    null,
    null
  ),
  (
    'Volkgruppe',
    'noun',
    'grupo étnico',
    'In Brasilien leben viele indigene Volkgruppen.',
    'A2',
    'die',
    null,
    null,
    null,
    'Es gibt viele verschiedene Volkgruppen im Land.',
    null,
    null
  ),
  (
    'Wahlkampfstrategie',
    'noun',
    'estrategia electoral',
    'Eine gezielte Wahlkampfstrategie für die Wahlen im Oktober.',
    'B2',
    'die',
    null,
    null,
    null,
    'Die Wahlkampfstrategie ist gut durchdacht.',
    null,
    null
  ),
  (
    'Wehrdienst',
    'noun',
    'servicio militar',
    'Die Rückkehr von BTS nach dem Abschluss des Wehrdienstes.',
    'B2',
    'der',
    null,
    null,
    null,
    'Nach dem Wehrdienst kehrt er zur Musik zurück.',
    null,
    null
  ),
  (
    'Welttournee',
    'noun',
    'gira mundial',
    'Sie machen auch eine große Welttournee.',
    'A2',
    'die',
    null,
    null,
    null,
    'Die Welttournee beginnt im Sommer.',
    null,
    null
  ),
  (
    'Wettbewerb',
    'noun',
    'competición',
    'Der Eurovision Song Contest ist ein großer Musikwettbewerb in Europa.',
    'A2',
    'der',
    null,
    null,
    null,
    'Sie nehmen an einem Wettbewerb teil.',
    null,
    null
  ),
  (
    'wichtig',
    'adjective',
    'importante',
    'Diese Gebiete sind ihr Zuhause und sehr wichtig für sie.',
    'A2',
    null,
    null,
    null,
    null,
    'Das ist ein sehr wichtiges Thema.',
    null,
    null
  ),
  (
    'widerstandsfähig',
    'adjective',
    'resistente',
    'Erstaunlich widerstandsfähig.',
    'C1',
    null,
    null,
    null,
    null,
    'Das System ist erstaunlich widerstandsfähig.',
    null,
    null
  ),
  (
    'Wirtschaftsfaktor',
    'noun',
    'factor económico',
    'K-Pop ist ein bedeutender Wirtschaftsfaktor für Südkorea.',
    'B1',
    'der',
    null,
    null,
    null,
    'Tourismus ist ein wichtiger Wirtschaftsfaktor.',
    null,
    null
  ),
  (
    'wählen',
    'verb',
    'elegir',
    'Das Publikum und eine Jury wählen den Gewinner.',
    'A2',
    null,
    null,
    'wählen',
    null,
    'Wir wählen zusammen den besten Song.',
    'wählte',
    'gewählt'
  ),
  (
    'Zuhause',
    'noun',
    'hogar',
    'Diese Gebiete sind ihr Zuhause.',
    'A2',
    'das',
    null,
    null,
    null,
    'Das ist unser Zuhause seit vielen Jahren.',
    null,
    null
  ),
  (
    'zunehmend',
    'adjective',
    'crecientemente',
    'Ein zunehmend politisch aufgeladenes Ereignis.',
    'B2',
    null,
    null,
    null,
    null,
    'Der Wettbewerb wird zunehmend politisch.',
    null,
    null
  ),
  (
    'zurückkommen',
    'verb',
    'volver',
    'Nach einer Pause ist BTS zurück.',
    'A2',
    null,
    null,
    'zurückkommen',
    null,
    'Die Band kommt nach zwei Jahren zurück.',
    'kam zurück',
    'zurückgekommen'
  ),
  (
    'zwingen',
    'verb',
    'obligar',
    'Der ESC zwingt die Gastgeberstadt, Haltungen einzunehmen.',
    'C1',
    null,
    null,
    'zwingen',
    null,
    'Die Situation zwingt uns zu einer Entscheidung.',
    'zwang',
    'gezwungen'
  ),
  (
    'überwachen',
    'verb',
    'supervisar',
    'Die Sportler sollen von Ärzten überwacht werden.',
    'A2',
    null,
    null,
    'überwachen',
    null,
    'Die Sportler werden genau überwacht.',
    'überwachte',
    'überwacht'
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
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Wettbewerb'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Publikum'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Jury'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Gewinner'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Hauptstadt'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Künstler'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Fernsehen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Spaß'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Fan'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'Jahr'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'wählen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'gewinnen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'stattfinden'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'schauen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'A2',
    'groß'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Gastgeberstadt'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Sieg'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Finale'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Abstimmung'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Ereignis'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Rahmenprogramm'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Ausstellung'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'Tourismusbranche'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'teilnehmen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'ausrichten'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'erwarten'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'planen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'kostenlos'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'umfangreich'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B1',
    'eigenen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Ritual'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Selbstdarstellung'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Gastgeberstatus'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Einnahmen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Nachfrage'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Angebot'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Platzierung'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Auswahlverfahren'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Stigma'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'Fanbasis'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'reformieren'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'durchbrechen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'erheblich'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'zunehmend'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'B2',
    'ausgebucht'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Paradox'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Seismograph'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Rundfunkkooperation'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Reichweite'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Abstimmungsverhalten'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Ausschluss'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Balanceakt'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Gegenwind'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Haltung'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'Kulturpolitik'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'offenbaren'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'zwingen'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'vermeiden'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'widerstandsfähig'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'uneinheitlich'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'explizit'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'geopolitisch'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'gesellschaftlich'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'tolerant'
  ),
  (
    'eurovision-song-contest-2026-findet-in-wien-statt',
    'C1',
    'gelegentlich'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'Sportwettbewerb'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'Sportler'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'Doping'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'Arzt'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'Organisator'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'benutzen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'überwachen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'finden'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'dürfen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'verboten'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'neu'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'offen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'sicher'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'fair'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'A2',
    'falsch'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Substanz'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Aufsicht'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Normalisierung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Sperre'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Preisgeld'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Disziplin'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'Kritiker'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'argumentieren'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'riskieren'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'verurteilen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'anmelden'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'leistungssteigernd'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'heimlich'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'verbreitet'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B1',
    'ehemalig'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Provokation'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Geschäftsmodell'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Gedankenexperiment'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Gründer'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Verurteilung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Grundlage'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Bedingung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'Körper'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'aufwerfen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'herstellen'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'entscheiden'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'scheinheilig'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'dreist'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'empirisch'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'B2',
    'konsequent'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Heuchelei'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Reinform'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Höchstleistung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Förderstruktur'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Ablehnung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Regulierung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Absenz'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'Forcierung'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'gefährden'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'divergieren'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'limitieren'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'befördern'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'unzureichend'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'herstellbar'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'strukturell'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'kommerziell'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'institutionalisiert'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'unbequem'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'provokativ'
  ),
  (
    'enhanced-games-ein-sportwettbewerb-bei-dem-doping-erlaubt-ist',
    'C1',
    'staatlich'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Protest'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Volkgruppe'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Gebiet'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Staat'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Zuhause'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Land'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'Jahr'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'protestieren'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'anerkennen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'leben'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'bedeuten'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'wichtig'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'frei'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'indigen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'A2',
    'besonders'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Forderung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Schutz'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Ausbeutung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Abholzung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Vertreibung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Bewegung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Handelsabkommen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'Gemeinschaft'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'demonstrieren'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'verfolgen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'unterstützen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'vertreten'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'gesetzlich'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'angestammt'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B1',
    'gewaltsam'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Brisanz'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Demarkierung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Verfassungsgarantie'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Konsequenz'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Nachhaltigkeitsklausel'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Handelsprivileg'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Wahlkampfstrategie'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'Schutzgebiet'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'fordern'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'verankern'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'eindringen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'abgrenzen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'humanitär'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'verfassungsmäßig'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'B2',
    'strafrechtlich'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Schnittpunkt'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Glaubwürdigkeit'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Versagen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Handhabe'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Paradoxie'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Durchsetzung'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Almosen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'Klimagewissen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'verschärfen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'bewachen'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'verhandeln'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'roden'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'kolonial'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'prioritär'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'rechtlich'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'strukturell'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'offensichtlich'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'global'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'effektiv'
  ),
  (
    'indigene-menschen-in-brasilien-protestieren',
    'C1',
    'unzureichend'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Gruppe'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Album'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Welttournee'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Sänger'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Kostüm'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Phänomen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'Pause'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'tanzen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'tragen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'zurückkommen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'heißen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'bekannt'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'populär'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'besonder'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'A2',
    'jung'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'Militärdienst'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'Fangemeinde'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'Selbstfindung'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'Wirtschaftsfaktor'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'Markt'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'Musikexport'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'ankündigen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'aufbauen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'mischen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'auslösen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'einbringen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'psychisch'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'bedeutend'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'elektronisch'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B1',
    'aktiv'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Wehrdienst'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Fanbeziehung'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Bindung'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Vermarktung'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Kulturrezeption'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Beleg'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'Kulturexport'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'aufrechterhalten'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'investieren'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'konsumieren'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'umfassen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'emotional'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'erzwungen'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'autonom'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'B2',
    'undenkbar'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Neuordnung'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Dominanz'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Ambivalenz'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Authentizität'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Privatsphäre'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Soft Power'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Selbstakzeptanz'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'Imageproduktion'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'markieren'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'verschieben'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'generieren'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'einschränken'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'multipolar'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'konsistent'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'eigenständig'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'industrialisiert'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'belastend'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'künstlerisch'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'frühzeitig'
  ),
  (
    'bts-ist-zurueck-k-pop-aus-korea-erobert-die-welt',
    'C1',
    'hochentwickelt'
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

