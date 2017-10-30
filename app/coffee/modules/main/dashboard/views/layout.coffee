DeviceLayout = require('./deviceLayout')
KeyEditor = require('./keyEditor')
KeyboardView = require('./KeyboardView')
# KeyDetail = require('./keyDetail')

# # # # #

class DeviceLayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid h-100'

  regions:
    deviceRegion:   '[data-region=device]'
    keyRegion:      '[data-region=key]'
    # ledRegion:      '[data-region=led]'
    controlsRegion: '[data-region=controls]'

  onRender: ->
    deviceView = new DeviceLayout({ model: @model })
    deviceView.on 'key:selected', (keyModel) => @showControlsView(keyModel)
    @deviceRegion.show(deviceView)

  showControlsView: (keyModel) ->
    # @controlsRegion.show new KeyEditor({ model: keyModel, keys: @options.keys })
    # @keyRegion.show new KeyDetail({ model: keyModel })
    # @ledRegion.show new LedEditor({ model: keyModel })

    # Shows the keyboard view
    # TODO - this will *eventually* display a selector between different types of keyboards / sets of keys
    @controlsRegion.show new KeyboardView({ model: keyModel, keys: @options.keys })

# # # # #

module.exports = DeviceLayoutView



