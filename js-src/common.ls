const serverUrl = 'https://api.leancloud.cn'
const apiVersion = '/1.1'
const API_ID = 's8b1q7BFUsYqzxc6N0DGszyS-gzGzoHsz'
const API_KEY = 'paqqJP2ce8AD0bTLPOjaEFUn'

require! {
  ajax
}

module.exports = Common =
  api: (method, path, data, cb = -> ) ->
    url = serverUrl + apiVersion + path
    ajax {
      url
      method
      data
      type: \json
      headers:
        'X-LC-Id': API_ID
        'X-LC-Key': API_KEY

    }, (data, status, req) -> cb null, data
    , (err) -> cb err

  getNoteList: (cb = ->) ->
    @api \GET, '/classes/Note', null, (err, data) ->
      if err?
       cb err
      else cb null, data.results
