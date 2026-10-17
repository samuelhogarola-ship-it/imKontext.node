/* Vokabel World integration — back-to-hub floating button */
(function () {
  var params = new URLSearchParams(window.location.search);
  if (params.get('from') === 'world') {
    try { sessionStorage.setItem('vokabel_from_world', '1'); } catch (e) {}
    if (params.get('name')) {
      try { sessionStorage.setItem('vokabel_world_name', params.get('name')); } catch (e) {}
    }
    params.delete('from');
    params.delete('name');
    var clean = params.toString();
    var url = window.location.pathname + (clean ? '?' + clean : '') + window.location.hash;
    history.replaceState(null, '', url);
  }

  var fromWorld = false;
  try { fromWorld = sessionStorage.getItem('vokabel_from_world') === '1'; } catch (e) {}

  if (fromWorld) {
    document.addEventListener('DOMContentLoaded', function () {
      var btn = document.createElement('a');
      btn.className = 'world-back-fab';
      btn.href = 'https://vokabelworld.com';
      btn.setAttribute('aria-label', 'Volver al planetario');
      btn.innerHTML = '🪐';
      btn.title = 'Volver a Vokabel World';
      document.body.appendChild(btn);
    });
  }
})();
