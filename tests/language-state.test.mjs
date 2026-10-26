import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import vm from 'node:vm';
async function runtime(){
 const store=new Map();const ctx=vm.createContext({URL,URLSearchParams,localStorage:{getItem:k=>store.get(k)||null,setItem:(k,v)=>store.set(k,v)}});
 for(const file of ['i18n.js','shared/learning-core.js','shared/practice-core.js']){
  const src=await fs.readFile(new URL(`../imKontext/${file}`,import.meta.url),'utf8').catch(e=>{if(e.code==='ENOENT')return '';throw e;});vm.runInContext(src,ctx);
 }
 return ctx;
}
test('German storage keys remain byte-compatible and other languages have separate keys',async()=>{
 const c=await runtime();assert.equal(c.languageProgressKey(5,'a2','de'),'progress_5_a2');
 assert.equal(c.languageProgressKey(5,'a2','fi'),'progress_fi_5_a2');assert.equal(c.languageQueueKey(5,'a2','de'),'queue_5_a2');
 assert.equal(c.languageQueueKey(5,'a2','en'),'queue_en_5_a2');
 assert.equal(c.parseLanguageProgressKey('progress_5_a2').language,'de');
 assert.equal(c.parseLanguageProgressKey('progress_fi_5_a2').textId,'5');
 assert.equal(c.parseLanguageProgressKey('unrelated'),null);
});
test('shared German links override saved target preference; translated links retain explicit locale',async()=>{
 const c=await runtime();c.setTargetLang('fi');
 assert.equal(c.resolveLearningRoute('/textos/hitze').language,'de');
 assert.equal(c.resolveLearningRoute('/').language,'de');
 assert.equal(c.resolveLearningRoute('/fi/textos/hitze').language,'fi');
 assert.equal(c.learningTextPath('hitze','B1','de'),'/textos/hitze?nivel=B1');
 assert.equal(c.learningTextPath('hitze','B1','fi'),'/fi/textos/hitze?nivel=B1');
 assert.equal(c.localizedApiPath('/api/texts','de'),'/api/texts');
 assert.equal(c.localizedApiPath('/api/texts','fi','es'),'/api/texts?lang=fi&native=es');
});
test('native vocabulary language stays different from target and independent of interface language',async()=>{
 const c=await runtime();c.setTargetLang('es');assert.equal(c.getNativeLang(),'de');
 c.setUILang('en');assert.equal(c.getNativeLang(),'de');
 c.setNativeLang('en');c.setUILang('fi');assert.equal(c.getNativeLang(),'en');
 assert.equal(c.setNativeLang('es'),false);assert.equal(c.getNativeLang(),'en');
 assert.equal(c.getNativeWord({native_word:'heat',spanish:'el calor'}),'heat');
});
test('Finnish blanks respect Unicode and languages without articles never get German article choices',async()=>{
 const c=await runtime();c.setTargetLang('fi');
 assert.equal(c.blankifyWord('Ääni kuuluu metsästä.','ääni'),'______ kuuluu metsästä.');
 assert.equal(c.blankifyWord('Jääni on kylmää.','ääni'),null);
 assert.equal(c.learningArticleOptions('fi').length,0);assert.equal(c.learningArticleOptions('en').length,0);
 assert.equal(c.learningArticleOptions('es').join(','),'el,la,los,las');
 assert.equal(c.stripArticle("l’ambiente",'it'),'ambiente');
 c.setTargetLang('de');assert.equal(c.learningArticleOptions('de').join(','),'der,die,das');
 assert.equal(c.blankifyWord('Der Staat hilft.','der Staat'),'______ hilft.');
});

test('German explanation opt-in changes vocabulary requests only',async()=>{
 const c=await runtime();
 assert.equal(c.localizedApiPath('/api/text-version-vocabulary-core?textVersionId=17','de','en'),'/api/text-version-vocabulary-core?textVersionId=17');
 c.setNativeLang('en');
 assert.equal(c.localizedApiPath('/api/text-version-vocabulary-core?textVersionId=17','de','en'),'/api/text-version-vocabulary-core?textVersionId=17&lang=de&native=en');
 assert.equal(c.localizedApiPath('/api/texts','de','en'),'/api/texts');
});

test('new language matching handles glossary alternatives and selected gap-fill stays gap-fill',async()=>{
 const c=await runtime();c.setTargetLang('en');
 assert.equal(c.blankifyWord('The index is a reflection of the economy.','image / reflection'),'The index is a ______ of the economy.');
 assert.equal(c.blankifyWord('They communicate their values.','to communicate'),'They ______ their values.');
 assert.equal(c.targetWordVariants('image / reflection').join(','),'image,reflection');
 assert.equal(c.practiceModesForWord({target_word:'to communicate',target_example:'They communicate their values.'},['lueckentext']).join(','),'lueckentext');
 assert.equal(c.practiceModesForWord({target_word:'to speak',target_example:'She spoke clearly.'},['lueckentext']).length,0);
 c.setTargetLang('de');assert.equal(c.blankifyWord('Es ist ein Abbild.','Bild / Abbild'),null);
});
