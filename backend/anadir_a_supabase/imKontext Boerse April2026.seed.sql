-- ============================================================
-- Seed generated from structured TXT
-- Source: /Users/sam/Documents/imKontext/backend/anadir_a_supabase/imKontext Boerse April2026.txt
-- Tables: texts, text_versions, vocabulario, text_version_vocabulary
-- ============================================================

-- Theme 1: Der DAX ist sehr hoch – was bedeutet das?
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Der DAX ist sehr hoch – was bedeutet das?',
  null,
  'premium',
  now(),
  'der-dax-ist-sehr-hoch-was-bedeutet-das'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'der-dax-ist-sehr-hoch-was-bedeutet-das'),
  'A2',
  'Der DAX ist der wichtigste Aktienindex in Deutschland. Er zeigt, wie gut die 40 größten deutschen Unternehmen an der Börse stehen. Im April 2026 ist der DAX sehr hoch.

Wenn der DAX steigt, bedeutet das: Die Unternehmen haben viel Geld verdient. Viele Investoren kaufen Aktien. Das ist ein gutes Zeichen für die Wirtschaft.

Aber ein hoher DAX bedeutet nicht immer, dass es allen Menschen gut geht. Die Preise für Lebensmittel und Wohnungen sind immer noch hoch. Das ist ein Widerspruch.'
),
(
  (select id from texts where slug = 'der-dax-ist-sehr-hoch-was-bedeutet-das'),
  'B1',
  'Der deutsche Aktienindex DAX hat in der zweiten Aprilwoche 2026 ein neues Allzeithoch erreicht. Der Index der 40 größten deutschen Börsenunternehmen kletterte auf über 23.500 Punkte. Das ist ein Rekord, der viele Anleger überrascht hat – denn die wirtschaftliche Lage Deutschlands gilt weiterhin als schwierig.

Als Haupttreiber gelten starke Quartalsergebnisse mehrerer DAX-Konzerne, insbesondere SAP, Siemens und Allianz. Hinzu kommt die Erleichterung über die Waffenruhe im Iran-Konflikt, die die Energiepreise stabilisiert hat. Auch die Aussicht auf weitere Zinssenkungen der Europäischen Zentralbank beflügelt die Stimmung.

Experten warnen jedoch vor übertriebenen Optimismus. Ein steigender Aktienindex spiegelt nicht zwingend den Zustand der Gesamtwirtschaft wider. Die Binnennachfrage in Deutschland bleibt schwach, und viele mittelständische Unternehmen kämpfen weiterhin mit hohen Kosten.'
),
(
  (select id from texts where slug = 'der-dax-ist-sehr-hoch-was-bedeutet-das'),
  'B2',
  'Der DAX hat in dieser Woche die Marke von 23.500 Punkten geknackt und damit ein neues Allzeithoch markiert. Die Rally wird von einem Mix aus stabilen Unternehmensgewinnen, gesunkenen Zinsen und geopolitischer Entspannung getragen – eine Konstellation, die Anleger in risikoreichere Assets treibt.

Besonders SAP trägt zur Indexstärke bei: Der Walldorfer Softwarekonzern hat seinen Cloud-Umsatz 2025 auf 21 Milliarden Euro gesteigert und peilt für 2026 einen Free Cashflow von 10 Milliarden Euro an. Auch Siemens Energy profitiert vom Boom bei Infrastrukturausrüstung, und Rheinmetall gehört nach dem Rüstungshaushalt-Anstieg zu den stärksten DAX-Titeln.

Das Paradox bleibt bestehen: Während der DAX Rekorde schreibt, stagniert die deutsche Konjunktur. Das Ifo-Geschäftsklima hat sich zwar leicht erholt, liegt aber weiterhin unter seinem langjährigen Durchschnitt. Für Kleinanleger, die erst jetzt einsteigen wollen, stellt sich die klassische Frage: Ist das noch ein guter Einstiegszeitpunkt – oder der Gipfel vor dem Absturz?'
),
(
  (select id from texts where slug = 'der-dax-ist-sehr-hoch-was-bedeutet-das'),
  'C1',
  'Der DAX auf Allzeithoch ist, je nach Perspektive, ein Zeichen wirtschaftlicher Stärke oder ein Symptom struktureller Entkopplung. Die Realität dürfte näher an letzterem liegen. Dass der wichtigste deutsche Aktienindex Rekordstände markiert, während die Binnennachfrage stagniert, die Insolvenzzahlen im Mittelstand historische Höchststände erreichen und die Industrieproduktion in weiten Teilen rückläufig ist, offenbart eine zunehmende Entkopplung von Börsenwert und volkswirtschaftlicher Substanz.

Der DAX ist kein Abbild der deutschen Wirtschaft, sondern ein Index multinationaler Konzerne, die den Großteil ihres Umsatzes im Ausland erzielen. SAP verdient in den USA, Siemens in Asien, BASF weltweit. Ein steigender DAX signalisiert damit primär, dass globale Nachfrage und internationale Finanzmarktbedingungen günstig sind – nicht, dass der Standort Deutschland floriert.

Geldpolitisch bleibt die Lage zweideutig. Die Zinssenkungen der EZB machen Aktien relativ attraktiver gegenüber Anleihen – ein mechanischer Effekt, der Kursgewinne produziert, ohne dass sich die operative Lage der Unternehmen verbessert haben müsste. Diese sogenannte TINA-Logik (There Is No Alternative) treibt Kapital in Aktienmärkte, auch wenn die Fundamentaldaten ambivalent bleiben.

Für Privatanleger ist das DAX-Rekordhoch daher kein Signal zum unreflektierten Einstieg, sondern Anlass für genauere Analyse: Was verdienen die Unternehmen wirklich, und zu welchem Preis kaufe ich das?'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 2: SAP: Das wertvollste Unternehmen in Deutschland
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'SAP: Das wertvollste Unternehmen in Deutschland',
  null,
  'premium',
  now(),
  'sap-das-wertvollste-unternehmen-in-deutschland'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'sap-das-wertvollste-unternehmen-in-deutschland'),
  'A2',
  'SAP ist ein deutsches Unternehmen. Es kommt aus Walldorf in Baden-Württemberg. SAP macht Software für andere Firmen. Das ist sehr wichtig für die Wirtschaft.

SAP ist das wertvollste Unternehmen in Deutschland. Das bedeutet: Die Aktie von SAP ist sehr viel Geld wert. Viele Investoren kaufen SAP-Aktien.

Im Jahr 2025 hat SAP sehr viel Geld verdient. Der Umsatz war ein Rekord. Viele Unternehmen auf der ganzen Welt benutzen SAP-Software.'
),
(
  (select id from texts where slug = 'sap-das-wertvollste-unternehmen-in-deutschland'),
  'B1',
  'SAP ist mit einer Börsenkapitalisierung von über 280 Milliarden Euro das wertvollste Unternehmen Deutschlands – und einer der führenden Softwarekonzerne weltweit. Der Erfolg basiert auf einer Transformation, die vor einigen Jahren begann: weg vom klassischen Lizenzgeschäft, hin zu cloudbasierten Abonnementdiensten.

Im Geschäftsjahr 2025 steigerte SAP seinen Cloud-Umsatz auf 21 Milliarden Euro, ein Plus von 23 Prozent. Der Free Cashflow verdoppelte sich nahezu auf 8,2 Milliarden Euro. Für 2026 hat der Konzern noch ehrgeizigere Ziele angekündigt.

Ein wichtiger Treiber ist der Migrationsdruck: Rund 40 Prozent aller SAP-Kunden nutzen noch alte Systeme, die bis Ende 2027 zwingend auf die neue Plattform S/4HANA wechseln müssen. Das garantiert SAP planbare Einnahmen für Jahre. Analysten bewerten die Aktie mehrheitlich mit Kaufempfehlung.'
),
(
  (select id from texts where slug = 'sap-das-wertvollste-unternehmen-in-deutschland'),
  'B2',
  'SAP hat die Transformation vom trägen ERP-Anbieter zum agilen Cloud-Konzern vollzogen – und die Kapitalmärkte honorieren das eindrücklich. Mit einer Börsenkapitalisierung von über 280 Milliarden Euro übertrifft SAP inzwischen selbst Volkswagen, Siemens und die Deutsche Telekom zusammengenommen. Das war noch vor fünf Jahren undenkbar.

Der strategische Kern der Transformation ist die Cloud. SAP bietet Unternehmensanwendungen – von Buchhaltung über Personalmanagement bis Supply Chain – zunehmend als Abonnementdienst an. Das reduziert Einmalzahlungen, schafft aber stabile, wiederkehrende Umsätze. Der Cloud-Auftragsbestand von 77 Milliarden Euro ist ein Indikator für die Verlässlichkeit dieser Einnahmen.

Hinzu kommt ein struktureller Vorteil: Die erzwungene Migration von Legacy-Systemen auf S/4HANA bis 2027 bindet Millionen Unternehmenskunden an SAP – unabhängig von Wettbewerb und Konjunktur. Kritisch bleibt die Frage, ob SAP im KI-Segment gegen amerikanische Plattformanbieter wie Microsoft oder Salesforce bestehen kann. Die Antwort wird über die nächste Wachstumsphase entscheiden.'
),
(
  (select id from texts where slug = 'sap-das-wertvollste-unternehmen-in-deutschland'),
  'C1',
  'SAP ist eine Anomalie in der deutschen Wirtschaftslandschaft. Während Deutschlands industrielle Kernbranchen – Automobil, Chemie, Maschinenbau – mit strukturellen Herausforderungen kämpfen, hat der Walldorfer Softwarekonzern in den letzten fünf Jahren eine Wertschöpfung erzielt, die im europäischen Technologiesegment ihresgleichen sucht. Die Börsenkapitalisierung von über 280 Milliarden Euro übertrifft den Wert sämtlicher DAX-Automobilkonzerne zusammen.

Was SAPs Aufstieg erklärt, ist keine technologische Revolution, sondern eine strategische Kehrtwende: die konsequente Abkehr vom Einmallizenzgeschäft hin zu wiederkehrenden Cloud-Einnahmen. Diese Transformation war schmerzhaft – sie drückte die Marge zunächst, schuf aber eine Ertragsqualität, die Kapitalmärkte systematisch höher bewerten als zyklische Industriegewinne.

Für den Standort Deutschland ist SAP auch ein ambivalentes Signal. Der Konzern beschäftigt weltweit über 105.000 Menschen, davon rund ein Drittel in Deutschland. Er zahlt Steuern, investiert in Forschung und bildet aus – aber sein Geschäftsmodell ist im Kern global und datenbasiert, nicht lokal und produktiv. SAP profitiert von der deutschen Ingenieurskultur, ist aber kein Garant für die industrielle Zukunft des Standorts.

Die eigentliche Frage ist, ob Deutschland einen zweiten SAP hervorbringen kann – oder ob der Konzern ein historischer Glücksfall bleibt.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 3: Anthropic: Ein KI-Unternehmen geht an die Börse
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Anthropic: Ein KI-Unternehmen geht an die Börse',
  null,
  'premium',
  now(),
  'anthropic-ein-ki-unternehmen-geht-an-die-boerse'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'anthropic-ein-ki-unternehmen-geht-an-die-boerse'),
  'A2',
  'Anthropic ist ein Unternehmen aus den USA. Es macht künstliche Intelligenz. Das bekannteste Produkt heißt Claude. Viele Menschen benutzen Claude jeden Tag.

