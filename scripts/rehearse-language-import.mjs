// Disposable local database only. Never connects to production.
import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import { PGlite } from '@electric-sql/pglite';
import { buildImportSQL } from './build-language-import.mjs';
import { createLocalizedService, registerLocalizedRoutes } from '../server/localized-routes.js';

const [sourceDirectory,outputFile,...localeFiles]=process.argv.slice(2);
if(!sourceDirectory||!outputFile||!localeFiles.length)throw new Error('Usage: node scripts/rehearse-language-import.mjs export-directory report.json locale.json ...');
const read=async name=>JSON.parse(await fs.readFile(path.join(sourceDirectory,name),'utf8'));
const source=await read('translation-source.json');
const [texts,versions,meanings,legacy,core,documents]=await Promise.all([
 read('german-texts.json'),read('german-versions.json'),read('german-meanings.json'),read('german-vocabulario.json'),read('german-vocabulary.json'),
 Promise.all(localeFiles.map(async f=>JSON.parse(await fs.readFile(f,'utf8'))))
]);
const db=new PGlite();
try{
 await db.exec(`CREATE ROLE anon; CREATE ROLE authenticated;
 CREATE TABLE texts(id bigint PRIMARY KEY,title text,slug text,topic text,categoria text,access_status text,published_at timestamptz,raw jsonb);
 CREATE TABLE text_versions(id bigint PRIMARY KEY,text_id bigint REFERENCES texts,level text,content text,raw jsonb);
 CREATE TABLE vocabulary_meanings(id bigint PRIMARY KEY,spanish text,english text,fi text,example text,example_es text,lemma_id bigint,raw jsonb);
 CREATE TABLE vocabulario(id bigint PRIMARY KEY,raw jsonb);
 CREATE TABLE text_version_meanings(text_version_id bigint REFERENCES text_versions,meaning_id bigint REFERENCES vocabulary_meanings,PRIMARY KEY(text_version_id,meaning_id));
 CREATE TABLE rehearsal_core(raw jsonb);
 ALTER TABLE texts ENABLE ROW LEVEL SECURITY; CREATE POLICY texts_select_anon ON texts FOR SELECT TO anon USING(true); CREATE POLICY texts_select_authenticated ON texts FOR SELECT TO authenticated USING(true);
 GRANT SELECT ON texts,text_versions,vocabulary_meanings,vocabulario,text_version_meanings,rehearsal_core TO anon,authenticated;
 `);
 for(const row of texts)await db.query('INSERT INTO texts VALUES($1,$2,$3,$4,$5,$6,$7,$8)',[row.id,row.title,row.slug,row.topic,row.categoria,row.access_status,row.published_at,row]);
 for(const row of versions)await db.query('INSERT INTO text_versions VALUES($1,$2,$3,$4,$5)',[row.id,row.text_id,row.level,row.content,row]);
 for(const row of meanings)await db.query('INSERT INTO vocabulary_meanings VALUES($1,$2,$3,$4,$5,$6,$7,$8)',[row.id,row.spanish,row.english,row.fi,row.example,row.example_es,row.lemma_id,row]);
 for(const row of legacy)await db.query('INSERT INTO vocabulario VALUES($1,$2)',[row.id,row]);
 for(const row of core){await db.query('INSERT INTO rehearsal_core VALUES($1)',[row]);await db.query('INSERT INTO text_version_meanings VALUES($1,$2) ON CONFLICT DO NOTHING',[row.text_version_id,row.id]);}
 const columns='text_version_id bigint,id bigint,german text,spanish text,article text,word_type text,plural_form text,infinitive text,past_simple text,past_participle text,example_sentence_de text,example_sentence_es text,level text,english text,finnish text,italian text,portuguese text,example_sentence_en text,example_sentence_fi text,example_sentence_it text,example_sentence_pt text';
 await db.exec(`CREATE VIEW text_version_vocabulary_core AS SELECT r.* FROM rehearsal_core c CROSS JOIN LATERAL jsonb_to_record(c.raw) AS r(${columns}); GRANT SELECT ON text_version_vocabulary_core TO anon,authenticated;`);
 const originals=['texts','text_versions','vocabulary_meanings','vocabulario','text_version_meanings'];
 const snapshot=async()=>{const result={};for(const table of originals){const rows=(await db.query(`SELECT to_jsonb(t) AS row FROM ${table} t ORDER BY to_jsonb(t)::text`)).rows;result[table]={count:rows.length,sha256:crypto.createHash('sha256').update(JSON.stringify(rows)).digest('hex')};}return result;};
 const before=await snapshot();
 const migration=await fs.readFile(new URL('../backend/sql/011_add_content_localizations.sql',import.meta.url),'utf8');
 await db.exec(migration);
 const sql=buildImportSQL(documents,source);await db.exec(sql);await db.exec(migration);await db.exec(sql);
 assert.deepEqual(await snapshot(),before,'Original data changed');
 const counts={};for(const table of ['imk_text_localizations','imk_version_localizations','imk_meaning_localizations'])counts[table]=(await db.query(`SELECT language,count(*)::int AS count FROM ${table} GROUP BY language ORDER BY language`)).rows;
 await db.exec('SET ROLE anon');
 const fetchRows=async route=>{
  const url=new URL(route,'http://rehearsal.local'),table=url.pathname.slice(1);
  assert.match(table,/^(texts|text_versions|text_version_meanings|text_version_vocabulary_core|imk_text_localizations|imk_version_localizations|imk_meaning_localizations)$/);
  const select=url.searchParams.get('select')||'*';assert.match(select,/^(\*|[a-z_,]+)$/);
  const filters=[],params=[];
  for(const [key,value]of url.searchParams){if(['select','order','limit','offset'].includes(key))continue;assert.match(key,/^[a-z_]+$/);if(value.startsWith('eq.')){params.push(value.slice(3));filters.push(`${key}=$${params.length}`);}else if(value.startsWith('in.(')){const values=value.slice(4,-1).split(',');const placeholders=values.map(v=>{params.push(v);return `$${params.length}`;});filters.push(`${key} IN (${placeholders})`);}else throw new Error('Unsupported rehearsal filter');}
  const limit=Number(url.searchParams.get('limit')||1000),offset=Number(url.searchParams.get('offset')||0);assert.ok(Number.isSafeInteger(limit)&&Number.isSafeInteger(offset));
  return (await db.query(`SELECT ${select} FROM ${table}${filters.length?' WHERE '+filters.join(' AND '):''} LIMIT ${limit} OFFSET ${offset}`,params)).rows;
 };
 const service=createLocalizedService(fetchRows),catalogs={};
 for(const doc of documents){
  const catalog=await service.catalog(doc.language);const linkedVersions=new Set(core.map(w=>w.text_version_id)),readyTexts=new Set(versions.filter(v=>linkedVersions.has(v.id)).map(v=>v.text_id));assert.equal(catalog.length,readyTexts.size);
  let checkedVersions=0,checkedWords=0;
  for(const version of versions){
   const [localized]=await service.versions(doc.language,version.text_id,version.level);assert.equal(localized.id,version.id);assert.notEqual(localized.content,version.content);
   const words=await service.vocabulary(doc.language,version.id,doc.language==='es'?'de':'es');const expected=core.filter(w=>w.text_version_id===version.id);assert.equal(words.length,expected.length);
   assert.ok(words.every(w=>w.target_word&&w.native_word&&w.target_example&&w.native_example));if(['en','fi'].includes(doc.language))assert.ok(words.every(w=>w.article===null));checkedVersions++;checkedWords+=words.length;
  }
  catalogs[doc.language]={texts:catalog.length,versions:checkedVersions,vocabularyLinks:checkedWords};
 }
 await db.exec('RESET ROLE');assert.deepEqual(await snapshot(),before);
 const report={database:'Disposable in-memory PostgreSQL (PGlite)',productionWrites:0,migrationAndImportRuns:2,originalsUnchanged:true,originals:before,counts,catalogs};
 await fs.mkdir(path.dirname(outputFile),{recursive:true});await fs.writeFile(outputFile,JSON.stringify(report,null,2)+'\n');process.stdout.write(JSON.stringify(report,null,2)+'\n');
 // Optional short-lived browser rehearsal, serving only the additive language API.
 if(process.env.IMK_REHEARSAL_PORT){
  const port=Number(process.env.IMK_REHEARSAL_PORT);assert.ok(Number.isSafeInteger(port)&&port>0&&port<65536);
  const {default:express}=await import('express');const app=express();
  await db.exec('SET ROLE anon');registerLocalizedRoutes(app,fetchRows);
  const frontend=path.resolve(new URL('../imKontext',import.meta.url).pathname);
  app.use(express.static(frontend));app.get('*',(req,res)=>res.sendFile(path.join(frontend,'index.html')));
  const server=await new Promise(resolve=>{const listener=app.listen(port,'127.0.0.1',()=>resolve(listener));});
  process.stdout.write(`Local rehearsal ready: http://127.0.0.1:${port}\n`);
  await new Promise(resolve=>{const stop=()=>server.close(resolve);process.once('SIGTERM',stop);process.once('SIGINT',stop);});
 }
}finally{await db.close();}
