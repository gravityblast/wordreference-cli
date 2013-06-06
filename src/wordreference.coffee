Request = require './request'

class Wordreference
  constructor: (@apiKey) ->

  search: (dictionary, term, callback) ->
    Request.get dictionary, term, apiKey: @apiKey,(data) ->
      callback data if callback

module.exports = Wordreference
