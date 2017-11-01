
class TextEditor extends Marionette.LayoutView
  className: 'row'
  template: require('./templates/text_editor')

  onRender: ->
    Backbone.Syphon.deserialize(@, @model.attributes)

# # # # #

module.exports = TextEditor
