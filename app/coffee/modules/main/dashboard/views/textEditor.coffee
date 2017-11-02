
class TextEditor extends Marionette.LayoutView
  className: 'row'
  template: require('./templates/text_editor')

  onRender: ->
    Backbone.Syphon.deserialize(@, { type: 'text', text_value: @model.get('text_value') })

# # # # #

module.exports = TextEditor
