DeviceLayout = require('./deviceLayout')
EditorSelector = require('./editorSelector')
TextEditor = require('./textEditor')
MacroEditor = require('./macroEditor')

# TODO - define EDITORWRAPPER view that accepts and editor, and wraps it in save/close controls

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
    editorSelector.on 'show:macro:editor', =>
      console.log 'show:macro:editor'
      @$el.addClass('active')
      @editorRegion.show new MacroEditor({ model: keyModel, keys: @options.keys, macros: @options.macros })

    # Shows Text Editor
    editorSelector.on 'show:text:editor', =>
      console.log 'show:text:editor'
      @$el.addClass('active')
      @editorRegion.show new MacroEditor({ model: keyModel, keys: @options.keys, macros: @options.macros })

    # Shows Key Editor
    editorSelector.on 'show:key:editor', =>
      console.log 'show:key:editor'
      @$el.addClass('active')
      @editorRegion.show new MacroEditor({ model: keyModel, keys: @options.keys, macros: @options.macros })

    # Shows the EditorSelector view
    @selectorRegion.show(editorSelector)

# # # # #

module.exports = DeviceLayoutView



