/*
 * Script added for the 2026 static reproduction — NOT part of the original theme.
 * The original footer used jquery.countdown to count down to the wedding
 * (2016-10-01 16:00); the archive counts the time elapsed since, in the
 * same "%D days %H:%M:%S" format.
 */
(function () {
  var clock = document.getElementById('clock');
  if (!clock) return;
  var wedding = new Date('2016-10-01T16:00:00+02:00').getTime();
  function pad(n) {
    return (n < 10 ? '0' : '') + n;
  }
  function tick() {
    var diff = Math.max(0, Math.floor((Date.now() - wedding) / 1000));
    var days = Math.floor(diff / 86400);
    var h = Math.floor((diff % 86400) / 3600);
    var m = Math.floor((diff % 3600) / 60);
    var s = diff % 60;
    clock.textContent = days + ' days ' + pad(h) + ':' + pad(m) + ':' + pad(s);
  }
  tick();
  setInterval(tick, 1000);
})();
