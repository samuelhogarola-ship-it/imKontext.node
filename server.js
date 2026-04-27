import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 3000;
const frontendDir = path.join(__dirname, "imKontext");
const SUPABASE_URL =
  process.env.SUPABASE_URL || "https://fvhxbbhxucwawypfzikf.supabase.co";
const SUPABASE_ANON =
  process.env.SUPABASE_ANON_KEY ||
  process.env.SUPABASE_ANON ||
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2aHhiYmh4dWN3YXd5cGZ6aWtmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyMzEzMzEsImV4cCI6MjA5MDgwNzMzMX0.LBSbe0SGXM5mGB9Ym6ljLUyI1Tug7yP9YNFlROE6kRE";

app.disable("x-powered-by");

function hasSupabaseConfig() {
  return Boolean(SUPABASE_URL && SUPABASE_ANON);
}

async function supabaseFetch(pathname) {
  if (!hasSupabaseConfig()) {
    const error = new Error("Supabase no está configurado");
    error.details =
      "Faltan SUPABASE_URL y/o SUPABASE_ANON_KEY en el entorno del servidor.";
    throw error;
  }

  const response = await fetch(`${SUPABASE_URL}/rest/v1/${pathname}`, {
    headers: {
      apikey: SUPABASE_ANON,
      Authorization: `Bearer ${SUPABASE_ANON}`
    }
  });

  if (!response.ok) {
    const body = await response.text();
    const error = new Error(`Supabase error ${response.status}`);
    error.details = body;
    throw error;
  }

  return response.json();
}

app.get("/api/health", (req, res) => {
  res.json({
    ok: true,
    app: "imKontext.node",
    frontend: "imKontext",
    port: Number(PORT),
    supabaseConfigured: hasSupabaseConfig()
  });
});

app.get("/api/texts", async (req, res) => {
  try {
    const [texts, versions] = await Promise.all([
      supabaseFetch(
        "texts?select=id,title,slug,topic,access_status,published_at&order=published_at.desc.nullslast,id.desc"
      ),
      supabaseFetch("text_versions?select=text_id,level,content")
    ]);

    const versionsByTextId = {};
    versions.forEach((version) => {
      if (!versionsByTextId[version.text_id]) {
        versionsByTextId[version.text_id] = [];
      }
      versionsByTextId[version.text_id].push(version);
    });

    res.json(
      texts.map((text) => {
        const textVersions = versionsByTextId[text.id] || [];
        const preferredPreview =
          textVersions.find((version) => version.level === "B1") ||
          textVersions.find((version) => version.level === "A2") ||
          textVersions[0] ||
          null;

        return {
          ...text,
          levels: textVersions.map((version) => version.level).sort(),
          previewContent: preferredPreview?.content || ""
        };
      })
    );
  } catch (error) {
    res.status(500).json({
      error: "No se pudieron cargar los textos",
      details: error.details || error.message
    });
  }
});

app.get("/api/text-version", async (req, res) => {
  const textId = String(req.query.textId || "").trim();
  const level = String(req.query.level || "").trim().toUpperCase();

  if (!textId || !level) {
    return res.status(400).json({ error: "Faltan textId o level" });
  }

  try {
    const versions = await supabaseFetch(
      `text_versions?text_id=eq.${encodeURIComponent(textId)}&level=eq.${encodeURIComponent(level)}&select=id,text_id,level,content`
    );
    res.json(versions);
  } catch (error) {
    res.status(500).json({
      error: "No se pudo cargar la versión del texto",
      details: error.details || error.message
    });
  }
});

app.get("/api/text-version-vocabulary", async (req, res) => {
  const textVersionId = String(req.query.textVersionId || "").trim();

  if (!textVersionId) {
    return res.status(400).json({ error: "Falta textVersionId" });
  }

  try {
    const links = await supabaseFetch(
      `text_version_vocabulary?text_version_id=eq.${encodeURIComponent(textVersionId)}&select=vocabulario_id`
    );
    res.json(links);
  } catch (error) {
    res.status(500).json({
      error: "No se pudo cargar el vocabulario del texto",
      details: error.details || error.message
    });
  }
});

app.get("/api/vocabulario", async (req, res) => {
  const ids = String(req.query.ids || "")
    .split(",")
    .map((value) => value.trim())
    .filter(Boolean);

  if (ids.length === 0) {
    return res.status(400).json({ error: "Faltan ids de vocabulario" });
  }

  try {
    const vocab = await supabaseFetch(
      `vocabulario?id=in.(${ids.join(",")})&select=id,german,spanish,article,word_type,example_sentence_de`
    );
    res.json(vocab);
  } catch (error) {
    res.status(500).json({
      error: "No se pudo cargar el vocabulario",
      details: error.details || error.message
    });
  }
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
