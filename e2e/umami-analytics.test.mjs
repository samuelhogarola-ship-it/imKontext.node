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

async function runBootstrap(config) {
  const source = readFileSync(bootstrapPath, "utf8");
  const appended = [];
  const document = {
    createElement() {
      return { dataset: {}, defer: false };
    },
    head: { appendChild: (element) => appended.push(element) },
    querySelector() {
      return null;
    },
  };
  const window = {};
  vm.runInContext(
    source,
    vm.createContext({
      console,
      document,
      fetch: async () => ({ json: async () => config, ok: true }),
      window,
    }),
  );
  await window.ImKontextUmami.ready;
  return appended[0] ?? null;
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
  const tracker = await runBootstrap({
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

test("fails closed without a website id", async () => {
  const tracker = await runBootstrap({
    hostUrl: "https://analytics.187.124.55.36.sslip.io",
    websiteId: "",
  });
  assert.equal(tracker, null);
});
