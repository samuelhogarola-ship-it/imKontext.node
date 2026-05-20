import { test, expect } from '@playwright/test';

test('GET /api/health confirms Supabase is configured', async ({ request }) => {
  const res = await request.get('/api/health');
  expect(res.ok()).toBe(true);
  const body = await res.json();
  expect(body.ok).toBe(true);
  expect(body.supabaseConfigured).toBe(true);
});

test('GET /api/texts returns a non-empty array with the expected shape', async ({ request }) => {
  const res = await request.get('/api/texts');
  expect(res.ok()).toBe(true);
  const texts = await res.json();
  expect(Array.isArray(texts)).toBe(true);
  expect(texts.length).toBeGreaterThan(0);

  for (const t of texts.slice(0, 3)) {
    expect(t).toHaveProperty('id');
    expect(t).toHaveProperty('slug');
    expect(t).toHaveProperty('title');
    expect(t).toHaveProperty('access_status');
    expect(Array.isArray(t.levels)).toBe(true);
  }
});

test('GET /api/texts includes at least one accessible (free or freemium) text', async ({ request }) => {
  const res = await request.get('/api/texts');
  const texts = await res.json();
  const accessible = texts.filter(t =>
    t.access_status === 'free' || t.access_status === 'freemium'
  );
  expect(accessible.length).toBeGreaterThan(0);
});

test('GET /api/text-version returns content for an accessible text', async ({ request }) => {
  const listRes = await request.get('/api/texts');
  const texts = await listRes.json();
  const candidate = texts.find(t =>
    (t.access_status === 'free' || t.access_status === 'freemium') &&
    t.levels.length > 0
  );
  expect(candidate).toBeDefined();

  const level = candidate.levels[0];
  const res = await request.get(`/api/text-version?textId=${candidate.id}&level=${level}`);
  expect(res.ok()).toBe(true);
  const versions = await res.json();
  expect(Array.isArray(versions)).toBe(true);
  expect(versions.length).toBeGreaterThan(0);
  expect(versions[0]).toHaveProperty('id');
  expect(typeof versions[0].content).toBe('string');
  expect(versions[0].content.length).toBeGreaterThan(0);
});
