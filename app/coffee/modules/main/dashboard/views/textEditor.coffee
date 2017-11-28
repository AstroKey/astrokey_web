
class TextEditor extends Marionette.LayoutView
  className: 'row d-flex justify-content-center'
  template: require('./templates/text_editor')

  onRender: ->
    Backbone.Syphon.deserialize(@, { type: 'text', text_value: @model.get('text_value') })

# # # # #

module.exports = TextEditor
