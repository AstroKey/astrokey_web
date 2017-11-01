DeviceLayout = require('./deviceLayout')
EditorSelector = require('./editorSelector')
TextEditor = require('./textEditor')
MacroEditor = require('./macroEditor')

# TODO - define EDITORWRAPPER view that accepts and editor, and wraps it in save/close controls

# # # # #
# TODO - abstract EditorWrapper into a different file when its ready
class EditorWrapper extends Marionette.LayoutView
  template: require './templates/editor_wrapper'
  className: 'row'

  regions:
    contentRegion: '[data-region=content]'

  triggers:
    'click [data-click=save]':    'save'
    'click [data-click=cancel]':  'cancel'

  onRender: ->
    @contentRegion.show new @options.editor({ model: @model, keys: @options.keys, macros: @options.macros })

# # # # #

class HelpView extends Marionette.LayoutView
  template: require './templates/help_view'
  className: 'row'

# # # # #

class DeviceLayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid h-100 device--layout'

  regions:
    deviceRegion: '[data-region=device]'
    selectorRegion: '[data-region=selector]'
    editorRegion: '[data-region=editor]'

  onRender: ->

    # Displays default help text
    @showHelpView()

    # Instantiates a new DeviceLayout for selecting an AstroKey
    deviceView = new DeviceLayout({ model: @model })
    deviceView.on 'key:selected', (keyModel) => @showEditorSelector(keyModel)
    deviceView.on 'key:deselected', () => @showHelpView()
    @deviceRegion.show(deviceView)

  showHelpView: ->

    @$el.removeClass('active')

    # Instantiates a new HelpView and shows it in @selectorRegion
    @selectorRegion.show new HelpView()

  showEditorSelector: (keyModel) ->

    # Instantaiates new EditorSelector view
    editorSelector = new EditorSelector({ model: keyModel })

    # Shows Macro Editor
    editorSelector.on 'show:macro:editor', => @showEditorView(keyModel, MacroEditor)

    # Shows Text Editor
    editorSelector.on 'show:text:editor', => @showEditorView(keyModel, MacroEditor) # TODO - TextEditor

    # Shows Key Editor
    editorSelector.on 'show:key:editor', => @showEditorView(keyModel, MacroEditor) # TODO - KeyEditor

    # Shows the EditorSelector view
    @selectorRegion.show(editorSelector)

  showEditorView: (keyModel, view) ->
    @$el.addClass('active')

    # Instantiates new EditorWrapper view
    editorWrapper = new EditorWrapper({ model: keyModel, keys: @options.keys, macros: @options.macros, editor: view })

    # Handles 'cancel' event
    editorWrapper.on 'cancel', =>
      @$el.removeClass('active')

    # Handles 'save' event
    editorWrapper.on 'save', =>
      console.log 'SAVE KEY MODEL SETTINGS'

    # Shows the EditorWrapper view in @editorRegion
    @editorRegion.show(editorWrapper)

# # # # #

module.exports = DeviceLayoutView



