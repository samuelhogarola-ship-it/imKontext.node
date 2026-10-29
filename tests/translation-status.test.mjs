import assert from 'node:assert/strict';
import test from 'node:test';

import { buildTranslationStatus } from '../scripts/build-translation-status.mjs';

test('translation status separates complete English rows from pending fields', () => {
  const report = buildTranslationStatus({
    texts: [{ id: 1, title: 'Complete' }, { id: 2, title: 'Pending' }],
    versions: [
      { text_id: 1, language: 'en', content: 'Complete article' },
      { text_id: 2, language: 'en', content: null },
    ],
    meanings: [
      { text_id: 1, language: 'en', term: 'term', example: 'Example.' },
      { text_id: 2, language: 'en', term: 'term', example: null },
    ],
  });

  assert.deepEqual(report.completeTextIds, [1]);
  assert.deepEqual(report.pendingTextIds, [2]);
  assert.equal(report.pendingFields[0].field, 'version.content');
  assert.equal(report.sql, undefined);
});
