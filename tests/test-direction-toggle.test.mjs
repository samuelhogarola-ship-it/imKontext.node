import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import test from 'node:test';
import vm from 'node:vm';

const coreSource = readFileSync(new URL('../imKontext/shared/practice-core.js', import.meta.url), 'utf8');
const context = vm.createContext({ Math });
vm.runInContext(coreSource, context);

const directionFixture = {
  targetWord: 'laufen',
  nativeWord: 'correr',
  targetColumn: 'german',
  nativeColumn: 'spanish',
  targetLang: 'de',
  nativeLang: 'es',
};

test('reverse Test direction asks in the interface language and answers in the target language', () => {
  const actual = context.buildTestDirectionData(directionFixture, 'reverse');

  assert.deepEqual(JSON.parse(JSON.stringify(actual)), {
    direction: 'reverse',
    prompt: 'correr',
    answer: 'laufen',
    answerColumn: 'german',
    promptLang: 'es',
    answerLang: 'de',
  });
});

test('forward Test direction asks in the target language and answers in the interface language', () => {
  const actual = context.buildTestDirectionData(directionFixture, 'forward');

  assert.deepEqual(JSON.parse(JSON.stringify(actual)), {
    direction: 'forward',
    prompt: 'laufen',
    answer: 'correr',
    answerColumn: 'spanish',
    promptLang: 'de',
    answerLang: 'es',
  });
});

test('unknown Test direction safely defaults to reverse', () => {
  assert.equal(context.buildTestDirectionData(directionFixture, 'unexpected').direction, 'reverse');
  assert.equal(context.buildTestDirectionData(directionFixture).answer, 'laufen');
});
