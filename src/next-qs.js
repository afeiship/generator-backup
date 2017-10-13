(function () {

  var global = global || this || self || window;
  var nx = global.nx || require('next-js-core2');
  var EMPTY_STR = '';
  var RE_START = '[\\?&]';
  var RE_END = '=([^&#]*)';
  var RE1_1 = /[\[]/;
  var RE2_1 = /[\]]/;
  var STR1_2 = '\\\[';
  var STR2_2 = '\\\]';

  nx.qs = function (inName, inString) {
    var name = inName
      .replace(RE1_1, STR1_2)
      .replace(/[\]]/, STR2_2);
    var regex = new RegExp(RE_START + name + RE_END);
    var str = inString || location.search;
    var matches = regex.exec(str);
    return matches == null ? EMPTY_STR: decodeURIComponent(matches[1]);
  };


  if (typeof module !== 'undefined' && module.exports) {
    module.exports = nx.qs;
  }

}());
