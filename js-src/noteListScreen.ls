require! {
  './genWindow': GenWindow
  './common': Common
  './noteDetailScreen': NoteDetailScreen
  'settings': Settings
  'ui': UI
}

class NoteListScreen extends GenWindow
  noteList: []
  updateInterval: (1000 * 60) * 5
  ->
    win = new UI.Menu {
      scrollable: false
      style: \small
      sections:
        * title: 'China Note'
          items:
            * title: '加载中...'
          ...
        ...
    }

    win.on \select, ~>
      @onselect ...
    super win

  onshow: ->
    lastUpdateTime =  Settings.data \lastUpdateTime
    noteList =  Settings.data \noteList

    if lastUpdateTime ~= null or Date.now! - lastUpdateTime >= @updateInterval
      Common.getNoteList (err, dataList) ~>
        if err?
          @renderErr err.error
        else
          @noteList = dataList
          Settings.data \lastUpdateTime, Date.now!
          Settings.data \noteList, dataList
          @render!
    else
      @noteList = noteList ? []
      @render!

  render: ->
    if @noteList.length is 0
      return @win.items 0, [title: '暂无笔记']
    items = for v, i in @noteList
      title: v.title
      subtitle: v.context
    @win.items 0, items

  renderErr: (err) ->
    @win.items 0, [title: err]

  onselect: (e) ->
    if e.item.subtitle?
      noteDetailScreen = new NoteDetailScreen
      noteDetailScreen.show e.item.subtitle

module.exports = NoteListScreen
