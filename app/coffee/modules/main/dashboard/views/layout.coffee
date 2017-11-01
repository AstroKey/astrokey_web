DeviceLayout = require('./deviceLayout')
EditorSelector = require('./editorSelector')
EditorWrapper = require('./editorWrapper')

# # # # #

class HelpView extends Marionette.LayoutView
  template: require './templates/help_view'
  className: 'row'

# # # # #

class LayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid d-flex flex-column w-100 h-100 justify-content-center align-items-center device--layout'

  regions:
    deviceRegion:   '[data-region=device]'
    selectorRegion: '[data-region=selector]'
    editorRegion:   '[data-region=editor]'

  onRender: ->

    # Displays default help text
    @showHelpView()

    # Instantiates a new DeviceLayout for connecting to an AstroKey
    # and selecting which key the user would like to edit
    deviceView = new DeviceLayout({ model: @model })
    deviceView.on 'key:selected', (keyModel) => @showEditorSelector(keyModel)
    deviceView.on 'key:deselected', () => @showHelpView()
    @deviceRegion.show(deviceView)

  showHelpView: ->

    # Instantiates a new HelpView and shows it in @selectorRegion
    @selectorRegion.show new HelpView()

  showEditorSelector: (keyModel) ->

    # Instantaiates new EditorSelector view
    editorSelector = new EditorSelector({ model: keyModel })

    # Shows Macro Editor
    editorSelector.on 'show:macro:editor', => @showEditorView(keyModel, 'macro')

    # Shows Text Editor
    editorSelector.on 'show:text:editor', => @showEditorView(keyModel, 'macro') # TODO - TextEditor

    # Shows Key Editor
    editorSelector.on 'show:key:editor', => @showEditorView(keyModel, 'macro') # TODO - KeyEditor

    # Shows the EditorSelector view
    @selectorRegion.show(editorSelector)

  showEditorView: (keyModel, editor) ->
    @$el.addClass('active')

    # Instantiates new EditorWrapper view
    editorWrapper = new EditorWrapper({ model: keyModel, keys: @options.keys, macros: @options.macros, editor: editor })

    # Handles 'cancel' event
    editorWrapper.on 'cancel', =>
      @$el.removeClass('active')

    # Handles 'save' event
    editorWrapper.on 'save', =>
      # TODO - hit the KeyModel / DeviceModel to do the rest from here
      console.log 'SAVE KEY MODEL SETTINGS HERE'
      @$el.removeClass('active')

    # Shows the EditorWrapper view in @editorRegion
    @editorRegion.show(editorWrapper)

# # # # #

module.exports = LayoutView



