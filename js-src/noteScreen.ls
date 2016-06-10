require! {
  './genWindow': GenWindow
  'ui': UI
}
class NoteScreen extends GenWindow
  ->
    win = new UI.Card {
      title: "。" * 10
      style: "small"
    }
    super win

module.exports = NoteScreen
