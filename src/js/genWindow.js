var GenWindow;
GenWindow = (function(){
  GenWindow.displayName = 'GenWindow';
  var prototype = GenWindow.prototype, constructor = GenWindow;
  function GenWindow(win){
    this.win = win;
    this.win.on('show', this.onshow);
    this.win.on('hide', this.onhide);
  }
  prototype.show = function(){
    return this.win.show();
  };
  prototype.hide = function(){
    return this.win.hide();
  };
  prototype.onshow = function(){};
  prototype.onhide = function(){};
  return GenWindow;
}());
module.exports = GenWindow;