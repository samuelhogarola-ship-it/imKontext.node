-- Update text_version_vocabulary_core view to support both legacy vocabulario
-- and new localization tables (imk_meaning_localizations)
CREATE OR REPLACE VIEW text_version_vocabulary_core AS
SELECT
  tvm.text_version_id,
  vm.id,
  vl.german,
  vm.spanish,
  vl.article,
  vl.word_type,
  COALESCE(vl.plural, leg.plural_form) AS plural_form,
  vl.conjugation ->> 'infinitive' AS infinitive,
  vl.conjugation ->> 'past_simple' AS past_simple,
  vl.conjugation ->> 'past_participle' AS past_participle,
  vm.example AS example_sentence_de,
  vm.example_es AS example_sentence_es,
  vm.level,
  COALESCE(vm.english, leg.english) AS english,
  COALESCE(vm.fi, leg.finnish) AS finnish,
  COALESCE(loc_it.term, leg.italian) AS italian,
  COALESCE(loc_pt.term, leg.portuguese) AS portuguese,
  COALESCE(loc_en.example, leg.example_sentence_en) AS example_sentence_en,
  COALESCE(loc_fi.example, leg.example_sentence_fi) AS example_sentence_fi,
  COALESCE(loc_it.example, leg.example_sentence_it) AS example_sentence_it,
  COALESCE(loc_pt.example, leg.example_sentence_pt) AS example_sentence_pt
FROM text_version_meanings tvm
JOIN vocabulary_meanings vm ON vm.id = tvm.meaning_id
JOIN vocabulary_lemmas vl ON vl.id = vm.lemma_id
LEFT JOIN vocabulario leg ON leg.id = vm.legacy_vocabulario_id
LEFT JOIN imk_meaning_localizations loc_en ON loc_en.meaning_id = vm.id AND loc_en.language = 'en'
LEFT JOIN imk_meaning_localizations loc_fi ON loc_fi.meaning_id = vm.id AND loc_fi.language = 'fi'
LEFT JOIN imk_meaning_localizations loc_it ON loc_it.meaning_id = vm.id AND loc_it.language = 'it'
LEFT JOIN imk_meaning_localizations loc_pt ON loc_pt.meaning_id = vm.id AND loc_pt.language = 'pt';
