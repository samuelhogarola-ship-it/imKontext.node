import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';
import {
  VIEWPORTS,
  disableAnimations,
  installDeterministicVisualState,
  prepareVisualPage,
  waitForVisualStability,
} from './helpers/visual.js';

function screenshotOptions(localOptions = {}) {
  return {
    animations: 'disabled',
    caret: 'hide',
    scale: 'css',
    ...localOptions,
  };
}

async function gotoVisualRoute(page, route, { mock = false, viewport = VIEWPORTS.desktop } = {}) {
  await prepareVisualPage(page, viewport);
  await installDeterministicVisualState(page);
  // Dismiss cookie banner so it never overlaps visual snapshots
  await page.addInitScript(() => {
    localStorage.setItem('imkontext_cookie_consent', 'accepted');
  });
  if (mock) {
    await mockApi(page);
  }
  await page.goto(route);
  await disableAnimations(page);
}

async function openFeaturedCard(page) {
  await expect(page.locator('#screen-textos')).toBeVisible({ timeout: 10_000 });
  const featuredCard = page.locator('[data-testid="featured-card"]').first();
  await expect(featuredCard).toBeVisible({ timeout: 10_000 });
  return featuredCard;
}

async function reachExercise(page, mode = 'test') {
  const featuredCard = await openFeaturedCard(page);
  await featuredCard.click();
  await expect(page.locator('#screen-content')).toBeVisible();
  await page.locator('#btn-ir-actividad').click();
  await expect(page.locator('#screen-activity')).toBeVisible();
  await page.locator(`#practice-selector [data-modo="${mode}"]`).click();
  await page.evaluate(() => {
    EXERCISE_CONFIG.autoNextDelay = 999;
  });
  await page.locator('#btn-empezar').click();
  await expect(page.locator('#screen-ejercicio')).toBeVisible({ timeout: 15_000 });
}

test.describe('visual regression without API dependency', () => {
  test('home page desktop screenshot', async ({ page }) => {
    await gotoVisualRoute(page, '/', { viewport: VIEWPORTS.desktop });
    const landing = page.locator('#screen-landing');
    await waitForVisualStability(page, landing);
    await expect(landing).toHaveScreenshot(
      'home-desktop.png',
      screenshotOptions({ maxDiffPixels: 19000 })
    );
  });

  test('home page mobile screenshot', async ({ page }) => {
    await gotoVisualRoute(page, '/', { viewport: VIEWPORTS.mobile });
    const landing = page.locator('#screen-landing');
    await waitForVisualStability(page, landing);
    await expect(landing).toHaveScreenshot(
      'home-mobile.png',
      screenshotOptions({ maxDiffPixels: 9000 })
    );
  });

  test('footer on home route', async ({ page }) => {
    await gotoVisualRoute(page, '/', { viewport: VIEWPORTS.desktop });
    const footer = page.locator('.ln-bottom-bar');
    await waitForVisualStability(page, footer);
    await expect(footer).toHaveScreenshot(
      'footer-home.png',
      screenshotOptions({ maxDiffPixels: 800 })
    );
  });

  test('footer on metodologia route', async ({ page }) => {
    await gotoVisualRoute(page, '/metodologia', { viewport: VIEWPORTS.desktop });
    await page.addStyleTag({
      content: '#app-footer { box-sizing: border-box !important; height: 51px !important; overflow: hidden !important; }',
    });
    const footer = page.locator('#app-footer');
    await waitForVisualStability(page, footer);
    await expect(footer).toHaveScreenshot(
      'footer-metodologia.png',
      screenshotOptions({ maxDiffPixels: 3000 })
    );
  });

  test('footer on legal route', async ({ page }) => {
    await gotoVisualRoute(page, '/legal', { viewport: VIEWPORTS.desktop });
    await page.addStyleTag({
      content: '#app-footer { box-sizing: border-box !important; height: 51px !important; overflow: hidden !important; }',
    });
    const footer = page.locator('#app-footer');
    await waitForVisualStability(page, footer);
    await expect(footer).toHaveScreenshot(
      'footer-legal.png',
      screenshotOptions({ maxDiffPixels: 1200 })
    );
  });
});

test.describe('visual regression with mocked app data', () => {
  test('featured card section', async ({ page }) => {
    await gotoVisualRoute(page, '/textos', { mock: true, viewport: VIEWPORTS.desktop });
    const featuredCard = page.locator('[data-testid="featured-card"]').first();
    await waitForVisualStability(page, featuredCard);
    await expect(featuredCard).toHaveScreenshot(
      'featured-card.png',
      screenshotOptions({ maxDiffPixels: 5500 })
    );
  });

  test('stats dashboard', async ({ page }) => {
    await page.addInitScript(() => {
      localStorage.setItem('progress_text-001_b1', JSON.stringify({ total: 6, done: 4 }));
      localStorage.setItem('progress_text-002_b2', JSON.stringify({ total: 6, done: 2 }));
    });
    await gotoVisualRoute(page, '/textos', { mock: true, viewport: VIEWPORTS.desktop });
    await page.locator('#nav-dashboard').click();
    const dashboard = page.locator('#db-content');
    await expect(dashboard).toBeVisible({ timeout: 10_000 });
    await waitForVisualStability(page, dashboard);
    await expect(dashboard).toHaveScreenshot(
      'stats-dashboard.png',
      screenshotOptions({ maxDiffPixels: 2000 })
    );
  });

  test('practice feedback correct answer state', async ({ page }) => {
    await gotoVisualRoute(page, '/textos', { mock: true, viewport: VIEWPORTS.desktop });
    await reachExercise(page, 'test');
    const answer = await page.evaluate(() => ({
      correct: queue[currentIdx]?.spanish || '',
    }));
    await page.locator('.opcion', { hasText: answer.correct }).click();
    const exercise = page.locator('#screen-ejercicio');
    await expect(page.locator('#respuesta-feedback')).toHaveClass(/correct/);
    await waitForVisualStability(page, exercise);
    await expect(exercise).toHaveScreenshot(
      'practice-feedback-correct.png',
      screenshotOptions({ maxDiffPixels: 2200 })
    );
  });

  test('practice feedback incorrect answer state', async ({ page }) => {
    await gotoVisualRoute(page, '/textos', { mock: true, viewport: VIEWPORTS.desktop });
    await reachExercise(page, 'test');
    const answer = await page.evaluate(() => {
      const correct = queue[currentIdx]?.spanish || '';
      const wrong = Array.from(document.querySelectorAll('.opcion'))
        .map(option => option.textContent || '')
        .find(option => option !== correct) || '';
      return { wrong };
    });
    await page.locator('.opcion', { hasText: answer.wrong }).click();
    const exercise = page.locator('#screen-ejercicio');
    await expect(page.locator('#respuesta-feedback')).toHaveClass(/wrong/);
    await waitForVisualStability(page, exercise);
    await expect(exercise).toHaveScreenshot(
      'practice-feedback-incorrect.png',
      screenshotOptions({ maxDiffPixels: 2500 })
    );
  });
});
