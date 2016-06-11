require! {
  './genWindow': GenWindow
  'ui': UI
}

class NoteListScreen extends GenWindow
  ->

  render: ->
    @list



module.exports = NoteListScreen
