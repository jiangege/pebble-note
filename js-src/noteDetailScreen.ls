require! {
  './genWindow': GenWindow
  'ui': UI
}


class NoteDetailScreen extends GenWindow
  currPageIndex: 0
  textAry: []
  text: null

  calcPaging = (text, maxRow =7, maxCol = 7) ->
    currCol = 0
    currRow = 0
    currPage = 0
    tempAry = []
    for v, i in text
      if (text[i] + text[i + 1]) is '\n'
        currCol = 0
        currRow++
        tempAry[currPage] += '\n'
      else
        currCol++
        tempAry[currPage] ?= ''
        tempAry[currPage] += text[i]
        if currCol is maxCol
          currCol = 0
          currRow++
      if currRow is maxRow
        currRow = 0
        currPage++
    tempAry

  ->
    win = new UI.Card {
      scrollable: false
      style: \small
      status: falsec
    }

    win.on 'click', \down, ~> @ondown!
    win.on 'click', \up, ~> @onup!
    super win

  show: (@text) ->
    console.log "hello"
    @textAry = calcPaging @text
    @render!
    super!

  render: ->
    if @textAry.length > 0
      if @textAry.length > 1
        @win.title "[#{@currPageIndex + 1}/#{@textAry.length}]"
      currentPageText = @textAry[@currPageIndex]
      @win.body currentPageText


  ondown: ->
    if @currPageIndex + 1 < @textAry.length
      @currPageIndex++
      @render!

  onup: ->
    if @currPageIndex - 1 > -1
      @currPageIndex--
      @render!



module.exports = NoteDetailScreen
