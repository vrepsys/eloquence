class app.views.WordsTable extends Backbone.View

  template: JST['words_tbl']

  events:
    'click #add_word': 'addWord'

  initialize: ->
    @collection.on('add', @render, this)

  addWord: ->
    @collection.create({wordstring: $('#new_word_text').val(), definition: $('#definition_text').val()})

  render: ->
    $(@el).html(@template(collection: @collection))
    @rows = $(@el).find('tbody')
    @collection.forEach (model) =>
      @rows.append(new app.views.WordsTableRow({model: model}).render().el)
    this