require! {
  './noteListScreen': NoteListScreen
  'settings': Settings
}


noteListScreen = new NoteListScreen

Settings.config(
  {url: 'http://192.168.0.104:8080'}
  , (e) ->
  , (e) ->
    noteListScreen.forceUpdate!
)

noteListScreen.show!
