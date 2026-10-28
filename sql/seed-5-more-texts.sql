-- imKontext: 5 additional multilingual news texts seed
-- Generated 2026-10-27
-- German base content + ES/EN/FI/IT/PT localizations
-- Levels: A2, B1, B2
-- Includes bridge table inserts for VokabelLab and DerDieDas

BEGIN;

-- ════════════════════════════════════════════════════════════════
-- TEXT 11: Rekordexporte stärken deutsche Wirtschaft
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

  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Rekordexporte stärken deutsche Wirtschaft',
    'rekordexporte-staerken-deutsche-wirtschaft',
    'Wirtschaft und Handel',
    'economia',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET slug = EXCLUDED.slug
  RETURNING id INTO v_text_id;

  -- A2
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'Deutschland hat dieses Jahr so viele Produkte ins Ausland verkauft wie noch nie. Die Exporte sind sehr hoch. Besonders Autos und Maschinen kaufen andere Länder gern. China und die USA sind die größten Kunden. Viele Fabriken in Deutschland haben viel Arbeit. Die Arbeiter sind zufrieden, weil sie gute Löhne bekommen. Aber es gibt auch Probleme. Die Energie ist teuer. Gas und Strom kosten viel Geld. Kleine Firmen haben es schwer, weil sie die hohen Kosten nicht bezahlen können. Die Regierung will helfen. Sie plant neue Gesetze für billigere Energie. Experten sagen, die Exporte bleiben auch nächstes Jahr stark. Das ist gut für die Wirtschaft und die Menschen in Deutschland.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN
    SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2';
  END IF;

  -- B1
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Die deutsche Exportwirtschaft hat im dritten Quartal dieses Jahres einen neuen Rekord aufgestellt. Laut dem Statistischen Bundesamt wurden Waren im Wert von 420 Milliarden Euro ins Ausland geliefert. Das entspricht einem Anstieg von acht Prozent im Vergleich zum Vorjahreszeitraum. Die wichtigsten Exportgüter waren Kraftfahrzeuge, Maschinen und chemische Erzeugnisse.

Besonders die Nachfrage aus China und den Vereinigten Staaten hat zum Wachstum beigetragen. Gleichzeitig konnten auch die Handelsbeziehungen mit Indien und den Golfstaaten ausgebaut werden. Die Industrie profitiert von einer stabilen globalen Konjunktur und einem schwächeren Euro, der deutsche Produkte im Ausland günstiger macht.

Allerdings sehen Ökonomen auch Risiken. Die hohen Energiekosten belasten vor allem mittelständische Unternehmen. Außerdem könnten neue Handelsbarrieren den positiven Trend gefährden. Die Bundesregierung hat deshalb ein Förderprogramm angekündigt, das kleinen und mittleren Unternehmen bei der Bewältigung steigender Produktionskosten helfen soll.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN
    SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1';
  END IF;

  -- B2
  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Die deutsche Exportwirtschaft hat im dritten Quartal 2026 ein historisches Hoch erreicht und damit die Erwartungen der Wirtschaftsforschungsinstitute deutlich übertroffen. Nach Angaben des Statistischen Bundesamts wurden Güter im Gesamtwert von 420 Milliarden Euro exportiert, was einem Zuwachs von acht Prozent gegenüber dem Vorjahreszeitraum entspricht. Automobilhersteller, Maschinenbauer und die chemische Industrie trugen maßgeblich zu diesem Ergebnis bei.

Insbesondere die wachsende Nachfrage aus dem asiatisch-pazifischen Raum sowie aus Nordamerika hat den Aufschwung befeuert. Der Außenhandelsverband BGA verweist zudem auf die strategische Erschließung neuer Absatzmärkte in Indien, den Vereinigten Arabischen Emiraten und Brasilien. Ein wesentlicher Faktor war darüber hinaus die Abwertung des Euro gegenüber dem US-Dollar, wodurch deutsche Erzeugnisse auf dem Weltmarkt preislich wettbewerbsfähiger wurden.

Dennoch mahnen Wirtschaftswissenschaftler zur Vorsicht. Die persistierend hohen Energiekosten stellen insbesondere für den Mittelstand eine erhebliche Belastung dar. Hinzu kommt die Gefahr protektionistischer Tendenzen: Sowohl die USA als auch China haben in jüngster Zeit verschärfte Zollregelungen in Aussicht gestellt, die den freien Warenverkehr empfindlich beeinträchtigen könnten. Das Bundesministerium für Wirtschaft hat als Reaktion ein umfassendes Förderprogramm vorgestellt, das kleinen und mittleren Unternehmen Zugang zu vergünstigten Energieverträgen und Investitionszuschüssen ermöglichen soll.

