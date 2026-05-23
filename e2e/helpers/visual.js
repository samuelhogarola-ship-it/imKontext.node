export const VIEWPORTS = {
  desktop: { width: 1440, height: 1200 },
  mobile: { width: 390, height: 844 },
};

export async function installDeterministicVisualState(page) {
  await page.addInitScript(() => {
    let seed = 123456789;
    Math.random = () => {
      seed = (seed * 1664525 + 1013904223) % 4294967296;
      return seed / 4294967296;
    };
  });
}

export async function prepareVisualPage(page, viewport) {
  await page.setViewportSize(viewport);
  await page.emulateMedia({ reducedMotion: 'reduce' });
}

export async function disableAnimations(page) {
  await page.addStyleTag({
    content: `
      *,
      *::before,
      *::after {
        animation-duration: 0s !important;
        animation-delay: 0s !important;
        transition-duration: 0s !important;
        transition-delay: 0s !important;
        scroll-behavior: auto !important;
        caret-color: transparent !important;
      }
    `,
  });
}

export async function waitForVisualStability(page, locator) {
  await page.waitForLoadState('networkidle');
  await page.evaluate(async () => {
    if (document.fonts?.ready) {
      await document.fonts.ready;
    }
    await new Promise(resolve => requestAnimationFrame(() => requestAnimationFrame(resolve)));
  });

  if (locator) {
    await locator.scrollIntoViewIfNeeded();
    await locator.waitFor({ state: 'visible' });
  }
}
