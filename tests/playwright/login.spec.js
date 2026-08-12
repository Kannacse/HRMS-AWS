const { test } = require('@playwright/test');

test('Inspect Flutter text editing', async ({ page }) => {
  await page.goto('http://hrms.local');

  await page.waitForTimeout(3000);

  console.log("Click the Username field manually.");
  console.log("After clicking it, press ENTER here in the terminal.");

  await page.pause();

  const count = await page.locator('input, textarea').count();
  console.log(`Inputs after focus: ${count}`);

  for (let i = 0; i < count; i++) {
    console.log(await page.locator('input, textarea').nth(i).evaluate(e => e.outerHTML));
  }

  await page.pause();
});
