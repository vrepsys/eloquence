class app.collections.Words extends Backbone.Collection

  url: '/api/words'
  model: app.models.Word
