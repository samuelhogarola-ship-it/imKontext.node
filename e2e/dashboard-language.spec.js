import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';

const labels = {
  es: ['Palabras practicadas', 'Textos activos', 'Progreso global'],
  en: ['Words practiced', 'Active texts', 'Overall progress'],
  de: ['Geübte Wörter', 'Aktive Texte', 'Gesamtfortschritt'],
  fi: ['Harjoitellut sanat', 'Aktiiviset tekstit', 'Kokonaisedistyminen'],
  it: ['Parole praticate', 'Testi attivi', 'Progresso complessivo'],
  pt: ['Palavras praticadas', 'Textos ativos', 'Progresso geral'],
};

for (const [language, expectedLabels] of Object.entries(labels)) {
  test(`${language}: dashboard labels describe practiced words, active texts and total progress`, async ({ page }) => {
    await mockApi(page);
    await page.addInitScript(language => {
      localStorage.setItem('imk_ui_lang', language);
      localStorage.setItem('imkontext_cookie_consent', 'rejected');
      localStorage.setItem('progress_text-001_b1', JSON.stringify({ total: 6, done: 4 }));
      localStorage.setItem('progress_text-002_b2', JSON.stringify({ total: 6, done: 2 }));
    }, language);
    await page.goto('/textos');
    await expect(page.getByTestId('featured-card').first()).toBeVisible();
    await page.locator('#nav-dashboard').click();
    await expect(page.locator('#db-stats-grid .db-stat-num')).toHaveText(['6', '2']);
    await expect(page.locator('#db-stats-grid .db-global-circle')).toHaveText('50%');
    await expect(page.locator('#db-stats-grid .db-stat-lbl')).toHaveText(expectedLabels, { useInnerText: true, ignoreCase: true });
  });
}
