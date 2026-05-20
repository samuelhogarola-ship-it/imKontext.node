import { test, expect } from '@playwright/test';

test('no JS errors during main navigation flow', async ({ page }) => {
  const errors = [];
  page.on('pageerror', err => errors.push(err.message));

  await page.goto('/');
  await page.locator('#btn-entrar').click();
  await page.locator('[data-testid="featured-card"]').first().waitFor({ state: 'visible', timeout: 10_000 });
  await page.locator('[data-testid="featured-card"]').first().click();
  await expect(page.locator('#screen-content')).toBeVisible();

  expect(errors).toEqual([]);
});

test('no broken same-origin assets on landing and text list', async ({ page }) => {
  const failed = [];
  page.on('response', res => {
    const url = res.url();
    const status = res.status();
    // Only flag same-origin non-API resources (static assets served by Express).
    if (url.startsWith('http://localhost') && !url.includes('/api/') && status >= 400) {
      failed.push(`${status} ${url}`);
    }
  });

  await page.goto('/');
  await page.goto('/textos');

  expect(failed).toEqual([]);
});

test('unknown text slug shows graceful error in the text list', async ({ page }) => {
  await page.goto('/textos/esta-ruta-no-existe-nunca-jamas');

  // App redirects to the text list and shows an inline error message.
  await expect(page.locator('#screen-textos')).toBeVisible({ timeout: 10_000 });
  await expect(page.locator('#txsel-error')).toBeVisible();
  await expect(page.locator('#txsel-error')).toContainText('No se encontró');
});
