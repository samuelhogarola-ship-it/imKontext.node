import { readFile } from 'node:fs/promises';
import path from 'node:path';

const nonEmpty = value => typeof value === 'string' && value.trim().length > 0;

function byKey(rows, key, value) {
  return rows.filter(row => String(row[key]) === String(value));
}

export function buildTranslationStatus({
  texts = [],
  versions = [],
  meanings = [],
  versionLocalizations = null,
  meaningLocalizations = null,
  vocabulary = [],
}) {
  const completeTextIds = [];
  const pendingTextIds = [];
  const pendingFields = [];

  for (const text of texts) {
    const sourceVersions = byKey(versions, 'text_id', text.id);
    const textVersions = versionLocalizations
      ? sourceVersions.map(version => versionLocalizations.find(row => (
        String(row.text_version_id) === String(version.id) && row.language === 'en'
      )) || { text_id: text.id, content: null })
      : byKey(versions, 'text_id', text.id).filter(row => row.language === 'en');
    const sourceMeaningIds = new Set(
      vocabulary
        .filter(row => sourceVersions.some(version => String(version.id) === String(row.text_version_id)))
        .map(row => String(row.id))
    );
    const textMeanings = meaningLocalizations
      ? meaningLocalizations.filter(row => row.language === 'en' && sourceMeaningIds.has(String(row.meaning_id)))
      : byKey(meanings, 'text_id', text.id).filter(row => row.language === 'en');
    const missingVersion = textVersions.some(row => !nonEmpty(row.content));
    const missingMeaning = textMeanings.some(row => !nonEmpty(row.term) || !nonEmpty(row.example));
    if (!missingVersion && !missingMeaning && textVersions.length > 0) {
      completeTextIds.push(text.id);
      continue;
    }
    pendingTextIds.push(text.id);
    for (const row of textVersions) {
      for (const field of ['content']) {
        if (!nonEmpty(row[field])) pendingFields.push({ textId: text.id, field: `version.${field}` });
      }
    }
    for (const row of textMeanings) {
      for (const field of ['term', 'example']) {
        if (!nonEmpty(row[field])) pendingFields.push({ textId: text.id, field: `meaning.${field}` });
      }
    }
    if (!textVersions.length) pendingFields.push({ textId: text.id, field: 'version.content' });
  }

  return { completeTextIds, pendingTextIds, pendingFields };
}

export function renderMarkdownStatus(status, { generatedAt = new Date().toISOString() } = {}) {
  const lines = [
    '# Estado de traducción inglesa de ImKontext',
    '',
    `Generado: ${generatedAt}`,
    '',
    `- Textos con traducción preparada (aún no publicada): ${status.completeTextIds.length}`,
    `- Textos pendientes para Claude: ${status.pendingTextIds.length}`,
    '',
    '## Pendiente de traducir',
    '',
    ...(status.pendingFields.length
      ? status.pendingFields.map(item => `- Texto ${item.textId}: ${item.field}`)
      : ['- No hay campos pendientes.']),
    '',
    'Este documento es una referencia interna. No ejecuta SQL ni publica contenido.',
    '',
  ];
  return lines.join('\n');
}

export function buildPublicationEvidence({ prepared = [], current = [] }) {
  const preparedIds = prepared.map(row => row.id).sort((a, b) => a - b);
  const currentIds = current.map(row => row.id).sort((a, b) => a - b);
  const preparedSet = new Set(preparedIds.map(String));
  const pendingIds = currentIds.filter(id => !preparedSet.has(String(id)));
  return {
    completeTextIds: preparedIds,
    pendingTextIds: pendingIds,
    pendingFields: pendingIds.map(textId => ({ textId, field: 'English content and exercise examples' })),
    preparedOnly: true,
  };
}

export async function loadSourceDirectory(directory) {
  const read = async name => JSON.parse(await readFile(path.join(directory, name), 'utf8'));
  return {
    texts: await read('german-texts.json'),
    versions: await read('german-versions.json'),
    meanings: [],
    versionLocalizations: await read('current-version-localizations.json'),
    meaningLocalizations: await read('current-meaning-localizations.json'),
    vocabulary: await read('german-vocabulary.json'),
  };
}

if (process.argv[1] && path.resolve(process.argv[1]) === path.resolve(new URL(import.meta.url).pathname)) {
  const sourceDir = process.argv[2];
  const outputPath = process.argv[3];
  if (!sourceDir || !outputPath) {
    console.error('Usage: node scripts/build-translation-status.mjs <source-dir> <output.md>');
    process.exitCode = 1;
  } else {
    const source = await loadSourceDirectory(sourceDir);
    const status = buildTranslationStatus(source);
    await import('node:fs/promises').then(fs => fs.writeFile(outputPath, renderMarkdownStatus(status), 'utf8'));
    console.log(`translation-status-written:${outputPath}`);
  }
}
