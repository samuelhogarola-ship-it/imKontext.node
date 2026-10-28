// Explicit locale branches. Default German requests keep the legacy handlers.
export const LEARNING_LANGUAGES = ['es','en','fi','it','pt'];
const WORD_COLUMNS={de:'german',es:'spanish',en:'english',fi:'finnish',it:'italian',pt:'portuguese'};
const EXAMPLE_COLUMNS={de:'example_sentence_de',es:'example_sentence_es',en:'example_sentence_en',fi:'example_sentence_fi',it:'example_sentence_it',pt:'example_sentence_pt'};
const nonempty=value=>typeof value==='string'&&value.trim().length>0;
function invalid(message){return Object.assign(new Error(message),{status:400});}
function language(value){if(!LEARNING_LANGUAGES.includes(value))throw invalid('Unsupported learning language');return value;}
function id(value){if(!/^[1-9]\d*$/.test(String(value))||!Number.isSafeInteger(Number(value)))throw invalid('Invalid source ID');return String(value);}
function level(value){const normalized=String(value||'').toUpperCase();if(!['A2','B1','B2','C1'].includes(normalized))throw invalid('Unsupported level');return normalized;}

export function createLocalizedService(fetchRows){
 async function all(query){
  const rows=[];
  for(let offset=0;;offset+=1000){
   const batch=await fetchRows(`${query}&limit=1000&offset=${offset}`);
   if(!Array.isArray(batch))throw new Error('Invalid database response');
   rows.push(...batch);if(batch.length<1000)return rows;
  }
 }
 async function catalog(lang){
  language(lang);
  const [texts,versions,links,titles,contents,terms]=await Promise.all([
   all('texts?select=id,title,slug,topic,categoria,access_status,published_at&order=published_at.desc.nullslast,id.desc'),
   all('text_versions?select=id,text_id,level'),
   all('text_version_meanings?select=text_version_id,meaning_id'),
   all(`imk_text_localizations?select=*&language=eq.${lang}&is_published=eq.true`),
   all(`imk_version_localizations?select=*&language=eq.${lang}&is_published=eq.true`),
   all(`imk_meaning_localizations?select=meaning_id,term,example&language=eq.${lang}`)
  ]);
  const titleMap=new Map(titles.filter(x=>nonempty(x.title)&&nonempty(x.slug)).map(x=>[String(x.text_id),x]));
  const contentMap=new Map(contents.filter(x=>nonempty(x.content)).map(x=>[String(x.text_version_id),x.content]));
  const translated=new Set(terms.filter(x=>nonempty(x.term)&&nonempty(x.example)).map(x=>String(x.meaning_id)));
  const byVersion=new Map();
  for(const link of links){const key=String(link.text_version_id);if(!byVersion.has(key))byVersion.set(key,[]);byVersion.get(key).push(String(link.meaning_id));}
  const ready=versions.filter(v=>contentMap.has(String(v.id))&&byVersion.get(String(v.id))?.length&&byVersion.get(String(v.id)).every(m=>translated.has(m)));
  return texts.flatMap(text=>{
   const localized=titleMap.get(String(text.id));const available=ready.filter(v=>String(v.text_id)===String(text.id));
   if(!localized||!available.length)return [];
   const preview=available.find(v=>v.level==='B1')||available.find(v=>v.level==='A2')||available[0];
   return [{...text,title:localized.title,slug:localized.slug,topic:localized.topic||null,language:lang,hasLoadedVocabulary:true,levels:available.map(v=>v.level).sort(),previewContent:contentMap.get(String(preview.id))}];
  });
 }
 async function versions(lang,textId,selectedLevel){
  language(lang);id(textId);const cefr=level(selectedLevel);
  const [source,title]=await Promise.all([
   all(`text_versions?select=id,text_id,level&text_id=eq.${id(textId)}&level=eq.${cefr}`),
   all(`imk_text_localizations?select=text_id&text_id=eq.${id(textId)}&language=eq.${lang}&is_published=eq.true`)
  ]);
  if(!source.length||!title.length)return [];
  const content=await all(`imk_version_localizations?select=text_version_id,content&language=eq.${lang}&is_published=eq.true&text_version_id=in.(${source.map(v=>id(v.id)).join(',')})`);
  const translated=new Map(content.filter(x=>nonempty(x.content)).map(x=>[String(x.text_version_id),x.content]));
  return source.filter(v=>translated.has(String(v.id))).map(v=>({...v,content:translated.get(String(v.id)),language:lang}));
 }
 async function vocabulary(lang,versionId,native=lang==='es'?'de':'es'){
  if(lang!=='de')language(lang);id(versionId);
  if(!Object.hasOwn(WORD_COLUMNS,native))throw invalid('Unsupported native language');
  if(native===lang)throw invalid('Native and learning language must be different');
  const [source]=await all(`text_versions?select=id,text_id,level&id=eq.${id(versionId)}`);
  if(!source||(lang!=='de'&&!(await versions(lang,source.text_id,source.level)).some(v=>String(v.id)===String(versionId))))return [];
  const core=await all(`text_version_vocabulary_core?select=*&text_version_id=eq.${id(versionId)}`);
  if(!core.length)return [];
  const ids=[...new Set(core.map(row=>id(row.id)))].join(',');
  const locales=[lang,native].filter(code=>LEARNING_LANGUAGES.includes(code));
  const translations=await all(`imk_meaning_localizations?select=*&meaning_id=in.(${ids})&language=in.(${locales.join(',')})`);
  const lookup=new Map(translations.map(row=>[`${row.language}:${row.meaning_id}`,row]));
  return core.flatMap(row=>{
   const target=lang==='de'?{...row,term:row.german,example:row.example_sentence_de}:lookup.get(`${lang}:${row.id}`);const explanation=lookup.get(`${native}:${row.id}`);
   const nativeWord=native==='de'?row[WORD_COLUMNS[native]]:explanation?.term??row[WORD_COLUMNS[native]];
   const nativeExample=native==='de'?row[EXAMPLE_COLUMNS[native]]:explanation?.example??row[EXAMPLE_COLUMNS[native]];
   if(!nonempty(target?.term)||!nonempty(target?.example)||!nonempty(nativeWord)||!nonempty(nativeExample))return [];
   return [{...row,[WORD_COLUMNS[lang]]:target.term,[EXAMPLE_COLUMNS[lang]]:target.example,[WORD_COLUMNS[native]]:nativeWord,[EXAMPLE_COLUMNS[native]]:nativeExample||'',
    target_word:target.term,native_word:nativeWord,target_example:target.example,native_example:nativeExample||'',language:lang,native_language:native,
    article:target.article||null,word_type:target.word_type||row.word_type,plural_form:target.plural_form||null,infinitive:target.infinitive||null,past_simple:target.past_simple||null,past_participle:target.past_participle||null}];
  });
 }
 return {catalog,versions,vocabulary};
}