Anthropic möchte an die Börse gehen. Das bedeutet: Normale Menschen können dann Aktien von Anthropic kaufen. Das Unternehmen ist sehr viel Geld wert.

KI-Unternehmen sind gerade sehr interessant für Investoren. Alle wollen in künstliche Intelligenz investieren. Das ist ein großer Trend.'
),
(
  (select id from texts where slug = 'anthropic-ein-ki-unternehmen-geht-an-die-boerse'),
  'B1',
  'Das amerikanische KI-Unternehmen Anthropic, Entwickler des KI-Assistenten Claude, plant laut Insidern einen Börsengang noch in diesem Jahr. Der IPO (Initial Public Offering) könnte das Unternehmen mit einem Wert von über 60 Milliarden US-Dollar bewerten – was Anthropic zu einem der größten Börsengänge der jüngeren Geschichte machen würde.

Anthropic wurde 2021 von ehemaligen OpenAI-Mitarbeiterinnen und -Mitarbeitern gegründet. Das Unternehmen positioniert sich als sicherheitsorientierter KI-Entwickler und hat mit Claude eine der meistgenutzten KI-Anwendungen der Welt geschaffen. Großinvestoren wie Google und Amazon haben bereits Milliarden in das Unternehmen investiert.

Für deutsche Anleger ist der mögliche IPO ein wichtiges Ereignis: KI-Aktien gehören derzeit zu den gefragtesten überhaupt. Wer frühzeitig in Technologieunternehmen der KI-Welle einsteigen will, beobachtet den Anthropic-Börsengang genau.'
),
(
  (select id from texts where slug = 'anthropic-ein-ki-unternehmen-geht-an-die-boerse'),
  'B2',
  'Der geplante Börsengang von Anthropic würde in einem Marktumfeld stattfinden, das KI-Unternehmen mit beispiellosen Multiplikatoren bewertet. Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt – Anthropic erzielte zuletzt einen jährlichen Umsatz von rund 2,5 Milliarden US-Dollar.

Was Anthropic von Wettbewerbern wie OpenAI unterscheidet, ist die explizite Positionierung als Sicherheitsunternehmen. Das Konzept der verfassungsbasierten KI-Entwicklung und die Fokussierung auf sogenannte AI Safety haben dem Unternehmen nicht nur wissenschaftliche Glaubwürdigkeit eingebracht, sondern auch strategische Vorteile in der Regulierungsdiskussion.

Für den Kapitalmarkt stellen sich drei Kernfragen: Wie nachhaltig ist das Umsatzwachstum in einem zunehmend wettbewerbsintensiven Markt? Wie stark hängt das Geschäftsmodell von wenigen Großkunden ab? Und wie verändert sich die Bewertungslogik, wenn die Regulierung von KI-Systemen schärfer wird? Antworten wird der Börsenprospekt liefern müssen.'
),
(
  (select id from texts where slug = 'anthropic-ein-ki-unternehmen-geht-an-die-boerse'),
  'C1',
  'Der mögliche Börsengang von Anthropic ist mehr als ein Finanzmarktereignis – er ist ein Stresstest für die Bewertungslogik des KI-Sektors insgesamt. Eine Unternehmensbewertung von über 60 Milliarden US-Dollar bei einem Jahresumsatz von rund 2,5 Milliarden impliziert ein Kurs-Umsatz-Verhältnis von 24 – ein Wert, der selbst in einem Niedrigzinsumfeld nur durch außergewöhnliches Wachstum und strukturelle Marktmacht gerechtfertigt wäre.

Anthropics Differenzierungsmerkmal – AI Safety als Kern des Geschäftsmodells, nicht als Marketingzusatz – ist strategisch klug positioniert. In einer Phase, in der Regulierungsbehörden weltweit Sicherheitsstandards für KI-Systeme erarbeiten, ist ein Unternehmen, das Compliance und Sicherheitsarchitektur als Wettbewerbsvorteil begreift, strukturell begünstigt. Der EU AI Act, das Executive-Order-Regime in den USA und vergleichbare Regulierungsrahmen in Asien dürften Anbieter mit robuster Safety-Dokumentation begünstigen.

Das strukturelle Risiko liegt anderswo: in der Kapitalintensität des Trainings von Frontier-Modellen, der Abhängigkeit von wenigen Cloud-Infrastrukturanbietern und der Frage, ob Sprachmodelle eine dauerhafte Plattformlogik erzeugen oder zur Massenware werden, bei der Anbieter mit dem niedrigsten Preis gewinnen.

Für Investoren ist Anthropic eine Hochrisikoinvestition auf die Institutionalisierung von KI – mit realem Aufwärtspotenzial, aber ohne historischen Präzedenzfall.'
)
on conflict (text_id, level) do update set
  content = excluded.content;

-- Theme 4: Rüstungsaktien steigen – warum?
insert into texts (
  title,
  topic,
  access_status,
  published_at,
  slug
)
values (
  'Rüstungsaktien steigen – warum?',
  null,
  'premium',
  now(),
  'ruestungsaktien-steigen-warum'
)
on conflict (slug) do update set
  title = excluded.title,
  topic = excluded.topic,
  access_status = excluded.access_status,
  published_at = excluded.published_at;

