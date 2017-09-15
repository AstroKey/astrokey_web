KeySelector = require('./keySelector')
KeyEditor = require('./keyEditor')

# # # # #

class DeviceLayoutView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    deviceRegion: '[data-region=device]'
    controlsRegion: '[data-region=controls]'

  onRender: ->
    keySelector = new KeySelector({ collection: @model.get('keys') })
    keySelector.on 'childview:selected', (view) => @showControlsView(view.model)
    @deviceRegion.show(keySelector)
    @model.get('keys').first().trigger('selected')

  showControlsView: (keyModel) ->
    @controlsRegion.show new KeyEditor({ model: keyModel })

# # # # #

module.exports = DeviceLayoutView