Analysten prognostizieren, dass die Exporte trotz der genannten Unwägbarkeiten auf hohem Niveau verbleiben werden, sofern geopolitische Eskalationen ausbleiben und die globale Konjunktur stabil bleibt.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN
    SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2';
  END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published)
  VALUES
    (v_text_id, 'es', 'Exportaciones récord fortalecen la economía alemana', 'exportaciones-record-economia-alemana', true),
    (v_text_id, 'en', 'Record Exports Strengthen German Economy', 'record-exports-strengthen-german-economy', true),
    (v_text_id, 'fi', 'Ennätysviennit vahvistavat Saksan taloutta', 'ennatysviennit-vahvistavat-saksan-taloutta', true),
    (v_text_id, 'it', 'Esportazioni record rafforzano l''economia tedesca', 'esportazioni-record-economia-tedesca', true),
    (v_text_id, 'pt', 'Exportações recorde fortalecem a economia alemã', 'exportacoes-recorde-economia-alema', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations A2
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES
    (v_version_a2_id, 'es', 'Alemania ha vendido este año más productos al extranjero que nunca. Las exportaciones son muy altas. Otros países compran sobre todo coches y máquinas. China y Estados Unidos son los mayores clientes. Muchas fábricas en Alemania tienen mucho trabajo. Los trabajadores están contentos porque reciben buenos salarios. Pero también hay problemas. La energía es cara. El gas y la electricidad cuestan mucho dinero. Las empresas pequeñas lo tienen difícil porque no pueden pagar los altos costes. El gobierno quiere ayudar. Planea nuevas leyes para energía más barata. Los expertos dicen que las exportaciones seguirán siendo fuertes el próximo año. Eso es bueno para la economía y la gente en Alemania.', true),
    (v_version_a2_id, 'en', 'Germany has sold more products abroad this year than ever before. Exports are very high. Other countries especially like to buy cars and machines. China and the USA are the biggest customers. Many factories in Germany have a lot of work. The workers are happy because they get good wages. But there are also problems. Energy is expensive. Gas and electricity cost a lot of money. Small companies find it hard because they cannot pay the high costs. The government wants to help. It is planning new laws for cheaper energy. Experts say exports will remain strong next year too. That is good for the economy and the people in Germany.', true),
    (v_version_a2_id, 'fi', 'Saksa on myynyt tänä vuonna enemmän tuotteita ulkomaille kuin koskaan ennen. Vienti on erittäin korkealla. Muut maat ostavat erityisesti autoja ja koneita. Kiina ja Yhdysvallat ovat suurimmat asiakkaat. Monilla tehtailla Saksassa on paljon työtä. Työntekijät ovat tyytyväisiä, koska he saavat hyviä palkkoja. Mutta ongelmiakin on. Energia on kallista. Kaasu ja sähkö maksavat paljon rahaa. Pienillä yrityksillä on vaikeaa, koska ne eivät pysty maksamaan korkeita kustannuksia. Hallitus haluaa auttaa. Se suunnittelee uusia lakeja halvemmasta energiasta. Asiantuntijat sanovat, että vienti pysyy vahvana myös ensi vuonna. Se on hyvä taloudelle ja ihmisille Saksassa.', true),
    (v_version_a2_id, 'it', 'La Germania ha venduto quest''anno più prodotti all''estero che mai. Le esportazioni sono molto alte. Altri paesi comprano soprattutto automobili e macchinari. La Cina e gli Stati Uniti sono i maggiori clienti. Molte fabbriche in Germania hanno molto lavoro. I lavoratori sono contenti perché ricevono buoni salari. Ma ci sono anche problemi. L''energia è cara. Il gas e l''elettricità costano molto. Le piccole imprese faticano perché non possono pagare i costi elevati. Il governo vuole aiutare. Sta pianificando nuove leggi per l''energia più economica. Gli esperti dicono che le esportazioni rimarranno forti anche il prossimo anno. Questo è positivo per l''economia e per le persone in Germania.', true),
    (v_version_a2_id, 'pt', 'A Alemanha vendeu este ano mais produtos ao estrangeiro do que nunca. As exportações estão muito altas. Outros países compram sobretudo carros e máquinas. A China e os Estados Unidos são os maiores clientes. Muitas fábricas na Alemanha têm muito trabalho. Os trabalhadores estão satisfeitos porque recebem bons salários. Mas também há problemas. A energia é cara. O gás e a eletricidade custam muito dinheiro. As pequenas empresas têm dificuldades porque não conseguem pagar os custos elevados. O governo quer ajudar. Planeia novas leis para energia mais barata. Os especialistas dizem que as exportações se manterão fortes no próximo ano. Isso é bom para a economia e para as pessoas na Alemanha.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Version localizations B1
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES
    (v_version_b1_id, 'es', 'La economía exportadora alemana ha establecido un nuevo récord en el tercer trimestre de este año. Según la Oficina Federal de Estadística, se entregaron mercancías por valor de 420 mil millones de euros al extranjero. Esto corresponde a un aumento del ocho por ciento en comparación con el mismo periodo del año anterior. Los principales bienes de exportación fueron vehículos, maquinaria y productos químicos.

La demanda de China y Estados Unidos contribuyó especialmente al crecimiento. Al mismo tiempo, se ampliaron las relaciones comerciales con India y los estados del Golfo. La industria se beneficia de una coyuntura global estable y de un euro más débil, que abarata los productos alemanes en el extranjero.

Sin embargo, los economistas también ven riesgos. Los altos costes energéticos afectan sobre todo a las empresas medianas. Además, nuevas barreras comerciales podrían poner en peligro la tendencia positiva. El gobierno federal ha anunciado un programa de apoyo para ayudar a las pequeñas y medianas empresas a afrontar el aumento de los costes de producción.', true),
    (v_version_b1_id, 'en', 'The German export economy set a new record in the third quarter of this year. According to the Federal Statistical Office, goods worth 420 billion euros were delivered abroad. This represents an increase of eight percent compared to the same period last year. The most important export goods were motor vehicles, machinery and chemical products.

Demand from China and the United States contributed particularly to the growth. At the same time, trade relations with India and the Gulf states were expanded. Industry is benefiting from a stable global economy and a weaker euro, which makes German products cheaper abroad.

However, economists also see risks. High energy costs are putting particular pressure on medium-sized companies. Furthermore, new trade barriers could jeopardize the positive trend. The federal government has therefore announced a support programme to help small and medium-sized enterprises cope with rising production costs.', true),
    (v_version_b1_id, 'fi', 'Saksan vientitalous saavutti uuden ennätyksen tämän vuoden kolmannella neljänneksellä. Liittovaltion tilastokeskuksen mukaan ulkomaille toimitettiin tavaroita 420 miljardin euron arvosta. Tämä vastaa kahdeksan prosentin kasvua edellisvuoden vastaavaan ajanjaksoon verrattuna. Tärkeimmät vientituotteet olivat moottoriajoneuvot, koneet ja kemianteollisuuden tuotteet.

Erityisesti Kiinan ja Yhdysvaltain kysyntä edisti kasvua. Samalla kauppasuhteita Intian ja Persianlahden valtioiden kanssa laajennettiin. Teollisuus hyötyy vakaasta maailmantaloudesta ja heikommasta eurosta, joka tekee saksalaisista tuotteista edullisempia ulkomailla.

Ekonomistit näkevät kuitenkin myös riskejä. Korkeat energiakustannukset rasittavat erityisesti keskisuuria yrityksiä. Lisäksi uudet kaupan esteet voisivat vaarantaa myönteisen kehityksen. Liittohallitus on siksi ilmoittanut tukiohjelmasta, joka auttaa pieniä ja keskisuuria yrityksiä selviytymään nousevista tuotantokustannuksista.', true),
    (v_version_b1_id, 'it', 'L''economia delle esportazioni tedesca ha stabilito un nuovo record nel terzo trimestre di quest''anno. Secondo l''Ufficio Federale di Statistica, merci per un valore di 420 miliardi di euro sono state consegnate all''estero. Ciò corrisponde a un aumento dell''otto per cento rispetto allo stesso periodo dell''anno precedente. I principali beni esportati erano autoveicoli, macchinari e prodotti chimici.

In particolare, la domanda da Cina e Stati Uniti ha contribuito alla crescita. Allo stesso tempo, sono state ampliate le relazioni commerciali con l''India e gli stati del Golfo. L''industria beneficia di una congiuntura globale stabile e di un euro più debole, che rende i prodotti tedeschi più convenienti all''estero.

Tuttavia, gli economisti vedono anche dei rischi. Gli alti costi energetici gravano soprattutto sulle medie imprese. Inoltre, nuove barriere commerciali potrebbero mettere a rischio la tendenza positiva. Il governo federale ha quindi annunciato un programma di sostegno per aiutare le piccole e medie imprese ad affrontare l''aumento dei costi di produzione.', true),
    (v_version_b1_id, 'pt', 'A economia de exportação alemã estabeleceu um novo recorde no terceiro trimestre deste ano. De acordo com o Instituto Federal de Estatística, foram entregues mercadorias no valor de 420 mil milhões de euros ao estrangeiro. Isto corresponde a um aumento de oito por cento em relação ao mesmo período do ano anterior. Os principais bens de exportação foram veículos automóveis, máquinas e produtos químicos.

A procura da China e dos Estados Unidos contribuiu particularmente para o crescimento. Ao mesmo tempo, as relações comerciais com a Índia e os estados do Golfo foram alargadas. A indústria beneficia de uma conjuntura global estável e de um euro mais fraco, que torna os produtos alemães mais baratos no estrangeiro.

Contudo, os economistas também veem riscos. Os elevados custos energéticos afetam sobretudo as médias empresas. Além disso, novas barreiras comerciais poderiam pôr em causa a tendência positiva. O governo federal anunciou por isso um programa de apoio para ajudar as pequenas e médias empresas a lidar com o aumento dos custos de produção.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Version localizations B2
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published)
  VALUES
    (v_version_b2_id, 'es', 'La economía exportadora alemana alcanzó un máximo histórico en el tercer trimestre de 2026, superando con creces las expectativas de los institutos de investigación económica. Según datos de la Oficina Federal de Estadística, se exportaron bienes por un valor total de 420 mil millones de euros, lo que supone un incremento del ocho por ciento respecto al mismo periodo del año anterior. Los fabricantes de automóviles, la industria de la maquinaria y la industria química contribuyeron decisivamente a este resultado.

En particular, la creciente demanda de la región Asia-Pacífico y de Norteamérica impulsó el auge. La asociación de comercio exterior BGA señala además la apertura estratégica de nuevos mercados en India, los Emiratos Árabes Unidos y Brasil. Un factor esencial fue la devaluación del euro frente al dólar estadounidense, que hizo que los productos alemanes fuesen más competitivos en precio en el mercado mundial.

No obstante, los economistas piden cautela. Los costes energéticos persistentemente altos representan una carga considerable especialmente para las pymes. A ello se suma el peligro de tendencias proteccionistas: tanto Estados Unidos como China han anunciado recientemente regulaciones arancelarias más estrictas que podrían afectar gravemente al libre comercio de mercancías. El Ministerio Federal de Economía presentó como respuesta un programa integral de apoyo que pretende facilitar a las pymes el acceso a contratos energéticos ventajosos y subvenciones a la inversión.

Los analistas pronostican que las exportaciones se mantendrán a un nivel elevado a pesar de las incertidumbres mencionadas, siempre que no se produzcan escaladas geopolíticas y la coyuntura global se mantenga estable.', true),
    (v_version_b2_id, 'en', 'The German export economy reached a historic high in the third quarter of 2026, significantly exceeding the expectations of economic research institutes. According to the Federal Statistical Office, goods totalling 420 billion euros were exported, representing an increase of eight percent over the same period last year. Automobile manufacturers, mechanical engineers and the chemical industry contributed significantly to this result.

In particular, growing demand from the Asia-Pacific region and North America fueled the upturn. The foreign trade association BGA also points to the strategic development of new sales markets in India, the United Arab Emirates and Brazil. A key factor was the depreciation of the euro against the US dollar, making German products more price-competitive on the world market.

Nevertheless, economists urge caution. Persistently high energy costs represent a considerable burden, particularly for medium-sized enterprises. Added to this is the threat of protectionist tendencies: both the USA and China have recently indicated tightened tariff regulations that could significantly impair the free movement of goods. The Federal Ministry for Economic Affairs responded by presenting a comprehensive support programme designed to give small and medium-sized enterprises access to discounted energy contracts and investment subsidies.

Analysts forecast that exports will remain at a high level despite the aforementioned uncertainties, provided geopolitical escalations do not occur and the global economy remains stable.', true),
    (v_version_b2_id, 'fi', 'Saksan vientitalous saavutti historiallisen huippunsa vuoden 2026 kolmannella neljänneksellä ylittäen selvästi taloustutkimuslaitosten odotukset. Liittovaltion tilastokeskuksen mukaan tavaroita vietiin yhteensä 420 miljardin euron arvosta, mikä merkitsee kahdeksan prosentin kasvua edellisvuoden vastaavaan ajanjaksoon verrattuna. Autonvalmistajat, koneenrakentajat ja kemianteollisuus myötävaikuttivat merkittävästi tähän tulokseen.

Erityisesti Aasian ja Tyynenmeren alueen sekä Pohjois-Amerikan kasvava kysyntä ruokki nousua. Ulkomaankaupan liitto BGA viittaa myös uusien markkinoiden strategiseen avaamiseen Intiassa, Arabiemiirikunnissa ja Brasiliassa. Olennainen tekijä oli euron heikkeneminen Yhdysvaltain dollaria vastaan, mikä teki saksalaisista tuotteista hintakilpailukykyisempiä maailmanmarkkinoilla.

Ekonomistit kehottavat silti varovaisuuteen. Jatkuvasti korkeat energiakustannukset ovat erityisesti keskisuurille yrityksille huomattava rasite. Lisäksi uhkana ovat protektionistiset taipumukset: sekä Yhdysvallat että Kiina ovat äskettäin ilmoittaneet tiukennetuista tullisäännöksistä, jotka voisivat haitata merkittävästi tavaroiden vapaata liikkuvuutta. Liittovaltion talousministeriö esitteli vastauksena kattavan tukiohjelman, jonka tarkoituksena on tarjota pienille ja keskisuurille yrityksille pääsy edullisiin energiasopimuksiin ja investointitukiin.

Analyytikot ennustavat, että vienti pysyy korkealla tasolla mainituista epävarmuustekijöistä huolimatta, mikäli geopoliittisia kärjistymisiä ei tapahdu ja maailmantalous pysyy vakaana.', true),
    (v_version_b2_id, 'it', 'L''economia delle esportazioni tedesca ha raggiunto un massimo storico nel terzo trimestre del 2026, superando nettamente le aspettative degli istituti di ricerca economica. Secondo l''Ufficio Federale di Statistica, sono stati esportati beni per un valore complessivo di 420 miliardi di euro, con un incremento dell''otto per cento rispetto allo stesso periodo dell''anno precedente. Costruttori di automobili, industria meccanica e industria chimica hanno contribuito in modo determinante a questo risultato.

In particolare, la crescente domanda dall''area Asia-Pacifico e dal Nord America ha alimentato la ripresa. L''associazione del commercio estero BGA sottolinea inoltre l''apertura strategica di nuovi mercati in India, negli Emirati Arabi Uniti e in Brasile. Un fattore chiave è stato il deprezzamento dell''euro rispetto al dollaro statunitense, che ha reso i prodotti tedeschi più competitivi in termini di prezzo sul mercato mondiale.

Ciononostante, gli economisti invitano alla cautela. I costi energetici persistentemente elevati rappresentano un onere considerevole soprattutto per le medie imprese. A ciò si aggiunge la minaccia di tendenze protezionistiche: sia gli USA che la Cina hanno recentemente annunciato regolamentazioni tariffarie più rigide che potrebbero compromettere significativamente la libera circolazione delle merci. Il Ministero Federale dell''Economia ha presentato in risposta un programma di sostegno completo volto a garantire alle piccole e medie imprese l''accesso a contratti energetici agevolati e a sovvenzioni per gli investimenti.

Gli analisti prevedono che le esportazioni rimarranno a un livello elevato nonostante le incertezze menzionate, a condizione che non si verifichino escalation geopolitiche e che la congiuntura globale resti stabile.', true),
    (v_version_b2_id, 'pt', 'A economia de exportação alemã atingiu um máximo histórico no terceiro trimestre de 2026, superando significativamente as expectativas dos institutos de investigação económica. Segundo o Instituto Federal de Estatística, foram exportados bens no valor total de 420 mil milhões de euros, o que representa um aumento de oito por cento em relação ao mesmo período do ano anterior. Fabricantes de automóveis, construtores de máquinas e a indústria química contribuíram decisivamente para este resultado.

Em particular, a crescente procura da região Ásia-Pacífico e da América do Norte impulsionou a recuperação. A associação de comércio externo BGA refere ainda a abertura estratégica de novos mercados na Índia, nos Emirados Árabes Unidos e no Brasil. Um fator essencial foi a desvalorização do euro face ao dólar americano, tornando os produtos alemães mais competitivos em preço no mercado mundial.

Contudo, os economistas apelam à prudência. Os custos energéticos persistentemente elevados representam um encargo considerável sobretudo para as médias empresas. Soma-se o perigo de tendências protecionistas: tanto os EUA como a China anunciaram recentemente regulamentações tarifárias mais rigorosas que poderiam afetar gravemente a livre circulação de mercadorias. O Ministério Federal da Economia apresentou em resposta um programa abrangente de apoio destinado a facilitar o acesso das PME a contratos energéticos vantajosos e subsídios ao investimento.

Os analistas preveem que as exportações se manterão a um nível elevado apesar das incertezas referidas, desde que não ocorram escaladas geopolíticas e a conjuntura global permaneça estável.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- ─── Vocabulary (30 words) ───

  -- 1. der Export
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Export', 'export', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la exportación', 'la exportación', 'Die Exporte sind dieses Jahr sehr hoch.', 'Las exportaciones son muy altas este año.', 'export', 'vienti')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la exportación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'export') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'vienti') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''esportazione') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a exportação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  -- VokabelLab bridge
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  -- DerDieDas bridge (noun)
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la exportación", "level": "b1", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 2. die Wirtschaft
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Wirtschaft', 'wirtschaft', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la economía', 'la economía', 'Die Wirtschaft wächst dieses Jahr stark.', 'La economía crece mucho este año.', 'economy', 'talous')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la economía'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'economy') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'talous') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''economia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a economia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la economía", "level": "a2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 3. die Fabrik
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Fabrik', 'fabrik', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la fábrica', 'la fábrica', 'Viele Fabriken haben viel Arbeit.', 'Muchas fábricas tienen mucho trabajo.', 'factory', 'tehdas')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la fábrica'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'factory') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tehdas') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la fabbrica') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a fábrica') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la fábrica", "level": "a2", "category": "work"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 4. der Lohn
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Lohn', 'lohn', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el salario', 'el salario', 'Die Arbeiter bekommen gute Löhne.', 'Los trabajadores reciben buenos salarios.', 'wage', 'palkka')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el salario'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'wage') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'palkka') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il salario') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o salário') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el salario", "level": "a2", "category": "work"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 5. die Energie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Energie', 'energie', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la energía', 'la energía', 'Die Energie ist teuer in Deutschland.', 'La energía es cara en Alemania.', 'energy', 'energia')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la energía'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'energy') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'energia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''energia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a energia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la energía", "level": "a2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 6. die Maschine
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Maschine', 'maschine', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la máquina', 'la máquina', 'Deutschland exportiert viele Maschinen.', 'Alemania exporta muchas máquinas.', 'machine', 'kone')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la máquina'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'machine') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kone') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la macchina') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a máquina') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la máquina", "level": "a2", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 7. das Gesetz
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Gesetz', 'gesetz', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la ley', 'la ley', 'Die Regierung plant neue Gesetze.', 'El gobierno planea nuevas leyes.', 'law', 'laki')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la ley'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'law') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'laki') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la legge') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a lei') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la ley", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 8. der Handel
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Handel', 'handel', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el comercio', 'el comercio', 'Der Handel mit China wächst.', 'El comercio con China crece.', 'trade', 'kauppa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el comercio'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'trade') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kauppa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il commercio') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o comércio') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el comercio", "level": "b1", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 9. der Rekord
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Rekord', 'rekord', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el récord', 'el récord', 'Die Exporte haben einen neuen Rekord erreicht.', 'Las exportaciones han alcanzado un nuevo récord.', 'record', 'ennätys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el récord'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'record') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'ennätys') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il record') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o recorde') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el récord", "level": "b1", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 10. der Anstieg
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Anstieg', 'anstieg', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el aumento', 'el aumento', 'Der Anstieg beträgt acht Prozent.', 'El aumento es del ocho por ciento.', 'increase', 'nousu')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el aumento'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'increase') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'nousu') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''aumento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o aumento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el aumento", "level": "b1", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 11. die Konjunktur
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Konjunktur', 'konjunktur', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la coyuntura económica', 'la coyuntura económica', 'Die globale Konjunktur ist stabil.', 'La coyuntura económica global es estable.', 'economic situation', 'suhdanne')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la coyuntura económica'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'economic situation') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'suhdanne') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la congiuntura') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a conjuntura') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la coyuntura", "level": "b2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 12. der Zoll
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Zoll', 'zoll', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el arancel', 'el arancel', 'Neue Zölle könnten den Handel behindern.', 'Nuevos aranceles podrían obstaculizar el comercio.', 'tariff', 'tulli')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el arancel'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'tariff') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tulli') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il dazio') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a tarifa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el arancel", "level": "b2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 13. die Ware
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Ware', 'ware', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la mercancía', 'la mercancía', 'Deutschland liefert Waren in viele Länder.', 'Alemania entrega mercancías a muchos países.', 'goods', 'tavara')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la mercancía'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'goods') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tavara') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la merce') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a mercadoria') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la mercancía", "level": "b1", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 14. das Unternehmen
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('das Unternehmen', 'unternehmen', 'das', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la empresa', 'la empresa', 'Kleine Unternehmen haben es schwer.', 'Las pequeñas empresas lo tienen difícil.', 'company', 'yritys')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la empresa'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'company') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'yritys') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''azienda') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a empresa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la empresa", "level": "a2", "category": "work"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 15. wachsen (verb - no DerDieDas)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('wachsen', 'wachsen', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'crecer', 'crecer', 'Die Nachfrage wächst schnell.', 'La demanda crece rápido.', 'to grow', 'kasvaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'crecer'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to grow') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kasvaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'crescere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'crescer') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 16. liefern (verb)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('liefern', 'liefern', NULL, 'Verb')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'suministrar', 'suministrar', 'Deutschland liefert Waren in die ganze Welt.', 'Alemania suministra mercancías a todo el mundo.', 'to deliver', 'toimittaa')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'suministrar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to deliver') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'toimittaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'fornire') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'fornecer') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 17. der Wert
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Wert', 'wert', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el valor', 'el valor', 'Waren im Wert von 420 Milliarden Euro.', 'Mercancías por valor de 420 mil millones de euros.', 'value', 'arvo')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el valor'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'value') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'arvo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il valore') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o valor') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el valor", "level": "b1", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 18. der Absatzmarkt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('der Absatzmarkt', 'absatzmarkt', 'der', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'el mercado de venta', 'el mercado de venta', 'Indien ist ein neuer Absatzmarkt.', 'India es un nuevo mercado de venta.', 'sales market', 'myyntimarkkina')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el mercado de venta'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'sales market') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'myyntimarkkina') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il mercato di vendita') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o mercado de vendas') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el mercado", "level": "b2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 19. die Nachfrage
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Nachfrage', 'nachfrage', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la demanda', 'la demanda', 'Die Nachfrage aus China steigt.', 'La demanda de China aumenta.', 'demand', 'kysyntä')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la demanda'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'demand') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'kysyntä') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'la domanda') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a procura') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la demanda", "level": "b1", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 20. die Investition
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type)
  VALUES ('die Investition', 'investition', 'die', 'Nomen')
  ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german
  RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi)
  VALUES (v_lemma_id, 'la inversión', 'la inversión', 'Die Investitionen in die Infrastruktur steigen.', 'Las inversiones en infraestructura aumentan.', 'investment', 'investointi')
  ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi
  RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la inversión'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'investment') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'investointi') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''investimento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o investimento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la inversión", "level": "b1", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 21-30: additional verbs and adjectives
  -- 21. exportieren
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('exportieren', 'exportieren', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'exportar', 'exportar', 'Deutschland exportiert Autos in die ganze Welt.', 'Alemania exporta coches a todo el mundo.', 'to export', 'viedä') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'exportar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to export') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'viedä') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'esportare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'exportar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 22. belasten
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('belasten', 'belasten', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'gravar', 'gravar', 'Hohe Kosten belasten die Firmen.', 'Los altos costes gravan a las empresas.', 'to burden', 'rasittaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'gravar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to burden') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'rasittaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'gravare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'sobrecarregar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 23. gefährden
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('gefährden', 'gefährden', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'poner en peligro', 'poner en peligro', 'Handelsbarrieren gefährden den Aufschwung.', 'Las barreras comerciales ponen en peligro la recuperación.', 'to endanger', 'vaarantaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'poner en peligro'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to endanger') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'vaarantaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'mettere in pericolo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'pôr em perigo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 24. die Förderung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Förderung', 'förderung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el fomento', 'el fomento', 'Es gibt ein neues Förderprogramm.', 'Hay un nuevo programa de fomento.', 'promotion/subsidy', 'tuki') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el fomento'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'promotion/subsidy') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'tuki') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il sostegno') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o fomento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el fomento", "level": "b2", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 25. günstig (adj)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('günstig', 'günstig', NULL, 'Adjektiv') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'favorable', 'favorable', 'Der schwache Euro macht Produkte günstiger.', 'El euro débil hace los productos más favorables.', 'favorable/cheap', 'edullinen') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'favorable'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'favorable/cheap') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'edullinen') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'conveniente') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'favorável') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 26. die Regierung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Regierung', 'regierung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el gobierno', 'el gobierno', 'Die Regierung will die Wirtschaft stärken.', 'El gobierno quiere fortalecer la economía.', 'government', 'hallitus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el gobierno'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'government') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'hallitus') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il governo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o governo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el gobierno", "level": "a2", "category": "politics"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 27. der Kunde
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Kunde', 'kunde', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el cliente', 'el cliente', 'China ist ein wichtiger Kunde.', 'China es un cliente importante.', 'customer', 'asiakas') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el cliente'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'customer') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'asiakas') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il cliente') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o cliente') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el cliente", "level": "a2", "category": "work"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 28. stärken (verb)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('stärken', 'stärken', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'fortalecer', 'fortalecer', 'Die Exporte stärken die Wirtschaft.', 'Las exportaciones fortalecen la economía.', 'to strengthen', 'vahvistaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'fortalecer'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to strengthen') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'vahvistaa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'rafforzare') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'fortalecer') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  -- 29. die Industrie
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Industrie', 'industrie', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la industria', 'la industria', 'Die Industrie profitiert vom Exportboom.', 'La industria se beneficia del auge exportador.', 'industry', 'teollisuus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la industria'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'industry') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'teollisuus') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''industria') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'a indústria') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la industria", "level": "b1", "category": "economy"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 30. die Belastung
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Belastung', 'belastung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la carga', 'la carga', 'Hohe Energiekosten sind eine Belastung.', 'Los altos costes energéticos son una carga.', 'burden', 'rasite') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la carga'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'burden') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'rasite') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''onere') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o encargo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la carga", "level": "b2", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 12: Klimakonferenz in der Mongolei
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

  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES (
    'Klimakonferenz in der Mongolei beschließt neue Ziele',
    'klimakonferenz-mongolei-neue-ziele',
    'Umwelt und Klimaschutz',
    'medio_ambiente',
    'premium',
    NOW()
  )
  ON CONFLICT (slug) DO UPDATE SET slug = EXCLUDED.slug
  RETURNING id INTO v_text_id;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'A2', 'In der Mongolei haben sich viele Länder getroffen. Sie sprechen über das Klima. Das Klima verändert sich, und das ist ein Problem. Es wird wärmer auf der Erde. Das Eis am Nordpol schmilzt. Das Wasser in den Meeren steigt. Viele Tiere verlieren ihre Heimat. Die Länder wollen etwas dagegen tun. Sie wollen weniger CO2 produzieren. CO2 kommt aus Fabriken und Autos. Die Länder haben ein neues Ziel: Bis 2035 soll es 50 Prozent weniger CO2 geben. Das ist nicht einfach. Aber alle Länder müssen zusammenarbeiten. Auch Deutschland hat versprochen, mehr für die Umwelt zu tun. Die Menschen hoffen, dass die Politiker ihre Versprechen halten.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2'; END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B1', 'Die diesjährige UN-Klimakonferenz hat in Ulaanbaatar, der Hauptstadt der Mongolei, stattgefunden. Vertreter aus 195 Ländern haben zwei Wochen lang über neue Klimaziele verhandelt. Im Mittelpunkt stand die Frage, wie die globale Erwärmung auf 1,5 Grad begrenzt werden kann.

Nach intensiven Diskussionen einigten sich die Teilnehmer auf ein verbindliches Abkommen. Bis 2035 sollen die weltweiten CO2-Emissionen um 50 Prozent gegenüber dem Stand von 2020 gesenkt werden. Außerdem wurde ein Klimafonds in Höhe von 200 Milliarden Dollar beschlossen, der Entwicklungsländern beim Umstieg auf erneuerbare Energien helfen soll.

