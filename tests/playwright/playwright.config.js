const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  timeout: 30000,

  use: {
    headless: true,
    baseURL: 'http://hrms.local',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
    trace: 'retain-on-failure'
  }
});
