import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';

test.beforeEach(async ({ page }) => {
  await page.addInitScript(() => localStorage.setItem('imkontext_cookie_consent', 'rejected'));
  await mockApi(page);
});

// Navigate through the full flow to reach the exercise screen.
async function reachExercise(page) {
  await page.goto('/textos');
  await page.locator('[data-testid="featured-card"]').first().waitFor({ state: 'visible', timeout: 10_000 });
  await page.locator('[data-testid="featured-card"]').first().click();
  await expect(page.locator('#screen-content')).toBeVisible();
  await page.locator('#btn-ir-actividad').click();
  await expect(page.locator('#screen-activity')).toBeVisible();
  await page.locator('#btn-empezar').click();
  // Vocab is fetched async — wait until the exercise screen is shown.
  await expect(page.locator('#screen-ejercicio')).toBeVisible({ timeout: 15_000 });
}

async function reachTestExercise(page) {
  await page.goto('/deutsch/textos');
  await page.locator('[data-testid="featured-card"]').first().waitFor({ state: 'visible', timeout: 10_000 });
  await page.locator('[data-testid="featured-card"]').first().click();
  await expect(page.locator('#screen-content')).toBeVisible();
  await page.locator('#btn-ir-actividad').click();
  await expect(page.locator('#screen-activity')).toBeVisible();
  await page.locator('#practice-selector [data-modo="test"]').click();
  await page.evaluate(() => { EXERCISE_CONFIG.autoNextDelay = 999; });
  await page.locator('#btn-empezar').click();
  await expect(page.locator('#screen-ejercicio')).toBeVisible({ timeout: 15_000 });
}

async function currentLanguagePair(page) {
  return page.evaluate(() => ({
    native: getNativeWord(queue[currentIdx]),
    target: getTargetWord(queue[currentIdx]),
  }));
}

// Answer whatever exercise mode is currently rendered.
async function respondToExercise(page) {
  const badge = await page.locator('#tipo-badge').textContent();

  if (badge.includes('Flashcard')) {
    await page.locator('#btn-flashcard-no').click();
  } else if (badge.includes('Ordenar')) {
    // Move every token from the bank to the construction area.
    const banco = page.locator('#banco-palabras [data-testid="palabra-token"]');
    const count = await banco.count();
    for (let i = 0; i < count; i++) {
      await banco.first().click();
    }
    await expect(page.locator('#respuesta-feedback')).not.toHaveText('');
  } else {
    // test / artículo / lückentext all provide #btn-no-se.
    await page.locator('#btn-no-se').click();
  }
}

test('exercise screen loads with first question', async ({ page }) => {
  await reachExercise(page);

  await expect(page.locator('#tipo-badge')).toBeVisible();
  await expect(page.locator('#prog-actual')).toHaveText('1');
  await expect(page.locator('#prog-total')).not.toHaveText('0');
});

test('Test direction button starts reversed and swaps the visible language sides', async ({ page }) => {
  await reachTestExercise(page);

  const first = await currentLanguagePair(page);
  const direction = page.locator('#test-direction-toggle');

  await expect(direction).toBeVisible();
  await expect(direction).toContainText('🇪🇸');
  await expect(direction).toContainText('🇩🇪');
  await expect(direction).toContainText('→');
  await expect(direction).toHaveAttribute('aria-label', 'Cambiar dirección: 🇩🇪 Alemán a 🇪🇸 Español');
  await expect(direction).toHaveAttribute('title', 'Cambiar dirección: 🇩🇪 Alemán a 🇪🇸 Español');
  await expect(page.locator('#pregunta-texto')).toHaveText(first.native);
  await expect(page.locator('.opcion', { hasText: first.target })).toHaveCount(1);

  const stateBeforeToggle = await page.evaluate(() => ({ currentIdx, score: { ...score } }));
  await direction.click();

  await expect(page.locator('#pregunta-texto')).toHaveText(first.target);
  await expect(page.locator('.opcion', { hasText: first.native })).toHaveCount(1);
  await expect(direction).toHaveAttribute('aria-label', 'Cambiar dirección: 🇪🇸 Español a 🇩🇪 Alemán');
  await expect.poll(() => page.evaluate(() => ({ currentIdx, score: { ...score } }))).toEqual(stateBeforeToggle);
});