Umweltorganisationen begrüßten die Ergebnisse, forderten aber gleichzeitig eine schnellere Umsetzung. Kritiker bemängelten, dass die Vereinbarungen nicht weit genug gehen und dass es an konkreten Kontrollmechanismen fehlt. Die deutsche Umweltministerin betonte, dass Deutschland seinen Anteil leisten werde und die Investitionen in Windenergie und Solarenergie verdoppeln wolle.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1'; END IF;

  INSERT INTO text_versions (text_id, level, content)
  VALUES (v_text_id, 'B2', 'Die 31. UN-Klimakonferenz, die in diesem Jahr erstmals in Ulaanbaatar stattfand, ist mit einem historischen Abkommen zu Ende gegangen. Nach zweiwöchigen Verhandlungen, die mehrfach vor dem Scheitern standen, einigten sich die Delegierten aus 195 Staaten auf ein verbindliches Regelwerk zur Reduzierung der globalen Treibhausgasemissionen.

Das Kernstück der Vereinbarung sieht vor, dass die weltweiten CO2-Emissionen bis 2035 um mindestens 50 Prozent gegenüber dem Referenzjahr 2020 gesenkt werden müssen. Darüber hinaus verpflichteten sich die Industrienationen zur Einrichtung eines Klimafinanzierungsfonds in Höhe von 200 Milliarden US-Dollar, der Schwellen- und Entwicklungsländern den Übergang zu einer kohlenstoffarmen Wirtschaft erleichtern soll.

Besonders kontrovers diskutiert wurde die Frage der Klimagerechtigkeit. Vertreter des globalen Südens forderten, dass die historisch größten Emittenten eine proportional höhere Verantwortung übernehmen müssten. China und Indien betonten dagegen ihr Recht auf wirtschaftliche Entwicklung und wehrten sich gegen als unverhältnismäßig empfundene Auflagen.

Umweltschutzorganisationen bewerteten das Abkommen als wichtigen, wenn auch unzureichenden Schritt. Greenpeace-Sprecherin Maria Vásquez bezeichnete die Vereinbarung als einen Kompromiss, der zwar Fortschritte bringe, aber hinter dem wissenschaftlich Notwendigen zurückbleibe. Entscheidend werde letztlich sein, ob die Staaten ihre Zusagen auch tatsächlich umsetzen – eine Frage, die angesichts der Erfahrungen mit früheren Klimaabkommen berechtigt erscheint.')
  ON CONFLICT DO NOTHING
  RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2'; END IF;

  -- Text localizations
  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published) VALUES
    (v_text_id, 'es', 'La conferencia climática en Mongolia acuerda nuevos objetivos', 'conferencia-climatica-mongolia', true),
    (v_text_id, 'en', 'Climate Conference in Mongolia Agrees on New Targets', 'climate-conference-mongolia', true),
    (v_text_id, 'fi', 'Ilmastokonferenssi Mongoliassa sopii uusista tavoitteista', 'ilmastokonferenssi-mongoliassa', true),
    (v_text_id, 'it', 'La conferenza sul clima in Mongolia fissa nuovi obiettivi', 'conferenza-clima-mongolia', true),
    (v_text_id, 'pt', 'Conferência climática na Mongólia define novos objetivos', 'conferencia-climatica-mongolia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- Version localizations A2
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_a2_id, 'es', 'En Mongolia se han reunido muchos países. Hablan sobre el clima. El clima está cambiando, y eso es un problema. La Tierra se calienta. El hielo del Polo Norte se derrite. El agua de los mares sube. Muchos animales pierden su hogar. Los países quieren hacer algo. Quieren producir menos CO2. El CO2 viene de las fábricas y los coches. Los países tienen un nuevo objetivo: hasta 2035 debe haber un 50 por ciento menos de CO2. No es fácil. Pero todos los países deben cooperar. Alemania también ha prometido hacer más por el medio ambiente. La gente espera que los políticos cumplan sus promesas.', true),
    (v_version_a2_id, 'en', 'Many countries have met in Mongolia. They are talking about the climate. The climate is changing, and that is a problem. The Earth is getting warmer. The ice at the North Pole is melting. The water in the seas is rising. Many animals are losing their homes. The countries want to do something about it. They want to produce less CO2. CO2 comes from factories and cars. The countries have a new goal: by 2035 there should be 50 percent less CO2. That is not easy. But all countries must work together. Germany has also promised to do more for the environment. People hope that politicians will keep their promises.', true),
    (v_version_a2_id, 'fi', 'Mongoliassa on kokoontunut monia maita. Ne puhuvat ilmastosta. Ilmasto muuttuu, ja se on ongelma. Maapallon lämpötila nousee. Pohjoisnavan jää sulaa. Merien vedenpinta nousee. Monet eläimet menettävät kotinsa. Maat haluavat tehdä jotain asialle. Ne haluavat tuottaa vähemmän hiilidioksidia. Hiilidioksidia tulee tehtaista ja autoista. Mailla on uusi tavoite: vuoteen 2035 mennessä hiilidioksidia pitää olla 50 prosenttia vähemmän. Se ei ole helppoa. Mutta kaikkien maiden on tehtävä yhteistyötä. Myös Saksa on luvannut tehdä enemmän ympäristön hyväksi. Ihmiset toivovat, että poliitikot pitävät lupauksensa.', true),
    (v_version_a2_id, 'it', 'In Mongolia si sono riuniti molti paesi. Parlano del clima. Il clima sta cambiando, e questo è un problema. La Terra si sta riscaldando. Il ghiaccio al Polo Nord si sta sciogliendo. L''acqua dei mari sale. Molti animali perdono la loro casa. I paesi vogliono fare qualcosa. Vogliono produrre meno CO2. La CO2 viene dalle fabbriche e dalle automobili. I paesi hanno un nuovo obiettivo: entro il 2035 ci deve essere il 50 per cento in meno di CO2. Non è facile. Ma tutti i paesi devono collaborare. Anche la Germania ha promesso di fare di più per l''ambiente. La gente spera che i politici mantengano le loro promesse.', true),
    (v_version_a2_id, 'pt', 'Na Mongólia reuniram-se muitos países. Falam sobre o clima. O clima está a mudar, e isso é um problema. A Terra está a aquecer. O gelo no Polo Norte está a derreter. A água dos mares está a subir. Muitos animais perdem o seu lar. Os países querem fazer algo. Querem produzir menos CO2. O CO2 vem das fábricas e dos carros. Os países têm um novo objetivo: até 2035 deve haver 50 por cento menos de CO2. Não é fácil. Mas todos os países têm de cooperar. A Alemanha também prometeu fazer mais pelo ambiente. As pessoas esperam que os políticos cumpram as suas promessas.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Version localizations B1
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b1_id, 'es', 'La conferencia climática de la ONU de este año se ha celebrado en Ulán Bator, la capital de Mongolia. Representantes de 195 países han negociado durante dos semanas sobre nuevos objetivos climáticos. El centro de atención fue la cuestión de cómo limitar el calentamiento global a 1,5 grados.

Tras intensas discusiones, los participantes acordaron un tratado vinculante. Hasta 2035, las emisiones mundiales de CO2 deben reducirse un 50 por ciento respecto al nivel de 2020. Además, se aprobó un fondo climático de 200 mil millones de dólares para ayudar a los países en desarrollo en la transición a energías renovables.

Las organizaciones medioambientales acogieron con satisfacción los resultados, pero al mismo tiempo exigieron una aplicación más rápida. Los críticos señalaron que los acuerdos no van lo suficientemente lejos y que faltan mecanismos de control concretos. La ministra de Medio Ambiente alemana subrayó que Alemania cumplirá su parte y duplicará las inversiones en energía eólica y solar.', true),
    (v_version_b1_id, 'en', 'This year''s UN Climate Conference took place in Ulaanbaatar, the capital of Mongolia. Representatives from 195 countries negotiated for two weeks on new climate targets. The central question was how global warming can be limited to 1.5 degrees.

After intensive discussions, the participants agreed on a binding agreement. By 2035, global CO2 emissions are to be reduced by 50 percent compared to 2020 levels. A climate fund of 200 billion dollars was also approved to help developing countries transition to renewable energy.

Environmental organisations welcomed the results but called for faster implementation. Critics pointed out that the agreements do not go far enough and that concrete monitoring mechanisms are lacking. The German Environment Minister emphasised that Germany would do its part and intended to double investments in wind and solar energy.', true),
    (v_version_b1_id, 'fi', 'Tämän vuoden YK:n ilmastokonferenssi järjestettiin Ulaanbaatarissa, Mongolian pääkaupungissa. 195 maan edustajat neuvottelivat kaksi viikkoa uusista ilmastotavoitteista. Keskiössä oli kysymys siitä, miten maapallon lämpeneminen voidaan rajata 1,5 asteeseen.

Intensiivisten keskustelujen jälkeen osallistujat sopivat sitovasta sopimuksesta. Vuoteen 2035 mennessä maailmanlaajuisia hiilidioksidipäästöjä on vähennettävä 50 prosenttia vuoden 2020 tasosta. Lisäksi hyväksyttiin 200 miljardin dollarin ilmastorahasto, joka auttaa kehitysmaita siirtymään uusiutuviin energialähteisiin.

Ympäristöjärjestöt toivottivat tulokset tervetulleiksi mutta vaativat samalla nopeampaa toimeenpanoa. Kriitikot huomauttivat, että sopimukset eivät mene tarpeeksi pitkälle ja että konkreettisia valvontamekanismeja puuttuu. Saksan ympäristöministeri korosti, että Saksa tekee oman osuutensa ja aikoo kaksinkertaistaa investoinnit tuuli- ja aurinkoenergian.', true),
    (v_version_b1_id, 'it', 'La conferenza sul clima delle Nazioni Unite di quest''anno si è svolta a Ulan Bator, la capitale della Mongolia. Rappresentanti di 195 paesi hanno negoziato per due settimane su nuovi obiettivi climatici. Al centro c''era la questione di come limitare il riscaldamento globale a 1,5 gradi.

Dopo intense discussioni, i partecipanti hanno concordato un accordo vincolante. Entro il 2035, le emissioni globali di CO2 dovranno essere ridotte del 50 per cento rispetto ai livelli del 2020. È stato inoltre approvato un fondo per il clima di 200 miliardi di dollari per aiutare i paesi in via di sviluppo nella transizione verso le energie rinnovabili.

Le organizzazioni ambientaliste hanno accolto con favore i risultati, chiedendo però una più rapida attuazione. I critici hanno sottolineato che gli accordi non sono sufficienti e che mancano meccanismi di controllo concreti. La ministra dell''Ambiente tedesca ha sottolineato che la Germania farà la sua parte e intende raddoppiare gli investimenti nell''energia eolica e solare.', true),
    (v_version_b1_id, 'pt', 'A conferência climática da ONU deste ano realizou-se em Ulaanbaatar, a capital da Mongólia. Representantes de 195 países negociaram durante duas semanas sobre novos objetivos climáticos. A questão central foi como limitar o aquecimento global a 1,5 graus.

Após discussões intensas, os participantes chegaram a um acordo vinculativo. Até 2035, as emissões globais de CO2 devem ser reduzidas em 50 por cento em relação aos níveis de 2020. Foi também aprovado um fundo climático de 200 mil milhões de dólares para ajudar os países em desenvolvimento na transição para energias renováveis.

As organizações ambientais acolheram os resultados, mas exigiram uma implementação mais rápida. Os críticos apontaram que os acordos não vão suficientemente longe e que faltam mecanismos de controlo concretos. A ministra do Ambiente alemã sublinhou que a Alemanha fará a sua parte e pretende duplicar os investimentos em energia eólica e solar.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Version localizations B2 (abbreviated for space)
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b2_id, 'es', 'La 31ª Conferencia Climática de la ONU, que este año se celebró por primera vez en Ulán Bator, ha concluido con un acuerdo histórico. Tras dos semanas de negociaciones que estuvieron varias veces al borde del fracaso, los delegados de 195 estados acordaron un marco normativo vinculante para la reducción de las emisiones globales de gases de efecto invernadero.

El núcleo del acuerdo establece que las emisiones mundiales de CO2 deben reducirse en al menos un 50 por ciento hasta 2035 respecto al año de referencia 2020. Además, las naciones industrializadas se comprometieron a crear un fondo de financiación climática de 200 mil millones de dólares destinado a facilitar a los países emergentes y en desarrollo la transición hacia una economía baja en carbono.

Especialmente controvertida fue la cuestión de la justicia climática. Los representantes del sur global exigieron que los mayores emisores históricos asuman una responsabilidad proporcionalmente mayor. China e India, por su parte, destacaron su derecho al desarrollo económico y se opusieron a exigencias percibidas como desproporcionadas.

Las organizaciones ecologistas valoraron el acuerdo como un paso importante, aunque insuficiente. La portavoz de Greenpeace, Maria Vásquez, calificó el acuerdo como un compromiso que aporta avances pero se queda por debajo de lo científicamente necesario. Lo decisivo será, en última instancia, si los estados cumplen realmente sus compromisos, una cuestión que parece justificada a la luz de las experiencias con acuerdos climáticos anteriores.', true),
    (v_version_b2_id, 'en', 'The 31st UN Climate Conference, held for the first time in Ulaanbaatar this year, concluded with a historic agreement. After two weeks of negotiations that repeatedly came close to collapse, delegates from 195 states agreed on a binding framework for the reduction of global greenhouse gas emissions.

The core of the agreement stipulates that global CO2 emissions must be reduced by at least 50 percent by 2035 relative to the 2020 baseline year. Additionally, industrialised nations committed to establishing a climate financing fund of 200 billion US dollars to help emerging and developing countries transition to a low-carbon economy.

The question of climate justice was particularly contentious. Representatives of the Global South demanded that the historically largest emitters must assume proportionally greater responsibility. China and India, by contrast, emphasised their right to economic development and resisted requirements perceived as disproportionate.

Environmental organisations assessed the agreement as an important but insufficient step. Greenpeace spokesperson Maria Vásquez described it as a compromise that delivers progress but falls short of what is scientifically necessary. Ultimately, the decisive factor will be whether states actually implement their commitments — a question that appears justified given the experience with previous climate agreements.', true),
    (v_version_b2_id, 'fi', 'YK:n 31. ilmastokonferenssi, joka tänä vuonna järjestettiin ensimmäistä kertaa Ulaanbaatarissa, päättyi historialliseen sopimukseen. Kahden viikon neuvottelujen jälkeen, jotka olivat useaan otteeseen kaatumaisillaan, 195 valtion delegaatit sopivat sitovasta sääntelykehyksestä maailmanlaajuisten kasvihuonekaasupäästöjen vähentämiseksi.

Sopimuksen ydin edellyttää, että maailmanlaajuisia hiilidioksidipäästöjä on vähennettävä vähintään 50 prosenttia vuoteen 2035 mennessä vertailuvuodesta 2020. Lisäksi teollisuusmaat sitoutuivat perustamaan 200 miljardin Yhdysvaltain dollarin ilmastorahoitusrahaston, joka helpottaa kehittyvien maiden ja nousevien talouksien siirtymistä vähähiiliseen talouteen.

Erityisen kiistanalainen oli ilmasto-oikeudenmukaisuuden kysymys. Globaalin etelän edustajat vaativat, että historiallisesti suurimpien päästöjen aiheuttajien on kannettava suhteellisesti suurempi vastuu. Kiina ja Intia puolestaan korostivat oikeuttaan taloudelliseen kehitykseen ja vastustivat suhteettomiksi koettuja vaatimuksia.

Ympäristönsuojelujärjestöt arvioivat sopimuksen tärkeäksi, joskin riittämättömäksi askeleeksi. Greenpeacen tiedottaja Maria Vásquez kuvaili sopimusta kompromissiksi, joka tuo edistystä mutta jää tieteellisesti tarpeellisen taakse. Ratkaisevaa on viime kädessä se, toteuttavatko valtiot lupauksensa todella – kysymys, joka vaikuttaa perustellulta aiempien ilmastosopimusten kokemusten valossa.', true),
    (v_version_b2_id, 'it', 'La 31ª Conferenza sul Clima delle Nazioni Unite, tenutasi per la prima volta quest''anno a Ulan Bator, si è conclusa con uno storico accordo. Dopo due settimane di negoziati che hanno rischiato più volte di fallire, i delegati di 195 stati hanno concordato un quadro normativo vincolante per la riduzione delle emissioni globali di gas serra.

Il nucleo dell''accordo prevede che le emissioni globali di CO2 debbano essere ridotte di almeno il 50 per cento entro il 2035 rispetto all''anno di riferimento 2020. Inoltre, le nazioni industrializzate si sono impegnate a istituire un fondo per il finanziamento climatico di 200 miliardi di dollari USA, destinato ad agevolare la transizione dei paesi emergenti e in via di sviluppo verso un''economia a basse emissioni di carbonio.

Particolarmente controversa è stata la questione della giustizia climatica. I rappresentanti del Sud globale hanno chiesto che i maggiori emettitori storici si assumano una responsabilità proporzionalmente maggiore. Cina e India hanno invece sottolineato il loro diritto allo sviluppo economico e si sono opposti a requisiti percepiti come sproporzionati.

Le organizzazioni ambientaliste hanno valutato l''accordo come un passo importante, anche se insufficiente. La portavoce di Greenpeace Maria Vásquez ha descritto l''accordo come un compromesso che porta progressi ma resta al di sotto di ciò che è scientificamente necessario. In definitiva, sarà decisivo se gli stati attueranno effettivamente i loro impegni – una domanda che appare giustificata alla luce delle esperienze con accordi climatici precedenti.', true),
    (v_version_b2_id, 'pt', 'A 31ª Conferência Climática da ONU, realizada pela primeira vez em Ulaanbaatar este ano, terminou com um acordo histórico. Após duas semanas de negociações que estiveram várias vezes à beira do fracasso, os delegados de 195 estados acordaram um quadro regulamentar vinculativo para a redução das emissões globais de gases com efeito de estufa.

O cerne do acordo estipula que as emissões mundiais de CO2 devem ser reduzidas em pelo menos 50 por cento até 2035 em relação ao ano de referência de 2020. Além disso, as nações industrializadas comprometeram-se a criar um fundo de financiamento climático de 200 mil milhões de dólares americanos para facilitar a transição dos países emergentes e em desenvolvimento para uma economia de baixo carbono.

Particularmente controversa foi a questão da justiça climática. Os representantes do Sul Global exigiram que os maiores emissores históricos assumam uma responsabilidade proporcionalmente maior. A China e a Índia, por seu lado, sublinharam o seu direito ao desenvolvimento económico e opuseram-se a exigências consideradas desproporcionadas.

As organizações ambientalistas avaliaram o acordo como um passo importante, embora insuficiente. A porta-voz da Greenpeace, Maria Vásquez, descreveu o acordo como um compromisso que traz progressos mas fica aquém do cientificamente necessário. O decisivo será, em última análise, se os estados cumprem efetivamente os seus compromissos – uma questão que parece justificada face à experiência com acordos climáticos anteriores.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- ─── Vocabulary (30 words) ───

  -- 1. das Klima
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('das Klima', 'klima', 'das', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el clima', 'el clima', 'Das Klima verändert sich schnell.', 'El clima cambia rápidamente.', 'climate', 'ilmasto') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el clima'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'climate') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'ilmasto') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'il clima') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o clima') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el clima", "level": "a2", "category": "nature"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 2. die Umwelt
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Umwelt', 'umwelt', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el medio ambiente', 'el medio ambiente', 'Wir müssen die Umwelt schützen.', 'Debemos proteger el medio ambiente.', 'environment', 'ympäristö') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el medio ambiente'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'environment') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'fi', 'ympäristö') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'it', 'l''ambiente') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'pt', 'o ambiente') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el medio ambiente", "level": "a2", "category": "nature"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- 3-30: remaining climate vocabulary (compact format)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Erwärmung', 'erwärmung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el calentamiento', 'el calentamiento', 'Die globale Erwärmung ist ein großes Problem.', 'El calentamiento global es un gran problema.', 'warming', 'lämpeneminen') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el calentamiento'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'warming'), (v_meaning_id, 'fi', 'lämpeneminen'), (v_meaning_id, 'it', 'il riscaldamento'), (v_meaning_id, 'pt', 'o aquecimento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el calentamiento", "level": "b1", "category": "nature"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('das Abkommen', 'abkommen', 'das', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el acuerdo', 'el acuerdo', 'Die Länder haben ein neues Abkommen beschlossen.', 'Los países han aprobado un nuevo acuerdo.', 'agreement', 'sopimus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el acuerdo'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'agreement'), (v_meaning_id, 'fi', 'sopimus'), (v_meaning_id, 'it', 'l''accordo'), (v_meaning_id, 'pt', 'o acordo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el acuerdo", "level": "b1", "category": "politics"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Emission', 'emission', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la emisión', 'la emisión', 'Die CO2-Emissionen müssen sinken.', 'Las emisiones de CO2 deben bajar.', 'emission', 'päästö') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la emisión'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'emission'), (v_meaning_id, 'fi', 'päästö'), (v_meaning_id, 'it', 'l''emissione'), (v_meaning_id, 'pt', 'a emissão') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la emisión", "level": "b1", "category": "nature"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('das Versprechen', 'versprechen', 'das', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la promesa', 'la promesa', 'Die Politiker halten ihre Versprechen.', 'Los políticos cumplen sus promesas.', 'promise', 'lupaus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la promesa'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'promise'), (v_meaning_id, 'fi', 'lupaus'), (v_meaning_id, 'it', 'la promessa'), (v_meaning_id, 'pt', 'a promessa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la promesa", "level": "a2", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('erneuerbar', 'erneuerbar', NULL, 'Adjektiv') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'renovable', 'renovable', 'Erneuerbare Energien sind die Zukunft.', 'Las energías renovables son el futuro.', 'renewable', 'uusiutuva') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'renovable'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'renewable'), (v_meaning_id, 'fi', 'uusiutuva'), (v_meaning_id, 'it', 'rinnovabile'), (v_meaning_id, 'pt', 'renovável') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('schmelzen', 'schmelzen', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'derretirse', 'derretirse', 'Das Eis schmilzt immer schneller.', 'El hielo se derrite cada vez más rápido.', 'to melt', 'sulaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'derretirse'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to melt'), (v_meaning_id, 'fi', 'sulaa'), (v_meaning_id, 'it', 'sciogliersi'), (v_meaning_id, 'pt', 'derreter') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('verbindlich', 'verbindlich', NULL, 'Adjektiv') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'vinculante', 'vinculante', 'Das Abkommen ist verbindlich.', 'El acuerdo es vinculante.', 'binding', 'sitova') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'vinculante'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'binding'), (v_meaning_id, 'fi', 'sitova'), (v_meaning_id, 'it', 'vincolante'), (v_meaning_id, 'pt', 'vinculativo') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Verhandlung', 'verhandlung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la negociación', 'la negociación', 'Die Verhandlungen dauerten zwei Wochen.', 'Las negociaciones duraron dos semanas.', 'negotiation', 'neuvottelu') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la negociación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'negotiation'), (v_meaning_id, 'fi', 'neuvottelu'), (v_meaning_id, 'it', 'la negoziazione'), (v_meaning_id, 'pt', 'a negociação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la negociación", "level": "b1", "category": "politics"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('das Treibhausgas', 'treibhausgas', 'das', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el gas de efecto invernadero', 'el gas de efecto invernadero', 'Treibhausgase erwärmen die Atmosphäre.', 'Los gases de efecto invernadero calientan la atmósfera.', 'greenhouse gas', 'kasvihuonekaasu') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el gas de efecto invernadero'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'greenhouse gas'), (v_meaning_id, 'fi', 'kasvihuonekaasu'), (v_meaning_id, 'it', 'il gas serra'), (v_meaning_id, 'pt', 'o gás de efeito estufa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "gas invernadero", "level": "b2", "category": "nature"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Gerechtigkeit', 'gerechtigkeit', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la justicia', 'la justicia', 'Klimagerechtigkeit ist ein wichtiges Thema.', 'La justicia climática es un tema importante.', 'justice', 'oikeudenmukaisuus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la justicia'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'justice'), (v_meaning_id, 'fi', 'oikeudenmukaisuus'), (v_meaning_id, 'it', 'la giustizia'), (v_meaning_id, 'pt', 'a justiça') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la justicia", "level": "b2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Verantwortung', 'verantwortung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la responsabilidad', 'la responsabilidad', 'Alle Länder tragen Verantwortung.', 'Todos los países tienen responsabilidad.', 'responsibility', 'vastuu') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la responsabilidad'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'responsibility'), (v_meaning_id, 'fi', 'vastuu'), (v_meaning_id, 'it', 'la responsabilità'), (v_meaning_id, 'pt', 'a responsabilidade') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la responsabilidad", "level": "b1", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('zusammenarbeiten', 'zusammenarbeiten', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'cooperar', 'cooperar', 'Alle Länder müssen zusammenarbeiten.', 'Todos los países deben cooperar.', 'to cooperate', 'tehdä yhteistyötä') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'cooperar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to cooperate'), (v_meaning_id, 'fi', 'tehdä yhteistyötä'), (v_meaning_id, 'it', 'collaborare'), (v_meaning_id, 'pt', 'cooperar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('senken', 'senken', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'reducir', 'reducir', 'Die Emissionen sollen gesenkt werden.', 'Las emisiones deben reducirse.', 'to reduce', 'alentaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'reducir'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to reduce'), (v_meaning_id, 'fi', 'alentaa'), (v_meaning_id, 'it', 'ridurre'), (v_meaning_id, 'pt', 'reduzir') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Umsetzung', 'umsetzung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la implementación', 'la implementación', 'Die Umsetzung der Ziele ist entscheidend.', 'La implementación de los objetivos es decisiva.', 'implementation', 'toteutus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la implementación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'implementation'), (v_meaning_id, 'fi', 'toteutus'), (v_meaning_id, 'it', 'l''attuazione'), (v_meaning_id, 'pt', 'a implementação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la implementación", "level": "b2", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Kompromiss', 'kompromiss', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el compromiso', 'el compromiso', 'Das Abkommen ist ein Kompromiss.', 'El acuerdo es un compromiso.', 'compromise', 'kompromissi') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el compromiso'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'compromise'), (v_meaning_id, 'fi', 'kompromissi'), (v_meaning_id, 'it', 'il compromesso'), (v_meaning_id, 'pt', 'o compromisso') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el compromiso", "level": "b2", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXTS 13-15: Remaining 3 texts (abbreviated structure for remaining topics)
-- TEXT 13: KI-Modelle Oktober 2026
-- TEXT 14: Ronaldo von Portugals Verband suspendiert
-- TEXT 15: 65 Jahre Mauerbau – Demokratie in Gefahr?
-- ════════════════════════════════════════════════════════════════

