// Local-only verification of UI × learning language, using the real server and disposable DB.
import { chromium, expect } from '@playwright/test';
import fs from 'node:fs/promises';
import path from 'node:path';
import assert from 'node:assert/strict';

const [baseUrl, sourceDirectory, outputDirectory] = process.argv.slice(2);
if (!baseUrl || !sourceDirectory || !outputDirectory) throw new Error('Usage: node scripts/verify-three-language-matrix.mjs http://127.0.0.1:3119 source-directory output-directory');
const base = new URL(baseUrl);
assert.ok(base.protocol === 'http:' && ['127.0.0.1', 'localhost', '[::1]'].includes(base.hostname), 'This verification must never target production');
const originals = JSON.parse(await fs.readFile(path.join(sourceDirectory, 'german-versions.json'), 'utf8'));
const originalVocabulary = JSON.parse(await fs.readFile(path.join(sourceDirectory, 'german-vocabulary.json'), 'utf8'));
const locales = Object.fromEntries(await Promise.all(['en', 'es'].map(async language =>
  [language, JSON.parse(await fs.readFile(new URL(`../data/localizations/${language}.json`, import.meta.url), 'utf8'))]
)));
await fs.mkdir(outputDirectory, { recursive: true });
const browser = await chromium.launch({ headless: true });
const rows = [];
const report = { checkedAt: new Date().toISOString(), baseUrl,
  configuredSource: 'Original server.js configured with the local PGlite REST upstream; reproduce using the documented launch commands',
  provenanceLimit: 'Browser request monitoring observes browser traffic only; it cannot independently inspect server-to-database traffic',
  productionWrites: 0, rows };
