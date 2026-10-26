import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';
const lessons={
 es:['Hace calor','En España hace calor.','el calor','El calor continúa.','el'],
 en:['Hot weather','The weather is hot.','heat','The heat continues.',null],
 fi:['On kuuma','Suomessa on kuuma.','helle','Helteet jatkuvat.',null],
 it:['Fa caldo','In Italia fa caldo.','il caldo','Il caldo continua.','il'],
 pt:['Faz calor','No Brasil faz calor.','o calor','O calor continua.','o']
};
async function multilingualApi(page,{delayedFi=false}={}){
 await mockApi(page);
 await page.route('**/api/learning-languages',r=>r.fulfill({json:['de','es','en','fi','it','pt'].map(code=>({code,available:true}))}));
 await page.route(url=>url.pathname.startsWith('/api/')&&Boolean(url.searchParams.get('lang')),async route=>{
  const url=new URL(route.request().url());const lang=url.searchParams.get('lang');const lesson=lessons[lang];
  if(!lesson)return route.fulfill({status:400,json:{error:'unsupported'}});
  if(url.pathname==='/api/texts'){
   if(lang==='fi'&&delayedFi)await new Promise(r=>setTimeout(r,200));
   return route.fulfill({json:[{id:5,title:lesson[0],slug:'hitze',topic:null,categoria:'sociedad',access_status:'free',published_at:null,language:lang,levels:['B1'],hasLoadedVocabulary:true,previewContent:lesson[1]}]});
  }
  if(url.pathname==='/api/text-version')return route.fulfill({json:[{id:17,text_id:5,level:'B1',language:lang,content:lesson[1]}]});
  if(url.pathname==='/api/text-version-vocabulary-core')return route.fulfill({json:[1,2,3,4,5].map(id=>({id,text_version_id:17,german:'die Hitze',spanish:'el calor',target_word:lesson[2]+(id===1?'':` ${id}`),native_word:lang==='es'?`die Hitze ${id}`:`el calor ${id}`,target_example:lesson[3],native_example:'El calor continúa.',word_type:'noun',article:lesson[4],language:lang}))});
  return route.fallback();
 });
}
for(const lang of ['es','en','fi','it','pt'])test(`${lang}: direct link loads translated reading and practice, without German article choices`,async({page})=>{
 await multilingualApi(page);await page.goto(`/${lang}/textos`);
 const card=page.locator('[data-testid="featured-card"]').first();await expect(card).toContainText(lessons[lang][0]);await card.click();
 await expect(page).toHaveURL(new RegExp(`/${lang}/textos/hitze`));
 await expect(page.locator('#content-body')).toContainText(lessons[lang][1]);
 await page.locator('#btn-ir-actividad').click();
 if(lang==='fi'||lang==='en')await expect(page.locator('[data-modo="articulo"]')).toBeDisabled();
 await page.locator('[data-modo="flashcards"]').click();await page.locator('#btn-empezar').click();
 await expect(page.locator('#flashcard-front')).toContainText(lessons[lang][2]);
 await page.locator('#btn-terminar').click();
 await expect(page.locator('#screen-resultado')).toBeVisible();
 expect(await page.evaluate(lang=>localStorage.getItem(`progress_${lang}_5_b1`),lang)).not.toBeNull();
 expect(await page.evaluate(()=>localStorage.getItem('progress_5_b1'))).toBeNull();
});
test('returning from translated reading keeps the locale in catalog navigation',async({page})=>{
 await multilingualApi(page);await page.goto('/it/textos/hitze?nivel=B1');
 await expect(page.locator('#content-body')).toContainText('In Italia fa caldo.');
 await page.locator('#btn-volver-textos').click();
 await expect(page).toHaveURL(/\/it\/textos$/);
});
test('German links ignore a saved other language and preserve old progress and endpoints',async({page})=>{
 await multilingualApi(page);await page.addInitScript(()=>{localStorage.setItem('imk_target_lang','fi');localStorage.setItem('progress_text-001_b1',JSON.stringify({done:2,total:10}));});
 const requests=[];page.on('request',req=>{if(new URL(req.url()).pathname==='/api/texts')requests.push(req.url());});
 await page.goto('/textos');await expect(page.getByText('Die Energiewende in Deutschland').first()).toBeVisible();
 expect(requests.every(url=>!new URL(url).searchParams.has('lang'))).toBe(true);
 expect(await page.evaluate(()=>JSON.parse(localStorage.getItem('progress_text-001_b1')).done)).toBe(2);
});
test('late responses from a previous target language cannot replace the selected catalog',async({page})=>{
 await multilingualApi(page,{delayedFi:true});await page.goto('/textos');
 await page.locator('#lang-selector-btn').click();await page.locator('#learning-language').selectOption('fi');
 await page.locator('#learning-language').selectOption('en');
 await expect(page.locator('#txsel-grid')).toContainText('Hot weather');
 await page.waitForTimeout(350);await expect(page.locator('#txsel-grid')).not.toContainText('On kuuma');
});

