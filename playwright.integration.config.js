import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './integration',
  timeout: 30_000,
  retries: 0,
  reporter: 'list',
  use: {
    baseURL: 'http://localhost:3101',
  },
  webServer: {
    command: 'PORT=3101 node server.js',
    url: 'http://localhost:3101/api/health',
    reuseExistingServer: !process.env.CI,
    timeout: 15_000,
  },
});
