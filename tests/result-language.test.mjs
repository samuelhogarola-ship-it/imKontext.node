import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import vm from 'node:vm';

async function runtime() {
  const context=vm.createContext({ localStorage: { getItem: () => null, setItem: () => {} } });
  for (const file of ['i18n.js', 'shared/result-view-core.js']) {
    vm.runInContext(await fs.readFile(new URL(`../imKontext/${file}`, import.meta.url), 'utf8'), context);
  }
  return context;
}
const states=[{ answered: true, correct: true, mode: 'flashcards' }];

test('legacy result callers keep German words and only answered rows', async () => {
  const c=await runtime();
  const rows=c.buildResumenRows(states, [{german:'die Hitze',spanish:'el calor'}, {german:'der Tag'}]);
  assert.equal(rows.length,1);
  assert.match(c.renderResumenHTML(rows),/>die Hitze<\/span>/);
  assert.equal(rows[0].german,'die Hitze');
});

test('result summaries use the same target-language accessor as the practiced word', async () => {
  const c=await runtime();
  for (const [lang,term] of [['en','heat'],['es','el calor'],['fi','helle'],['it','il caldo'],['pt','o calor']]) {
    c.setTargetLang(lang);
    const rows=c.buildResumenRows(states,[{german:'die Hitze',spanish:'el calor',target_word:term}],c.getTargetWord);
    assert.ok(c.renderResumenHTML(rows).includes(`>${term}</span>`),lang);
    assert.equal(rows[0].german,'die Hitze','original source field remains intact');
  }
});

test('target words are escaped and legacy prebuilt result rows remain renderable', async () => {
  const c=await runtime();
  const rows=c.buildResumenRows(states,[{german:'Quelle',target_word:'<img src=x onerror=alert(1)>'}],word=>word.target_word);
  assert.ok(!c.renderResumenHTML(rows).includes('<img'));
  assert.ok(c.renderResumenHTML(rows).includes('&lt;img'));
  assert.match(c.renderResumenHTML([{german:'der Tag',correct:true}]),/>der Tag<\/span>/);
});
