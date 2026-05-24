/* ═══════════════════════════════════════════════════════════════
   fuengirola-studio.js — carousel interactions only
   Content lives in fuengirola-studio.html; this file handles
   slide navigation and auto-advance behaviour.
═══════════════════════════════════════════════════════════════ */
(function () {
  'use strict';

  function initCarousel() {
    var track   = document.getElementById('wf-track');
    var dotsEl  = document.getElementById('wf-dots');
    var btnPrev = document.getElementById('wf-prev');
    var btnNext = document.getElementById('wf-next');
    if (!track) return;

    var slides  = track.querySelectorAll('.wf-slide');
    var total   = slides.length;
    var current = 0;
    var timer   = null;

    for (var i = 0; i < total; i++) {
      var dot = document.createElement('button');
      dot.className = 'wf-dot';
      dot.setAttribute('aria-label', 'Ir a slide ' + (i + 1));
      dot.dataset.i = i;
      dotsEl.appendChild(dot);
    }
    var dots = dotsEl.querySelectorAll('.wf-dot');

    function goTo(n) {
      current = (n + total) % total;
      track.style.transform = 'translateX(-' + (current * 100) + '%)';
      dots.forEach(function (d, i) { d.classList.toggle('active', i === current); });
    }

    function resetTimer() {
      clearInterval(timer);
      timer = setInterval(function () { goTo(current + 1); }, 8000);
    }

    btnPrev.addEventListener('click', function () { goTo(current - 1); resetTimer(); });
    btnNext.addEventListener('click', function () { goTo(current + 1); resetTimer(); });
    dotsEl.addEventListener('click', function (e) {
      var d = e.target.closest('.wf-dot');
      if (d) { goTo(Number(d.dataset.i)); resetTimer(); }
    });

    goTo(0);
    resetTimer();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initCarousel);
  } else {
    initCarousel();
  }
})();
