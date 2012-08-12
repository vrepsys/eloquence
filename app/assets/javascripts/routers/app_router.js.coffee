class app.AppRouter extends Backbone.Router

  routes:
    '': 'index'
    'words': 'words'
    'signin' : 'signin'
    'signup' : 'signup'

  index: ->
    if app.currentUser
      this.navigate 'words', trigger: true
    else
      this.navigate 'signin', trigger: true

  words: ->
    @wordsLists = new app.collections.WordsLists()
    @wordsLists.fetch
      success: =>
        view = new app.views.WordsIndex(collection : @wordsLists)
        $('#container').html(view.render().el)

  signin: ->
    view = new app.views.SignIn()
    $('#container').html(view.render().el)

  signup: ->
    view = new app.views.SignUp()
    $('#container').html(view.render().el)