class Eloquence.Views.WordsList extends Backbone.View

  template: JST['words_list']

  events:
    'click #add_word': 'addWord'

  initialize: ->
    @collection.on('add', @render, this)

  addWord: ->
    @collection.create({wordstring: $('#new_word_text').val(), definition: $('#definition_text').val()})

  render: ->
    $(@el).html(@template(collection: @collection))
    @rows = $(@el).find('tbody')
    @collection.forEach (model) =>
      @rows.append(new Eloquence.Views.WordsRow({model: model}).render().el)
    @autocomplete()
    this

  autocomplete: ->
    a = $(@el).find('#new_word_text')
    a.autocomplete
      source: (request, response) ->
        url = "http://api.wordnik.com/v4/words.json/search/#{request.term}?caseSensitive=true&limit=10&skip=0&api_key=24153e3841944b605fa137ad8d32bdc0d51545b3155fcf9b9"
        lastXhr = $.getJSON url, request, (data, status, xhr ) ->
          if xhr == lastXhr
            response  _.pluck(data.searchResults, 'word')
      select: (event, ui) ->
        url = "http://api.wordnik.com//v4/word.json/#{$('#new_word_text').val()}/definitions?includeRelated=false&includeTags=false&sourceDictionaries=wiktionary&useCanonical=false&api_key=24153e3841944b605fa137ad8d32bdc0d51545b3155fcf9b9"
        lastXhr = $.getJSON url, (data, status, xhr) ->
          if xhr == lastXhr
            $('#definition_text').val _.pluck(data, 'text').join("\r\n")
