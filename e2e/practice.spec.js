import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';

test.beforeEach(async ({ page }) => {
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
