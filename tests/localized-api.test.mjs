import test from 'node:test';
import assert from 'node:assert/strict';
import { createLocalizedService, registerLocalizedRoutes } from '../server/localized-routes.js';

const tables={
 texts:[{id:5,title:'Es ist heiß',slug:'hitze',topic:'Deutschland',categoria:'sociedad',access_status:'free',published_at:null}],
 text_versions:[{id:17,text_id:5,level:'A2',content:'Die Hitze bleibt.'}],
 text_version_meanings:[{text_version_id:17,meaning_id:101}],
 text_version_vocabulary_core:[{text_version_id:17,id:101,german:'die Hitze',spanish:'el calor',article:'die',word_type:'noun',example_sentence_de:'Die Hitze bleibt.',example_sentence_es:'El calor continúa.'}],
 imk_text_localizations:['es','en','fi','it','pt'].map(language=>({text_id:5,language,title:`${language} title`,slug:'hitze',topic:'Weather',is_published:true})),
 imk_version_localizations:['es','en','fi','it','pt'].map(language=>({text_version_id:17,language,content:`${language} content`,is_published:true})),
 imk_meaning_localizations:[
  {meaning_id:101,language:'es',term:'el calor',example:'El calor continúa.',article:'el',word_type:'noun'},
  {meaning_id:101,language:'en',term:'heat',example:'The heat continues.',article:null,word_type:'noun'},
  {meaning_id:101,language:'fi',term:'helle',example:'Helteet jatkuvat.',article:null,word_type:'noun'},
  {meaning_id:101,language:'it',term:'il caldo',example:'Il caldo continua.',article:'il',word_type:'noun'},
  {meaning_id:101,language:'pt',term:'o calor',example:'O calor continua.',article:'o',word_type:'noun'}
 ]
};
function service(overrides={}){
 const source={...structuredClone(tables),...overrides};
 return createLocalizedService(async pathname=>{
  const url=new URL(pathname,'https://example.test/');const table=url.pathname.slice(1);
  assert.ok(Object.hasOwn(source,table),`unknown query ${table}`);
  let rows=source[table];
  for(const [key,value]of url.searchParams){
   if(value.startsWith('eq.'))rows=rows.filter(x=>String(x[key])===value.slice(3));
   if(value.startsWith('in.('))rows=rows.filter(x=>value.slice(4,-1).split(',').includes(String(x[key])));
  }
  rows=rows.slice(Number(url.searchParams.get('offset')||0),Number(url.searchParams.get('offset')||0)+Number(url.searchParams.get('limit')||1000));
  const select=url.searchParams.get('select');
  return rows.map(row=>select&&select!=='*'?Object.fromEntries(select.split(',').map(k=>[k,row[k]])):structuredClone(row));
 });
}
test('every additional language gets its own title, preview and available source version IDs',async()=>{
 for(const lang of ['es','en','fi','it','pt']){
  const result=await service().catalog(lang);
  assert.equal(result.length,1);assert.equal(result[0].title,`${lang} title`);
  assert.equal(result[0].previewContent,`${lang} content`);assert.equal(result[0].id,5);
  assert.deepEqual(result[0].levels,['A2']);assert.equal(result[0].hasLoadedVocabulary,true);
 }
});
test('missing content or a missing linked target meaning never falls back to German',async()=>{
 assert.deepEqual(await service({imk_version_localizations:[]}).catalog('fi'),[]);
 assert.deepEqual(await service({imk_meaning_localizations:[]}).catalog('fi'),[]);
 assert.deepEqual(await service({imk_version_localizations:[]}).versions('fi','5','A2'),[]);
 assert.deepEqual(await service({imk_meaning_localizations:[]}).vocabulary('fi','17','es'),[]);
});
test('localized version preserves its identity and CEFR level but uses translated content',async()=>{
 assert.deepEqual(await service().versions('fi','5','a2'),[{id:17,text_id:5,level:'A2',content:'fi content',language:'fi'}]);
 assert.deepEqual(await service().versions('fi','999','A2'),[]);
});
test('vocabulary joins canonical meaning IDs and uses target grammar, examples and native translation',async()=>{
 const before=structuredClone(tables.text_version_vocabulary_core);
 const [fi]=await service().vocabulary('fi','17','es');
 assert.equal(fi.id,101);assert.equal(fi.target_word,'helle');assert.equal(fi.native_word,'el calor');
 assert.equal(fi.target_example,'Helteet jatkuvat.');assert.equal(fi.article,null);
 const [es]=await service().vocabulary('es','17','de');
 assert.equal(es.target_word,'el calor');assert.equal(es.native_word,'die Hitze');assert.equal(es.article,'el');
 assert.deepEqual(tables.text_version_vocabulary_core,before);
});
test('same target/native language, unsupported locale and malformed IDs are rejected before querying',async()=>{
 await assert.rejects(service().vocabulary('fi','17','fi'),/different/);
 await assert.rejects(service().catalog('xx'),/language/);
 await assert.rejects(service().versions('fi','5&or=x','A2'),/ID/);
 await assert.rejects(service().versions('fi','5','A1'),/level/);
});
test('opting into another explanation language keeps German words, examples and articles unchanged',async()=>{
 const [row]=await service().vocabulary('de','17','en');
 assert.equal(row.target_word,'die Hitze');assert.equal(row.target_example,'Die Hitze bleibt.');
 assert.equal(row.article,'die');assert.equal(row.native_word,'heat');
});

test('new native explanations use corrected localization and never return blank examples',async()=>{
 const translated=structuredClone(tables.imk_meaning_localizations);translated.find(r=>r.language==='es').example='Ejemplo revisado.';
 assert.equal((await service({imk_meaning_localizations:translated}).vocabulary('fi','17','es'))[0].native_example,'Ejemplo revisado.');
 translated.find(r=>r.language==='en').example='';
 assert.deepEqual(await service({imk_meaning_localizations:translated}).vocabulary('fi','17','en'),[]);
});
function routes(fetchRows){const entries=[];registerLocalizedRoutes({get:(path,fn)=>entries.push({path,fn})},fetchRows);return async(path,query)=>{const response={statusCode:200,status(code){this.statusCode=code;return this;},json(data){this.data=data;}};let bypass=true;for(const e of entries.filter(e=>e.path===path)){let next=false;await e.fn({query},response,()=>{next=true;});if(!next){bypass=false;break;}}return {...response,bypass};};}
test('route registration preserves default German bypass and reports validation/upstream failures',async()=>{
 let calls=0;const run=routes(async()=>{calls++;throw new Error('upstream unavailable');});
 for(const query of [{},{lang:'de'}])assert.equal((await run('/api/texts',query)).bypass,true);
 assert.equal(calls,0);assert.equal((await run('/api/texts',{lang:'xx'})).statusCode,400);
 assert.equal((await run('/api/texts',{lang:'fi'})).statusCode,503);
 assert.equal((await run('/api/text-version-vocabulary-core',{lang:'de',native:'es'})).bypass,true);
 assert.equal((await run('/api/text-version-vocabulary-core',{lang:'de',native:'de',textVersionId:'17'})).statusCode,400);
});
test('missing additive tables leave German available and new languages unavailable',async()=>{
 const run=routes(async()=>{throw new Error('PGRST205 relation missing from schema cache');});const result=await run('/api/learning-languages',{});
 assert.equal(result.statusCode,200);assert.equal(result.data[0].available,true);assert.equal(result.data.slice(1).every(x=>!x.available),true);
});
