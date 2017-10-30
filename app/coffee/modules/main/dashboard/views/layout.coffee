DeviceLayout = require('./deviceLayout')
KeyboardView = require('./keyboardView')
MacroList = require('./macroList')
# KeyEditor = require('./keyEditor')

# # # # #

class DeviceLayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid h-100'

  regions:
    deviceRegion:   '[data-region=device]'
    macroRegion:    '[data-region=macro]'
    controlsRegion: '[data-region=controls]'

  onRender: ->
    deviceView = new DeviceLayout({ model: @model })
    deviceView.on 'key:selected', (keyModel) => @showControlsView(keyModel)
    @deviceRegion.show(deviceView)

  showControlsView: (keyModel) ->
    # @controlsRegion.show new KeyEditor({ model: keyModel, keys: @options.keys })

    # Gets the current macro assigned to the keyModel
    # macroCollection = keyModel.getMacroCollection()
    # macros = macroCollection.toJSON()
    # TODO - currently using mock
    MacroList

    # Shows the keyboard view
    # TODO - this will *eventually* display a selector between different types of keyboards / sets of keys
    @controlsRegion.show new KeyboardView({ model: keyModel, keys: @options.keys })

# # # # #

module.exports = DeviceLayoutView



