import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import { fixtureDB } from './helpers/database.mjs';

const migration=await fs.readFile(new URL('../backend/sql/011_add_content_localizations.sql',import.meta.url),'utf8').catch(e=>{if(e.code==='ENOENT')return '';throw e;});
async function germanSnapshot(db){const rows={};for(const table of ['texts','text_versions','vocabulary_meanings','vocabulario','text_version_meanings'])rows[table]=(await db.query(`SELECT to_jsonb(t) AS row FROM ${table} t ORDER BY to_jsonb(t)::text`)).rows;return rows;}

test('new localization records leave every original German row intact and migration reruns safely',async()=>{
 const db=await fixtureDB();try{
  const before=await germanSnapshot(db);
  await db.exec(`INSERT INTO imk_text_localizations(text_id,language,title,slug,topic) VALUES(5,'fi','On kuuma','hitze','Yhteiskunta');
   INSERT INTO imk_version_localizations(text_version_id,language,content) VALUES(17,'fi','Helteet jatkuvat.');
   INSERT INTO imk_meaning_localizations(meaning_id,language,term,example,word_type) VALUES(101,'fi','helle','Helteet jatkuvat.','noun');`);
  await db.exec(migration);
  assert.deepEqual(await germanSnapshot(db),before);
  assert.equal((await db.query('SELECT count(*)::int AS n FROM imk_text_localizations')).rows[0].n,1);
 }finally{await db.close();}
});
test('localization constraints reject German locale, missing parents, duplicates and Finnish articles',async()=>{
 const db=await fixtureDB();try{
  await assert.rejects(db.exec("INSERT INTO imk_text_localizations(text_id,language,title,slug) VALUES(5,'de','Neu','neu')"),/check constraint/);
  await assert.rejects(db.exec("INSERT INTO imk_text_localizations(text_id,language,title,slug) VALUES(999,'en','Heat','heat')"),/foreign key/);
  await db.exec("INSERT INTO imk_text_localizations(text_id,language,title,slug) VALUES(5,'en','Heat','heat')");
  await assert.rejects(db.exec("INSERT INTO imk_text_localizations(text_id,language,title,slug) VALUES(5,'en','Heat','heat')"),/unique/);
  await assert.rejects(db.exec("INSERT INTO imk_meaning_localizations(meaning_id,language,term,example,article) VALUES(101,'fi','helle','Helteet jatkuvat.','der')"),/check constraint/);
 }finally{await db.close();}
});
test('new policies inherit parent visibility and grant readers no write access',async()=>{
 const db=await fixtureDB();try{
  await db.exec("INSERT INTO imk_text_localizations(text_id,language,title,slug) VALUES(5,'en','Heat','heat'),(6,'en','Private','private'); INSERT INTO imk_version_localizations(text_version_id,language,content) VALUES(17,'en','Heat continues.'),(18,'en','Private.'); INSERT INTO imk_meaning_localizations(meaning_id,language,term,example) VALUES(101,'en','heat','Heat continues.'),(102,'en','private','Private.'); SET ROLE anon;");
  assert.deepEqual((await db.query('SELECT text_id FROM imk_text_localizations')).rows,[{text_id:5}]);
  assert.deepEqual((await db.query('SELECT text_version_id FROM imk_version_localizations')).rows,[{text_version_id:17}]);
  assert.deepEqual((await db.query('SELECT meaning_id FROM imk_meaning_localizations')).rows,[{meaning_id:101}]);
  await assert.rejects(db.exec("INSERT INTO imk_text_localizations(text_id,language,title,slug) VALUES(5,'it','Caldo','caldo')"),/permission denied/);
 }finally{await db.close();}
});
