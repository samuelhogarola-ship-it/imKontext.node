/* Pure language helpers. German URLs and stored progress keep their original format. */
function languageProgressKey(textId,level,language=getTargetLang()) {
 return `progress_${language==='de'?'':language+'_'}${textId}_${level}`;
}
function languageQueueKey(textId,level,language=getTargetLang()) {
 return `queue_${language==='de'?'':language+'_'}${textId}_${level}`;
}
function parseLanguageProgressKey(key) {
 const match=/^progress_(?:(es|en|fi|it|pt)_)?(.+)_([a-z]\d)$/i.exec(key);
 return match?{language:match[1]||'de',textId:match[2],level:match[3].toLowerCase()}:null;
}
function learningHomePath(language=getTargetLang()){return language==='de'?'/':`/${language}/`;}
function learningCatalogPath(language=getTargetLang()){return `${language==='de'?'':'/'+language}/textos`;}
function learningTextPath(slug,level,language=getTargetLang()) {
 return `${learningCatalogPath(language)}/${encodeURIComponent(slug)}${level?'?nivel='+encodeURIComponent(level.toUpperCase()):''}`;
}
function resolveLearningRoute(pathname) {
 if(pathname==='/')return {language:'de',screen:'landing'};
 const home=/^\/(es|en|fi|it|pt)\/?$/.exec(pathname);
 if(home)return {language:home[1],screen:'landing'};
 const match=/^(?:\/(es|en|fi|it|pt))?\/textos(?:\/([^/]+))?\/?$/.exec(pathname);
 if(!match)return null;
 try{return {language:match[1]||'de',screen:match[2]?'content':'textos',slug:match[2]?decodeURIComponent(match[2]):null};}catch{return null;}
}
function localizedApiPath(path,language=getTargetLang(),native=getNativeLang()) {
 if(!/^\/api\/(texts|text-version|text-version-vocabulary-core)(?:\?|$)/.test(path))return path;
 if(language==='de'&&!(hasExplicitNativeLanguage()&&native!=='es'&&/^\/api\/text-version-vocabulary-core(?:\?|$)/.test(path)))return path;
 return `${path}${path.includes('?')?'&':'?'}lang=${encodeURIComponent(language)}&native=${encodeURIComponent(native)}`;
}
function learningArticleOptions(language=getTargetLang()) {
 return ({de:['der','die','das'],es:['el','la','los','las'],it:['il','lo','la','l’','i','gli','le'],pt:['o','a','os','as']})[language]||[];
}
// Canonical glossary labels may contain alternatives; matching uses each form separately.
function targetWordVariants(word,language=getTargetLang()) {
 if(language==='de')return [String(word||'')];
 const variants=[];
 for(const alternative of String(word||'').split(/\s*\/\s*|\s*;\s*/u)) {
  const term=alternative.replace(/\s*\([^)]*\)/gu,'').trim();
  if(!term)continue;
  variants.push(term,stripArticle(term,language));
  if(language==='en'&&/^to\s+/i.test(term))variants.push(term.replace(/^to\s+/i,''));
 }
 return [...new Set(variants.filter(Boolean))];
}
function practiceModesForWord(word,modes) {
 if(getTargetLang()==='de')return modes;
 return modes.filter(mode=>{
  if(mode==='articulo')return learningArticleOptions().includes(word?.article);
  if(mode==='lueckentext')return Boolean(blankifyWord(getTargetExample(word||{}),getTargetWord(word||{})));
  return true;
 });
}
