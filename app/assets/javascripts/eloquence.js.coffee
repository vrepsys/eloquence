window.Eloquence =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Eloquence.Routers.AppRouter
    Backbone.history.start()

$(document).ready ->
  Eloquence.init()
