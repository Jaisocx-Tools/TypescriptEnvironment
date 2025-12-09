const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    baseUrl: process.env.CYPRESS_BASE_URL || 'https://sandbox.brightday.email:8445/',
    supportFile: false,
    specPattern: '/var/cypress/e2e/**/*.cy.{js,ts}',
  },
});


