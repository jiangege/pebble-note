require! {
  './noteListScreen': NoteListScreen
  'settings': Settings
}


noteListScreen = new NoteListScreen

Settings.config(
  {url: 'http://jiangege.github.io/pebble-note'}
  , (e) ->
  , (e) ->
    noteListScreen.forceUpdate!
)

noteListScreen.show!
