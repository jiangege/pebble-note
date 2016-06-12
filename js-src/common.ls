const serverUrl = 'https://api.leancloud.cn'
const apiVersion = '/1.1'
const API_ID = 's8b1q7BFUsYqzxc6N0DGszyS-gzGzoHsz'
const API_KEY = 'paqqJP2ce8AD0bTLPOjaEFUn'

require! {
  ajax
  'settings': Settings
}

module.exports =
  api: (method, path, data, cb = -> ) ->
    url = serverUrl + apiVersion + path
    options = {
      url
      method
      data
      type: \json
      headers:
        'X-LC-Id': API_ID
        'X-LC-Key': API_KEY
    }
    if (sessionToken = Settings.option(\sessionToken))?
      options.headers[\X-LC-Session] = sessionToken

    ajax options, (data, status, req) -> cb null, data
    , (err) -> cb err

  getNoteList: (cb = ->) ->
    @api \GET, '/classes/Note', null, (err, data) ->
      if err?
       cb err
      else cb null, data.results
