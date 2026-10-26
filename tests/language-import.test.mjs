import test from 'node:test';
import assert from 'node:assert/strict';
import { fixtureDB } from './helpers/database.mjs';
import { buildImportSQL } from '../scripts/build-language-import.mjs';
const source={links:[{text_version_id:17,meaning_id:101},{text_version_id:18,meaning_id:102}],texts:[{id:5,title:'Es ist heiß',slug:'hitze'},{id:6,title:'Privater Text',slug:'privat'}],versions:[{id:17,text_id:5,level:'A2',content:'Die Hitze bleibt.'},{id:18,text_id:6,level:'B1',content:'Privat.'}],meanings:[{id:101,spanish:'el calor',german:'die Hitze',article:'die',word_type:'noun',example_sentence_de:'Die Hitze bleibt.'},{id:102,spanish:'privado',german:'privat',example_sentence_de:'Privat.'}]};
const doc={language:'fi',texts:[{text_id:5,title:'On kuuma',slug:'hitze',topic:null},{text_id:6,title:'Yksityinen',slug:'privat',topic:null}],versions:[{text_version_id:17,content:'Helteet jatkuvat.'},{text_version_id:18,content:'Yksityinen.'}],meanings:[{meaning_id:101,term:'helle',example:'Helteet jatkuvat.',article:null},{meaning_id:102,term:'yksityinen',example:'Yksityinen.',article:null}]};
async function snapshot(db){return (await db.query(`SELECT jsonb_build_array((SELECT jsonb_agg(to_jsonb(t)) FROM texts t),(SELECT jsonb_agg(to_jsonb(v)) FROM text_versions v),(SELECT jsonb_agg(to_jsonb(m)) FROM vocabulary_meanings m),(SELECT jsonb_agg(to_jsonb(w)) FROM vocabulario w),(SELECT jsonb_agg(to_jsonb(l)) FROM text_version_meanings l)) AS data`)).rows[0].data;}
test('import adds only localized rows, reruns safely and preserves every German row',async()=>{
 const db=await fixtureDB();try{const before=await snapshot(db);const sql=buildImportSQL([doc],source);await db.exec(sql);await db.exec(sql);
 assert.equal((await db.query('SELECT count(*)::int AS n FROM imk_meaning_localizations')).rows[0].n,2);assert.deepEqual(await snapshot(db),before);
 await db.exec("UPDATE imk_meaning_localizations SET term='Reviewed' WHERE meaning_id=101");await db.exec(sql);assert.equal((await db.query('SELECT term FROM imk_meaning_localizations WHERE meaning_id=101')).rows[0].term,'Reviewed');
 }finally{await db.close();}
});
test('stale source aborts before any localized write',async()=>{
 const db=await fixtureDB();try{await db.exec("UPDATE text_versions SET content='Changed' WHERE id=17");await assert.rejects(db.exec(buildImportSQL([doc],source)),/Source versions changed/);await db.exec('ROLLBACK');assert.equal((await db.query('SELECT count(*)::int AS n FROM imk_text_localizations')).rows[0].n,0);}finally{await db.close();}
});
test('data validation rejects missing/duplicate IDs, German locale and relabelled German sentences',()=>{
 for(const mutate of [d=>d.language='de',d=>d.meanings.pop(),d=>d.meanings.push(d.meanings[0]),d=>d.versions[0].content='Die Hitze bleibt.',d=>d.meanings[0].article='die',d=>d.meanings[0].example='Die Hitze bleibt.']){const d=structuredClone(doc);mutate(d);assert.throws(()=>buildImportSQL([d],source));}
});
test('SQL encoding handles quotes, dollar delimiters and literal SQL safely',async()=>{
 const db=await fixtureDB();try{const d=structuredClone(doc);d.meanings[0].example="Hän sanoi: 'kuuma' $imk_json$; DELETE FROM texts; --";await db.exec(buildImportSQL([d],source));assert.equal((await db.query('SELECT example FROM imk_meaning_localizations WHERE meaning_id=101')).rows[0].example,d.meanings[0].example);assert.equal((await db.query('SELECT count(*)::int AS n FROM texts')).rows[0].n,2);}finally{await db.close();}
});

test('source containing a procedural dollar delimiter is safely guarded',async()=>{
 const db=await fixtureDB();try{const s=structuredClone(source);s.texts[0].title="$imk_guard$; DELETE FROM texts; --";await db.query('UPDATE texts SET title=$1 WHERE id=5',[s.texts[0].title]);await db.exec(buildImportSQL([doc],s));assert.equal((await db.query('SELECT count(*)::int AS n FROM texts')).rows[0].n,2);}finally{await db.close();}
});

test('changed canonical example or vocabulary link aborts the import',async()=>{
 for(const mutation of ["UPDATE vocabulary_meanings SET example='Changed' WHERE id=101","DELETE FROM text_version_meanings WHERE text_version_id=17","UPDATE vocabulario SET german='Changed' WHERE id=99","INSERT INTO text_version_meanings VALUES(17,102)"]){const db=await fixtureDB();try{await db.exec(mutation);await assert.rejects(db.exec(buildImportSQL([doc],source)),/Source (meanings|links|vocabulary) changed/);await db.exec('ROLLBACK');assert.equal((await db.query('SELECT count(*)::int AS n FROM imk_text_localizations')).rows[0].n,0);}finally{await db.close();}}
});
