import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";
import path from "node:path";
import test from "node:test";
import vm from "node:vm";

const projectRoot = process.cwd();
const frontendRoot = path.join(projectRoot, "imKontext");
const bootstrapPath = path.join(frontendRoot, "shared/umami-analytics.js");

function collectHtmlFiles() {
  return readdirSync(frontendRoot, { withFileTypes: true })
    .filter((entry) => entry.isFile() && entry.name.endsWith(".html"))
    .map((entry) => path.join(frontendRoot, entry.name));
}

async function runBootstrap(config, { readyState = "complete" } = {}) {
  const source = readFileSync(bootstrapPath, "utf8");
  const appended = [];
  let loadHandler = null;
  const document = {
    readyState,
    createElement() {
      return { dataset: {}, defer: false };
    },
    head: { appendChild: (element) => appended.push(element) },
    querySelector() {
      return null;
    },
  };
  const window = {
    addEventListener(type, handler) {
      if (type === "load") loadHandler = handler;
    },
  };
  vm.runInContext(
    source,
    vm.createContext({
      console,
      document,
      fetch: async () => ({ json: async () => config, ok: true }),
      window,
    }),
  );
  return {
    appended,
    fireLoad() {
      loadHandler?.();
    },
    loadHandler,
    ready: window.ImKontextUmami.ready,
  };
}

async function loadTracker(config) {
  const bootstrap = await runBootstrap(config);
  await bootstrap.ready;
  return bootstrap.appended[0] ?? null;
}

test("covers every HTML entry with personal Umami", async () => {
  const htmlFiles = collectHtmlFiles();
  const incorrect = htmlFiles
    .filter((file) => {
      const matches = readFileSync(file, "utf8").match(
        /\/shared\/umami-analytics\.js/g,
      );
      return matches?.length !== 1;
    })
    .map((file) => path.relative(projectRoot, file));
  const tracker = await loadTracker({
    hostUrl: "https://analytics.187.124.55.36.sslip.io",
    websiteId: "imkontext-test-id",
  });

  assert.equal(htmlFiles.length, 5);
  assert.deepEqual(incorrect, []);
  assert.equal(
    tracker.src,
    "https://analytics.187.124.55.36.sslip.io/script.js",
  );
  assert.equal(tracker.dataset.websiteId, "imkontext-test-id");
});

test("versioned production config loads the real imKontext website", async () => {
  const config = JSON.parse(
    readFileSync(path.join(frontendRoot, "umami-config.json"), "utf8"),
  );
  const tracker = await loadTracker(config);

  assert.deepEqual(config, {
    hostUrl: "https://analytics.187.124.55.36.sslip.io",
    websiteId: "e29b9b5b-3ec7-4e25-8d5d-76e1a52d86a2",
  });
  assert.equal(tracker?.dataset.websiteId, config.websiteId);
});

test("fails closed without a website id or with the wrong host", async () => {
  const tracker = await loadTracker({
    hostUrl: "https://analytics.187.124.55.36.sslip.io",
    websiteId: "",
  });
  const wrongHostTracker = await loadTracker({
    hostUrl: "https://analytics.2.24.10.239.sslip.io",
    websiteId: "e29b9b5b-3ec7-4e25-8d5d-76e1a52d86a2",
  });
  assert.equal(tracker, null);
  assert.equal(wrongHostTracker, null);
});

test("waits for page load before requesting the external tracker", async () => {
  const bootstrap = await runBootstrap(
    {
      hostUrl: "https://analytics.187.124.55.36.sslip.io",
      websiteId: "e29b9b5b-3ec7-4e25-8d5d-76e1a52d86a2",
    },
    { readyState: "loading" },
  );

  await new Promise((resolve) => setImmediate(resolve));
  assert.equal(bootstrap.appended.length, 0);
  assert.equal(typeof bootstrap.loadHandler, "function");

  bootstrap.fireLoad();
  await bootstrap.ready;
  assert.equal(bootstrap.appended.length, 1);
});
