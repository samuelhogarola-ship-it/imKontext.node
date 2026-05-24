import {
  buildReviewSummary,
  normalizeReviewItems
} from "./quiz-review-core.js";

function cloneMeta(value) {
  return value && typeof value === "object" ? { ...value } : {};
}

function cloneItem(item) {
  return item && typeof item === "object" ? { ...item } : item;
}

function cloneItems(items) {
  return Array.isArray(items) ? items.map(cloneItem) : [];
}

function createResultReviewEntry(item) {
  return {
    ...item,
    word: item.prompt,
    translation: item.detail,
    correctArticle: item.correctAnswer,
    item: item.sourceItem ?? null
  };
}

function normalizeResultReviewEntries(items, options = {}) {
  return normalizeReviewItems(items, options).map(createResultReviewEntry);
}

function buildBreakdownMap(items, key) {
  return items.reduce((acc, item) => {
    const value = item?.[key];
    if (value === undefined || value === null || value === "") {
      return acc;
    }

    const bucket = String(value);
    acc[bucket] = (acc[bucket] || 0) + 1;
    return acc;
  }, {});
}

function buildOrderedBreakdown(items, key, values = []) {
  const counts = buildBreakdownMap(items, key);
  const orderedValues = Array.isArray(values)
    ? values.filter((value, index, source) => source.indexOf(value) === index)
    : [];

  Object.keys(counts).forEach((value) => {
    if (!orderedValues.includes(value)) {
      orderedValues.push(value);
    }
  });

  return orderedValues.map((value) => ({
    value,
    count: counts[value] || 0
  }));
}

function getPerformanceBand(accuracyPercent, options = {}) {
  const highThreshold = Number(options.highThreshold) || 80;
  const midThreshold = Number(options.midThreshold) || 50;

  if (accuracyPercent >= highThreshold) {
    return "high";
  }

  if (accuracyPercent >= midThreshold) {
    return "mid";
  }

  return "low";
}

function buildResultViewModel(items, options = {}) {
  const answers = normalizeResultReviewEntries(items, options.reviewOptions);
  const summary = buildReviewSummary(answers, options.reviewOptions);
  const incorrectAnswers = answers.filter(
    (entry) => entry.answered && !entry.isCorrect
  );
  const recentItems = cloneItems(
    answers
      .map((entry) => entry.item)
      .filter((item) => item !== undefined && item !== null)
  );
  const answerValues = options.answerValues || ["der", "die", "das"];
  const correctAnswerBreakdown = buildOrderedBreakdown(
    answers,
    "correctAnswer",
    answerValues
  );
  const userAnswerBreakdown = buildOrderedBreakdown(
    answers.filter((entry) => entry.answered),
    "userAnswer",
    answerValues
  );

  return {
    summary: {
      total: summary.total,
      answered: summary.answered,
      unanswered: summary.unanswered,
      correct: summary.correct,
      incorrect: summary.incorrect,
      accuracyPercent: summary.accuracyPercent,
      performanceBand: getPerformanceBand(
        summary.accuracyPercent,
        options.performanceBands
      )
    },
    answers,
    incorrectAnswers,
    recentItems,
    hasIncorrectAnswers: incorrectAnswers.length > 0,
    correctAnswerBreakdown,
    userAnswerBreakdown,
    meta: cloneMeta(options.meta)
  };
}

const resultViewCoreApi = {
  buildResultViewModel,
  createResultReviewEntry,
  getPerformanceBand,
  normalizeResultReviewEntries
};

if (typeof window !== "undefined") {
  window.VokabelLabCore = window.VokabelLabCore || {};
  Object.assign(window.VokabelLabCore, resultViewCoreApi);
  window.LabWorldCore = window.LabWorldCore || window.VokabelLabCore;
  Object.assign(window.LabWorldCore, resultViewCoreApi);
}

export {
  buildResultViewModel,
  createResultReviewEntry,
  getPerformanceBand,
  normalizeResultReviewEntries
};
