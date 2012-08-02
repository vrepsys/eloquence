class Eloquence.Views.WordsRow extends Backbone.View
  
  tagName: 'tr'

  template: JST['words_row']

  events:
    'click .remove_word' : 'removeWord'

  initialize: ->
    @model.on('destroy', @destroy, this)

  removeWord: ->
    @model.destroy()

  destroy: ->
    $(@el).remove()

  render: ->
    $(@el).html(@template(word: @model))
    this
