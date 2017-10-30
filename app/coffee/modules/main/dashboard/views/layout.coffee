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
    @macroRegion.show new MacroList({ collection: @options.macros })

    # Instantaiates new KeyboardView
    # TODO - this will *eventually* display a selector between different types of keyboards / sets of keys
    keyboardView = new KeyboardView({ model: keyModel, keys: @options.keys })

    # Handles KeySelection event
    keyboardView.on 'key:selected', (key) =>

      # Clones the original object
      key = _.clone(key)

      # Adds the correct `order` attribute
      key.order = @options.macros.length + 1

      # Adds the key to the MacroCollection
      @options.macros.add(key)

    # Shows the keyboardView
    @controlsRegion.show keyboardView

# # # # #

module.exports = DeviceLayoutView



