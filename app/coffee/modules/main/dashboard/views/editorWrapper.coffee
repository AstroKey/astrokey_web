TextEditor = require('./textEditor')
MacroEditor = require('./macroEditor')

# # # # #

class EditorWrapper extends Marionette.LayoutView
  template: require './templates/editor_wrapper'
  className: 'row'

  regions:
    contentRegion: '[data-region=content]'

  events:
    'click [data-click=save]':    'onSave'
    'click [data-click=cancel]':  'onCancel'

  editors:
    macro:  MacroEditor
    text:   TextEditor
    key:    MacroEditor

  onRender: ->

    # Fetches the EditorView prototype
    EditorView = @editors[@options.editor]

    # Isolates Config
    config = @model.get('config')

    # Caches the current configuration to be restored when this view is cancelled out
    @cachedConfig = config.toJSON()

    # Isolates MacroCollection
    macros = config.get('macros')

    # Requests KeyCollection from the KeyFactory
    keys = Radio.channel('key').request('collection')

    # Shows the view in @contentRegion
    # QUESTION - PASS IN KEY (@model?)
    @contentRegion.show new EditorView({ model: config, keys: keys, macros: macros })

  # onSave
  onSave: ->

    # Triggers 'save' event, closing this view
    return @trigger 'save'

  # onCancel
  onCancel: ->

    # Resets config attributes
    @model.get('config').set(@cachedConfig)

    # Triggers 'cancel' event, closing this view
    return @trigger 'cancel'

# # # # #

module.exports = EditorWrapper