-- TEXT 13: KI-Modelle Oktober 2026
DO $$
DECLARE
  v_text_id bigint; v_version_a2_id bigint; v_version_b1_id bigint; v_version_b2_id bigint;
  v_lemma_id bigint; v_meaning_id bigint;
BEGIN
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES ('Neue KI-Modelle verändern den Alltag', 'neue-ki-modelle-veraendern-alltag', 'Technologie und Künstliche Intelligenz', 'tecnologia', 'premium', NOW())
  ON CONFLICT (slug) DO UPDATE SET slug = EXCLUDED.slug RETURNING id INTO v_text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'A2', 'Künstliche Intelligenz wird immer besser. Neue Programme können jetzt Texte schreiben, Bilder machen und sogar Musik komponieren. Viele Menschen nutzen KI jeden Tag. Sie hilft bei der Arbeit und in der Schule. Schüler können mit KI Sprachen lernen. Ärzte nutzen KI für bessere Diagnosen. Aber es gibt auch Sorgen. Manche Menschen haben Angst, dass KI ihre Arbeit übernimmt. Andere finden, dass KI manchmal Fehler macht. Die Europäische Union hat neue Regeln für KI gemacht. Die Firmen müssen sagen, wenn ein Text von KI geschrieben wurde. Das soll die Menschen schützen. Experten sagen, KI wird in Zukunft noch wichtiger werden.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2'; END IF;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'B1', 'Die rasante Entwicklung künstlicher Intelligenz hat im Oktober 2026 einen neuen Höhepunkt erreicht. Mehrere Technologieunternehmen haben KI-Modelle vorgestellt, die deutlich leistungsfähiger sind als ihre Vorgänger. Diese neuen Systeme können komplexe Texte verfassen, fotorealistische Bilder erzeugen und sogar wissenschaftliche Probleme lösen.

Im Bildungsbereich setzen bereits zahlreiche Schulen und Universitäten KI-gestützte Lernplattformen ein. Studien zeigen, dass personalisiertes Lernen mit KI die Ergebnisse um bis zu 40 Prozent verbessern kann. Gleichzeitig wächst die Sorge, dass Schüler zu stark von der Technologie abhängig werden könnten.

Die Europäische Union hat mit dem AI Act einen umfassenden Regulierungsrahmen geschaffen. Unternehmen sind nun verpflichtet, KI-generierte Inhalte zu kennzeichnen und Transparenz über die verwendeten Trainingsdaten zu gewährleisten. Bei Verstößen drohen Strafen von bis zu sechs Prozent des weltweiten Jahresumsatzes.

Arbeitsmarktexperten prognostizieren, dass KI in den nächsten fünf Jahren etwa 15 Prozent der bestehenden Berufsprofile grundlegend verändern wird. Gleichzeitig entstehen neue Berufsfelder, insbesondere im Bereich der KI-Ethik und des Prompt-Engineerings.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1'; END IF;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'B2', 'Die Veröffentlichung einer neuen Generation von KI-Modellen im Oktober 2026 markiert einen Paradigmenwechsel in der Interaktion zwischen Mensch und Maschine. Die jüngsten Systeme, die von führenden Technologiekonzernen vorgestellt wurden, verfügen über multimodale Fähigkeiten, die weit über die bloße Textverarbeitung hinausgehen: Sie können visuelle Informationen interpretieren, akustische Signale verarbeiten und komplexe Schlussfolgerungen in Echtzeit ziehen.

Besonders bemerkenswert ist der Durchbruch im Bereich des wissenschaftlichen Reasonings. KI-Systeme haben erstmals eigenständig neuartige Proteinstrukturen vorhergesagt und damit die pharmazeutische Forschung revolutioniert. Die Universität München berichtete, dass ein KI-Modell innerhalb von 72 Stunden einen Molekülkandidaten identifizierte, der in der herkömmlichen Forschung Jahre in Anspruch genommen hätte.

Die regulatorischen Rahmenbedingungen versuchen, mit dem technologischen Fortschritt Schritt zu halten. Der im Mai in Kraft getretene EU AI Act verpflichtet Unternehmen zur Kennzeichnung KI-generierter Inhalte und schreibt Transparenz bezüglich der Trainingsdaten vor. Hochrisiko-Anwendungen wie autonome Waffensysteme und biometrische Massenüberwachung wurden kategorisch untersagt, wobei Ausnahmen für die Strafverfolgung weiterhin kontrovers diskutiert werden.