try {
  for (const ui of ['de', 'en', 'es']) for (const target of ['de', 'en', 'es']) {
    const native = ui !== target ? ui : target === 'es' ? 'en' : 'es';
    const context = await browser.newContext({ viewport: { width: 1440, height: 1000 } });
    await context.route(/https:\/\/(?:analytics\.|www\.googletagmanager\.)/, route => route.abort());
    const guard = JSON.stringify({ done: 3, total: 20 });
    await context.addInitScript(({ ui, target, native, guard }) => {
      if (localStorage.getItem('imk_matrix_initialized')) return;
      localStorage.setItem('imk_matrix_initialized', '1');
      localStorage.setItem('imk_ui_lang', ui);
      localStorage.setItem('imk_native_lang', native);
      localStorage.setItem('imk_target_lang', target === 'de' ? 'en' : 'de');
      localStorage.setItem('imkontext_cookie_consent', 'rejected');
    }, { ui, target, native, guard });
    const page = await context.newPage(), errors = [], databaseRequests = [];
    page.on('pageerror', error => errors.push(error.message));
    page.on('request', request => { if (request.url().includes('.supabase.co')) databaseRequests.push(request.url()); });
    const catalogResponse = page.waitForResponse(response => new URL(response.url()).pathname === '/api/texts');
    await page.goto(new URL(target === 'de' ? '/textos' : `/${target}/textos`, base).href);
    const catalog = await (await catalogResponse).json();
    assert.ok(Array.isArray(catalog) && catalog.length >= 25);
    await expect(page.locator('html')).toHaveAttribute('lang', ui);
    await expect(page.locator('#learning-language')).toHaveValue(target);
    await expect(page.locator('#native-language')).toHaveValue(native);
    const card = page.getByTestId('featured-card').first();
    await expect(card).toBeVisible();
    const title = await card.locator('h3').innerText();
    assert.ok(catalog.some(text => text.title === title));
    const versionResponse = page.waitForResponse(response => new URL(response.url()).pathname === '/api/text-version');
    const vocabularyResponse = page.waitForResponse(response => new URL(response.url()).pathname === '/api/text-version-vocabulary-core');
    await card.click();
    const [version] = await (await versionResponse).json();
    const vocabulary = await (await vocabularyResponse).json();
    assert.ok(version.content.length > 100 && vocabulary.length > 0);
    await expect(page.locator('#content-body')).toContainText(version.content.trim().slice(0, 70));
    const original = originals.find(row => row.id === version.id);
    assert.ok(original, 'Translated records retain their original version identity');
    if (target === 'de') assert.equal(version.content, original.content);
    else {
      const expected = locales[target].versions.find(row => row.text_version_id === version.id);
      assert.equal(version.content, expected?.content, `Content must match the reviewed ${target} localization exactly`);
      assert.equal(title, locales[target].texts.find(row => row.text_id === version.text_id)?.title);
    }
    const normalize = text => text.replace(/\s+/g, ' ').trim();
    assert.equal(normalize(await page.locator('#content-body').innerText()), normalize(version.content), 'Rendered reading must contain the complete expected content');
    const untouched = ['de', 'en', 'es'].filter(language => language !== target).flatMap(language =>
      [`progress_${language === 'de' ? '' : language + '_'}${version.text_id}_b1`, `queue_${language === 'de' ? '' : language + '_'}${version.text_id}_b1`]
    );
    await page.evaluate(({ keys, guard }) => keys.forEach(key => localStorage.setItem(key, key.startsWith('progress_') ? guard : 'unchanged-sibling-queue')), { keys: untouched, guard });
    const untouchedBefore = await page.evaluate(keys => keys.map(key => localStorage.getItem(key)), untouched);
    const sharedUrl = page.url();
    await expect(page.locator('#link-canonical')).toHaveAttribute('href', sharedUrl);
    await page.locator('#btn-ir-actividad').click();
    if (target === 'en') await expect(page.locator('[data-modo="articulo"]')).toBeDisabled();
    else await expect(page.locator('[data-modo="articulo"]')).toBeEnabled();
    await page.locator('[data-modo="flashcards"]').click();
    await page.locator('#btn-empezar').click();
    await expect(page.locator('#flashcard-front')).not.toBeEmpty();
    const practiced = await page.locator('#flashcard-front').innerText();
    const explanation = await page.locator('#flashcard-back').innerText();
    const targetField = { de: 'german', en: 'english', es: 'spanish' }[target];
    const word = vocabulary.find(row => (row.target_word ?? row[targetField]) === practiced);
    assert.ok(word && explanation, 'The actual exercise uses target terms and native explanations');
    assert.equal(explanation, word.native_word ?? word[{ de: 'german', en: 'english', es: 'spanish' }[native]]);
    const sourceWord = originalVocabulary.find(row => row.id === word.id && row.text_version_id === version.id);
    assert.ok(sourceWord, 'Practiced word retains its original meaning ID and version link');
    const expectedTerm = language => language === 'de' ? sourceWord.german : locales[language].meanings.find(row => row.meaning_id === word.id)?.term;
    assert.equal(practiced, expectedTerm(target), 'Practiced term must match the reviewed target locale');
    assert.equal(explanation, expectedTerm(native), 'Displayed translation must match the reviewed native locale');
    await page.locator('#btn-flashcard-si').click();
    await page.locator('#btn-terminar').click();
    await expect(page.locator('#resumen-lista .resumen-word').first()).toHaveText(practiced);
    await page.screenshot({ path: path.join(outputDirectory, `ui-${ui}-aprende-${target}.png`), fullPage: true });
    const progressKey = `progress_${target === 'de' ? '' : target + '_'}${version.text_id}_b1`;
    assert.equal(await page.evaluate(key => JSON.parse(localStorage.getItem(key)).done, progressKey), 1);
    assert.deepEqual(await page.evaluate(keys => keys.map(key => localStorage.getItem(key)), untouched), untouchedBefore, 'Other-language progress/queues for this same text must remain intact');
    // The one-time initialization guard makes reload verify persisted state, not recreate it.
    await page.goto(sharedUrl);
    await expect(page.locator('html')).toHaveAttribute('lang', ui);
    await expect(page.locator('#learning-language')).toHaveValue(target);
    await expect(page.locator('#native-language')).toHaveValue(native);
    await page.locator('#btn-ir-actividad').click();
    await expect(page.locator('#weekly-progress-main')).toContainText(/1\s*\/\s*\d+/);
    assert.deepEqual(errors, []);
    assert.deepEqual(databaseRequests, [], 'Browser must never query production Supabase in this local matrix');
    rows.push({ ui, learningLanguage: target, vocabularyTranslation: native, catalogTexts: catalog.length,
      title, versionId: version.id, originalGermanContentPreserved: target === 'de', localizedContentVerified: target !== 'de',
      sharedPath: new URL(sharedUrl).pathname + new URL(sharedUrl).search, practiced, explanation,
      exactlyMatchesReviewedLocale: true, originalMeaningId: word.id, untouchedSiblingKeys: untouched,
      resultWord: practiced, progressKey, persistedAfterReload: true, otherLanguageProgressPreserved: true, pageErrors: errors.length });
    await fs.writeFile(path.join(outputDirectory, 'matriz-de-en-es.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(`PASS UI=${ui} target=${target} native=${native} catalog=${catalog.length} version=${version.id} persisted=true`);
    await context.close();
  }
} finally { await browser.close(); }
