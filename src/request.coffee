http    = require "http"
extend  = require "xtend"

class Request
  OPTIONS:
    host:       "api.wordreference.com"
    apiVersion: 0.8
    format:     'json'

  constructor: (@dictionary, @term, options, @callback) ->
    @options = extend @OPTIONS, options
    @data = ''

  performRequest: ->
    request = http.get @buildUrl(), @responseHandler
    request.on 'error', @errorHandler

  errorHandler: (error) =>
    console.log error

  buildUrl: ->
    "http://#{@options.host}/#{@buildPath()}"

  buildPath: (dictionary, term) ->
    "#{@options.apiVersion}/#{@options.apiKey}/#{@options.format}/#{@dictionary}/#{@term}"

  responseHandler: (response) =>
    response.on 'data', @dataHandler
    response.on 'end', @endHandler

  endHandler: =>
    if @callback
      @callback @data

  dataHandler: (chunk) =>
    @data += chunk.toString()

Request.get = (dictionary, term, options, callback) ->
  request = new Request dictionary, term, options, callback
  request.performRequest()

module.exports = Request
