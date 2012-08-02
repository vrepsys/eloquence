class Eloquence.Routers.AppRouter extends Backbone.Router

  routes:
    '': 'index'

  index: ->
    @wordsList = new Eloquence.Collections.Words()
    @wordsList.fetch
      success: =>
        view = new Eloquence.Views.WordsList(collection : @wordsList)
        $('#container').html(view.render().el)

