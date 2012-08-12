class app.views.SignUp extends Backbone.View
  tagName: 'div'
  template: JST['sign_up']
  className: 'row-fluid offset4'

  events:
    'click #sign_up': 'sign_up'

  initialize: ->
    @model = new app.models.UserRegistration()

  sign_up: ->
    @model.save {email: $('#email').val(), password: $('#password').val(), password_confirmation: $('#password_confirmation').val()},
    success: (model, response) =>
      app.currentUser = new app.models.UserSession(response)
      app.events.trigger "currentUser:change"
      app.router.navigate "words", trigger: true
    error: (model, response) =>
      alert response.responseText



  #initialize: ->
  #  @model = new app.models.UserSession()

  #login: (event) ->
  #  event.preventDefault()
  #  @model.save {email: $('#email').val(), password: $('#password').val()},
  #    success: =>
  #      app.currentUser = @model
  #      app.events.trigger 'currentUser:change'
  #      app.router.navigate 'words', trigger: true
  #    error: ->
  #      alert 'error'

  render: ->
    $(@el).html(@template())
    this