export function registerLocalizedRoutes(app,fetchRows){
 const service=createLocalizedService(fetchRows);
 const handle=callback=>async(req,res,next)=>{
  if(req.query.lang===undefined||req.query.lang==='de')return next();
  try{language(req.query.lang);res.json(await callback(req));}
  catch(error){res.status(error.status||503).json({error:error.message,details:error.details||undefined});}
 };
 app.get('/api/texts',handle(req=>service.catalog(req.query.lang)));
 app.get('/api/text-version',handle(req=>service.versions(req.query.lang,req.query.textId,req.query.level)));
 app.get('/api/text-version-vocabulary-core',async(req,res,next)=>{
  if(req.query.lang!=='de'||req.query.native===undefined||req.query.native==='es')return next();
  try{res.json(await service.vocabulary('de',req.query.textVersionId,req.query.native));}
  catch(error){res.status(error.status||503).json({error:error.message});}
 });
 app.get('/api/text-version-vocabulary-core',handle(req=>service.vocabulary(req.query.lang,req.query.textVersionId,req.query.native)));
 app.get('/api/learning-languages',async(req,res)=>{
  try{
   const results=await Promise.all(LEARNING_LANGUAGES.map(async code=>({code,available:(await service.catalog(code)).length>0})));
   res.json([{code:'de',available:true},...results]);
  }catch(error){
   if(/PGRST205|42P01|does not exist|schema cache/.test(`${error.message} ${error.details||''}`))return res.json([{code:'de',available:true},...LEARNING_LANGUAGES.map(code=>({code,available:false}))]);
   res.status(503).json({error:'Language availability could not be loaded'});
  }
 });
}
