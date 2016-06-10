var GenWindow, UI, NoteScreen;
GenWindow = require('./genWindow');
UI = require('ui');
NoteScreen = (function(superclass){
  var prototype = extend$((import$(NoteScreen, superclass).displayName = 'NoteScreen', NoteScreen), superclass).prototype, constructor = NoteScreen;
  function NoteScreen(){
    var win;
    win = new UI.Card({
      title: "。。。。。。。。。。",
      style: "small"
    });
    NoteScreen.superclass.call(this, win);
  }
  return NoteScreen;
}(GenWindow));
module.exports = NoteScreen;
function extend$(sub, sup){
  function fun(){} fun.prototype = (sub.superclass = sup).prototype;
  (sub.prototype = new fun).constructor = sub;
  if (typeof sup.extended == 'function') sup.extended(sub);
  return sub;
}
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}