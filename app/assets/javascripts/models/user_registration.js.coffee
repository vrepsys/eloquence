class app.models.UserRegistration extends Backbone.Model
  url: '/accounts.json'
  paramRoot: 'user'

  defaults:
    'email': ''
    'password': ''
    'password_confirmation': ''
