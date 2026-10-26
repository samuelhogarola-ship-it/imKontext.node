import fs from 'node:fs/promises';
import { PGlite } from '@electric-sql/pglite';
const migration=await fs.readFile(new URL('../../backend/sql/011_add_content_localizations.sql',import.meta.url),'utf8');
export async function fixtureDB(){
 const db=new PGlite();
 await db.exec(`CREATE ROLE anon; CREATE ROLE authenticated;
 CREATE TABLE texts(id bigint PRIMARY KEY,title text NOT NULL,slug text UNIQUE,topic text,categoria text NOT NULL,access_status text NOT NULL,published_at timestamptz,created_at timestamptz NOT NULL DEFAULT now());
 CREATE TABLE text_versions(id bigint PRIMARY KEY,text_id bigint REFERENCES texts,level text CHECK(level IN ('A2','B1','B2','C1')),content text,created_at timestamptz);
 CREATE TABLE vocabulary_meanings(id bigint PRIMARY KEY,spanish text NOT NULL,example text,example_es text,english text,fi text,lemma_id bigint);
 CREATE TABLE vocabulario(id bigint PRIMARY KEY,german text,primary_meaning_id bigint REFERENCES vocabulary_meanings);
 CREATE TABLE text_version_meanings(text_version_id bigint REFERENCES text_versions,meaning_id bigint REFERENCES vocabulary_meanings,PRIMARY KEY(text_version_id,meaning_id));
 INSERT INTO texts(id,title,slug,categoria,access_status) VALUES(5,'Es ist heiß','hitze','sociedad','free'),(6,'Privater Text','privat','sociedad','private');
 INSERT INTO text_versions VALUES(17,5,'A2','Die Hitze bleibt.',NULL),(18,6,'B1','Privat.',NULL);
 INSERT INTO vocabulary_meanings(id,spanish,example) VALUES(101,'el calor','Die Hitze bleibt.'),(102,'privado','Privat.');
 INSERT INTO vocabulario VALUES(99,'die Hitze',101);
 INSERT INTO text_version_meanings VALUES(17,101),(18,102);
 CREATE VIEW text_version_vocabulary_core AS SELECT l.text_version_id,l.meaning_id AS id,w.german,'die'::text AS article,'noun'::text AS word_type FROM text_version_meanings l JOIN vocabulario w ON w.primary_meaning_id=l.meaning_id;
 ALTER TABLE texts ENABLE ROW LEVEL SECURITY; CREATE POLICY readable_texts ON texts FOR SELECT USING(access_status='free');
 GRANT SELECT ON texts,text_versions,vocabulary_meanings,text_version_meanings TO anon,authenticated;
 `);
 await db.exec(migration);
 return db;
}
