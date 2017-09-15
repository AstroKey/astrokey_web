KeySelector = require('./keySelector')

# # # # #

class DeviceLayout extends Mn.LayoutView
  className: 'row'
  template: require('./templates/device_layout')

  regions:
    keysRegion: '[data-region=keys]'

  onRender: ->
    keySelector = new KeySelector({ collection: @model.get('keys') })
    keySelector.on 'childview:selected', (view) => @trigger('key:selected', view.model)
    @keysRegion.show(keySelector)
    @model.get('keys').first().trigger('selected')

# # # # #

module.exports = DeviceLayout


