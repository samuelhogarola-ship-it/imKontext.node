import { test, expect } from '@playwright/test';
import { mockApi } from './helpers/mock-api.js';

const labels = {
  es: ['Destacado de la semana', 'Esta selección incluye textos premium.', 'Ver más textos'],
  en: ['Featured this week', 'This selection includes premium texts.', 'See more texts'],
  de: ['Highlight der Woche', 'Diese Auswahl enthält Premium-Texte.', 'Weitere Texte anzeigen'],
  fi: ['Viikon valinta', 'Tämä valikoima sisältää premium-tekstejä.', 'Näytä lisää tekstejä'],
  it: ['In evidenza questa settimana', 'Questa selezione include testi premium.', 'Mostra altri testi'],
  pt: ['Destaque da semana', 'Esta seleção inclui textos premium.', 'Ver mais textos'],
};

async function catalog(page) {
  await mockApi(page);
  await page.route(url => url.pathname === '/api/texts', route => route.fulfill({ json:
    Array.from({ length: 12 }, (_, i) => ({
      id: `text-${i}`, title: `Article ${i}`, slug: `article-${i}`, categoria: 'sociedad',
      levels: ['B1'], access_status: i === 0 ? 'premium' : 'free', hasLoadedVocabulary: true,
      published_at: '2026-05-01T00:00:00Z', previewContent: 'An article for reading practice.',
    }))
  }));
}

for (const [language, [featured, notice, next]] of Object.entries(labels)) {
  test(`${language}: catalog controls use the chosen interface language`, async ({ page }) => {
    await catalog(page);
    await page.addInitScript(language => {
      localStorage.setItem('imk_ui_lang', language);
      localStorage.setItem('imkontext_cookie_consent', 'rejected');
    }, language);
    await page.goto('/textos');
    await expect(page.locator('.tx-featured-kicker')).toHaveText(featured);
    await expect(page.locator('.tx-archive-note strong')).toHaveText(notice);
    await expect(page.locator('#txsel-page-next')).toHaveAccessibleName(next);
  });
}

test('switching interface language refreshes the visible catalog immediately', async ({ page }) => {
  await catalog(page);
  await page.goto('/textos');
  await expect(page.locator('.tx-featured-kicker')).toHaveText(labels.es[0]);
  await page.locator('#lang-selector-btn').click();
  await page.locator('#lang-ui-grid [data-lang="en"]').click();
  await expect(page.locator('.tx-featured-kicker')).toHaveText(labels.en[0]);
  await expect(page.locator('.tx-archive-note strong')).toHaveText(labels.en[1]);
  await expect(page.locator('#txsel-page-next')).toHaveAccessibleName(labels.en[2]);
});
