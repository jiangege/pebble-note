class GenWindow
  (@win) ->
    @win.on \show, ~> @onshow ...
    @win.on \hide, ~> @onhide ...
  show: -> @win.show!
  hide: -> @win.hide!
  onshow: ->
  onhide: ->

module.exports = GenWindow
