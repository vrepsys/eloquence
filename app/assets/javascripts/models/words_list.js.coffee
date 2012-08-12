class app.models.WordsList extends Backbone.Model

  fetchWords: (params) ->
    @words = new app.collections.Words()
    @words.url = "/api/words_lists/#{@id}/words"
    @words.fetch params

  addWord: (params) ->
    @words.create params