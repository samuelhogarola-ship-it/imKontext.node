import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';

test.beforeEach(async ({ page }) => {
  await mockApi(page);
});

test('landing page loads', async ({ page }) => {
  await page.goto('/');

  await expect(page).toHaveTitle(/imKontext/);
  await expect(page.locator('#screen-landing')).toBeVisible();
  await expect(page.locator('#btn-entrar')).toBeVisible();
});

test('can navigate to text list and see texts', async ({ page }) => {
  await page.goto('/textos');

  // Wait for JS to load and render the text list
  await expect(page.locator('#screen-textos')).toBeVisible();

  // At least one text card should appear (featured or regular row)
  const anyCard = page.locator('[data-testid="featured-card"], [data-testid="text-row"]').first();
  await expect(anyCard).toBeVisible({ timeout: 10_000 });
});

test('category filter shows all texts and filters client-side', async ({ page }) => {
  await page.goto('/textos');

  await expect(page.locator('#screen-textos')).toBeVisible();
  await expect(page.getByRole('button', { name: 'Todas' })).toBeVisible();
  await expect(page.getByText('Neue Regeln im Klassenzimmer')).toBeVisible();

  await page.getByRole('button', { name: 'Tecnología' }).click();

  await expect(page.getByText('Künstliche Intelligenz im Alltag')).toBeVisible();
  await expect(page.getByText('Die Energiewende in Deutschland')).toHaveCount(0);
  await expect(page.getByText('Neue Regeln im Klassenzimmer')).toHaveCount(0);

  await page.getByRole('button', { name: 'Todas' }).click();

  await expect(page.getByText('Die Energiewende in Deutschland')).toBeVisible();
  await expect(page.getByText('Neue Regeln im Klassenzimmer')).toBeVisible();
});

test('can open a free text and reach the activity screen', async ({ page }) => {
  await page.goto('/textos');

  // Wait for the list to render
  const featuredCard = page.locator('[data-testid="featured-card"]').first();
  await expect(featuredCard).toBeVisible({ timeout: 10_000 });

  // Open the featured (always-accessible) text
  await featuredCard.click();
  await expect(page.locator('#screen-content')).toBeVisible();

  // The "go to activity" button must be present for accessible texts
  const actBtn = page.locator('#btn-ir-actividad');
  await expect(actBtn).toBeVisible();

  // Navigate to the activity config screen
  await actBtn.click();
  await expect(page.locator('#screen-activity')).toBeVisible();
  await expect(page.locator('#btn-empezar')).toBeVisible();
});
