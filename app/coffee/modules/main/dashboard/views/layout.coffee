DeviceLayout = require('./deviceLayout')
KeyEditor = require('./keyEditor')
HotkeyEditor = require('./hotkeyEditor')
# KeyDetail = require('./keyDetail')
# LedEditor = require('./ledEditor')

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
    # @controlsRegion.show new KeyEditor({ model: keyModel })
    # @keyRegion.show new KeyDetail({ model: keyModel })
    # @ledRegion.show new LedEditor({ model: keyModel })
    @controlsRegion.show new HotkeyEditor({ model: keyModel })

# # # # #

module.exports = DeviceLayoutView



