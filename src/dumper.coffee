class Dumper
  constructor: (@term, @dictionary, @object) ->

  dump: ->
    console.log "#{@term.toUpperCase()} (#{@dictionary})\n"
    @dumpObject @object
    console.log '© WordReference.com'

  dumpObject: (object, indent, prefix) ->
    for key of object
      if /^term[0-9]+/.test key or key == 'original'
        @dumpTerm object[key]

  dumpTerm: (term) ->
    for key of term
      list = term[key]
      for index of list
        @dumpTranslation list[index]

  dumpTranslation: (translation) ->
    originalTerm = translation['OriginalTerm']
    if originalTerm
      @dumpTranslationTerm originalTerm
      delete translation['OriginalTerm']
    for key of translation
      @dumpTranslationTerm translation[key], 1
    console.log ''

  dumpTranslationTerm: (term, indent) ->
    if term instanceof Object
      indent = indent or 0
      spaces = ("\t" for i in [0...indent]).join ''
      @print spaces, term.term, term.POS, term.sense

  print: (spaces, term, pos, sense) ->
    string = "#{spaces}#{term}"
    string += " [#{pos}]" if pos
    string += " (#{sense})" if sense
    console.log string

module.exports = Dumper