insert into text_versions (text_id, level, content)
values
(
  (select id from texts where slug = 'ruestungsaktien-steigen-warum'),
  'A2',
  'Rüstungsunternehmen machen Waffen und militärische Produkte. In Deutschland gibt es zum Beispiel Rheinmetall. Die Aktie von Rheinmetall ist gerade sehr teuer.

Warum steigen Rüstungsaktien? Die Länder in Europa geben mehr Geld für ihr Militär aus. Das ist wegen der Kriege in der Welt. Mehr Geld für das Militär bedeutet mehr Aufträge für Rüstungsunternehmen.

Manche Menschen finden es problematisch, Geld in Rüstungsaktien zu investieren. Andere sagen: Es ist notwendig für die Sicherheit Europas. Das ist eine schwierige Diskussion.'
),
(
  (select id from texts where slug = 'ruestungsaktien-steigen-warum'),
  'B1',
  'Kaum eine Branche hat an der Börse in den letzten zwei Jahren so stark zugelegt wie die Rüstungsindustrie. Die Aktie von Rheinmetall, dem größten deutschen Rüstungskonzern, hat sich seit 2022 mehr als verzehnfacht. Auch europäische Wettbewerber wie Leonardo, BAE Systems und Thales verzeichnen Rekordkurse.

Der Hauptgrund ist klar: Die europäischen Staaten erhöhen ihre Verteidigungsausgaben massiv. Deutschland hat ein Sondervermögen von 100 Milliarden Euro für die Bundeswehr beschlossen. Die NATO-Länder streben das Zwei-Prozent-Ziel an. Diese Investitionen bedeuten langfristige Aufträge für Rüstungsunternehmen.

Das wirft jedoch auch ethische Fragen auf. Immer mehr Anleger fragen sich, ob Rüstungsinvestitionen mit nachhaltigen Anlagestrategien vereinbar sind. Einige Fonds haben Rüstungsaktien aus ihren ESG-Portfolios ausgeschlossen – andere haben sie explizit aufgenommen.'
),
(
  (select id from texts where slug = 'ruestungsaktien-steigen-warum'),
  'B2',
  'Die Rally bei europäischen Rüstungsaktien ist strukturell unterlegt. Rheinmetall, der Panzer- und Munitionshersteller aus Düsseldorf, hat seinen Auftragsbestand auf über 50 Milliarden Euro ausgebaut – ein Vielfaches des jährlichen Umsatzes. Die Planbarkeit dieser Einnahmen über viele Jahre ist für institutionelle Investoren hochattraktiv.

Treiber ist die neue europäische Verteidigungsrealität. Deutschland hat mit dem 100-Milliarden-Sondervermögen und dem angestrebten Zwei-Prozent-Ziel einen Paradigmenwechsel vollzogen. Frankreich, Polen und die baltischen Staaten haben ihre Militärhaushalte ebenfalls deutlich ausgebaut. Für Rüstungsunternehmen bedeutet das jahrzehntelange Auftragssicherheit.

Die Kehrseite ist die ESG-Debatte. Nachhaltigkeitsorientierte Investoren stehen vor einem Dilemma: Klassische ESG-Kriterien schließen Rüstung als Branche häufig aus. Angesichts des sicherheitspolitischen Kontexts haben mehrere EU-Institutionen jedoch begonnen, Verteidigungsinvestitionen als notwendig für den Erhalt demokratischer Gesellschaften einzustufen – eine Neubewertung, die die ESG-Industrie vor ungewohnte Fragen stellt.'
),
(
  (select id from texts where slug = 'ruestungsaktien-steigen-warum'),
  'C1',
  'Der Rüstungsboom an europäischen Börsen stellt die Nachhaltigkeitsfinanzierung vor eine konzeptionelle Zerreißprobe. Jahrelang galt das Prinzip: Rüstungsunternehmen sind per definitionem mit ESG-Kriterien unvereinbar – sie produzieren Waffen, also Instrumente der Zerstörung. Diese Sichtweise war moralisch bequem und analytisch schlicht. Angesichts der veränderten sicherheitspolitischen Realität in Europa erscheint sie zunehmend als Luxus.

Die Argumentation der Rüstungsbefürworter lautet strukturell so: Eine Gesellschaft, die ihre Verteidigungsfähigkeit verliert, verliert auch die Grundlage für alle anderen Nachhaltigkeitsziele. Demokratische Institutionen, Rechtsstaatlichkeit und soziale Sicherheit setzen physische Sicherheit voraus. Investitionen in Verteidigung sind damit – in einem spezifischen historischen Kontext – Investitionen in die Voraussetzungen von Nachhaltigkeit.

Diese Argumentation ist nicht lückenlos. Sie abstrahiert von der Frage, welche Waffen für welche Zwecke in welche Länder geliefert werden. Ein Rüstungslieferant, der gleichzeitig autoritäre Regime ausstattet, lässt sich schwerlich als ESG-konform einordnen. Die Unterscheidung zwischen defensiver und offensiver Rüstung, zwischen demokratischen Abnehmerstaaten und anderen, ist analytisch möglich – erfordert aber eine Transparenz, die viele Rüstungsunternehmen bislang nicht bieten.

Was bleibt, ist die unbequeme Erkenntnis, dass Kapitalmarkt und Geopolitik keine getrennten Sphären sind – und dass jeder Investitionsentscheid eine implizite Weltsicht enthält.'
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
    'abstrahieren',
    'verb',
    'abstraer / hacer abstracción',
    'Sie abstrahiert von der Frage, welche Waffen für welche Zwecke in welche Länder geliefert werden.',
    'C1',
    null,
    null,
    'abstrahieren',
    null,
    null,
    null,
    null
  ),
  (
    'agil',
    'adjective',
    'ágil',
    'SAP hat die Transformation vom trägen ERP-Anbieter zum agilen Cloud-Konzern vollzogen – und die Kapitalmärkte honorieren das eindrücklich.',
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
    'ambitioniert',
    'adjective',
    'ambicioso',
    'Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt – Anthropic erzielte zuletzt einen jährlichen Umsatz von rund 2,5 Milliarden US-Dollar.',
    'B2',
    null,
    null,
    null,
    'Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt.',
    null,
    null,
    null
  ),
  (
    'an die Börse gehen',
    'verb',
    'salir a bolsa',
    'Anthropic möchte an die Börse gehen.',
    'A2',
    null,
    null,
    'an die Börse gehen',
    null,
    null,
    null,
    null
  ),
  (
    'anpeilen',
    'verb',
    'apuntar a / aspirar a',
    'Besonders SAP trägt zur Indexstärke bei: Der Walldorfer Softwarekonzern hat seinen Cloud-Umsatz 2025 auf 21 Milliarden Euro gesteigert und peilt für 2026 einen Free Cashflow von 10 Milliarden Euro an.',
    'B2',
    null,
    null,
    'anpeilen',
    null,
    null,
    null,
    null
  ),
  (
    'anstreben',
    'verb',
    'aspirar a',
    'Die NATO-Länder streben das Zwei-Prozent-Ziel an.',
    'B1',
    null,
    null,
    'anstreben',
    null,
    null,
    null,
    null
  ),
  (
    'aufwerfen',
    'verb',
    'plantear',
    'Das wirft jedoch auch ethische Fragen auf.',
    'B1',
    null,
    null,
    'aufwerfen',
    null,
    null,
    null,
    null
  ),
  (
    'ausschließen',
    'verb',
    'excluir',
    'Einige Fonds haben Rüstungsaktien aus ihren ESG-Portfolios ausgeschlossen – andere haben sie explizit aufgenommen.',
    'B1',
    null,
    null,
    'ausschließen',
    null,
    null,
    null,
    null
  ),
  (
    'ausstatten',
    'verb',
    'equipar / dotar',
    'Ein Rüstungslieferant, der gleichzeitig autoritäre Regime ausstattet, lässt sich schwerlich als ESG-konform einordnen.',
    'C1',
    null,
    null,
    'ausstatten',
    null,
    null,
    null,
    null
  ),
  (
    'beflügeln',
    'verb',
    'impulsar / dar alas a',
    'Auch die Aussicht auf weitere Zinssenkungen der Europäischen Zentralbank beflügelt die Stimmung.',
    'B1',
    null,
    null,
    'beflügeln',
    null,
    null,
    null,
    null
  ),
  (
    'beispiellos',
    'adjective',
    'sin precedentes',
    'Der geplante Börsengang von Anthropic würde in einem Marktumfeld stattfinden, das KI-Unternehmen mit beispiellosen Multiplikatoren bewertet.',
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
    'beobachten',
    'verb',
    'observar',
    'Wer frühzeitig in Technologieunternehmen der KI-Welle einsteigen will, beobachtet den Anthropic-Börsengang genau.',
    'B1',
    null,
    null,
    'beobachten',
    null,
    null,
    null,
    null
  ),
  (
    'bestehen',
    'verb',
    'resistir / aguantar',
    'Kritisch bleibt die Frage, ob SAP im KI-Segment gegen amerikanische Plattformanbieter wie Microsoft oder Salesforce bestehen kann.',
    'B2',
    null,
    null,
    'bestehen',
    null,
    null,
    null,
    null
  ),
  (
    'bewerten',
    'verb',
    'valorar',
    'Der IPO könnte das Unternehmen mit einem Wert von über 60 Milliarden US-Dollar bewerten – was Anthropic zu einem der größten Börsengänge der jüngeren Geschichte machen würde.',
    'B1',
    null,
    null,
    'bewerten',
    null,
    null,
    null,
    null
  ),
  (
    'das Abbild',
    'noun',
    'reflejo / imagen',
    'Der DAX ist kein Abbild der deutschen Wirtschaft, sondern ein Index multinationaler Konzerne, die den Großteil ihres Umsatzes im Ausland erzielen.',
    'C1',
    'das',
    null,
    null,
    'Der DAX ist kein Abbild der deutschen Wirtschaft, sondern ein Index multinationaler Konzerne, die den Großteil ihres Umsätzes im Ausland erzielen.',
    null,
    null,
    null
  ),
  (
    'das Allzeithoch',
    'noun',
    'máximo histórico',
    'Der deutsche Aktienindex DAX hat in der zweiten Aprilwoche 2026 ein neues Allzeithoch erreicht.',
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
    'das Aufwärtspotenzial',
    'noun',
    'potencial alcista',
    'Für Investoren ist Anthropic eine Hochrisikoinvestition auf die Institutionalisierung von KI – mit realem Aufwärtspotenzial, aber ohne historischen Präzedenzfall.',
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
    'das Differenzierungsmerkmal',
    'noun',
    'elemento diferenciador',
    'Anthropics Differenzierungsmerkmal – AI Safety als Kern des Geschäftsmodells, nicht als Marketingzusatz – ist strategisch klug positioniert.',
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
    'das Dilemma',
    'noun',
    'dilema',
    'Nachhaltigkeitsorientierte Investoren stehen vor einem Dilemma: Klassische ESG-Kriterien schließen Rüstung als Branche häufig aus.',
    'B2',
    'das',
    null,
    null,
    'Nachhaltigkeitsorientierte Investoren stehen vor einem Dilemma.',
    null,
    null,
    null
  ),
  (
    'das Ereignis',
    'noun',
    'acontecimiento',
    'Für deutsche Anleger ist der mögliche IPO ein wichtiges Ereignis: KI-Aktien gehören derzeit zu den gefragtesten überhaupt.',
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
    'das Geschäftsjahr',
    'noun',
    'ejercicio fiscal',
    'Im Geschäftsjahr 2025 steigerte SAP seinen Cloud-Umsatz auf 21 Milliarden Euro, ein Plus von 23 Prozent.',
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
    'das Kurs-Umsatz-Verhältnis',
    'noun',
    'ratio precio-ventas',
    'Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt – Anthropic erzielte zuletzt einen jährlichen Umsatz von rund 2,5 Milliarden US-Dollar.',
    'B2',
    'das',
    null,
    null,
    'Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt.',
    null,
    null,
    null
  ),
  (
    'das Legacy-System',
    'noun',
    'sistema heredado',
    'Hinzu kommt ein struktureller Vorteil: Die erzwungene Migration von Legacy-Systemen auf S/4HANA bis 2027 bindet Millionen Unternehmenskunden an SAP – unabhängig von Wettbewerb und Konjunktur.',
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
    'das Lizenzgeschäft',
    'noun',
    'negocio de licencias',
    'Der Erfolg basiert auf einer Transformation, die vor einigen Jahren begann: weg vom klassischen Lizenzgeschäft, hin zu cloudbasierten Abonnementdiensten.',
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
    'das Marktumfeld',
    'noun',
    'entorno de mercado',
    'Der geplante Börsengang von Anthropic würde in einem Marktumfeld stattfinden, das KI-Unternehmen mit beispiellosen Multiplikatoren bewertet.',
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
    'das Militär',
    'noun',
    'ejército / fuerzas militares',
    'Die Länder in Europa geben mehr Geld für ihr Militär aus.',
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
    'das Niedrigzinsumfeld',
    'noun',
    'entorno de tipos de interés bajos',
    'Eine Unternehmensbewertung von über 60 Milliarden US-Dollar bei einem Jahresumsatz von rund 2,5 Milliarden impliziert ein Kurs-Umsatz-Verhältnis von 24 – ein Wert, der selbst in einem Niedrigzinsumfeld nur durch außergewöhnliches Wachstum und strukturelle Marktmacht gerechtfertigt wäre.',
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
    'das Paradox',
    'noun',
    'paradoja',
    'Das Paradox bleibt bestehen: Während der DAX Rekorde schreibt, stagniert die deutsche Konjunktur.',
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
    'das Produkt',
    'noun',
    'producto',
    'Das bekannteste Produkt heißt Claude.',
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
    'das Quartalsergebnis',
    'noun',
    'resultado trimestral',
    'Als Haupttreiber gelten starke Quartalsergebnisse mehrerer DAX-Konzerne, insbesondere SAP, Siemens und Allianz.',
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
    'das Rüstungsunternehmen',
    'noun',
    'empresa armamentística',
    'Rüstungsunternehmen machen Waffen und militärische Produkte.',
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
    'das Sondervermögen',
    'noun',
    'fondo especial',
    'Deutschland hat ein Sondervermögen von 100 Milliarden Euro für die Bundeswehr beschlossen.',
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
    'das Unternehmen',
    'noun',
    'empresa',
    'Er zeigt, wie gut die 40 größten deutschen Unternehmen an der Börse stehen.',
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
    'das Zeichen',
    'noun',
    'señal',
    'Das ist ein gutes Zeichen für die Wirtschaft.',
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
    'der Abnehmerstaat',
    'noun',
    'país receptor / cliente estatal',
    'Die Unterscheidung zwischen defensiver und offensiver Rüstung, zwischen demokratischen Abnehmerstaaten und anderen, ist analytisch möglich – erfordert aber eine Transparenz, die viele Rüstungsunternehmen bislang nicht bieten.',
    'C1',
    'der',
    null,
    null,
    'Die Differenzierung zwischen defensiver und offensiver Rüstung, zwischen demokratischen Abnehmerstaaten und anderen, ist analytisch möglich – erfordert aber Transparenz, die viele Rüstungsunternehmen bislang nicht bieten.',
    null,
    null,
    null
  ),
  (
    'der Abonnementdienst',
    'noun',
    'servicio de suscripción',
    'Der Erfolg basiert auf einer Transformation, die vor einigen Jahren begann: weg vom klassischen Lizenzgeschäft, hin zu cloudbasierten Abonnementdiensten.',
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
    'der Absturz',
    'noun',
    'caída / desplome',
    'Für Kleinanleger, die erst jetzt einsteigen wollen, stellt sich die klassische Frage: Ist das noch ein guter Einstiegszeitpunkt – oder der Gipfel vor dem Absturz?',
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
    'der Aktienindex',
    'noun',
    'índice de bolsa',
    'Der DAX ist der wichtigste Aktienindex in Deutschland.',
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
    'der Anleger',
    'noun',
    'inversor',
    'Das ist ein Rekord, der viele Anleger überrascht hat – denn die wirtschaftliche Lage Deutschlands gilt weiterhin als schwierig.',
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
    'der Auftrag',
    'noun',
    'pedido / encargo',
    'Mehr Geld für das Militär bedeutet mehr Aufträge für Rüstungsunternehmen.',
    'A2',
    'der',
    null,
    null,
    'Mehr Geld für Militär bedeutet mehr Aufträge für Rüstungsunternehmen.',
    null,
    null,
    null
  ),
  (
    'der Auftragsbestand',
    'noun',
    'cartera de pedidos',
    'Der Cloud-Auftragsbestand von 77 Milliarden Euro ist ein Indikator für die Verlässlichkeit dieser Einnahmen.',
    'B2',
    'der',
    null,
    null,
    'Der Cloud-Auftragsbestand von 77 Milliarden Euro ist ein Indikator für die Visibilität dieser Einnahmen.',
    null,
    null,
    null
  ),
  (
    'der Börsengang',
    'noun',
    'salida a bolsa / OPV',
    'Das amerikanische KI-Unternehmen Anthropic, Entwickler des KI-Assistenten Claude, plant laut Insidern einen Börsengang noch in diesem Jahr.',
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
    'der Börsenprospekt',
    'noun',
    'folleto de salida a bolsa',
    'Antworten wird der Börsenprospekt liefern müssen.',
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
    'der DAX',
    'noun',
    'índice bursátil alemán',
    'Der DAX ist der wichtigste Aktienindex in Deutschland.',
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
    'der Durchschnitt',
    'noun',
    'promedio',
    'Das Ifo-Geschäftsklima hat sich zwar leicht erholt, liegt aber weiterhin unter seinem langjährigen Durchschnitt.',
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
    'der Einstiegszeitpunkt',
    'noun',
    'momento de entrada',
    'Für Kleinanleger, die erst jetzt einsteigen wollen, stellt sich die klassische Frage: Ist das noch ein guter Einstiegszeitpunkt – oder der Gipfel vor dem Absturz?',
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
    'der Energiepreis',
    'noun',
    'precio de la energía',
    'Hinzu kommt die Erleichterung über die Waffenruhe im Iran-Konflikt, die die Energiepreise stabilisiert hat.',
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
    'der Entwickler',
    'noun',
    'desarrollador',
    'Das amerikanische KI-Unternehmen Anthropic, Entwickler des KI-Assistenten Claude, plant laut Insidern einen Börsengang noch in diesem Jahr.',
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
    'der Erhalt',
    'noun',
    'preservación / mantenimiento',
    'Angesichts des sicherheitspolitischen Kontexts haben mehrere EU-Institutionen jedoch begonnen, Verteidigungsinvestitionen als notwendig für den Erhalt demokratischer Gesellschaften einzustufen – eine Neubewertung, die die ESG-Industrie vor ungewohnte Fragen stellt.',
    'B2',
    'der',
    null,
    null,
    'Angesichts des sicherheitspolitischen Kontexts haben mehrere EU-Institutionen jedoch begonnen, Verteidigungsinvestitionen als notwendig für den Erhalt demokratischer Gesellschaften zu rahmen.',
    null,
    null,
    null
  ),
  (
    'der Free Cashflow',
    'noun',
    'flujo de caja libre',
    'Der Free Cashflow verdoppelte sich nahezu auf 8,2 Milliarden Euro.',
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
    'der Garant',
    'noun',
    'garante',
    'SAP profitiert von der deutschen Ingenieurskultur, ist aber kein Garant für die industrielle Zukunft des Standorts.',
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
    'der Glücksfall',
    'noun',
    'golpe de suerte',
    'Die eigentliche Frage ist, ob Deutschland einen zweiten SAP hervorbringen kann – oder ob der Konzern ein historischer Glücksfall bleibt.',
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
    'der Großinvestor',
    'noun',
    'gran inversor',
    'Großinvestoren wie Google und Amazon haben bereits Milliarden in das Unternehmen investiert.',
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
    'der Haupttreiber',
    'noun',
    'motor principal',
    'Als Haupttreiber gelten starke Quartalsergebnisse mehrerer DAX-Konzerne, insbesondere SAP, Siemens und Allianz.',
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
    'der Indikator',
    'noun',
    'indicador',
    'Der Cloud-Auftragsbestand von 77 Milliarden Euro ist ein Indikator für die Verlässlichkeit dieser Einnahmen.',
    'B2',
    'der',
    null,
    null,
    'Der Cloud-Auftragsbestand von 77 Milliarden Euro ist ein Indikator für die Visibilität dieser Einnahmen.',
    null,
    null,
    null
  ),
  (
    'der Investor',
    'noun',
    'inversor',
    'Viele Investoren kaufen Aktien.',
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
    'der IPO',
    'noun',
    'oferta pública inicial',
    'Der IPO könnte das Unternehmen mit einem Wert von über 60 Milliarden US-Dollar bewerten – was Anthropic zu einem der größten Börsengänge der jüngeren Geschichte machen würde.',
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
    'der Kapitalmarkt',
    'noun',
    'mercado de capitales',
    'SAP hat die Transformation vom trägen ERP-Anbieter zum agilen Cloud-Konzern vollzogen – und die Kapitalmärkte honorieren das eindrücklich.',
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
    'der Kleinanleger',
    'noun',
    'pequeño inversor',
    'Für Kleinanleger, die erst jetzt einsteigen wollen, stellt sich die klassische Frage: Ist das noch ein guter Einstiegszeitpunkt – oder der Gipfel vor dem Absturz?',
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
    'der Krieg',
    'noun',
    'guerra',
    'Das ist wegen der Kriege in der Welt.',
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
    'der Migrationsdruck',
    'noun',
    'presión de migración',
    'Ein wichtiger Treiber ist der Migrationsdruck: Rund 40 Prozent aller SAP-Kunden nutzen noch alte Systeme, die bis Ende 2027 zwingend auf die neue Plattform S/4HANA wechseln müssen.',
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
    'der Militärhaushalt',
    'noun',
    'presupuesto de defensa',
    'Frankreich, Polen und die baltischen Staaten haben ihre Militärhaushalte ebenfalls deutlich ausgebaut.',
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
    'der Multiplikator',
    'noun',
    'multiplicador de valoración',
    'Der geplante Börsengang von Anthropic würde in einem Marktumfeld stattfinden, das KI-Unternehmen mit beispiellosen Multiplikatoren bewertet.',
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
    'der Munitionshersteller',
    'noun',
    'fabricante de munición',
    'Rheinmetall, der Panzer- und Munitionshersteller aus Düsseldorf, hat seinen Auftragsbestand auf über 50 Milliarden Euro ausgebaut – ein Vielfaches des jährlichen Umsatzes.',
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
    'der Paradigmenwechsel',
    'noun',
    'cambio de paradigma',
    'Deutschland hat mit dem 100-Milliarden-Sondervermögen und dem angestrebten Zwei-Prozent-Ziel einen Paradigmenwechsel vollzogen.',
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
    'der Preis',
    'noun',
    'precio',
    'Die Preise für Lebensmittel und Wohnungen sind immer noch hoch.',
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
    'der Präzedenzfall',
    'noun',
    'precedente histórico',
    'Für Investoren ist Anthropic eine Hochrisikoinvestition auf die Institutionalisierung von KI – mit realem Aufwärtspotenzial, aber ohne historischen Präzedenzfall.',
    'C1',
    'der',
    null,
    null,
    'Für Investoren ist Anthropic ein Hochrisikobet auf die Institutionalisierung von KI – mit realem Upside, aber ohne historischen Präzedenzfall.',
    null,
    null,
    null
  ),
  (
    'der Rekord',
    'noun',
    'récord',
    'Das ist ein Rekord, der viele Anleger überrascht hat – denn die wirtschaftliche Lage Deutschlands gilt weiterhin als schwierig.',
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
    'der Rekordkurs',
    'noun',
    'cotización récord',
    'Auch europäische Wettbewerber wie Leonardo, BAE Systems und Thales verzeichnen Rekordkurse.',
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
    'der Rüstungsbefürworter',
    'noun',
    'defensor del armamento',
    'Die Argumentation der Rüstungsbefürworter lautet strukturell so: Eine Gesellschaft, die ihre Verteidigungsfähigkeit verliert, verliert auch die Grundlage für alle anderen Nachhaltigkeitsziele.',
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
    'der Standort',
    'noun',
    'plaza empresarial / emplazamiento',
    'Ein steigender DAX signalisiert damit primär, dass globale Nachfrage und internationale Finanzmarktbedingungen günstig sind – nicht, dass der Standort Deutschland floriert.',
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
    'der Stresstest',
    'noun',
    'prueba de estrés / test de resistencia',
    'Der mögliche Börsengang von Anthropic ist mehr als ein Finanzmarktereignis – er ist ein Stresstest für die Bewertungslogik des KI-Sektors insgesamt.',
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
    'der Titel',
    'noun',
    'valor bursátil',
    'Auch Siemens Energy profitiert vom Boom bei Infrastrukturausrüstung, und Rheinmetall gehört nach dem Rüstungshaushalt-Anstieg zu den stärksten DAX-Titeln.',
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
    'der Treiber',
    'noun',
    'motor / impulsor',
    'Ein wichtiger Treiber ist der Migrationsdruck: Rund 40 Prozent aller SAP-Kunden nutzen noch alte Systeme, die bis Ende 2027 zwingend auf die neue Plattform S/4HANA wechseln müssen.',
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
    'der Trend',
    'noun',
    'tendencia',
    'Das ist ein großer Trend.',
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
    'der Umsatz',
    'noun',
    'facturación / volumen de ventas',
    'Der Umsatz war ein Rekord.',
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
    'der Unternehmensgewinn',
    'noun',
    'beneficio empresarial',
    'Die Rally wird von einem Mix aus stabilen Unternehmensgewinnen, gesunkenen Zinsen und geopolitischer Entspannung getragen – eine Konstellation, die Anleger in risikoreichere Assets treibt.',
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
    'der Wettbewerber',
    'noun',
    'competidor',
    'Was Anthropic von Wettbewerbern wie OpenAI unterscheidet, ist die explizite Positionierung als Sicherheitsunternehmen.',
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
    'der Wettbewerbsvorteil',
    'noun',
    'ventaja competitiva',
    'In einer Phase, in der Regulierungsbehörden weltweit Sicherheitsstandards für KI-Systeme erarbeiten, ist ein Unternehmen, das Compliance und Sicherheitsarchitektur als Wettbewerbsvorteil begreift, strukturell begünstigt.',
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
    'der Widerspruch',
    'noun',
    'contradicción',
    'Das ist ein Widerspruch.',
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
    'der Zustand',
    'noun',
    'estado / situación',
    'Ein steigender Aktienindex spiegelt nicht zwingend den Zustand der Gesamtwirtschaft wider.',
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
    'die Abhängigkeit',
    'noun',
    'dependencia',
    'Das strukturelle Risiko liegt anderswo: in der Kapitalintensität des Trainings von Frontier-Modellen, der Abhängigkeit von wenigen Cloud-Infrastrukturanbietern und der Frage, ob Sprachmodelle eine dauerhafte Plattformlogik erzeugen oder zur Massenware werden, bei der Anbieter mit dem niedrigsten Preis gewinnen.',
    'C1',
    'die',
    null,
    null,
    'Das strukturelle Risiko liegt anderswo: in der Kapitalintensität des Trainings von Frontier-Modellen, der Abhängigkeit von wenigen Cloud-Infrastrukturanbietern und der Frage, ob Sprachmodelle eine dauerhafte Plattformlogik erzeugen oder zu einem Commodity werden, in dem Preiswäger gewinnen.',
    null,
    null,
    null
  ),
  (
    'die Abkehr',
    'noun',
    'alejamiento / abandono',
    'Was SAPs Aufstieg erklärt, ist keine technologische Revolution, sondern eine strategische Kehrtwende: die konsequente Abkehr vom Einmallizenzgeschäft hin zu wiederkehrenden Cloud-Einnahmen.',
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
    'die Aktie',
    'noun',
    'acción de bolsa',
    'Viele Investoren kaufen Aktien.',
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
    'die Anlagestrategie',
    'noun',
    'estrategia de inversión',
    'Immer mehr Anleger fragen sich, ob Rüstungsinvestitionen mit nachhaltigen Anlagestrategien vereinbar sind.',
    'B1',
    'die',
    null,
    null,
    'Immer mehr Anleger stellen sich die Frage, ob Rüstungsinvestitionen mit nachhaltigen Anlagestrategien vereinbar sind.',
    null,
    null,
    null
  ),
  (
    'die Anleihe',
    'noun',
    'bono / obligación',
    'Die Zinssenkungen der EZB machen Aktien relativ attraktiver gegenüber Anleihen – ein mechanischer Effekt, der Kursgewinne produziert, ohne dass sich die operative Lage der Unternehmen verbessert haben müsste.',
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
    'die Anomalie',
    'noun',
    'anomalía',
    'SAP ist eine Anomalie in der deutschen Wirtschaftslandschaft.',
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
    'die Auftragssicherheit',
    'noun',
    'seguridad de pedidos / cartera asegurada',
    'Für Rüstungsunternehmen bedeutet das jahrzehntelange Auftragssicherheit.',
    'B2',
    'die',
    null,
    null,
    'Für Rüstungsunternehmen bedeutet das dekadenlange Auftragssicherheit.',
    null,
    null,
    null
  ),
  (
    'die Aussicht',
    'noun',
    'perspectiva',
    'Auch die Aussicht auf weitere Zinssenkungen der Europäischen Zentralbank beflügelt die Stimmung.',
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
    'die Bewertung',
    'noun',
    'valoración',
    'Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt – Anthropic erzielte zuletzt einen jährlichen Umsatz von rund 2,5 Milliarden US-Dollar.',
    'B2',
    'die',
    null,
    null,
    'Eine Bewertung von über 60 Milliarden US-Dollar entspräche einem Kurs-Umsatz-Verhältnis, das selbst für Wachstumsunternehmen ambitioniert wirkt.',
    null,
    null,
    null
  ),
  (
    'die Bewertungslogik',
    'noun',
    'lógica de valoración',
    'Der mögliche Börsengang von Anthropic ist mehr als ein Finanzmarktereignis – er ist ein Stresstest für die Bewertungslogik des KI-Sektors insgesamt.',
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
    'die Binnennachfrage',
    'noun',
    'demanda interna',
    'Die Binnennachfrage in Deutschland bleibt schwach, und viele mittelständische Unternehmen kämpfen weiterhin mit hohen Kosten.',
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
    'die Branche',
    'noun',
    'sector',
    'Kaum eine Branche hat an der Börse in den letzten zwei Jahren so stark zugelegt wie die Rüstungsindustrie.',
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
    'die Buchhaltung',
    'noun',
    'contabilidad',
    'SAP bietet Unternehmensanwendungen – von Buchhaltung über Personalmanagement bis Supply Chain – zunehmend als Abonnementdienst an.',
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
    'die Börse',
    'noun',
    'bolsa de valores',
    'Er zeigt, wie gut die 40 größten deutschen Unternehmen an der Börse stehen.',
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
    'die Börsenkapitalisierung',
    'noun',
    'capitalización bursátil',
    'SAP ist mit einer Börsenkapitalisierung von über 280 Milliarden Euro das wertvollste Unternehmen Deutschlands – und einer der führenden Softwarekonzerne weltweit.',
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
    'die Einmalzahlung',
    'noun',
    'pago único',
    'Das reduziert Einmalzahlungen, schafft aber stabile, wiederkehrende Umsätze.',
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
    'die Entkopplung',
    'noun',
    'desacoplamiento',
    'Der DAX auf Allzeithoch ist, je nach Perspektive, ein Zeichen wirtschaftlicher Stärke oder ein Symptom struktureller Entkopplung.',
    'C1',
    'die',
    null,
    null,
    'Dass der wichtigste deutsche Aktienindex Rekordstände markiert, während die Binnennachfrage stagniert, die Insolvenzzahlen im Mittelstand historische Höchststände erreichen und die Industrieproduktion in weiten Teilen rückläufig ist, offenbart eine zunehmende Entkopplung von Börsenwert und volkswirtschaftlicher Substanz.',
    null,
    null,
    null
  ),
  (
    'die Entspannung',
    'noun',
    'distensión / relajación',
    'Die Rally wird von einem Mix aus stabilen Unternehmensgewinnen, gesunkenen Zinsen und geopolitischer Entspannung getragen – eine Konstellation, die Anleger in risikoreichere Assets treibt.',
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
    'die Erkenntnis',
    'noun',
    'conclusión / constatación',
    'Was bleibt, ist die unbequeme Erkenntnis, dass Kapitalmarkt und Geopolitik keine getrennten Sphären sind – und dass jeder Investitionsentscheid eine implizite Weltsicht enthält.',
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
    'die Erleichterung',
    'noun',
    'alivio',
    'Hinzu kommt die Erleichterung über die Waffenruhe im Iran-Konflikt, die die Energiepreise stabilisiert hat.',
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
    'die Ertragsqualität',
    'noun',
    'calidad de los beneficios',
    'Diese Transformation war schmerzhaft – sie drückte die Marge zunächst, schuf aber eine Ertragsqualität, die Kapitalmärkte systematisch höher bewerten als zyklische Industriegewinne.',
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
    'die Firma',
    'noun',
    'empresa',
    'SAP macht Software für andere Firmen.',
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
    'die Fundamentaldaten',
    'noun',
    'datos fundamentales',
    'Diese sogenannte TINA-Logik treibt Kapital in Aktienmärkte, auch wenn die Fundamentaldaten ambivalent bleiben.',
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
    'die Glaubwürdigkeit',
    'noun',
    'credibilidad',
    'Das Konzept der verfassungsbasierten KI-Entwicklung und die Fokussierung auf sogenannte AI Safety haben dem Unternehmen nicht nur wissenschaftliche Glaubwürdigkeit eingebracht, sondern auch strategische Vorteile in der Regulierungsdiskussion.',
    'B2',
    'die',
    null,
    null,
    'Das Konzept der verfassungsbasierten KI-Entwicklung und die Fokussierung auf sogenannte AI Safety haben dem Unternehmen nicht nur wissenschaftliche Glaubwürdigkeit eingebracht, sondern auch strategische Vorteile bei der Regulierungsdiskussion.',
    null,
    null,
    null
  ),
  (
    'die Insolvenzzahl',
    'noun',
    'cifra de insolvencias',
    'Dass der wichtigste deutsche Aktienindex Rekordstände markiert, während die Binnennachfrage stagniert, die Insolvenzzahlen im Mittelstand historische Höchststände erreichen und die Industrieproduktion in weiten Teilen rückläufig ist, offenbart eine zunehmende Entkopplung von Börsenwert und volkswirtschaftlicher Substanz.',
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
    'die Kapitalintensität',
    'noun',
    'intensidad de capital',
    'Das strukturelle Risiko liegt anderswo: in der Kapitalintensität des Trainings von Frontier-Modellen, der Abhängigkeit von wenigen Cloud-Infrastrukturanbietern und der Frage, ob Sprachmodelle eine dauerhafte Plattformlogik erzeugen oder zur Massenware werden, bei der Anbieter mit dem niedrigsten Preis gewinnen.',
    'C1',
    'die',
    null,
    null,
    'Das strukturelle Risiko liegt anderswo: in der Kapitalintensität des Trainings von Frontier-Modellen, der Abhängigkeit von wenigen Cloud-Infrastrukturanbietern und der Frage, ob Sprachmodelle eine dauerhafte Plattformlogik erzeugen oder zu einem Commodity werden, in dem Preiswäger gewinnen.',
    null,
    null,
    null
  ),
  (
    'die Kaufempfehlung',
    'noun',
    'recomendación de compra',
    'Analysten bewerten die Aktie mehrheitlich mit Kaufempfehlung.',
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
    'die Kehrseite',
    'noun',
    'cara negativa / contrapartida',
    'Die Kehrseite ist die ESG-Debatte.',
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
    'die Kehrtwende',
    'noun',
    'giro estratégico / cambio de rumbo',
    'Was SAPs Aufstieg erklärt, ist keine technologische Revolution, sondern eine strategische Kehrtwende: die konsequente Abkehr vom Einmallizenzgeschäft hin zu wiederkehrenden Cloud-Einnahmen.',
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
    'die Kernbranche',
    'noun',
    'sector industrial clave',
    'Während Deutschlands industrielle Kernbranchen – Automobil, Chemie, Maschinenbau – mit strukturellen Herausforderungen kämpfen, hat der Walldorfer Softwarekonzern in den letzten fünf Jahren eine Wertschöpfung erzielt, die im europäischen Technologiesegment ihresgleichen sucht.',
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
    'die Konjunktur',
    'noun',
    'coyuntura económica',
    'Das Paradox bleibt bestehen: Während der DAX Rekorde schreibt, stagniert die deutsche Konjunktur.',
    'B2',
    'die',
    null,
    null,
    'Während der DAX Rekorde schreibt, stagniert die deutsche Konjunktur.',
    null,
    null,
    null
  ),
  (
    'die Konstellation',
    'noun',
    'coyuntura / constelación de factores',
    'Die Rally wird von einem Mix aus stabilen Unternehmensgewinnen, gesunkenen Zinsen und geopolitischer Entspannung getragen – eine Konstellation, die Anleger in risikoreichere Assets treibt.',
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
    'die künstliche Intelligenz',
    'noun',
    'inteligencia artificial',
    'Es macht künstliche Intelligenz.',
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
    'die Lage',
    'noun',
    'situación',
    'Das ist ein Rekord, der viele Anleger überrascht hat – denn die wirtschaftliche Lage Deutschlands gilt weiterhin als schwierig.',
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
    'die Lebensmittel',
    'noun',
    'alimentos',
    'Die Preise für Lebensmittel und Wohnungen sind immer noch hoch.',
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
    'die Marge',
    'noun',
    'margen',
    'Diese Transformation war schmerzhaft – sie drückte die Marge zunächst, schuf aber eine Ertragsqualität, die Kapitalmärkte systematisch höher bewerten als zyklische Industriegewinne.',
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
    'die Massenware',
    'noun',
    'producto de consumo masivo / commodity',
    'Das strukturelle Risiko liegt anderswo: in der Kapitalintensität des Trainings von Frontier-Modellen, der Abhängigkeit von wenigen Cloud-Infrastrukturanbietern und der Frage, ob Sprachmodelle eine dauerhafte Plattformlogik erzeugen oder zur Massenware werden, bei der Anbieter mit dem niedrigsten Preis gewinnen.',
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
    'die Nachhaltigkeitsfinanzierung',
    'noun',
    'financiación sostenible',
    'Der Rüstungsboom an europäischen Börsen stellt die Nachhaltigkeitsfinanzierung vor eine konzeptionelle Zerreißprobe.',
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
    'die Neubewertung',
    'noun',
    'revaluación / nueva clasificación',
    'Angesichts des sicherheitspolitischen Kontexts haben mehrere EU-Institutionen jedoch begonnen, Verteidigungsinvestitionen als notwendig für den Erhalt demokratischer Gesellschaften einzustufen – eine Neubewertung, die die ESG-Industrie vor ungewohnte Fragen stellt.',
    'B2',
    'die',
    null,
    null,
    'Angesichts des sicherheitspolitischen Kontexts haben mehrere EU-Institutionen jedoch begonnen, Verteidigungsinvestitionen als notwendig für den Erhalt demokratischer Gesellschaften zu rahmen – eine Neubewertung, die die ESG-Industrie vor ungewohnte Fragen stellt.',
    null,
    null,
    null
  ),
  (
    'die Planbarkeit',
    'noun',
    'previsibilidad / trazabilidad',
    'Die Planbarkeit dieser Einnahmen über viele Jahre ist für institutionelle Investoren hochattraktiv.',
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
    'die Positionierung',
    'noun',
    'posicionamiento',
    'Was Anthropic von Wettbewerbern wie OpenAI unterscheidet, ist die explizite Positionierung als Sicherheitsunternehmen.',
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
    'die Rally',
    'noun',
    'rally / subida sostenida',
    'Die Rally wird von einem Mix aus stabilen Unternehmensgewinnen, gesunkenen Zinsen und geopolitischer Entspannung getragen – eine Konstellation, die Anleger in risikoreichere Assets treibt.',
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
    'die Rechtsstaatlichkeit',
    'noun',
    'Estado de derecho',
    'Demokratische Institutionen, Rechtsstaatlichkeit und soziale Sicherheit setzen physische Sicherheit voraus.',
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
    'die Regulierungsbehörde',
    'noun',
    'organismo regulador',
    'In einer Phase, in der Regulierungsbehörden weltweit Sicherheitsstandards für KI-Systeme erarbeiten, ist ein Unternehmen, das Compliance und Sicherheitsarchitektur als Wettbewerbsvorteil begreift, strukturell begünstigt.',
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
    'die Regulierungsdiskussion',
    'noun',
    'debate regulatorio',
    'Das Konzept der verfassungsbasierten KI-Entwicklung und die Fokussierung auf sogenannte AI Safety haben dem Unternehmen nicht nur wissenschaftliche Glaubwürdigkeit eingebracht, sondern auch strategische Vorteile in der Regulierungsdiskussion.',
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
    'die Rüstungsindustrie',
    'noun',
    'industria armamentística',
    'Kaum eine Branche hat an der Börse in den letzten zwei Jahren so stark zugelegt wie die Rüstungsindustrie.',
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
    'die Sicherheit',
    'noun',
    'seguridad',
    'Andere sagen: Es ist notwendig für die Sicherheit Europas.',
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
    'die Software',
    'noun',
    'software / programa informático',
    'SAP macht Software für andere Firmen.',
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
    'die Sphäre',
    'noun',
    'esfera / ámbito',
    'Was bleibt, ist die unbequeme Erkenntnis, dass Kapitalmarkt und Geopolitik keine getrennten Sphären sind – und dass jeder Investitionsentscheid eine implizite Weltsicht enthält.',
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
    'die TINA-Logik',
    'noun',
    'lógica TINA — «no hay alternativa»',
    'Diese sogenannte TINA-Logik treibt Kapital in Aktienmärkte, auch wenn die Fundamentaldaten ambivalent bleiben.',
    'C1',
    'die',
    null,
    null,
    'Diese sogenannte TINA-Logik (There Is No Alternative) treibt Kapital in Aktienmärkte, auch wenn die Fundamentaldaten ambivalent bleiben.',
    null,
    null,
    null
  ),
  (
    'die Transformation',
    'noun',
    'transformación',
    'Der Erfolg basiert auf einer Transformation, die vor einigen Jahren begann: weg vom klassischen Lizenzgeschäft, hin zu cloudbasierten Abonnementdiensten.',
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
    'die Unternehmensanwendung',
    'noun',
    'aplicación empresarial',
    'SAP bietet Unternehmensanwendungen – von Buchhaltung über Personalmanagement bis Supply Chain – zunehmend als Abonnementdienst an.',
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
    'die Verteidigungsausgaben',
    'noun',
    'gastos de defensa',
    'Der Hauptgrund ist klar: Die europäischen Staaten erhöhen ihre Verteidigungsausgaben massiv.',
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
    'die Verteidigungsfähigkeit',
    'noun',
    'capacidad de defensa',
    'Die Argumentation der Rüstungsbefürworter lautet strukturell so: Eine Gesellschaft, die ihre Verteidigungsfähigkeit verliert, verliert auch die Grundlage für alle anderen Nachhaltigkeitsziele.',
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
    'die volkswirtschaftliche Substanz',
    'noun',
    'base de la economía real',
    'Dass der wichtigste deutsche Aktienindex Rekordstände markiert, während die Binnennachfrage stagniert, die Insolvenzzahlen im Mittelstand historische Höchststände erreichen und die Industrieproduktion in weiten Teilen rückläufig ist, offenbart eine zunehmende Entkopplung von Börsenwert und volkswirtschaftlicher Substanz.',
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
    'die Waffe',
    'noun',
    'arma',
    'Rüstungsunternehmen machen Waffen und militärische Produkte.',
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
    'die Weltsicht',
    'noun',
    'cosmovisión / visión del mundo',
    'Was bleibt, ist die unbequeme Erkenntnis, dass Kapitalmarkt und Geopolitik keine getrennten Sphären sind – und dass jeder Investitionsentscheid eine implizite Weltsicht enthält.',
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
    'die Wertschöpfung',
    'noun',
    'creación de valor',
    'Während Deutschlands industrielle Kernbranchen – Automobil, Chemie, Maschinenbau – mit strukturellen Herausforderungen kämpfen, hat der Walldorfer Softwarekonzern in den letzten fünf Jahren eine Wertschöpfung erzielt, die im europäischen Technologiesegment ihresgleichen sucht.',
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
    'die Wirtschaft',
    'noun',
    'economía',
    'Das ist ein gutes Zeichen für die Wirtschaft.',
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
    'die Wirtschaftslandschaft',
    'noun',
    'panorama económico',
    'SAP ist eine Anomalie in der deutschen Wirtschaftslandschaft.',
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
    'die Wohnung',
    'noun',
    'piso / vivienda',
    'Die Preise für Lebensmittel und Wohnungen sind immer noch hoch.',
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
    'die Zerreißprobe',
    'noun',
    'prueba de fuego / tensión extrema',
    'Der Rüstungsboom an europäischen Börsen stellt die Nachhaltigkeitsfinanzierung vor eine konzeptionelle Zerreißprobe.',
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
    'die Zerstörung',
    'noun',
    'destrucción',
    'Jahrelang galt das Prinzip: Rüstungsunternehmen sind per definitionem mit ESG-Kriterien unvereinbar – sie produzieren Waffen, also Instrumente der Zerstörung.',
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
    'die Zinssenkung',
    'noun',
    'bajada de tipos de interés',
    'Auch die Aussicht auf weitere Zinssenkungen der Europäischen Zentralbank beflügelt die Stimmung.',
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
    'ehrgeizig',
    'adjective',
    'ambicioso',
    'Für 2026 hat der Konzern noch ehrgeizigere Ziele angekündigt.',
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
    'ein Vielfaches',
    'noun',
    'un múltiplo',
    'Rheinmetall, der Panzer- und Munitionshersteller aus Düsseldorf, hat seinen Auftragsbestand auf über 50 Milliarden Euro ausgebaut – ein Vielfaches des jährlichen Umsatzes.',
    'B2',
    'ein',
    null,
    null,
    null,
    null,
    null,
    null
  ),
  (
    'einstufen',
    'verb',
    'clasificar / considerar',
    'Angesichts des sicherheitspolitischen Kontexts haben mehrere EU-Institutionen jedoch begonnen, Verteidigungsinvestitionen als notwendig für den Erhalt demokratischer Gesellschaften einzustufen – eine Neubewertung, die die ESG-Industrie vor ungewohnte Fragen stellt.',
    'B2',
    null,
    null,
    'einstufen',
    null,
    null,
    null,
    null
  ),
  (
    'erzwungen',
    'verb',
    'forzado / obligado',
    'Hinzu kommt ein struktureller Vorteil: Die erzwungene Migration von Legacy-Systemen auf S/4HANA bis 2027 bindet Millionen Unternehmenskunden an SAP – unabhängig von Wettbewerb und Konjunktur.',
    'B2',
    null,
    null,
    'erzwungen',
    null,
    null,
    null,
    null
  ),
  (
    'florieren',
    'verb',
    'prosperar / florecer',
    'Ein steigender DAX signalisiert damit primär, dass globale Nachfrage und internationale Finanzmarktbedingungen günstig sind – nicht, dass der Standort Deutschland floriert.',
    'C1',
    null,
    null,
    'florieren',
    null,
    null,
    null,
    null
  ),
  (
    'frühzeitig',
    'adjective',
    'con antelación / a tiempo',
    'Wer frühzeitig in Technologieunternehmen der KI-Welle einsteigen will, beobachtet den Anthropic-Börsengang genau.',
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
    'führend',
    'adjective',
    'líder',
    'SAP ist mit einer Börsenkapitalisierung von über 280 Milliarden Euro das wertvollste Unternehmen Deutschlands – und einer der führenden Softwarekonzerne weltweit.',
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
    'garantieren',
    'verb',
    'garantizar',
    'Das garantiert SAP planbare Einnahmen für Jahre.',
    'B1',
    null,
    null,
    'garantieren',
    null,
    null,
    null,
    null
  ),
  (
    'gefragt',
    'adjective',
    'demandado / cotizado',
    'Für deutsche Anleger ist der mögliche IPO ein wichtiges Ereignis: KI-Aktien gehören derzeit zu den gefragtesten überhaupt.',
    'B1',
    null,
    null,
    null,
    'KI-Aktien gehören derzeit zu den gefragtesten überhaupt.',
    null,
    null,
    null
  ),
  (
    'gründen',
    'verb',
    'fundar',
    'Anthropic wurde 2021 von ehemaligen OpenAI-Mitarbeiterinnen und -Mitarbeitern gegründet.',
    'B1',
    null,
    null,
    'gründen',
    null,
    null,
    null,
    null
  ),
  (
    'hervorbringen',
    'verb',
    'producir / generar',
    'Die eigentliche Frage ist, ob Deutschland einen zweiten SAP hervorbringen kann – oder ob der Konzern ein historischer Glücksfall bleibt.',
    'C1',
    null,
    null,
    'hervorbringen',
    null,
    null,
    null,
    null
  ),
  (
    'honorieren',
    'verb',
    'reconocer / recompensar',
    'SAP hat die Transformation vom trägen ERP-Anbieter zum agilen Cloud-Konzern vollzogen – und die Kapitalmärkte honorieren das eindrücklich.',
    'B2',
    null,
    null,
    'honorieren',
    null,
    null,
    null,
    null
  ),
  (
    'ihresgleichen suchen',
    'verb',
    'no tener parangón',
    'Während Deutschlands industrielle Kernbranchen – Automobil, Chemie, Maschinenbau – mit strukturellen Herausforderungen kämpfen, hat der Walldorfer Softwarekonzern in den letzten fünf Jahren eine Wertschöpfung erzielt, die im europäischen Technologiesegment ihresgleichen sucht.',
    'C1',
    null,
    null,
    'ihresgleichen suchen',
    null,
    null,
    null,
    null
  ),
  (
    'investieren',
    'verb',
    'invertir',
    'Alle wollen in künstliche Intelligenz investieren.',
    'A2',
    null,
    null,
    'investieren',
    'Alle wollen in Künstliche Intelligenz investieren.',
    null,
    null,
    null
  ),
  (
    'klettern',
    'verb',
    'escalar / subir',
    'Der Index der 40 größten deutschen Börsenunternehmen kletterte auf über 23.500 Punkte.',
    'B1',
    null,
    null,
    'klettern',
    null,
    null,
    null,
    null
  ),
  (
    'knacken',
    'verb',
    'superar / romper',
    'Der DAX hat in dieser Woche die Marke von 23.500 Punkten geknackt und damit ein neues Allzeithoch markiert.',
    'B2',
    null,
    null,
    'knacken',
    null,
    null,
    null,
    null
  ),
  (
    'lückenlos',
    'adjective',
    'sin fisuras / impecable',
    'Diese Argumentation ist nicht lückenlos.',
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
    'mehrheitlich',
    'adjective',
    'mayoritariamente',
    'Analysten bewerten die Aktie mehrheitlich mit Kaufempfehlung.',
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
    'mittelständisch',
    'adjective',
    'de mediana empresa',
    'Die Binnennachfrage in Deutschland bleibt schwach, und viele mittelständische Unternehmen kämpfen weiterhin mit hohen Kosten.',
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
    'nachhaltig',
    'adjective',
    'sostenible / duradero',
    'Für den Kapitalmarkt stellen sich drei Kernfragen: Wie nachhaltig ist das Umsatzwachstum in einem zunehmend wettbewerbsintensiven Markt?',
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
    'notwendig',
    'adjective',
    'necesario',
    'Andere sagen: Es ist notwendig für die Sicherheit Europas.',
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
    'planbar',
    'adjective',
    'predecible / planificable',
    'Das garantiert SAP planbare Einnahmen für Jahre.',
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
    'positionieren',
    'verb',
    'posicionarse',
    'Das Unternehmen positioniert sich als sicherheitsorientierter KI-Entwickler und hat mit Claude eine der meistgenutzten KI-Anwendungen der Welt geschaffen.',
    'B1',
    null,
    null,
    'positionieren',
    null,
    null,
    null,
    null
  ),
  (
    'problematisch',
    'adjective',
    'problemático',
    'Manche Menschen finden es problematisch, Geld in Rüstungsaktien zu investieren.',
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
    'rechtfertigen',
    'verb',
    'justificar',
    'Eine Unternehmensbewertung von über 60 Milliarden US-Dollar bei einem Jahresumsatz von rund 2,5 Milliarden impliziert ein Kurs-Umsatz-Verhältnis von 24 – ein Wert, der selbst in einem Niedrigzinsumfeld nur durch außergewöhnliches Wachstum und strukturelle Marktmacht gerechtfertigt wäre.',
    'C1',
    null,
    null,
    'rechtfertigen',
    null,
    null,
    null,
    null
  ),
  (
    'rückläufig',
    'adjective',
    'en descenso / a la baja',
    'Dass der wichtigste deutsche Aktienindex Rekordstände markiert, während die Binnennachfrage stagniert, die Insolvenzzahlen im Mittelstand historische Höchststände erreichen und die Industrieproduktion in weiten Teilen rückläufig ist, offenbart eine zunehmende Entkopplung von Börsenwert und volkswirtschaftlicher Substanz.',
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
    'schlicht',
    'adjective',
    'simplista / llano',
    'Diese Sichtweise war moralisch bequem und analytisch schlicht.',
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
    'schwerlich',
    'adjective',
    'difícilmente',
    'Ein Rüstungslieferant, der gleichzeitig autoritäre Regime ausstattet, lässt sich schwerlich als ESG-konform einordnen.',
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
    'sich erholen',
    'verb',
    'recuperarse',
    'Das Ifo-Geschäftsklima hat sich zwar leicht erholt, liegt aber weiterhin unter seinem langjährigen Durchschnitt.',
    'B2',
    null,
    null,
    'sich erholen',
    null,
    null,
    null,
    null
  ),
  (
    'sicherheitsorientiert',
    'adjective',
    'orientado a la seguridad',
    'Das Unternehmen positioniert sich als sicherheitsorientierter KI-Entwickler und hat mit Claude eine der meistgenutzten KI-Anwendungen der Welt geschaffen.',
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
    'stagnieren',
    'verb',
    'estancarse',
    'Das Paradox bleibt bestehen: Während der DAX Rekorde schreibt, stagniert die deutsche Konjunktur.',
    'B2',
    null,
    null,
    'stagnieren',
    null,
    null,
    null,
    null
  ),
  (
    'steigen',
    'verb',
    'subir',
    'Wenn der DAX steigt, bedeutet das: Die Unternehmen haben viel Geld verdient.',
    'A2',
    null,
    null,
    'steigen',
    null,
    null,
    null,
    null
  ),
  (
    'strukturell unterlegt',
    'adjective',
    'con fundamento estructural',
    'Die Rally bei europäischen Rüstungsaktien ist strukturell unterlegt.',
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
    'träge',
    'adjective',
    'lento / rezagado',
    'SAP hat die Transformation vom trägen ERP-Anbieter zum agilen Cloud-Konzern vollzogen – und die Kapitalmärkte honorieren das eindrücklich.',
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
    'undenkbar',
    'adjective',
    'impensable',
    'Das war noch vor fünf Jahren undenkbar.',
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
    'unreflektiert',
    'adjective',
    'irreflexivo / sin análisis',
    'Für Privatanleger ist das DAX-Rekordhoch daher kein Signal zum unreflektierten Einstieg, sondern Anlass für genauere Analyse: Was verdienen die Unternehmen wirklich, und zu welchem Preis kaufe ich das?',
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
    'verdienen',
    'verb',
    'ganar dinero',
    'Wenn der DAX steigt, bedeutet das: Die Unternehmen haben viel Geld verdient.',
    'A2',
    null,
    null,
    'verdienen',
    'Die Unternehmen haben viel Geld verdient.',
    null,
    null,
    null
  ),
  (
    'vereinbar',
    'adjective',
    'compatible',
    'Immer mehr Anleger fragen sich, ob Rüstungsinvestitionen mit nachhaltigen Anlagestrategien vereinbar sind.',
    'B1',
    null,
    null,
    null,
    'Immer mehr Anleger stellen sich die Frage, ob Rüstungsinvestitionen mit nachhaltigen Anlagestrategien vereinbar sind.',
    null,
    null,
    null
  ),
  (
    'verzehnfachen',
    'verb',
    'multiplicar por diez',
    'Die Aktie von Rheinmetall, dem größten deutschen Rüstungskonzern, hat sich seit 2022 mehr als verzehnfacht.',
    'B1',
    null,
    null,
    'verzehnfachen',
    null,
    null,
    null,
    null
  ),
  (
    'verzeichnen',
    'verb',
    'registrar',
    'Auch europäische Wettbewerber wie Leonardo, BAE Systems und Thales verzeichnen Rekordkurse.',
    'B1',
    null,
    null,
    'verzeichnen',
    null,
    null,
    null,
    null
  ),
  (
    'voraussetzen',
    'verb',
    'requerir / presuponer',
    'Demokratische Institutionen, Rechtsstaatlichkeit und soziale Sicherheit setzen physische Sicherheit voraus.',
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
    'warnen',
    'verb',
    'advertir',
    'Experten warnen jedoch vor übertriebenen Optimismus.',
    'B1',
    null,
    null,
    'warnen',
    'Experten warnen jedoch vor Überoptimismus.',
    null,
    null,
    null
  ),
  (
    'wertvoll',
    'adjective',
    'valioso',
    'SAP ist das wertvollste Unternehmen in Deutschland.',
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
    'wiederkehrend',
    'adjective',
    'recurrente',
    'Das reduziert Einmalzahlungen, schafft aber stabile, wiederkehrende Umsätze.',
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
    'zeigen',
    'verb',
    'mostrar',
    'Er zeigt, wie gut die 40 größten deutschen Unternehmen an der Börse stehen.',
    'A2',
    null,
    null,
    'zeigen',
    null,
    null,
    null,
    null
  ),
  (
    'zulegen',
    'verb',
    'ganar terreno / subir',
    'Kaum eine Branche hat an der Börse in den letzten zwei Jahren so stark zugelegt wie die Rüstungsindustrie.',
    'B1',
    null,
    null,
    'zulegen',
    null,
    null,
    null,
    null
  ),
  (
    'zweideutig',
    'adjective',
    'ambiguo',
    'Geldpolitisch bleibt die Lage zweideutig.',
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
    'zwingend',
    'adjective',
    'necesariamente',
    'Ein steigender Aktienindex spiegelt nicht zwingend den Zustand der Gesamtwirtschaft wider.',
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
    'zyklisch',
    'adjective',
    'cíclico',
    'Diese Transformation war schmerzhaft – sie drückte die Marge zunächst, schuf aber eine Ertragsqualität, die Kapitalmärkte systematisch höher bewerten als zyklische Industriegewinne.',
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
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'der DAX'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'der Aktienindex'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'zeigen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'das Unternehmen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'die Börse'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'steigen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'verdienen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'der Investor'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'die Aktie'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'das Zeichen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'die Wirtschaft'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'der Preis'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'die Lebensmittel'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'die Wohnung'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'A2',
    'der Widerspruch'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'das Allzeithoch'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'klettern'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'der Rekord'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'der Anleger'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'die Lage'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'der Haupttreiber'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'das Quartalsergebnis'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'die Erleichterung'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'der Energiepreis'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'die Aussicht'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'die Zinssenkung'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'beflügeln'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'warnen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'zwingend'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'der Zustand'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'die Binnennachfrage'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B1',
    'mittelständisch'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'knacken'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'die Rally'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'der Unternehmensgewinn'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'die Entspannung'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'die Konstellation'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'anpeilen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'der Titel'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'das Paradox'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'stagnieren'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'die Konjunktur'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'sich erholen'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'der Durchschnitt'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'der Kleinanleger'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'der Einstiegszeitpunkt'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'B2',
    'der Absturz'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'die Entkopplung'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'die Insolvenzzahl'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'rückläufig'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'die volkswirtschaftliche Substanz'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'das Abbild'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'der Standort'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'florieren'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'zweideutig'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'die Anleihe'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'die TINA-Logik'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'die Fundamentaldaten'
  ),
  (
    'der-dax-ist-sehr-hoch-was-bedeutet-das',
    'C1',
    'unreflektiert'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'A2',
    'die Software'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'A2',
    'die Firma'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'A2',
    'wertvoll'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'A2',
    'der Umsatz'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'die Börsenkapitalisierung'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'führend'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'die Transformation'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'das Lizenzgeschäft'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'der Abonnementdienst'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'das Geschäftsjahr'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'der Free Cashflow'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'ehrgeizig'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'der Treiber'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'der Migrationsdruck'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'garantieren'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'planbar'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'mehrheitlich'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B1',
    'die Kaufempfehlung'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'träge'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'agil'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'der Kapitalmarkt'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'honorieren'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'undenkbar'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'die Unternehmensanwendung'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'die Buchhaltung'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'die Einmalzahlung'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'wiederkehrend'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'der Auftragsbestand'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'der Indikator'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'erzwungen'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'das Legacy-System'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'B2',
    'bestehen'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Anomalie'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Wirtschaftslandschaft'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Kernbranche'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Wertschöpfung'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'ihresgleichen suchen'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Kehrtwende'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Abkehr'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Marge'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'die Ertragsqualität'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'zyklisch'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'der Garant'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'hervorbringen'
  ),
  (
    'sap-das-wertvollste-unternehmen-in-deutschland',
    'C1',
    'der Glücksfall'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'A2',
    'die künstliche Intelligenz'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'A2',
    'das Produkt'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'A2',
    'an die Börse gehen'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'A2',
    'investieren'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'A2',
    'der Trend'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'der Entwickler'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'der Börsengang'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'der IPO'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'bewerten'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'gründen'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'positionieren'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'sicherheitsorientiert'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'der Großinvestor'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'das Ereignis'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'gefragt'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'frühzeitig'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B1',
    'beobachten'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'das Marktumfeld'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'beispiellos'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'der Multiplikator'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'die Bewertung'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'das Kurs-Umsatz-Verhältnis'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'ambitioniert'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'der Wettbewerber'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'die Positionierung'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'die Glaubwürdigkeit'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'die Regulierungsdiskussion'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'nachhaltig'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'B2',
    'der Börsenprospekt'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'der Stresstest'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'die Bewertungslogik'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'das Niedrigzinsumfeld'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'rechtfertigen'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'das Differenzierungsmerkmal'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'die Regulierungsbehörde'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'der Wettbewerbsvorteil'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'die Kapitalintensität'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'die Abhängigkeit'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'die Massenware'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'das Aufwärtspotenzial'
  ),
  (
    'anthropic-ein-ki-unternehmen-geht-an-die-boerse',
    'C1',
    'der Präzedenzfall'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'das Rüstungsunternehmen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'die Waffe'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'das Militär'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'der Krieg'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'der Auftrag'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'problematisch'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'notwendig'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'A2',
    'die Sicherheit'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'die Branche'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'zulegen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'die Rüstungsindustrie'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'verzehnfachen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'verzeichnen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'der Rekordkurs'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'die Verteidigungsausgaben'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'das Sondervermögen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'anstreben'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'aufwerfen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'nachhaltig'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'die Anlagestrategie'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'vereinbar'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B1',
    'ausschließen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'strukturell unterlegt'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'der Munitionshersteller'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'ein Vielfaches'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'die Planbarkeit'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'der Paradigmenwechsel'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'der Militärhaushalt'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'die Auftragssicherheit'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'die Kehrseite'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'das Dilemma'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'der Erhalt'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'einstufen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'B2',
    'die Neubewertung'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Nachhaltigkeitsfinanzierung'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Zerreißprobe'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Zerstörung'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'schlicht'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'der Rüstungsbefürworter'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Verteidigungsfähigkeit'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Rechtsstaatlichkeit'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'voraussetzen'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'lückenlos'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'abstrahieren'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'ausstatten'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'schwerlich'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'der Abnehmerstaat'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Erkenntnis'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Sphäre'
  ),
  (
    'ruestungsaktien-steigen-warum',
    'C1',
    'die Weltsicht'
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

