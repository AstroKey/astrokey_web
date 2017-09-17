DeviceLayout = require('./deviceLayout')
KeyEditor = require('./keyEditor')

# # # # #

class DeviceLayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid h-100'

  regions:
    deviceRegion: '[data-region=device]'
    controlsRegion: '[data-region=controls]'

  onRender: ->
    deviceView = new DeviceLayout({ model: @model })
    deviceView.on 'key:selected', (keyModel) => @showControlsView(keyModel)
    @deviceRegion.show(deviceView)

  showControlsView: (keyModel) ->
    @controlsRegion.show new KeyEditor({ model: keyModel })

# # # # #

module.exports = DeviceLayoutView



