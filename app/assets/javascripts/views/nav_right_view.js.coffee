class app.views.NavRight extends Backbone.View

  template: JST['nav_right']
  tagName: 'ul'
  className: 'nav pull-right'

  render: ->
    $(@el).html(@template(currentUser: app.currentUser))
    this