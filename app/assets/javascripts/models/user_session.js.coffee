class app.models.UserSession extends Backbone.Model

  url: '/accounts/sign_in.json',
  paramRoot: 'user',

  defaults: 
    'email': ''
    'password': ''