test('translated home navigation keeps the explicit locale and German root resets it',async({page})=>{
 await multilingualApi(page);await page.goto('/fi/textos');await expect(page.locator('#txsel-grid')).toContainText('On kuuma');
 await page.locator('#btn-volver-landing-from-textos').click();await expect(page).toHaveURL(/\/fi\/$/);
 await page.goto('/');await page.locator('#lang-selector-btn').click();await expect(page.locator('#learning-language')).toHaveValue('de');
});
test('resetting translated progress preserves German progress and saved queue',async({page})=>{
 await multilingualApi(page);await page.addInitScript(()=>{localStorage.setItem('imkontext_cookie_consent','accepted');for(const k of ['progress_5_b1','progress_fi_5_b1'])localStorage.setItem(k,JSON.stringify({done:2,total:5}));localStorage.setItem('queue_5_b1','saved-german');});
 await page.goto('/fi/textos/hitze?nivel=B1');await expect(page.locator('#content-body')).toContainText('Suomessa on kuuma.');
 await page.locator('#btn-ir-actividad').click();
 await page.locator('#btn-reset-progress').click();
 expect(await page.evaluate(()=>localStorage.getItem('progress_fi_5_b1'))).toBeNull();
 expect(await page.evaluate(()=>JSON.parse(localStorage.getItem('progress_5_b1')).done)).toBe(2);
 expect(await page.evaluate(()=>localStorage.getItem('queue_5_b1'))).toBe('saved-german');
});

test('unavailable content disables new language choices while German still loads',async({page})=>{
 await multilingualApi(page);await page.route('**/api/learning-languages',r=>r.fulfill({json:['de','es','en','fi','it','pt'].map(code=>({code,available:code==='de'}))}));
 await page.goto('/textos');await expect(page.getByText('Die Energiewende in Deutschland').first()).toBeVisible();await page.locator('#lang-selector-btn').click();
 await expect(page.locator('#learning-language option[value="fi"]')).toBeDisabled();await expect(page.locator('#native-language option[value="en"]')).toBeDisabled();
});
test('mobile language controls can select Finnish and reach the translated catalog',async({page})=>{
 await page.setViewportSize({width:390,height:844});await multilingualApi(page);await page.addInitScript(()=>localStorage.setItem('imkontext_cookie_consent','accepted'));
 await page.goto('/textos');await page.locator('#lang-selector-btn').click();await page.locator('#learning-language').selectOption('fi');await expect(page.locator('#txsel-grid')).toContainText('On kuuma');
});

test('English gap-fill matches glossary alternatives and excludes words without an attested form',async({page})=>{
 await multilingualApi(page);await page.addInitScript(()=>localStorage.setItem('imkontext_cookie_consent','accepted'));
 await page.route('**/api/text-version-vocabulary-core?*',r=>r.fulfill({json:[{id:101,text_version_id:17,target_word:'image / reflection',target_example:'It is a reflection of the economy.',native_word:'reflejo',native_example:'Es un reflejo de la economía.',english:'image / reflection',word_type:'noun',article:null},{id:102,text_version_id:17,target_word:'to speak',target_example:'She spoke clearly.',native_word:'hablar',native_example:'Ella habló con claridad.',english:'to speak',word_type:'verb',article:null}]}));
 await page.goto('/en/textos/hitze?nivel=B1');await page.locator('#btn-ir-actividad').click();await page.locator('[data-modo="lueckentext"]').click();await page.locator('#btn-empezar').click();
 await expect(page.locator('.luecken-blank')).toBeVisible();await expect(page.locator('#pregunta-texto')).toContainText('It is a ______ of the economy.');await expect(page.locator('#opciones-wrap')).toContainText('image / reflection');
 expect(await page.evaluate(()=>queue.length)).toBe(1);
});

test('changing interface language retains translated detail canonical and native selection',async({page})=>{
 await multilingualApi(page);await page.goto('/it/textos/hitze?nivel=B1');await expect(page.locator('#content-body')).toContainText('In Italia fa caldo.');
 await page.locator('#lang-selector-btn').click();await page.locator('#lang-ui-grid [data-lang="en"]').click();
 await expect(page.locator('#link-canonical')).toHaveAttribute('href',/\/it\/textos\/hitze\?nivel=B1$/);expect(await page.evaluate(()=>getNativeLang())).toBe('es');
});
