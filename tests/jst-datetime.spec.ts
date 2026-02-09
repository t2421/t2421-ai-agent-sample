import { test, expect } from '@playwright/test';
import path from 'path';

const htmlPath = `file://${path.resolve(__dirname, '../apps/index.html')}`;

test('displays JST datetime in #datetime element', async ({ page }) => {
  await page.goto(htmlPath);

  const datetime = page.locator('#datetime');
  await expect(datetime).toBeVisible();

  const text = await datetime.textContent();
  // ja-JP locale with Asia/Tokyo timezone produces format like "2026/2/9 15:30:00"
  expect(text).toMatch(/^\d{4}\/\d{1,2}\/\d{1,2} \d{1,2}:\d{2}:\d{2}$/);
});

test('datetime updates after 1 second', async ({ page }) => {
  await page.goto(htmlPath);

  const datetime = page.locator('#datetime');
  const firstText = await datetime.textContent();

  await page.waitForTimeout(1500);

  const secondText = await datetime.textContent();
  expect(secondText).not.toBe(firstText);
});
