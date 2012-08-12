class app.views.WordsIndex extends Backbone.View

  template: JST['words_index']

  events:
    'click #add_word': 'addWord'
    'click #add_list': 'addList'
    'change #words_lists': 'handleListChange'

  initialize: ->
    @selectedWordsList = @collection.first()
    @collection.on('add', @onNewListAdded, this)

  handleListChange: ->
    @selectedWordsList = @collection.find (wl) => wl.id == +$('#words_lists').val()
    @refreshWordsTable()

  onNewListAdded: (wordsList) ->
    alert wordsList.toJSON()
    $('#words_lists').prepend(
        $('<option></option>').val(wordsList.get('id')).html(wordsList.get('name'))
        )
    $('#words_lists').val(0)
    @handleListChange()


  addWord: ->
    wordEl = $('#new_word_text')
    definitionEl = $('#definition_text')
    @selectedWordsList.addWord({wordstring: wordEl.val(), definition: definitionEl.val()})
    wordEl.val('')
    definitionEl.val('')

  addList: ->
    @collection.create {name: $('#new_list_name').val()}, wait: true

  render: ->
    $(@el).html(@template(collection: @collection))
    @refreshWordsTable()
    @autocomplete()
    this

  refreshWordsTable: ->
    if @selectedWordsList
      @selectedWordsList.fetchWords
        success: =>
          wordsTblView = new app.views.WordsTable(collection: @selectedWordsList.words)
          $('#words_table').html(wordsTblView.render().el)

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