test('Test direction persists across questions and repeat while answered questions restore their own direction', async ({ page }) => {
  await reachTestExercise(page);
  const direction = page.locator('#test-direction-toggle');

  await direction.click();
  const first = await currentLanguagePair(page);
  const originalOptions = await page.locator('.opcion').allTextContents();
  const wrongAnswer = originalOptions.find(option => option !== first.native);
  await page.locator('.opcion', { hasText: wrongAnswer }).click();
  await expect(direction).toBeDisabled();
  await page.locator('#btn-siguiente').click();

  const second = await currentLanguagePair(page);
  await expect(direction).toHaveAttribute('data-direction', 'forward');
  await expect(page.locator('#pregunta-texto')).toHaveText(second.target);

  await direction.click();
  await expect(direction).toHaveAttribute('data-direction', 'reverse');
  await expect(page.locator('#pregunta-texto')).toHaveText(second.native);

  await page.locator('#btn-atras').click();
  await expect(direction).toHaveAttribute('data-direction', 'forward');
  await expect(direction).toBeDisabled();
  await expect(page.locator('#pregunta-texto')).toHaveText(first.target);
  await expect(page.locator('.opcion')).toHaveText(originalOptions);
  await expect(page.locator('.opcion.wrong-ans')).toHaveText(wrongAnswer);

  await page.locator('#btn-siguiente').click();
  await expect(direction).toHaveAttribute('data-direction', 'reverse');
  await direction.click();
  await expect(direction).toHaveAttribute('data-direction', 'forward');
  await page.locator('#btn-terminar').click();
  await page.locator('#btn-repasar-errores').click();

  const review = await currentLanguagePair(page);
  await expect(direction).toHaveAttribute('data-direction', 'forward');
  await expect(page.locator('#pregunta-texto')).toHaveText(review.target);

  await page.locator('#btn-terminar').click();
  await page.locator('#btn-reiniciar').click();

  const repeated = await currentLanguagePair(page);
  await expect(direction).toHaveAttribute('data-direction', 'forward');
  await expect(page.locator('#pregunta-texto')).toHaveText(repeated.target);
});

test('a newly started Test session resets to reverse after a previous forward session', async ({ page }) => {
  await reachTestExercise(page);
  const direction = page.locator('#test-direction-toggle');
  await direction.click();
  await expect(direction).toHaveAttribute('data-direction', 'forward');

  await page.locator('#btn-terminar').click();
  await page.locator('#btn-volver-menu').click();
  await page.locator('#btn-empezar').click();
  await expect(page.locator('#screen-ejercicio')).toBeVisible({ timeout: 15_000 });

  const restarted = await currentLanguagePair(page);
  await expect(direction).toHaveAttribute('data-direction', 'reverse');
  await expect(page.locator('#pregunta-texto')).toHaveText(restarted.native);
});

test('Test shows a clear fallback when the selected language pair is unavailable', async ({ page }) => {
  await page.addInitScript(() => localStorage.setItem('imk_ui_lang', 'en'));
  await reachTestExercise(page);

  const direction = page.locator('#test-direction-toggle');
  await expect(direction).toBeHidden();
  await expect(page.locator('#pregunta-texto')).toHaveText(
    'No translation is available between 🇬🇧 English and 🇩🇪 German. Use Next to continue.'
  );
  await expect(page.locator('.opcion')).toHaveCount(0);
  await expect(page.locator('#btn-no-se')).toHaveCount(0);
  await expect(page.locator('#btn-siguiente')).toBeEnabled();
  await page.locator('#btn-siguiente').click();
  await expect(page.locator('#prog-actual')).toHaveText('2');
});

test('same target and interface language hides the direction control and keeps Test answerable', async ({ page }) => {
  await page.goto('/espanol/textos');
  await page.locator('[data-testid="featured-card"]').first().waitFor({ state: 'visible', timeout: 10_000 });
  await page.locator('[data-testid="featured-card"]').first().click();
  await page.locator('#btn-ir-actividad').click();
  await page.locator('#practice-selector [data-modo="test"]').click();
  await page.evaluate(() => { EXERCISE_CONFIG.autoNextDelay = 999; });
  await page.locator('#btn-empezar').click();
  await expect(page.locator('#screen-ejercicio')).toBeVisible({ timeout: 15_000 });

  const pair = await currentLanguagePair(page);
  await expect(page.locator('#test-direction-toggle')).toBeHidden();
  await expect(page.locator('#pregunta-texto')).toHaveText(pair.native);
  await expect(page.locator('.opcion', { hasText: pair.target })).toHaveCount(1);
  await page.locator('.opcion', { hasText: pair.target }).click();
  await expect(page.locator('#respuesta-feedback')).not.toHaveText('');
});

test('answering a question shows correct or wrong feedback', async ({ page }) => {
  await reachExercise(page);
  await respondToExercise(page);

  const feedback = page.locator('#respuesta-feedback');
  await expect(feedback).not.toHaveText('');
  const cls = await feedback.getAttribute('class');
  expect(cls).toMatch(/correct|wrong/);
});

test('finishing practice shows result screen with score', async ({ page }) => {
  await reachExercise(page);
  await page.locator('#btn-terminar').click();

  await expect(page.locator('#screen-resultado')).toBeVisible();
  await expect(page.locator('#punt-grande')).toBeVisible();
  // Score is always a percentage, e.g. "0%" or "100%"
  await expect(page.locator('#punt-grande')).toContainText('%');
});
