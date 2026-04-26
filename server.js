import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 3000;
const frontendDir = path.join(__dirname, "imKontext");

app.disable("x-powered-by");

app.get("/api/health", (req, res) => {
  res.json({
    ok: true,
    app: "imKontext.node",
    frontend: "imKontext",
    port: Number(PORT)
  });
});

app.use(express.static(frontendDir, {
  extensions: ["html"]
}));

app.get("*", (req, res) => {
  res.sendFile(path.join(frontendDir, "index.html"));
});

app.listen(PORT, () => {
  console.log(`imKontext.node running on http://localhost:${PORT}`);
});
