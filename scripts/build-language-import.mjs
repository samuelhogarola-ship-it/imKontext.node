import fs from 'node:fs/promises';
import path from 'node:path';
import { pathToFileURL } from 'node:url';

const languages=['es','en','fi','it','pt'];
const grammar=['article','word_type','plural_form','infinitive','past_simple','past_participle'];
const articles={es:['el','la','los','las'],en:[],fi:[],it:['il','lo','la','l’',"l'",'i','gli','le'],pt:['o','a','os','as']};
function fail(message){throw new Error(message);}
function string(value,label){if(typeof value!=='string'||!value.trim()||value.includes('\0'))fail(`Invalid ${label}`);}
function sameIds(rows,key,expected,label){
 if(!Array.isArray(rows)||rows.length!==expected.length)fail(`Incomplete ${label}`);
 const wanted=new Set(expected.map(x=>String(x.id))),seen=new Set();
 for(const row of rows){const id=String(row[key]);if(!wanted.has(id)||seen.has(id))fail(`Invalid or duplicate ${label} ID ${id}`);seen.add(id);}
}
export function validateLocalizations(documents,source){
 if(!Array.isArray(source.links))fail('Source links are required');
 if(!Array.isArray(documents)||!documents.length)fail('No localization documents');
 const seen=new Set(),versions=new Map(source.versions.map(v=>[String(v.id),v])),meanings=new Map(source.meanings.map(m=>[String(m.id),m]));
 for(const doc of documents){
  if(!languages.includes(doc.language)||seen.has(doc.language))fail('Invalid or duplicate learning language');seen.add(doc.language);
  sameIds(doc.texts,'text_id',source.texts,'texts');sameIds(doc.versions,'text_version_id',source.versions,'versions');sameIds(doc.meanings,'meaning_id',source.meanings,'meanings');
  const slugs=new Set();
  for(const row of doc.texts){string(row.title,'title');string(row.slug,'slug');if(slugs.has(row.slug))fail('Duplicate slug');slugs.add(row.slug);if(row.topic!=null)string(row.topic,'topic');}
  for(const row of doc.versions){string(row.content,'content');if(row.content.trim()===versions.get(String(row.text_version_id)).content.trim())fail('German content relabelled');}
  for(const row of doc.meanings){
   string(row.term,'term');string(row.example,'example');const original=meanings.get(String(row.meaning_id));
   if(row.example.trim()===original.example_sentence_de?.trim()&&!(doc.language==='es'&&row.example_source_language==='es'&&original.example_language==='es'))fail('German example relabelled');
   if(doc.language==='en'&&original.existing_english&&row.term!==original.existing_english)fail('Canonical English term changed');
   if(doc.language==='es'&&row.term!==original.spanish)fail('Canonical Spanish term changed');
   for(const key of grammar)if(row[key]!=null)string(row[key],key);
   if(row.article!=null&&!articles[doc.language].includes(row.article))fail('Invalid target article');
  }
 }
 return documents;
}
function literal(value){const json=JSON.stringify(value);let tag='$imk_json$';while(json.includes(tag))tag=tag.replace(/\$$/,'x$');return `${tag}${json}${tag}::jsonb`;}
export function buildImportSQL(documents,source){
 validateLocalizations(documents,source);
 let guard='$imk_guard$';while(JSON.stringify(source).includes(guard))guard=guard.replace(/\$$/,'x$');
 const texts=documents.flatMap(d=>d.texts.map(r=>({...r,language:d.language})));
 const versions=documents.flatMap(d=>d.versions.map(r=>({...r,language:d.language})));
 const meanings=documents.flatMap(d=>d.meanings.map(r=>({...r,language:d.language})));
 return `-- Generated additive import. Existing German rows and reviewed translations are preserved.
BEGIN;
DO ${guard}
BEGIN
 IF EXISTS (SELECT 1 FROM jsonb_to_recordset(${literal(source.texts)}) s(id bigint,title text,slug text) LEFT JOIN public.texts t ON t.id=s.id WHERE t.id IS NULL OR t.title IS DISTINCT FROM s.title OR t.slug IS DISTINCT FROM s.slug) THEN RAISE EXCEPTION 'Source texts changed; export and review again'; END IF;
 IF EXISTS (SELECT 1 FROM jsonb_to_recordset(${literal(source.versions)}) s(id bigint,text_id bigint,level text,content text) LEFT JOIN public.text_versions v ON v.id=s.id WHERE v.id IS NULL OR v.text_id IS DISTINCT FROM s.text_id OR v.level IS DISTINCT FROM s.level OR v.content IS DISTINCT FROM s.content) THEN RAISE EXCEPTION 'Source versions changed; export and review again'; END IF;
 IF EXISTS (SELECT 1 FROM jsonb_to_recordset(${literal(source.meanings.map(m=>({id:m.id,spanish:m.spanish,english:m.existing_english,fi:m.existing_finnish,example:m.example_sentence_de,example_es:m.example_sentence_es,lemma_id:m.lemma_id})))}) s(id bigint,spanish text,english text,fi text,example text,example_es text,lemma_id bigint) LEFT JOIN public.vocabulary_meanings m ON m.id=s.id WHERE m.id IS NULL OR m.spanish IS DISTINCT FROM s.spanish OR m.english IS DISTINCT FROM s.english OR m.fi IS DISTINCT FROM s.fi OR m.example IS DISTINCT FROM s.example OR m.example_es IS DISTINCT FROM s.example_es OR m.lemma_id IS DISTINCT FROM s.lemma_id) THEN RAISE EXCEPTION 'Source meanings changed; export and review again'; END IF;
 IF EXISTS (SELECT 1 FROM jsonb_to_recordset(${literal(source.meanings.filter(m=>Object.hasOwn(m,'article')&&Object.hasOwn(m,'word_type')).map(m=>({id:m.id,german:m.german,article:m.article,word_type:m.word_type})))}) s(id bigint,german text,article text,word_type text) WHERE NOT EXISTS(SELECT 1 FROM public.text_version_vocabulary_core c WHERE c.id=s.id AND c.german IS NOT DISTINCT FROM s.german AND c.article IS NOT DISTINCT FROM s.article AND c.word_type IS NOT DISTINCT FROM s.word_type)) THEN RAISE EXCEPTION 'Source vocabulary changed; export and review again'; END IF;
 IF EXISTS (SELECT 1 FROM jsonb_to_recordset(${literal(source.links)}) e(text_version_id bigint,meaning_id bigint) FULL JOIN (SELECT text_version_id,meaning_id FROM public.text_version_meanings WHERE text_version_id IN(SELECT value::bigint FROM jsonb_array_elements_text(${literal(source.versions.map(v=>v.id))}))) a USING(text_version_id,meaning_id) WHERE e.meaning_id IS NULL OR a.meaning_id IS NULL) THEN RAISE EXCEPTION 'Source links changed; export and review again'; END IF;
END
${guard};
INSERT INTO public.imk_text_localizations(text_id,language,title,slug,topic)
 SELECT text_id,language,title,slug,topic FROM jsonb_to_recordset(${literal(texts)}) AS r(text_id bigint,language text,title text,slug text,topic text) ON CONFLICT DO NOTHING;
INSERT INTO public.imk_version_localizations(text_version_id,language,content)
 SELECT text_version_id,language,content FROM jsonb_to_recordset(${literal(versions)}) AS r(text_version_id bigint,language text,content text) ON CONFLICT DO NOTHING;
INSERT INTO public.imk_meaning_localizations(meaning_id,language,term,example,article,word_type,plural_form,infinitive,past_simple,past_participle)
 SELECT meaning_id,language,term,example,article,word_type,plural_form,infinitive,past_simple,past_participle FROM jsonb_to_recordset(${literal(meanings)}) AS r(meaning_id bigint,language text,term text,example text,article text,word_type text,plural_form text,infinitive text,past_simple text,past_participle text) ON CONFLICT DO NOTHING;
COMMIT;
`;
}
if(process.argv[1]&&import.meta.url===pathToFileURL(path.resolve(process.argv[1])).href){
 const [sourceFile,outputDirectory,...files]=process.argv.slice(2);
 if(!sourceFile||!outputDirectory||!files.length)throw new Error('Usage: node scripts/build-language-import.mjs source.json output-directory locale.json ...');
 const source=JSON.parse(await fs.readFile(sourceFile,'utf8'));
 const docs=await Promise.all(files.map(async f=>JSON.parse(await fs.readFile(f,'utf8'))));validateLocalizations(docs,source);
 await fs.mkdir(outputDirectory,{recursive:true});
 for(const doc of docs){const file=path.join(outputDirectory,`import-${doc.language}.sql`);await fs.writeFile(file,buildImportSQL([doc],source));process.stdout.write(`${doc.language}: ${doc.texts.length} texts, ${doc.versions.length} versions, ${doc.meanings.length} meanings → ${file}\n`);}
}
