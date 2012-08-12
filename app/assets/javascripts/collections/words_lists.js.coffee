class app.collections.WordsLists extends Backbone.Collection

  model: app.models.WordsList

  constructor: ->
    @url = "api/users/#{app.currentUser.id}/words_lists"
    super