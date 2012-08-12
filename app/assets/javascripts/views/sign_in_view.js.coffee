class app.views.SignIn extends Backbone.View
  tagName: 'div'
  template: JST['sign_in']
  className: 'row-fluid offset4'

  events:
    'click #sign_in': 'sign_in'
    'click #sign_up': 'sign_up'

  initialize: ->
    @model = new app.models.UserSession()

  sign_in: (event) ->
    event.preventDefault()
    @model.save {email: $('#email').val(), password: $('#password').val()},
      success: (a, b)=>
        app.currentUser = @model
        app.events.trigger 'currentUser:change'
        app.router.navigate 'words', trigger: true
      error: ->
        alert 'error'

  sign_up: (event) ->
    event.preventDefault()
    app.router.navigate 'signup', trigger: true

  render: ->
    $(@el).html(@template())
    this