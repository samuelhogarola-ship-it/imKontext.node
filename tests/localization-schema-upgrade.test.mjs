import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import { PGlite } from '@electric-sql/pglite';
const migration = await fs.readFile(new URL('../backend/sql/011_add_content_localizations.sql', import.meta.url), 'utf8');
const existing = await fs.readFile(new URL('../supabase/migrations/20261026_create_imk_localization_tables.sql', import.meta.url), 'utf8');
test('upgrades the live localization shape additively and preserves existing published content on rerun', async () => {
 const db = new PGlite();
 try {
  await db.exec(`CREATE ROLE anon; CREATE ROLE authenticated;
   CREATE TABLE texts(id bigint PRIMARY KEY); CREATE TABLE text_versions(id bigint PRIMARY KEY,text_id bigint REFERENCES texts);
   CREATE TABLE vocabulary_meanings(id bigint PRIMARY KEY); CREATE TABLE text_version_meanings(text_version_id bigint,meaning_id bigint);
   INSERT INTO texts VALUES(54); INSERT INTO text_versions VALUES(200,54); INSERT INTO vocabulary_meanings VALUES(4000);`);
  await db.exec(existing);
  await db.exec(`INSERT INTO imk_text_localizations VALUES(54,'en','Existing title','existing-slug',true);
   INSERT INTO imk_version_localizations VALUES(200,'en','Existing English content',true);
   INSERT INTO imk_meaning_localizations VALUES(4000,'en','existing term','Existing example.',NULL,'noun');`);
  const before = (await db.query(`SELECT (SELECT row_to_json(t) FROM imk_text_localizations t) AS title,
   (SELECT row_to_json(v) FROM imk_version_localizations v) AS content,
   (SELECT row_to_json(m) FROM imk_meaning_localizations m) AS meaning`)).rows[0];
  await db.exec(migration); await db.exec(migration);
  const columns = (await db.query(`SELECT column_name FROM information_schema.columns WHERE table_name='imk_meaning_localizations'`)).rows.map(r=>r.column_name);
  for (const column of ['plural_form','infinitive','past_simple','past_participle']) assert.ok(columns.includes(column), `missing compatible column ${column}`);
  assert.equal((await db.query(`SELECT topic FROM imk_text_localizations`)).rows[0].topic, null);
  const after = (await db.query(`SELECT jsonb_build_object('text_id',text_id,'language',language,'title',title,'slug',slug,'is_published',is_published) AS title FROM imk_text_localizations`)).rows[0].title;
  assert.deepEqual(after,before.title);
  assert.deepEqual((await db.query('SELECT row_to_json(v) AS content FROM imk_version_localizations v')).rows[0].content,before.content);
  const meaning = (await db.query(`SELECT meaning_id,language,term,example,article,word_type FROM imk_meaning_localizations`)).rows[0];
  assert.deepEqual(meaning,before.meaning);
  await db.exec(`INSERT INTO texts VALUES(55); INSERT INTO imk_text_localizations(text_id,language,title,slug,topic) VALUES(55,'en','New title','new-slug','Society');`);
 } finally { await db.close(); }
});
