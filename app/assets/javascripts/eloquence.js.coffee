window.app =
  models: {}
  collections: {}
  views: {}

  start: (@currentUser) ->
    @router = new app.AppRouter
    @events = {}
    _.extend(@events, Backbone.Events);

    @initializeEvents()
    @events.trigger "currentUser:change"

    Backbone.history.start {pushState: true}

  initializeEvents: ->
    @events.on "currentUser:change", =>
      if @currentUser
        view = new app.views.NavRight()
        $('#nav_right').html(view.render().el)
      else
        $('#nav_right').empty()