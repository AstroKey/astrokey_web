TextEditor = require('./textEditor')
MacroEditor = require('./macroEditor')

# # # # #

class EditorWrapper extends Marionette.LayoutView
  template: require './templates/editor_wrapper'
  className: 'row'

  regions:
    contentRegion: '[data-region=content]'

  triggers:
    'click [data-click=save]':    'save'
    'click [data-click=cancel]':  'cancel'

  editors:
    macro:  MacroEditor
    text:   TextEditor
    key:    MacroEditor

  onRender: ->
    EditorView = @editors[@options.editor]
    @contentRegion.show new EditorView({ model: @model, keys: @options.keys, macros: @options.macros })

# # # # #

module.exports = EditorWrapper