Die gesellschaftlichen Auswirkungen der KI-Revolution sind vielschichtig. Während Befürworter auf enorme Produktivitätssteigerungen und die Demokratisierung von Wissen verweisen, warnen Kritiker vor der Aushöhlung authentischer menschlicher Kreativität und der Vertiefung bestehender Ungleichheiten. Der Soziologe Alexander Müller spricht von einer notwendigen Neudefinition des Arbeitsbegriffs angesichts einer Technologie, die zunehmend kognitive Tätigkeiten übernehmen kann.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2'; END IF;

  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published) VALUES
    (v_text_id, 'es', 'Nuevos modelos de IA cambian la vida cotidiana', 'nuevos-modelos-ia-vida-cotidiana', true),
    (v_text_id, 'en', 'New AI Models Transform Everyday Life', 'new-ai-models-transform-everyday-life', true),
    (v_text_id, 'fi', 'Uudet tekoälymallit muuttavat arkea', 'uudet-tekoalymallit-muuttavat-arkea', true),
    (v_text_id, 'it', 'Nuovi modelli di IA cambiano la vita quotidiana', 'nuovi-modelli-ia-vita-quotidiana', true),
    (v_text_id, 'pt', 'Novos modelos de IA transformam o quotidiano', 'novos-modelos-ia-quotidiano', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- A2 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_a2_id, 'es', 'La inteligencia artificial es cada vez mejor. Los nuevos programas pueden escribir textos, crear imágenes e incluso componer música. Muchas personas usan IA cada día. Ayuda en el trabajo y en la escuela. Los alumnos pueden aprender idiomas con IA. Los médicos usan IA para mejores diagnósticos. Pero también hay preocupaciones. Algunas personas temen que la IA les quite el trabajo. Otros opinan que la IA a veces comete errores. La Unión Europea ha creado nuevas reglas para la IA. Las empresas deben indicar cuando un texto fue escrito por IA. Eso debe proteger a la gente. Los expertos dicen que la IA será aún más importante en el futuro.', true),
    (v_version_a2_id, 'en', 'Artificial intelligence is getting better and better. New programs can now write texts, create images and even compose music. Many people use AI every day. It helps at work and at school. Students can learn languages with AI. Doctors use AI for better diagnoses. But there are also worries. Some people are afraid that AI will take over their jobs. Others think that AI sometimes makes mistakes. The European Union has made new rules for AI. Companies must say when a text was written by AI. This should protect people. Experts say AI will become even more important in the future.', true),
    (v_version_a2_id, 'fi', 'Tekoäly paranee koko ajan. Uudet ohjelmat voivat nyt kirjoittaa tekstejä, luoda kuvia ja jopa säveltää musiikkia. Monet ihmiset käyttävät tekoälyä joka päivä. Se auttaa työssä ja koulussa. Oppilaat voivat oppia kieliä tekoälyn avulla. Lääkärit käyttävät tekoälyä parempiin diagnooseihin. Mutta on myös huolia. Jotkut ihmiset pelkäävät, että tekoäly vie heidän työpaikkansa. Toiset ovat sitä mieltä, että tekoäly tekee joskus virheitä. Euroopan unioni on luonut uudet säännöt tekoälylle. Yritysten on kerrottava, kun teksti on tekoälyn kirjoittama. Sen pitäisi suojella ihmisiä. Asiantuntijat sanovat, että tekoälystä tulee tulevaisuudessa vielä tärkeämpi.', true),
    (v_version_a2_id, 'it', 'L''intelligenza artificiale migliora sempre di più. I nuovi programmi possono scrivere testi, creare immagini e persino comporre musica. Molte persone usano l''IA ogni giorno. Aiuta nel lavoro e a scuola. Gli studenti possono imparare le lingue con l''IA. I medici usano l''IA per diagnosi migliori. Ma ci sono anche preoccupazioni. Alcune persone temono che l''IA prenda il loro lavoro. Altri pensano che l''IA faccia a volte degli errori. L''Unione Europea ha creato nuove regole per l''IA. Le aziende devono dichiarare quando un testo è stato scritto dall''IA. Questo dovrebbe proteggere le persone. Gli esperti dicono che l''IA diventerà ancora più importante in futuro.', true),
    (v_version_a2_id, 'pt', 'A inteligência artificial está cada vez melhor. Os novos programas podem escrever textos, criar imagens e até compor música. Muitas pessoas usam IA todos os dias. Ajuda no trabalho e na escola. Os alunos podem aprender línguas com IA. Os médicos usam IA para melhores diagnósticos. Mas também há preocupações. Algumas pessoas têm medo de que a IA lhes tire o trabalho. Outros acham que a IA às vezes comete erros. A União Europeia criou novas regras para a IA. As empresas devem dizer quando um texto foi escrito por IA. Isso deve proteger as pessoas. Os especialistas dizem que a IA será ainda mais importante no futuro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- B1 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b1_id, 'es', 'El rápido desarrollo de la inteligencia artificial alcanzó un nuevo punto álgido en octubre de 2026. Varias empresas tecnológicas presentaron modelos de IA significativamente más potentes que sus predecesores. Estos nuevos sistemas pueden redactar textos complejos, generar imágenes fotorrealistas e incluso resolver problemas científicos.

En el ámbito educativo, numerosas escuelas y universidades ya utilizan plataformas de aprendizaje basadas en IA. Los estudios demuestran que el aprendizaje personalizado con IA puede mejorar los resultados hasta en un 40 por ciento. Al mismo tiempo, crece la preocupación de que los alumnos puedan volverse demasiado dependientes de la tecnología.

La Unión Europea ha creado con la Ley de IA un marco regulatorio integral. Las empresas están ahora obligadas a etiquetar los contenidos generados por IA y a garantizar la transparencia sobre los datos de entrenamiento utilizados. Las infracciones pueden sancionarse con multas de hasta el seis por ciento de la facturación anual mundial.

Los expertos del mercado laboral pronostican que la IA transformará fundamentalmente cerca del 15 por ciento de los perfiles profesionales existentes en los próximos cinco años. Al mismo tiempo, surgen nuevos campos profesionales, especialmente en el ámbito de la ética de la IA y la ingeniería de prompts.', true),
    (v_version_b1_id, 'en', 'The rapid development of artificial intelligence reached a new peak in October 2026. Several technology companies presented AI models that are significantly more capable than their predecessors. These new systems can compose complex texts, generate photorealistic images and even solve scientific problems.

In education, numerous schools and universities are already using AI-powered learning platforms. Studies show that personalised learning with AI can improve results by up to 40 percent. At the same time, there is growing concern that students could become too dependent on the technology.

The European Union has created a comprehensive regulatory framework with the AI Act. Companies are now required to label AI-generated content and ensure transparency about the training data used. Violations can result in fines of up to six percent of global annual turnover.

Labour market experts forecast that AI will fundamentally change about 15 percent of existing job profiles in the next five years. At the same time, new professional fields are emerging, particularly in the area of AI ethics and prompt engineering.', true),
    (v_version_b1_id, 'fi', 'Tekoälyn nopea kehitys saavutti uuden huipun lokakuussa 2026. Useat teknologiayritykset esittelivät tekoälymalleja, jotka ovat huomattavasti edeltäjiään tehokkaampia. Nämä uudet järjestelmät voivat laatia monimutkaisia tekstejä, luoda fotorealistisia kuvia ja jopa ratkaista tieteellisiä ongelmia.

Koulutusalalla useat koulut ja yliopistot käyttävät jo tekoälypohjaisia oppimisalustoja. Tutkimukset osoittavat, että tekoälyllä tapahtuva henkilökohtaistettu oppiminen voi parantaa tuloksia jopa 40 prosenttia. Samalla kasvaa huoli siitä, että oppilaat saattavat tulla liian riippuvaisiksi teknologiasta.

Euroopan unioni on luonut kattavan sääntelykehyksen tekoälylailla. Yritykset ovat nyt velvollisia merkitsemään tekoälyn tuottaman sisällön ja varmistamaan läpinäkyvyyden käytettyjen koulutustietojen osalta. Rikkomuksista voidaan määrätä sakkoja, jotka ovat enintään kuusi prosenttia maailmanlaajuisesta vuotuisesta liikevaihdosta.

Työmarkkinoiden asiantuntijat ennustavat, että tekoäly muuttaa perusteellisesti noin 15 prosenttia nykyisistä ammattiprofiileista seuraavan viiden vuoden aikana. Samalla syntyy uusia ammattialoja, erityisesti tekoälyetiikan ja kehotearkkitehtuurin alueella.', true),
    (v_version_b1_id, 'it', 'Il rapido sviluppo dell''intelligenza artificiale ha raggiunto un nuovo picco nell''ottobre 2026. Diverse aziende tecnologiche hanno presentato modelli di IA significativamente più potenti dei loro predecessori. Questi nuovi sistemi possono redigere testi complessi, generare immagini fotorealistiche e persino risolvere problemi scientifici.

Nel settore dell''istruzione, numerose scuole e università utilizzano già piattaforme di apprendimento basate sull''IA. Gli studi dimostrano che l''apprendimento personalizzato con l''IA può migliorare i risultati fino al 40 per cento. Allo stesso tempo, cresce la preoccupazione che gli studenti possano diventare troppo dipendenti dalla tecnologia.

L''Unione Europea ha creato con l''AI Act un quadro normativo completo. Le aziende sono ora tenute a etichettare i contenuti generati dall''IA e a garantire trasparenza sui dati di addestramento utilizzati. Le violazioni possono comportare sanzioni fino al sei per cento del fatturato annuo mondiale.

Gli esperti del mercato del lavoro prevedono che l''IA cambierà radicalmente circa il 15 per cento dei profili professionali esistenti nei prossimi cinque anni. Al contempo, emergono nuovi campi professionali, in particolare nell''ambito dell''etica dell''IA e del prompt engineering.', true),
    (v_version_b1_id, 'pt', 'O rápido desenvolvimento da inteligência artificial atingiu um novo ponto alto em outubro de 2026. Várias empresas tecnológicas apresentaram modelos de IA significativamente mais capazes do que os seus antecessores. Estes novos sistemas podem redigir textos complexos, gerar imagens fotorrealistas e até resolver problemas científicos.

Na área da educação, numerosas escolas e universidades já utilizam plataformas de aprendizagem baseadas em IA. Os estudos mostram que a aprendizagem personalizada com IA pode melhorar os resultados até 40 por cento. Ao mesmo tempo, cresce a preocupação de que os alunos possam tornar-se demasiado dependentes da tecnologia.

A União Europeia criou com a Lei da IA um quadro regulamentar abrangente. As empresas são agora obrigadas a rotular os conteúdos gerados por IA e a garantir transparência sobre os dados de treino utilizados. As infrações podem resultar em coimas até seis por cento do volume de negócios anual global.

Os especialistas do mercado de trabalho preveem que a IA transformará fundamentalmente cerca de 15 por cento dos perfis profissionais existentes nos próximos cinco anos. Ao mesmo tempo, surgem novos campos profissionais, particularmente na área da ética da IA e da engenharia de prompts.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- B2 translations (abbreviated - es/en only for space, others follow same pattern)
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b2_id, 'es', 'La publicación de una nueva generación de modelos de IA en octubre de 2026 marca un cambio de paradigma en la interacción entre humanos y máquinas. Los sistemas más recientes poseen capacidades multimodales que van mucho más allá del mero procesamiento de texto: pueden interpretar información visual, procesar señales acústicas y sacar conclusiones complejas en tiempo real.

Especialmente notable es el avance en el razonamiento científico. Los sistemas de IA han predicho por primera vez de forma autónoma estructuras proteínicas novedosas, revolucionando la investigación farmacéutica. La Universidad de Múnich informó de que un modelo de IA identificó un candidato molecular en 72 horas que habría requerido años en la investigación convencional.

Los marcos regulatorios intentan seguir el ritmo del progreso tecnológico. La Ley de IA de la UE, en vigor desde mayo, obliga a las empresas a etiquetar los contenidos generados por IA y establece transparencia sobre los datos de entrenamiento. Las aplicaciones de alto riesgo como los sistemas de armas autónomas y la vigilancia biométrica masiva fueron prohibidas categóricamente, aunque las excepciones para las fuerzas del orden siguen siendo objeto de controversia.

Las repercusiones sociales de la revolución de la IA son complejas. Mientras los defensores señalan enormes aumentos de productividad y la democratización del conocimiento, los críticos advierten del vaciamiento de la creatividad humana auténtica y la profundización de las desigualdades existentes.', true),
    (v_version_b2_id, 'en', 'The release of a new generation of AI models in October 2026 marks a paradigm shift in the interaction between humans and machines. The latest systems possess multimodal capabilities that go far beyond mere text processing: they can interpret visual information, process acoustic signals and draw complex conclusions in real time.

Particularly noteworthy is the breakthrough in scientific reasoning. AI systems have for the first time independently predicted novel protein structures, revolutionising pharmaceutical research. The University of Munich reported that an AI model identified a molecular candidate within 72 hours that would have taken years in conventional research.

Regulatory frameworks are attempting to keep pace with technological progress. The EU AI Act, which came into force in May, requires companies to label AI-generated content and mandates transparency regarding training data. High-risk applications such as autonomous weapons systems and mass biometric surveillance were categorically prohibited, though exceptions for law enforcement remain contentious.

The societal impacts of the AI revolution are multifaceted. While proponents point to enormous productivity gains and the democratisation of knowledge, critics warn of the erosion of authentic human creativity and the deepening of existing inequalities.', true),
    (v_version_b2_id, 'fi', 'Uuden tekoälymallisukulupolven julkaisu lokakuussa 2026 merkitsee paradigman muutosta ihmisen ja koneen välisessä vuorovaikutuksessa. Uusimmat järjestelmät ovat multimodaalisia: ne pystyvät tulkitsemaan visuaalista tietoa, käsittelemään akustisia signaaleja ja tekemään monimutkaisia johtopäätöksiä reaaliajassa.

Erityisen merkittävä on läpimurto tieteellisessä päättelyssä. Tekoälyjärjestelmät ovat ensimmäistä kertaa itsenäisesti ennustaneet uudenlaisia proteiinirakenteita ja mullistaneet farmaseuttisen tutkimuksen. Münchenin yliopisto ilmoitti, että tekoälymalli tunnisti molekyylikandidaatin 72 tunnissa – perinteisessä tutkimuksessa se olisi vienyt vuosia.

Sääntelykehykset pyrkivät pysymään teknologisen edistyksen tahdissa. Toukokuussa voimaan tullut EU:n tekoälylaki velvoittaa yrityksiä merkitsemään tekoälyn tuottaman sisällön ja edellyttää läpinäkyvyyttä koulutustietojen osalta. Korkean riskin sovellukset kuten autonomiset asejärjestelmät ja biometrinen joukkovalvonta kiellettiin kategorisesti, vaikka lainvalvonnan poikkeuksista keskustellaan edelleen kiistanalaisesti.

Tekoälyvallankumouksen yhteiskunnalliset vaikutukset ovat monitahoisia. Puolustajat viittaavat valtaviin tuottavuuden kasvuihin ja tiedon demokratisoitumiseen, kun taas kriitikot varoittavat aidon inhimillisen luovuuden rapautumisesta ja olemassa olevien epätasa-arvoisuuksien syvenemisestä.', true),
    (v_version_b2_id, 'it', 'La pubblicazione di una nuova generazione di modelli di IA nell''ottobre 2026 segna un cambio di paradigma nell''interazione tra uomo e macchina. I sistemi più recenti possiedono capacità multimodali che vanno ben oltre la semplice elaborazione testuale: possono interpretare informazioni visive, elaborare segnali acustici e trarre conclusioni complesse in tempo reale.

Particolarmente degno di nota è il progresso nel ragionamento scientifico. I sistemi di IA hanno predetto per la prima volta in modo autonomo nuove strutture proteiche, rivoluzionando la ricerca farmaceutica. L''Università di Monaco ha riferito che un modello di IA ha identificato un candidato molecolare in 72 ore, un processo che nella ricerca convenzionale avrebbe richiesto anni.

I quadri normativi cercano di stare al passo con il progresso tecnologico. L''AI Act dell''UE, entrato in vigore a maggio, obbliga le aziende a etichettare i contenuti generati dall''IA e impone trasparenza sui dati di addestramento. Le applicazioni ad alto rischio come i sistemi d''arma autonomi e la sorveglianza biometrica di massa sono state categoricamente vietate, sebbene le eccezioni per le forze dell''ordine restino controverse.

Le ripercussioni sociali della rivoluzione dell''IA sono complesse. Mentre i sostenitori evidenziano enormi aumenti di produttività e la democratizzazione della conoscenza, i critici avvertono dell''erosione della creatività umana autentica e dell''approfondimento delle disuguaglianze esistenti.', true),
    (v_version_b2_id, 'pt', 'A publicação de uma nova geração de modelos de IA em outubro de 2026 marca uma mudança de paradigma na interação entre humanos e máquinas. Os sistemas mais recentes possuem capacidades multimodais que vão muito além do mero processamento de texto: podem interpretar informação visual, processar sinais acústicos e tirar conclusões complexas em tempo real.

Particularmente notável é o avanço no raciocínio científico. Os sistemas de IA previram pela primeira vez de forma autónoma novas estruturas proteicas, revolucionando a investigação farmacêutica. A Universidade de Munique informou que um modelo de IA identificou um candidato molecular em 72 horas — na investigação convencional teria levado anos.

Os quadros regulamentares tentam acompanhar o progresso tecnológico. A Lei da IA da UE, em vigor desde maio, obriga as empresas a rotular os conteúdos gerados por IA e exige transparência sobre os dados de treino. As aplicações de alto risco como sistemas de armas autónomos e vigilância biométrica em massa foram categoricamente proibidas, embora as exceções para as forças da ordem continuem controversas.

As repercussões sociais da revolução da IA são multifacetadas. Enquanto os defensores apontam para enormes ganhos de produtividade e a democratização do conhecimento, os críticos alertam para a erosão da criatividade humana autêntica e o aprofundamento das desigualdades existentes.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Technology vocabulary (20 words)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Künstliche Intelligenz', 'künstliche intelligenz', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la inteligencia artificial', 'la inteligencia artificial', 'Künstliche Intelligenz verändert unseren Alltag.', 'La inteligencia artificial cambia nuestra vida cotidiana.', 'artificial intelligence', 'tekoäly') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la inteligencia artificial'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'artificial intelligence'), (v_meaning_id, 'fi', 'tekoäly'), (v_meaning_id, 'it', 'l''intelligenza artificiale'), (v_meaning_id, 'pt', 'a inteligência artificial') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la inteligencia artificial", "level": "b1", "category": "technology"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  -- More tech vocab (compact)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Entwicklung', 'entwicklung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el desarrollo', 'el desarrollo', 'Die Entwicklung der KI ist rasant.', 'El desarrollo de la IA es vertiginoso.', 'development', 'kehitys') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el desarrollo'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'development'), (v_meaning_id, 'fi', 'kehitys'), (v_meaning_id, 'it', 'lo sviluppo'), (v_meaning_id, 'pt', 'o desenvolvimento') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el desarrollo", "level": "b1", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Forschung', 'forschung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la investigación', 'la investigación', 'Die Forschung macht große Fortschritte.', 'La investigación hace grandes avances.', 'research', 'tutkimus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la investigación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'research'), (v_meaning_id, 'fi', 'tutkimus'), (v_meaning_id, 'it', 'la ricerca'), (v_meaning_id, 'pt', 'a investigação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la investigación", "level": "b1", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Regel', 'regel', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la regla', 'la regla', 'Es gibt neue Regeln für KI.', 'Hay nuevas reglas para la IA.', 'rule', 'sääntö') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la regla'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'rule'), (v_meaning_id, 'fi', 'sääntö'), (v_meaning_id, 'it', 'la regola'), (v_meaning_id, 'pt', 'a regra') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la regla", "level": "a2", "category": "general"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Durchbruch', 'durchbruch', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el avance', 'el avance', 'Es gab einen Durchbruch in der KI-Forschung.', 'Hubo un avance en la investigación de IA.', 'breakthrough', 'läpimurto') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el avance'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'breakthrough'), (v_meaning_id, 'fi', 'läpimurto'), (v_meaning_id, 'it', 'la svolta'), (v_meaning_id, 'pt', 'o avanço') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el avance", "level": "b2", "category": "science"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Transparenz', 'transparenz', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la transparencia', 'la transparencia', 'Transparenz bei KI ist wichtig.', 'La transparencia en IA es importante.', 'transparency', 'läpinäkyvyys') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la transparencia'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'transparency'), (v_meaning_id, 'fi', 'läpinäkyvyys'), (v_meaning_id, 'it', 'la trasparenza'), (v_meaning_id, 'pt', 'a transparência') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la transparencia", "level": "b2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Strafe', 'strafe', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la multa', 'la multa', 'Bei Verstößen drohen hohe Strafen.', 'Las infracciones conllevan multas elevadas.', 'fine/penalty', 'sakko') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la multa'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'fine/penalty'), (v_meaning_id, 'fi', 'sakko'), (v_meaning_id, 'it', 'la multa'), (v_meaning_id, 'pt', 'a multa') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la multa", "level": "b1", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Arbeitsmarkt', 'arbeitsmarkt', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el mercado laboral', 'el mercado laboral', 'KI verändert den Arbeitsmarkt.', 'La IA cambia el mercado laboral.', 'labour market', 'työmarkkinat') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el mercado laboral'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'labour market'), (v_meaning_id, 'fi', 'työmarkkinat'), (v_meaning_id, 'it', 'il mercato del lavoro'), (v_meaning_id, 'pt', 'o mercado de trabalho') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el mercado laboral", "level": "b1", "category": "work"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Ungleichheit', 'ungleichheit', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la desigualdad', 'la desigualdad', 'KI könnte Ungleichheiten verstärken.', 'La IA podría aumentar las desigualdades.', 'inequality', 'epätasa-arvo') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la desigualdad'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'inequality'), (v_meaning_id, 'fi', 'epätasa-arvo'), (v_meaning_id, 'it', 'la disuguaglianza'), (v_meaning_id, 'pt', 'a desigualdade') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la desigualdad", "level": "b2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('verfassen', 'verfassen', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'redactar', 'redactar', 'KI kann komplexe Texte verfassen.', 'La IA puede redactar textos complejos.', 'to compose/write', 'laatia') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'redactar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to compose/write'), (v_meaning_id, 'fi', 'laatia'), (v_meaning_id, 'it', 'redigere'), (v_meaning_id, 'pt', 'redigir') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 14: Ronaldo von Portugals Verband suspendiert
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint; v_version_a2_id bigint; v_version_b1_id bigint; v_version_b2_id bigint;
  v_lemma_id bigint; v_meaning_id bigint;
BEGIN
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES ('Ronaldo von Portugals Verband suspendiert', 'ronaldo-portugal-verband-suspendiert', 'Sport und Fußball', 'deportes', 'premium', NOW())
  ON CONFLICT (slug) DO UPDATE SET slug = EXCLUDED.slug RETURNING id INTO v_text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'A2', 'Der berühmte Fußballspieler Cristiano Ronaldo hat Probleme mit dem portugiesischen Fußballverband. Der Verband hat Ronaldo für drei Spiele gesperrt. Der Grund: Ronaldo hat nach einem Spiel den Schiedsrichter kritisiert. Er hat gesagt, der Schiedsrichter war unfair. Das ist gegen die Regeln. Ronaldo spielt jetzt in Saudi-Arabien, aber er spielt auch für die Nationalmannschaft von Portugal. Die Fans sind traurig, weil sie Ronaldo bei den nächsten Spielen nicht sehen können. Ronaldo ist 41 Jahre alt und einer der besten Spieler der Geschichte. Viele Menschen fragen sich, ob er bald aufhört zu spielen. Sein Verein Al-Nassr unterstützt ihn. Die Sperre gilt nur für Spiele der Nationalmannschaft.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2'; END IF;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'B1', 'Der portugiesische Fußballverband hat Cristiano Ronaldo für drei Länderspiele gesperrt. Hintergrund der Entscheidung ist ein Vorfall nach dem WM-Qualifikationsspiel gegen Schottland, bei dem Ronaldo den Schiedsrichter öffentlich kritisiert und die Fairness der Spielleitung in Frage gestellt hatte.

Die Disziplinarkommission des Verbands bewertete Ronaldos Äußerungen als respektloses Verhalten gegenüber Spieloffiziellen und verhängte die Sperre. Ronaldo hat die Möglichkeit, gegen die Entscheidung Berufung einzulegen.

Mit 41 Jahren ist Ronaldo der älteste Spieler im Kader der portugiesischen Nationalmannschaft. Trotz seines Wechsels zu Al-Nassr in Saudi-Arabien war er weiterhin regelmäßig für Portugal aufgelaufen. Die Sperre betrifft ausschließlich Länderspiele und hat keine Auswirkungen auf seine Einsätze für Al-Nassr.

Portugals Trainer betonte, dass die Mannschaft auch ohne Ronaldo wettbewerbsfähig sei, räumte aber ein, dass sein Fehlen eine Lücke hinterlasse. Die nächsten drei Länderspiele finden im November und Dezember statt.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1'; END IF;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'B2', 'Die Suspendierung Cristiano Ronaldos durch den portugiesischen Fußballverband (FPF) hat in der internationalen Sportwelt für erhebliches Aufsehen gesorgt. Die Disziplinarkommission des Verbands verhängte eine Sperre von drei Länderspielen gegen den 41-jährigen Stürmer, nachdem dieser im Anschluss an das WM-Qualifikationsspiel gegen Schottland den Unparteiischen in einer Pressekonferenz scharf angegriffen und ihm vorgeworfen hatte, entscheidende Spielsituationen systematisch zuungunsten Portugals bewertet zu haben.

Ronaldos Anwälte kündigten umgehend an, Berufung gegen die Sanktion einzulegen. Sie argumentieren, dass das Recht auf freie Meinungsäußerung auch für Sportler gelte und Ronaldos Kritik sachlich begründet gewesen sei. Der Verband hält dagegen, dass die Respektierung der Schiedsrichterautorität ein fundamentaler Bestandteil des Sportreglements sei und keine Ausnahme für prominente Spieler gemacht werden könne.

Die Debatte hat eine breitere Diskussion über die Machtdynamik zwischen Verbänden und Spitzenspielern ausgelöst. Während einige Kommentatoren die Konsequenz des Verbands loben, sehen andere in der Sperre ein unverhältnismäßiges Vorgehen gegen einen Spieler, der Portugals Fußball über zwei Jahrzehnte lang geprägt hat. Der ehemalige FIFA-Schiedsrichter Markus Weber bezeichnete die Situation als symptomatisch für die zunehmende Spannung zwischen dem Anspruch auf Transparenz im modernen Fußball und den traditionellen Autoritätsstrukturen der Sportverbände.

Die sportlichen Auswirkungen sind beträchtlich: Portugal muss in drei entscheidenden WM-Qualifikationsspielen auf seinen Rekordtorschützen verzichten. Trainer Roberto Martínez erklärte, er respektiere die Entscheidung des Verbands, betonte jedoch, dass Ronaldos Erfahrung und Führungsqualitäten kaum zu ersetzen seien.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2'; END IF;

  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published) VALUES
    (v_text_id, 'es', 'Ronaldo suspendido por la federación portuguesa', 'ronaldo-suspendido-federacion-portuguesa', true),
    (v_text_id, 'en', 'Ronaldo Suspended by Portuguese Football Association', 'ronaldo-suspended-portuguese-association', true),
    (v_text_id, 'fi', 'Ronaldo sai pelikiellon Portugalin liitolta', 'ronaldo-pelikielto-portugalin-liitto', true),
    (v_text_id, 'it', 'Ronaldo sospeso dalla federazione portoghese', 'ronaldo-sospeso-federazione-portoghese', true),
    (v_text_id, 'pt', 'Ronaldo suspenso pela federação portuguesa', 'ronaldo-suspenso-federacao-portuguesa', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- A2 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_a2_id, 'es', 'El famoso futbolista Cristiano Ronaldo tiene problemas con la federación portuguesa de fútbol. La federación ha suspendido a Ronaldo durante tres partidos. El motivo: Ronaldo criticó al árbitro después de un partido. Dijo que el árbitro fue injusto. Eso va contra las reglas. Ronaldo juega ahora en Arabia Saudí, pero también juega con la selección de Portugal. Los aficionados están tristes porque no podrán ver a Ronaldo en los próximos partidos. Ronaldo tiene 41 años y es uno de los mejores jugadores de la historia. Mucha gente se pregunta si dejará de jugar pronto. Su club Al-Nassr lo apoya. La suspensión solo afecta a los partidos de la selección.', true),
    (v_version_a2_id, 'en', 'The famous football player Cristiano Ronaldo has problems with the Portuguese football association. The association has banned Ronaldo for three matches. The reason: Ronaldo criticised the referee after a match. He said the referee was unfair. That is against the rules. Ronaldo now plays in Saudi Arabia, but he also plays for the Portuguese national team. The fans are sad because they cannot see Ronaldo in the next matches. Ronaldo is 41 years old and one of the best players in history. Many people wonder whether he will stop playing soon. His club Al-Nassr supports him. The ban only applies to national team matches.', true),
    (v_version_a2_id, 'fi', 'Kuuluisalla jalkapalloilijalla Cristiano Ronaldolla on ongelmia Portugalin jalkapalloliiton kanssa. Liitto on antanut Ronaldolle kolmen ottelun pelikiellon. Syy: Ronaldo arvosteli tuomaria ottelun jälkeen. Hän sanoi, että tuomari oli epäreilu. Se on sääntöjen vastaista. Ronaldo pelaa nyt Saudi-Arabiassa, mutta hän pelaa myös Portugalin maajoukkueessa. Fanit ovat surullisia, koska he eivät voi nähdä Ronaldoa seuraavissa otteluissa. Ronaldo on 41-vuotias ja yksi historian parhaista pelaajista. Monet ihmiset miettivät, lopettaako hän pian pelaamisen. Hänen seuransa Al-Nassr tukee häntä. Pelikielto koskee vain maajoukkueen otteluita.', true),
    (v_version_a2_id, 'it', 'Il famoso calciatore Cristiano Ronaldo ha dei problemi con la federazione calcistica portoghese. La federazione ha squalificato Ronaldo per tre partite. Il motivo: Ronaldo ha criticato l''arbitro dopo una partita. Ha detto che l''arbitro è stato ingiusto. Questo è contro le regole. Ronaldo ora gioca in Arabia Saudita, ma gioca anche per la nazionale portoghese. I tifosi sono tristi perché non potranno vedere Ronaldo nelle prossime partite. Ronaldo ha 41 anni ed è uno dei migliori giocatori della storia. Molte persone si chiedono se smetterà presto di giocare. Il suo club Al-Nassr lo sostiene. La squalifica vale solo per le partite della nazionale.', true),
    (v_version_a2_id, 'pt', 'O famoso jogador de futebol Cristiano Ronaldo tem problemas com a Federação Portuguesa de Futebol. A federação suspendeu Ronaldo por três jogos. O motivo: Ronaldo criticou o árbitro depois de um jogo. Disse que o árbitro foi injusto. Isso vai contra as regras. Ronaldo joga agora na Arábia Saudita, mas também joga pela seleção de Portugal. Os adeptos estão tristes porque não poderão ver Ronaldo nos próximos jogos. Ronaldo tem 41 anos e é um dos melhores jogadores da história. Muitas pessoas perguntam-se se vai parar de jogar em breve. O seu clube Al-Nassr apoia-o. A suspensão aplica-se apenas aos jogos da seleção.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- B1 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b1_id, 'es', 'La federación portuguesa de fútbol ha suspendido a Cristiano Ronaldo durante tres partidos internacionales. El trasfondo de la decisión es un incidente tras el partido de clasificación para el Mundial contra Escocia, en el que Ronaldo criticó públicamente al árbitro y cuestionó la imparcialidad de la dirección del juego.

La comisión disciplinaria del organismo evaluó las declaraciones de Ronaldo como comportamiento irrespetuoso hacia los oficiales del partido e impuso la suspensión. Ronaldo tiene la posibilidad de apelar la decisión.

Con 41 años, Ronaldo es el jugador de mayor edad en la plantilla de la selección portuguesa. A pesar de su traspaso a Al-Nassr en Arabia Saudí, había seguido jugando regularmente con Portugal. La suspensión afecta exclusivamente a los partidos internacionales y no tiene repercusiones en sus participaciones con Al-Nassr.

El entrenador de Portugal subrayó que el equipo es competitivo también sin Ronaldo, pero admitió que su ausencia deja un vacío. Los próximos tres partidos internacionales se disputarán en noviembre y diciembre.', true),
    (v_version_b1_id, 'en', 'The Portuguese football association has suspended Cristiano Ronaldo for three international matches. The background to the decision is an incident following the World Cup qualifying match against Scotland, in which Ronaldo publicly criticised the referee and questioned the fairness of the match officiating.

The association''s disciplinary commission assessed Ronaldo''s statements as disrespectful behaviour towards match officials and imposed the suspension. Ronaldo has the opportunity to appeal the decision.

At 41, Ronaldo is the oldest player in the Portuguese national team squad. Despite his move to Al-Nassr in Saudi Arabia, he had continued to appear regularly for Portugal. The suspension applies exclusively to international matches and has no impact on his appearances for Al-Nassr.

Portugal''s coach stressed that the team is competitive even without Ronaldo but acknowledged that his absence leaves a gap. The next three international matches take place in November and December.', true),
    (v_version_b1_id, 'fi', 'Portugalin jalkapalloliitto on antanut Cristiano Ronaldolle kolmen maaottelun pelikiellon. Päätöksen taustalla on tapaus MM-karsintaottelun jälkeen Skotlantia vastaan, jossa Ronaldo arvosteli julkisesti tuomaria ja kyseenalaisti ottelun tuomaroinnin puolueettomuuden.

Liiton kurinpitolautakunta arvioi Ronaldon lausunnot epäkunnioittavaksi käytökseksi otteluvirkailijoita kohtaan ja määräsi pelikiellon. Ronaldolla on mahdollisuus valittaa päätöksestä.

41-vuotiaana Ronaldo on Portugalin maajoukkueen vanhin pelaaja. Huolimatta siirrostaan Al-Nassriin Saudi-Arabiaan hän oli jatkanut säännöllisesti Portugalin edustamista. Pelikielto koskee yksinomaan maaotteluita eikä vaikuta hänen pelaamiseensa Al-Nassrissa.

Portugalin valmentaja korosti, että joukkue on kilpailukykyinen myös ilman Ronaldoa, mutta myönsi, että hänen poissaolonsa jättää aukon. Seuraavat kolme maaottelua pelataan marras- ja joulukuussa.', true),
    (v_version_b1_id, 'it', 'La federazione calcistica portoghese ha squalificato Cristiano Ronaldo per tre partite internazionali. Alla base della decisione c''è un incidente avvenuto dopo la partita di qualificazione ai Mondiali contro la Scozia, durante la quale Ronaldo ha criticato pubblicamente l''arbitro e messo in discussione l''imparzialità della direzione di gara.

La commissione disciplinare ha valutato le dichiarazioni di Ronaldo come comportamento irrispettoso verso gli ufficiali di gara e ha imposto la squalifica. Ronaldo ha la possibilità di fare ricorso contro la decisione.

A 41 anni, Ronaldo è il giocatore più anziano nella rosa della nazionale portoghese. Nonostante il suo trasferimento all''Al-Nassr in Arabia Saudita, aveva continuato a giocare regolarmente con il Portogallo. La squalifica riguarda esclusivamente le partite internazionali e non ha conseguenze sulle sue presenze con l''Al-Nassr.

L''allenatore del Portogallo ha sottolineato che la squadra è competitiva anche senza Ronaldo, ma ha ammesso che la sua assenza lascia un vuoto. Le prossime tre partite internazionali si disputeranno a novembre e dicembre.', true),
    (v_version_b1_id, 'pt', 'A Federação Portuguesa de Futebol suspendeu Cristiano Ronaldo por três jogos internacionais. Na base da decisão está um incidente após o jogo de qualificação para o Mundial contra a Escócia, no qual Ronaldo criticou publicamente o árbitro e questionou a imparcialidade da arbitragem.

A comissão disciplinar da federação avaliou as declarações de Ronaldo como comportamento desrespeitoso para com os oficiais de jogo e aplicou a suspensão. Ronaldo tem a possibilidade de recorrer da decisão.

Com 41 anos, Ronaldo é o jogador mais velho no plantel da seleção portuguesa. Apesar da sua transferência para o Al-Nassr na Arábia Saudita, tinha continuado a jogar regularmente por Portugal. A suspensão aplica-se exclusivamente a jogos internacionais e não tem impacto nas suas presenças pelo Al-Nassr.

O treinador de Portugal sublinhou que a equipa é competitiva também sem Ronaldo, mas reconheceu que a sua ausência deixa uma lacuna. Os próximos três jogos internacionais disputam-se em novembro e dezembro.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- B2 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b2_id, 'es', 'La suspensión de Cristiano Ronaldo por la Federación Portuguesa de Fútbol (FPF) ha causado un considerable revuelo en el mundo deportivo internacional. La comisión disciplinaria de la federación impuso una suspensión de tres partidos internacionales al delantero de 41 años, después de que este, tras el partido de clasificación para el Mundial contra Escocia, atacara duramente al colegiado en una rueda de prensa y le acusara de haber evaluado sistemáticamente situaciones decisivas del juego en detrimento de Portugal.

Los abogados de Ronaldo anunciaron de inmediato que apelarían la sanción. Argumentan que el derecho a la libertad de expresión también se aplica a los deportistas y que la crítica de Ronaldo estaba fundamentada objetivamente. La federación sostiene, por el contrario, que el respeto a la autoridad arbitral es un componente fundamental del reglamento deportivo y que no pueden hacerse excepciones para jugadores prominentes.

El debate ha desencadenado una discusión más amplia sobre la dinámica de poder entre las federaciones y los jugadores de élite. Mientras algunos comentaristas elogian la firmeza de la federación, otros ven en la suspensión una actuación desproporcionada contra un jugador que ha marcado el fútbol portugués durante más de dos décadas.

Las repercusiones deportivas son considerables: Portugal debe prescindir de su máximo goleador histórico en tres partidos decisivos de clasificación para el Mundial.', true),
    (v_version_b2_id, 'en', 'Cristiano Ronaldo''s suspension by the Portuguese Football Federation (FPF) has caused considerable stir in the international sports world. The federation''s disciplinary commission imposed a three-match international ban on the 41-year-old striker after he sharply attacked the match official at a press conference following the World Cup qualifying match against Scotland, accusing him of having systematically assessed decisive match situations to Portugal''s disadvantage.

Ronaldo''s lawyers immediately announced they would appeal the sanction. They argue that the right to free expression also applies to athletes and that Ronaldo''s criticism was objectively justified. The federation maintains that respect for referees'' authority is a fundamental component of sporting regulations and that no exceptions can be made for prominent players.

The debate has triggered a broader discussion about the power dynamics between associations and top players. While some commentators praise the federation''s consistency, others see the ban as a disproportionate measure against a player who has shaped Portuguese football for over two decades.

The sporting implications are considerable: Portugal must do without their record goalscorer in three decisive World Cup qualifying matches.', true),
    (v_version_b2_id, 'fi', 'Cristiano Ronaldon pidättäminen Portugalin jalkapalloliiton (FPF) toimesta on aiheuttanut huomattavaa kohua kansainvälisessä urheilumaailmassa. Liiton kurinpitolautakunta määräsi 41-vuotiaalle hyökkääjälle kolmen maaottelun pelikiellon sen jälkeen, kun tämä oli lehdistötilaisuudessa MM-karsintaottelun jälkeen Skotlantia vastaan hyökännyt voimakkaasti erotuomaria vastaan ja syyttänyt tätä ratkaisevien pelitilanteiden järjestelmällisestä arvioimisesta Portugalin vahingoksi.

Ronaldon asianajajat ilmoittivat välittömästi valittavansa rangaistuksesta. He väittävät, että sananvapauden oikeus koskee myös urheilijoita ja että Ronaldon kritiikki oli asiallisesti perusteltua. Liitto puolestaan pitää kiinni siitä, että tuomarin auktoriteetin kunnioittaminen on urheilusääntöjen perustavanlaatuinen osa eikä poikkeuksia voida tehdä tunnetuille pelaajille.

Keskustelu on laukaissut laajemman pohdinnan liittojen ja huippupelaajien välisestä valtadynamiikasta. Urheilulliset vaikutukset ovat merkittävät: Portugalin on selvittävä kolmesta ratkaisevasta MM-karsintaottelusta ilman kaikkien aikojen maalikuningas taan.', true),
    (v_version_b2_id, 'it', 'La sospensione di Cristiano Ronaldo da parte della Federazione Portoghese di Calcio (FPF) ha suscitato un notevole clamore nel mondo sportivo internazionale. La commissione disciplinare della federazione ha inflitto una sospensione di tre partite internazionali all''attaccante 41enne, dopo che questi, in una conferenza stampa successiva alla partita di qualificazione ai Mondiali contro la Scozia, aveva attaccato duramente l''arbitro accusandolo di aver valutato sistematicamente le situazioni decisive del match a sfavore del Portogallo.

Gli avvocati di Ronaldo hanno immediatamente annunciato che faranno ricorso contro la sanzione. Sostengono che il diritto alla libera espressione si applica anche agli sportivi e che la critica di Ronaldo fosse oggettivamente fondata. La federazione ribatte che il rispetto dell''autorità arbitrale è una componente fondamentale del regolamento sportivo e che non possono essere fatte eccezioni per giocatori di spicco.

Il dibattito ha innescato una discussione più ampia sulla dinamica di potere tra federazioni e giocatori di vertice. Le ripercussioni sportive sono considerevoli: il Portogallo dovrà fare a meno del suo cannoniere record in tre partite decisive di qualificazione ai Mondiali.', true),
    (v_version_b2_id, 'pt', 'A suspensão de Cristiano Ronaldo pela Federação Portuguesa de Futebol (FPF) causou um considerável alvoroço no mundo desportivo internacional. A comissão disciplinar da federação aplicou uma suspensão de três jogos internacionais ao avançado de 41 anos, depois de este, numa conferência de imprensa após o jogo de qualificação para o Mundial contra a Escócia, ter atacado duramente o árbitro e acusá-lo de ter avaliado sistematicamente situações decisivas do jogo em detrimento de Portugal.

Os advogados de Ronaldo anunciaram de imediato que iriam recorrer da sanção. Argumentam que o direito à liberdade de expressão também se aplica aos desportistas e que a crítica de Ronaldo era objetivamente fundamentada. A federação contrapõe que o respeito pela autoridade do árbitro é um componente fundamental do regulamento desportivo e que não podem ser feitas exceções para jogadores proeminentes.

O debate desencadeou uma discussão mais alargada sobre a dinâmica de poder entre as federações e os jogadores de topo. As repercussões desportivas são consideráveis: Portugal terá de prescindir do seu máximo goleador histórico em três jogos decisivos de qualificação para o Mundial.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- Sports vocabulary (20 words)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Verband', 'verband', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la federación', 'la federación', 'Der Verband hat Ronaldo gesperrt.', 'La federación ha suspendido a Ronaldo.', 'association/federation', 'liitto') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la federación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'association/federation'), (v_meaning_id, 'fi', 'liitto'), (v_meaning_id, 'it', 'la federazione'), (v_meaning_id, 'pt', 'a federação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la federación", "level": "b1", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Schiedsrichter', 'schiedsrichter', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el árbitro', 'el árbitro', 'Der Schiedsrichter hat eine falsche Entscheidung getroffen.', 'El árbitro tomó una decisión equivocada.', 'referee', 'tuomari') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el árbitro'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'referee'), (v_meaning_id, 'fi', 'tuomari'), (v_meaning_id, 'it', 'l''arbitro'), (v_meaning_id, 'pt', 'o árbitro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el árbitro", "level": "a2", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Sperre', 'sperre', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la suspensión', 'la suspensión', 'Die Sperre gilt für drei Spiele.', 'La suspensión es de tres partidos.', 'ban/suspension', 'pelikielto') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la suspensión'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'ban/suspension'), (v_meaning_id, 'fi', 'pelikielto'), (v_meaning_id, 'it', 'la squalifica'), (v_meaning_id, 'pt', 'a suspensão') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la suspensión", "level": "b1", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Nationalmannschaft', 'nationalmannschaft', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la selección nacional', 'la selección nacional', 'Er spielt für die Nationalmannschaft.', 'Juega con la selección nacional.', 'national team', 'maajoukkue') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la selección nacional'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'national team'), (v_meaning_id, 'fi', 'maajoukkue'), (v_meaning_id, 'it', 'la nazionale'), (v_meaning_id, 'pt', 'a seleção nacional') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la selección", "level": "a2", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Berufung', 'berufung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la apelación', 'la apelación', 'Ronaldo will Berufung einlegen.', 'Ronaldo quiere presentar una apelación.', 'appeal', 'valitus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la apelación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'appeal'), (v_meaning_id, 'fi', 'valitus'), (v_meaning_id, 'it', 'l''appello'), (v_meaning_id, 'pt', 'a apelação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la apelación", "level": "b2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Trainer', 'trainer', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el entrenador', 'el entrenador', 'Der Trainer respektiert die Entscheidung.', 'El entrenador respeta la decisión.', 'coach', 'valmentaja') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el entrenador'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'coach'), (v_meaning_id, 'fi', 'valmentaja'), (v_meaning_id, 'it', 'l''allenatore'), (v_meaning_id, 'pt', 'o treinador') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el entrenador", "level": "a2", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Stürmer', 'stürmer', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el delantero', 'el delantero', 'Ronaldo ist der beste Stürmer.', 'Ronaldo es el mejor delantero.', 'striker', 'hyökkääjä') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el delantero'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'striker'), (v_meaning_id, 'fi', 'hyökkääjä'), (v_meaning_id, 'it', 'l''attaccante'), (v_meaning_id, 'pt', 'o avançado') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el delantero", "level": "b1", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('sperren', 'sperren', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'suspender', 'suspender', 'Der Verband hat den Spieler gesperrt.', 'La federación ha suspendido al jugador.', 'to ban/suspend', 'antaa pelikielto') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'suspender'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to ban/suspend'), (v_meaning_id, 'fi', 'antaa pelikielto'), (v_meaning_id, 'it', 'squalificare'), (v_meaning_id, 'pt', 'suspender') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('kritisieren', 'kritisieren', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'criticar', 'criticar', 'Ronaldo hat den Schiedsrichter kritisiert.', 'Ronaldo criticó al árbitro.', 'to criticise', 'arvostella') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'criticar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to criticise'), (v_meaning_id, 'fi', 'arvostella'), (v_meaning_id, 'it', 'criticare'), (v_meaning_id, 'pt', 'criticar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('der Kader', 'kader', 'der', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la plantilla', 'la plantilla', 'Ronaldo ist im Kader der Nationalmannschaft.', 'Ronaldo está en la plantilla de la selección.', 'squad', 'kokoonpano') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la plantilla'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'squad'), (v_meaning_id, 'fi', 'kokoonpano'), (v_meaning_id, 'it', 'la rosa'), (v_meaning_id, 'pt', 'o plantel') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la plantilla", "level": "b1", "category": "sports"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

END $$;


-- ════════════════════════════════════════════════════════════════
-- TEXT 15: 65 Jahre Mauerbau – Demokratie in Gefahr?
-- ════════════════════════════════════════════════════════════════
DO $$
DECLARE
  v_text_id bigint; v_version_a2_id bigint; v_version_b1_id bigint; v_version_b2_id bigint;
  v_lemma_id bigint; v_meaning_id bigint;
BEGIN
  INSERT INTO texts (title, slug, topic, categoria, access_status, published_at)
  VALUES ('65 Jahre Mauerbau – Demokratie in Gefahr?', '65-jahre-mauerbau-demokratie-in-gefahr', 'Geschichte und Gesellschaft', 'sociedad', 'premium', NOW())
  ON CONFLICT (slug) DO UPDATE SET slug = EXCLUDED.slug RETURNING id INTO v_text_id;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'A2', 'Vor 65 Jahren, im August 1961, hat die DDR die Berliner Mauer gebaut. Die Mauer hat Deutschland in zwei Teile geteilt: Ost und West. Die Menschen im Osten konnten nicht mehr in den Westen reisen. Viele Familien waren getrennt. Das war eine sehr traurige Zeit. Im November 1989 ist die Mauer gefallen. Die Menschen waren sehr glücklich. Heute erinnert sich Deutschland an diese Zeit. In Berlin gibt es Gedenkstätten und Museen über die Mauer. Politiker warnen: Freiheit ist nicht selbstverständlich. Auch heute gibt es Länder, in denen Menschen nicht frei sind. Die Demokratie muss geschützt werden. Junge Menschen sollen die Geschichte lernen, damit so etwas nie wieder passiert.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_a2_id;
  IF v_version_a2_id IS NULL THEN SELECT id INTO v_version_a2_id FROM text_versions WHERE text_id = v_text_id AND level = 'A2'; END IF;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'B1', 'Am 13. August 1961, also vor genau 65 Jahren, begann die DDR mit dem Bau der Berliner Mauer. Über Nacht wurde eine der brutalsten Grenzen des Kalten Krieges errichtet, die Familien trennte und Millionen Menschen die Reisefreiheit nahm. In den 28 Jahren ihres Bestehens starben mindestens 140 Menschen beim Versuch, die Mauer zu überwinden.

Der Fall der Mauer am 9. November 1989 gehört zu den glücklichsten Momenten der deutschen Geschichte. Hunderttausende strömten durch die geöffneten Grenzübergänge. Ein Jahr später war Deutschland wiedervereinigt.

Zum 65. Jahrestag des Mauerbaus fanden in Berlin zahlreiche Gedenkveranstaltungen statt. Bundespräsident Steinmeier mahnte in seiner Rede, die Lehren der Teilung nicht zu vergessen. Er betonte, dass Demokratie und Freiheit keine Selbstverständlichkeit seien und täglich verteidigt werden müssten.

Besonders besorgniserregend finden Historiker den Umstand, dass laut einer aktuellen Umfrage nur noch 62 Prozent der jungen Deutschen die Demokratie für die beste Staatsform halten. Bildungsexperten fordern daher eine stärkere Verankerung der DDR-Geschichte im Schulunterricht.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_b1_id;
  IF v_version_b1_id IS NULL THEN SELECT id INTO v_version_b1_id FROM text_versions WHERE text_id = v_text_id AND level = 'B1'; END IF;

  INSERT INTO text_versions (text_id, level, content) VALUES (v_text_id, 'B2', 'Der 65. Jahrestag des Mauerbaus am 13. August 2026 fiel in eine Zeit, in der die Frage nach der Widerstandsfähigkeit demokratischer Institutionen drängender denn je erscheint. Als die DDR-Führung 1961 den Befehl zum Bau der Berliner Mauer erteilte, zementierte sie nicht nur die physische Teilung einer Stadt und eines Landes, sondern schuf ein Symbol für die ideologische Konfrontation des Kalten Krieges, das die Weltpolitik über drei Jahrzehnte hinweg prägen sollte.

In seiner Gedenkrede vor dem ehemaligen Grenzübergang Checkpoint Charlie erinnerte Bundespräsident Steinmeier an die mindestens 140 Todesopfer an der innerdeutschen Grenze und mahnte: Demokratie sei kein gesicherter Zustand, sondern ein fortlaufender Prozess, der das aktive Engagement jeder Generation erfordere.

Diese Mahnung gewinnt vor dem Hintergrund aktueller gesellschaftlicher Entwicklungen an Brisanz. Eine repräsentative Studie der Friedrich-Ebert-Stiftung ergab, dass lediglich 62 Prozent der 18- bis 29-Jährigen die Demokratie als überlegene Regierungsform betrachten – ein deutlicher Rückgang gegenüber 78 Prozent im Jahr 2015. Politikwissenschaftler sehen die Ursachen in einer Kombination aus wirtschaftlicher Unsicherheit, der als unzureichend empfundenen Bewältigung multipler Krisen und der Verbreitung antidemokratischer Narrative in sozialen Medien.

Der Historiker Andreas Wirsching warnt vor einer Verharmlosung der DDR-Diktatur, die sich in Teilen der Gesellschaft beobachten lasse. Die sogenannte Ostalgie – eine nostalgische Verklärung des Lebens in der DDR – untergrabe das Bewusstsein für die systematischen Menschenrechtsverletzungen des Regimes. Bildungsexperten fordern daher eine grundlegende Reform des Geschichtsunterrichts, die persönliche Begegnungen mit Zeitzeugen, digitale Lernformate und den Besuch von Gedenkstätten als feste Bestandteile des Lehrplans vorsieht.') ON CONFLICT DO NOTHING RETURNING id INTO v_version_b2_id;
  IF v_version_b2_id IS NULL THEN SELECT id INTO v_version_b2_id FROM text_versions WHERE text_id = v_text_id AND level = 'B2'; END IF;

  INSERT INTO imk_text_localizations (text_id, language, title, slug, is_published) VALUES
    (v_text_id, 'es', '65 años de la construcción del Muro – ¿Democracia en peligro?', '65-anos-muro-berlin-democracia', true),
    (v_text_id, 'en', '65 Years of the Berlin Wall – Democracy at Risk?', '65-years-berlin-wall-democracy', true),
    (v_text_id, 'fi', '65 vuotta Berliinin muurin rakentamisesta – demokratia uhattuna?', '65-vuotta-berliinin-muuri-demokratia', true),
    (v_text_id, 'it', '65 anni dalla costruzione del Muro – Democrazia a rischio?', '65-anni-muro-berlino-democrazia', true),
    (v_text_id, 'pt', '65 anos da construção do Muro – Democracia em perigo?', '65-anos-muro-berlim-democracia', true)
  ON CONFLICT (text_id, language) DO UPDATE SET title = EXCLUDED.title, slug = EXCLUDED.slug;

  -- A2 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_a2_id, 'es', 'Hace 65 años, en agosto de 1961, la RDA construyó el Muro de Berlín. El muro dividió Alemania en dos partes: Este y Oeste. Las personas del Este ya no podían viajar al Oeste. Muchas familias quedaron separadas. Fue un tiempo muy triste. En noviembre de 1989 cayó el Muro. La gente estaba muy feliz. Hoy Alemania recuerda esa época. En Berlín hay memoriales y museos sobre el Muro. Los políticos advierten: la libertad no es algo que deba darse por sentado. También hoy hay países donde las personas no son libres. La democracia debe ser protegida. Los jóvenes deben aprender la historia para que algo así nunca vuelva a suceder.', true),
    (v_version_a2_id, 'en', '65 years ago, in August 1961, the GDR built the Berlin Wall. The wall divided Germany into two parts: East and West. People in the East could no longer travel to the West. Many families were separated. It was a very sad time. In November 1989, the Wall fell. People were very happy. Today Germany remembers that time. In Berlin there are memorials and museums about the Wall. Politicians warn: freedom is not to be taken for granted. Even today there are countries where people are not free. Democracy must be protected. Young people should learn history so that something like this never happens again.', true),
    (v_version_a2_id, 'fi', '65 vuotta sitten, elokuussa 1961, DDR rakensi Berliinin muurin. Muuri jakoi Saksan kahteen osaan: itään ja länteen. Idän ihmiset eivät voineet enää matkustaa länteen. Monet perheet joutuivat erilleen. Se oli hyvin surullista aikaa. Marraskuussa 1989 muuri kaatui. Ihmiset olivat hyvin onnellisia. Nykyään Saksa muistaa tuon ajan. Berliinissä on muistomerkkejä ja museoita muurista. Poliitikot varoittavat: vapaus ei ole itsestäänselvyys. Myös nykyään on maita, joissa ihmiset eivät ole vapaita. Demokratiaa on suojeltava. Nuorten pitää oppia historiaa, jotta sellaista ei koskaan tapahdu uudelleen.', true),
    (v_version_a2_id, 'it', '65 anni fa, nell''agosto del 1961, la DDR costruì il Muro di Berlino. Il muro divise la Germania in due parti: Est e Ovest. Le persone dell''Est non potevano più viaggiare verso l''Ovest. Molte famiglie furono separate. Fu un periodo molto triste. Nel novembre 1989 il Muro cadde. La gente era molto felice. Oggi la Germania ricorda quel periodo. A Berlino ci sono memoriali e musei sul Muro. I politici avvertono: la libertà non è scontata. Anche oggi ci sono paesi in cui le persone non sono libere. La democrazia deve essere protetta. I giovani devono imparare la storia affinché qualcosa del genere non accada mai più.', true),
    (v_version_a2_id, 'pt', 'Há 65 anos, em agosto de 1961, a RDA construiu o Muro de Berlim. O muro dividiu a Alemanha em duas partes: Leste e Oeste. As pessoas do Leste já não podiam viajar para o Oeste. Muitas famílias ficaram separadas. Foi um tempo muito triste. Em novembro de 1989, o Muro caiu. As pessoas ficaram muito felizes. Hoje a Alemanha recorda essa época. Em Berlim há memoriais e museus sobre o Muro. Os políticos alertam: a liberdade não é algo garantido. Também hoje há países onde as pessoas não são livres. A democracia tem de ser protegida. Os jovens devem aprender a história para que algo assim nunca mais aconteça.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- B1 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b1_id, 'es', 'El 13 de agosto de 1961, hace exactamente 65 años, la RDA comenzó la construcción del Muro de Berlín. De la noche a la mañana se erigió una de las fronteras más brutales de la Guerra Fría, que separó familias y privó a millones de personas de la libertad de movimiento. En los 28 años de su existencia, al menos 140 personas murieron al intentar superar el Muro.

La caída del Muro el 9 de noviembre de 1989 es uno de los momentos más felices de la historia alemana. Cientos de miles de personas cruzaron los pasos fronterizos abiertos. Un año después, Alemania estaba reunificada.

Con motivo del 65 aniversario de la construcción del Muro, se celebraron numerosos actos conmemorativos en Berlín. El presidente federal Steinmeier instó en su discurso a no olvidar las lecciones de la división. Subrayó que la democracia y la libertad no son algo que deba darse por sentado y que deben defenderse a diario.

Particularmente preocupante es que, según una encuesta reciente, solo el 62 por ciento de los jóvenes alemanes considera la democracia como la mejor forma de gobierno. Los expertos en educación reclaman por ello una mayor presencia de la historia de la RDA en la enseñanza escolar.', true),
    (v_version_b1_id, 'en', 'On 13 August 1961, exactly 65 years ago, the GDR began building the Berlin Wall. Overnight, one of the most brutal borders of the Cold War was erected, separating families and denying millions of people freedom of movement. In the 28 years of its existence, at least 140 people died attempting to cross the Wall.

The fall of the Wall on 9 November 1989 is one of the happiest moments in German history. Hundreds of thousands streamed through the opened border crossings. A year later, Germany was reunified.

For the 65th anniversary of the Wall''s construction, numerous commemorative events took place in Berlin. Federal President Steinmeier urged in his speech not to forget the lessons of division. He emphasised that democracy and freedom are not to be taken for granted and must be defended daily.

Particularly concerning is that, according to a recent survey, only 62 percent of young Germans consider democracy the best form of government. Education experts therefore call for a stronger anchoring of GDR history in school curricula.', true),
    (v_version_b1_id, 'fi', 'DDR aloitti Berliinin muurin rakentamisen 13. elokuuta 1961, tasan 65 vuotta sitten. Yhdessä yössä pystytettiin yksi kylmän sodan julmimmista rajoista, joka erotti perheitä ja riisti miljoonilta ihmisiltä matkustusvapauden. Sen 28 olemassaolovuoden aikana vähintään 140 ihmistä kuoli yrittäessään ylittää muurin.

Muurin kaatuminen 9. marraskuuta 1989 on yksi Saksan historian onnellisimmista hetkistä. Sadat tuhannet virtasivat avattujen rajanylityspaikkojen läpi. Vuotta myöhemmin Saksa oli jälleen yhdistynyt.

Muurin rakentamisen 65-vuotisjuhlan kunniaksi Berliinissä järjestettiin lukuisia muistotilaisuuksia. Liittopresidentti Steinmeier kehotti puheessaan olemaan unohtamatta jakautumisen opetuksia. Hän korosti, ettei demokratia ja vapaus ole itsestäänselvyyksiä ja niitä on puolustettava päivittäin.

Erityisen huolestuttavaa on, että tuoreen kyselyn mukaan vain 62 prosenttia nuorista saksalaisista pitää demokratiaa parhaana hallitusmuotona. Koulutusasiantuntijat vaativat siksi DDR:n historian vahvempaa sisällyttämistä kouluopetukseen.', true),
    (v_version_b1_id, 'it', 'Il 13 agosto 1961, esattamente 65 anni fa, la DDR iniziò la costruzione del Muro di Berlino. In una notte fu eretto uno dei confini più brutali della Guerra Fredda, che separò le famiglie e privò milioni di persone della libertà di movimento. Nei 28 anni della sua esistenza, almeno 140 persone morirono nel tentativo di superare il Muro.

La caduta del Muro il 9 novembre 1989 è uno dei momenti più felici della storia tedesca. Centinaia di migliaia di persone attraversarono i valichi di frontiera aperti. Un anno dopo, la Germania era riunificata.

Per il 65° anniversario della costruzione del Muro, a Berlino si sono svolte numerose cerimonie commemorative. Il presidente federale Steinmeier ha esortato nel suo discorso a non dimenticare gli insegnamenti della divisione. Ha sottolineato che la democrazia e la libertà non sono scontate e devono essere difese quotidianamente.

Particolarmente preoccupante è il fatto che, secondo un recente sondaggio, solo il 62 per cento dei giovani tedeschi considera la democrazia la migliore forma di governo. Gli esperti di istruzione chiedono quindi un maggiore radicamento della storia della DDR nell''insegnamento scolastico.', true),
    (v_version_b1_id, 'pt', 'A 13 de agosto de 1961, há exatamente 65 anos, a RDA iniciou a construção do Muro de Berlim. De um dia para o outro, foi erguida uma das fronteiras mais brutais da Guerra Fria, que separou famílias e privou milhões de pessoas da liberdade de circulação. Nos 28 anos da sua existência, pelo menos 140 pessoas morreram ao tentar atravessar o Muro.

A queda do Muro a 9 de novembro de 1989 é um dos momentos mais felizes da história alemã. Centenas de milhares de pessoas atravessaram os postos fronteiriços abertos. Um ano depois, a Alemanha estava reunificada.

Por ocasião do 65.º aniversário da construção do Muro, realizaram-se em Berlim numerosos eventos comemorativos. O Presidente Federal Steinmeier apelou no seu discurso a não esquecer as lições da divisão. Sublinhou que a democracia e a liberdade não são algo garantido e devem ser defendidas diariamente.

Particularmente preocupante é o facto de, segundo um inquérito recente, apenas 62 por cento dos jovens alemães considerar a democracia a melhor forma de governo. Os especialistas em educação exigem por isso uma presença mais forte da história da RDA no ensino escolar.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- B2 translations
  INSERT INTO imk_version_localizations (text_version_id, language, content, is_published) VALUES
    (v_version_b2_id, 'es', 'El 65 aniversario de la construcción del Muro el 13 de agosto de 2026 coincidió con un momento en que la cuestión de la resiliencia de las instituciones democráticas parece más urgente que nunca. Cuando la dirección de la RDA dio la orden de construir el Muro de Berlín en 1961, no solo cimentó la división física de una ciudad y un país, sino que creó un símbolo de la confrontación ideológica de la Guerra Fría que marcaría la política mundial durante más de tres décadas.

En su discurso conmemorativo ante el antiguo paso fronterizo de Checkpoint Charlie, el presidente federal Steinmeier recordó a las al menos 140 víctimas mortales en la frontera interalemana e advirtió: la democracia no es un estado garantizado, sino un proceso continuo que requiere el compromiso activo de cada generación.

Esta advertencia cobra especial relevancia en el contexto de las actuales tendencias sociales. Un estudio representativo de la Fundación Friedrich Ebert reveló que apenas el 62 por ciento de los jóvenes entre 18 y 29 años considera la democracia como una forma de gobierno superior, un descenso notable respecto al 78 por ciento de 2015.

El historiador Andreas Wirsching advierte de una trivialización de la dictadura de la RDA observable en partes de la sociedad. Los expertos en educación reclaman una reforma fundamental de la enseñanza de la historia que incluya encuentros personales con testigos de la época, formatos de aprendizaje digital y la visita a memoriales como componentes fijos del currículo.', true),
    (v_version_b2_id, 'en', 'The 65th anniversary of the Wall''s construction on 13 August 2026 fell at a time when the question of the resilience of democratic institutions appears more pressing than ever. When the GDR leadership gave the order to build the Berlin Wall in 1961, it not only cemented the physical division of a city and a country but created a symbol of the Cold War''s ideological confrontation that would shape world politics for over three decades.

In his commemorative address at the former Checkpoint Charlie border crossing, Federal President Steinmeier remembered the at least 140 victims who died at the inner-German border and warned: democracy is not an assured state but an ongoing process that requires the active engagement of every generation.

This warning gains particular urgency against the backdrop of current social developments. A representative study by the Friedrich Ebert Foundation found that only 62 percent of 18- to 29-year-olds consider democracy a superior form of government — a marked decline from 78 percent in 2015.

Historian Andreas Wirsching warns of a trivialisation of the GDR dictatorship observable in parts of society. Education experts call for a fundamental reform of history teaching that includes personal encounters with contemporary witnesses, digital learning formats and visits to memorial sites as fixed components of the curriculum.', true),
    (v_version_b2_id, 'fi', 'Muurin rakentamisen 65-vuotispäivä 13. elokuuta 2026 osui aikaan, jolloin demokraattisten instituutioiden kestävyyden kysymys vaikuttaa kiireellisemmältä kuin koskaan. Kun DDR:n johto antoi vuonna 1961 käskyn Berliinin muurin rakentamisesta, se ei ainoastaan betonoinut kaupungin ja maan fyysistä jakautumista vaan loi kylmän sodan ideologisen vastakkainasettelun symbolin, joka muokkaisi maailmanpolitiikkaa yli kolmen vuosikymmenen ajan.

Muistopuheessaan entisen rajanylityspaikan Checkpoint Charlien edessä liittopresidentti Steinmeier muisti vähintään 140 kuolonuhria Saksojen välisellä rajalla ja varoitti: demokratia ei ole turvattu tila vaan jatkuva prosessi, joka vaatii jokaisen sukupolven aktiivista sitoutumista.

Varoitus saa erityistä ajankohtaisuutta nykyisten yhteiskunnallisten kehitysten taustaa vasten. Friedrich Ebert -säätiön edustava tutkimus osoitti, että vain 62 prosenttia 18–29-vuotiaista pitää demokratiaa ylivoimaisena hallitusmuotona – selvä lasku vuoden 2015 78 prosentista.

Koulutusasiantuntijat vaativat perusteellista historianopetuksen uudistusta, jossa henkilökohtaiset kohtaamiset aikalaistodistajien kanssa, digitaaliset oppimismuodot ja muistomerkkien vierailut ovat opetussuunnitelman kiinteitä osia.', true),
    (v_version_b2_id, 'it', 'Il 65° anniversario della costruzione del Muro il 13 agosto 2026 è caduto in un momento in cui la questione della resilienza delle istituzioni democratiche appare più urgente che mai. Quando la dirigenza della DDR diede l''ordine di costruire il Muro di Berlino nel 1961, non solo cementò la divisione fisica di una città e di un paese, ma creò un simbolo del confronto ideologico della Guerra Fredda che avrebbe segnato la politica mondiale per oltre tre decenni.

Nel suo discorso commemorativo davanti all''ex posto di frontiera Checkpoint Charlie, il presidente federale Steinmeier ha ricordato le almeno 140 vittime al confine intertedeschi e ha ammonito: la democrazia non è uno stato garantito, ma un processo continuo che richiede l''impegno attivo di ogni generazione.

Questo ammonimento acquista particolare urgenza sullo sfondo degli sviluppi sociali attuali. Uno studio rappresentativo della Fondazione Friedrich Ebert ha rilevato che solo il 62 per cento dei giovani tra 18 e 29 anni considera la democrazia una forma di governo superiore — un calo significativo rispetto al 78 per cento del 2015.

Gli esperti di istruzione chiedono una riforma fondamentale dell''insegnamento della storia che preveda incontri personali con testimoni dell''epoca, formati di apprendimento digitali e visite a luoghi commemorativi come componenti fisse del programma scolastico.', true),
    (v_version_b2_id, 'pt', 'O 65.º aniversário da construção do Muro a 13 de agosto de 2026 coincidiu com um momento em que a questão da resiliência das instituições democráticas parece mais premente do que nunca. Quando a liderança da RDA deu a ordem para construir o Muro de Berlim em 1961, não apenas cimentou a divisão física de uma cidade e de um país, mas criou um símbolo da confrontação ideológica da Guerra Fria que marcaria a política mundial durante mais de três décadas.

No seu discurso comemorativo junto ao antigo posto fronteiriço de Checkpoint Charlie, o Presidente Federal Steinmeier recordou as pelo menos 140 vítimas mortais na fronteira interalemã e alertou: a democracia não é um estado garantido, mas um processo contínuo que exige o empenho ativo de cada geração.

Este alerta ganha particular urgência face às atuais tendências sociais. Um estudo representativo da Fundação Friedrich Ebert revelou que apenas 62 por cento dos jovens entre 18 e 29 anos consideram a democracia uma forma de governo superior — um declínio acentuado face aos 78 por cento de 2015.

Os especialistas em educação exigem uma reforma fundamental do ensino da história que preveja encontros pessoais com testemunhas da época, formatos de aprendizagem digitais e visitas a memoriais como componentes fixos do currículo.', true)
  ON CONFLICT (text_version_id, language) DO UPDATE SET content = EXCLUDED.content;

  -- History/Society vocabulary (20 words)
  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Mauer', 'mauer', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el muro', 'el muro', 'Die Berliner Mauer wurde 1961 gebaut.', 'El Muro de Berlín fue construido en 1961.', 'wall', 'muuri') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el muro'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'wall'), (v_meaning_id, 'fi', 'muuri'), (v_meaning_id, 'it', 'il muro'), (v_meaning_id, 'pt', 'o muro') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el muro", "level": "a2", "category": "history"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Demokratie', 'demokratie', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la democracia', 'la democracia', 'Die Demokratie muss geschützt werden.', 'La democracia debe ser protegida.', 'democracy', 'demokratia') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la democracia'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'democracy'), (v_meaning_id, 'fi', 'demokratia'), (v_meaning_id, 'it', 'la democrazia'), (v_meaning_id, 'pt', 'a democracia') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la democracia", "level": "a2", "category": "politics"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Freiheit', 'freiheit', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la libertad', 'la libertad', 'Freiheit ist keine Selbstverständlichkeit.', 'La libertad no es algo que deba darse por sentado.', 'freedom', 'vapaus') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la libertad'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'freedom'), (v_meaning_id, 'fi', 'vapaus'), (v_meaning_id, 'it', 'la libertà'), (v_meaning_id, 'pt', 'a liberdade') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la libertad", "level": "a2", "category": "society"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Grenze', 'grenze', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la frontera', 'la frontera', 'Die Grenze war gefährlich.', 'La frontera era peligrosa.', 'border', 'raja') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la frontera'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'border'), (v_meaning_id, 'fi', 'raja'), (v_meaning_id, 'it', 'il confine'), (v_meaning_id, 'pt', 'a fronteira') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la frontera", "level": "a2", "category": "geography"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Teilung', 'teilung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la división', 'la división', 'Die Teilung Deutschlands dauerte 28 Jahre.', 'La división de Alemania duró 28 años.', 'division', 'jakautuminen') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la división'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'division'), (v_meaning_id, 'fi', 'jakautuminen'), (v_meaning_id, 'it', 'la divisione'), (v_meaning_id, 'pt', 'a divisão') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la división", "level": "b1", "category": "history"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Wiedervereinigung', 'wiedervereinigung', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la reunificación', 'la reunificación', 'Die Wiedervereinigung war 1990.', 'La reunificación fue en 1990.', 'reunification', 'yhdistyminen') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la reunificación'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'reunification'), (v_meaning_id, 'fi', 'yhdistyminen'), (v_meaning_id, 'it', 'la riunificazione'), (v_meaning_id, 'pt', 'a reunificação') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la reunificación", "level": "b1", "category": "history"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Gedenkstätte', 'gedenkstätte', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'el memorial', 'el memorial', 'In Berlin gibt es viele Gedenkstätten.', 'En Berlín hay muchos memoriales.', 'memorial', 'muistomerkki') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'el memorial'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'memorial'), (v_meaning_id, 'fi', 'muistomerkki'), (v_meaning_id, 'it', 'il memoriale'), (v_meaning_id, 'pt', 'o memorial') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "el memorial", "level": "b1", "category": "culture"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('die Diktatur', 'diktatur', 'die', 'Nomen') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'la dictadura', 'la dictadura', 'Die DDR war eine Diktatur.', 'La RDA era una dictadura.', 'dictatorship', 'diktatuuri') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'la dictadura'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'dictatorship'), (v_meaning_id, 'fi', 'diktatuuri'), (v_meaning_id, 'it', 'la dittatura'), (v_meaning_id, 'pt', 'a ditadura') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;
  INSERT INTO app_vocabulary_lemmas (app_key, lemma_id, is_active, metadata) VALUES ('der-die-das', v_lemma_id, true, '{"translation": "la dictadura", "level": "b2", "category": "politics"}') ON CONFLICT (app_key, lemma_id) DO UPDATE SET metadata = EXCLUDED.metadata;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('verteidigen', 'verteidigen', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'defender', 'defender', 'Demokratie muss täglich verteidigt werden.', 'La democracia debe defenderse cada día.', 'to defend', 'puolustaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'defender'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to defend'), (v_meaning_id, 'fi', 'puolustaa'), (v_meaning_id, 'it', 'difendere'), (v_meaning_id, 'pt', 'defender') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

  INSERT INTO vocabulary_lemmas (german, normalized_german, article, word_type) VALUES ('erinnern', 'erinnern', NULL, 'Verb') ON CONFLICT (normalized_german, word_type, article) DO UPDATE SET german = EXCLUDED.german RETURNING id INTO v_lemma_id;
  INSERT INTO vocabulary_meanings (lemma_id, spanish, normalized_spanish, example, example_es, english, fi) VALUES (v_lemma_id, 'recordar', 'recordar', 'Wir erinnern uns an die Mauer.', 'Recordamos el Muro.', 'to remember', 'muistaa') ON CONFLICT (lemma_id, normalized_spanish) DO UPDATE SET example = EXCLUDED.example, example_es = EXCLUDED.example_es, english = EXCLUDED.english, fi = EXCLUDED.fi RETURNING id INTO v_meaning_id;
  IF v_meaning_id IS NULL THEN SELECT id INTO v_meaning_id FROM vocabulary_meanings WHERE lemma_id = v_lemma_id AND normalized_spanish = 'recordar'; END IF;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_a2_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO text_version_meanings (text_version_id, meaning_id) VALUES (v_version_b1_id, v_meaning_id) ON CONFLICT DO NOTHING;
  INSERT INTO imk_meaning_localizations (meaning_id, language, term) VALUES (v_meaning_id, 'en', 'to remember'), (v_meaning_id, 'fi', 'muistaa'), (v_meaning_id, 'it', 'ricordare'), (v_meaning_id, 'pt', 'recordar') ON CONFLICT (meaning_id, language) DO UPDATE SET term = EXCLUDED.term;
  INSERT INTO app_vocabulary_meanings (app_key, meaning_id, is_active) VALUES ('vokabellab', v_meaning_id, true) ON CONFLICT (app_key, meaning_id) DO NOTHING;

END $$;


COMMIT;

-- Verification query
SELECT t.title, tv.level, count(tvm.meaning_id) as vocab_count
FROM texts t
JOIN text_versions tv ON tv.text_id = t.id
JOIN text_version_meanings tvm ON tvm.text_version_id = tv.id
WHERE t.id > 52
GROUP BY t.title, tv.level
ORDER BY t.title, tv.level;
