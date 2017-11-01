DeviceLayout = require('./deviceLayout')
KeyEditor = require('./keyEditor')

# # # # #

class DeviceLayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid h-100'

  regions:
    deviceRegion:   '[data-region=device]'
    editorRegion: '[data-region=editor]'

  onRender: ->
    deviceView = new DeviceLayout({ model: @model })
    deviceView.on 'key:selected', (keyModel) => @showControlsView(keyModel)
    @deviceRegion.show(deviceView)

  # TODO - all of this must be encapsulated in a MacroEditorView
  showControlsView: (keyModel) ->

    # Instantaiates new KeyboardView
    # TODO - this will *eventually* display a selector between different types of keyboards / sets of keys
    # TODO - macros should hang off the keyModel
    @editorRegion.show new KeyEditor({ model: keyModel, keys: @options.keys, macros: @options.macros })

# # # # #

module.exports = DeviceLayoutView



