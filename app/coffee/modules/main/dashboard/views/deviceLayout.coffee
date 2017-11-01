KeySelector = require('./keySelector')

# # # # #

class DeviceStatusView extends Marionette.LayoutView
  template: require './templates/device_status'
  className: 'row'

  templateHelpers: ->

    status = {
      text: 'Not Connected'
      css:  'badge-default'
    }

    # Connected
    if @model.get('status_code') == 1

      status = {
        text: 'Connected'
        css: 'badge-success'
      }

    return { status: status }

# # # # #

class DeviceLayout extends Mn.LayoutView
  className: 'row'
  template: require('./templates/device_layout')

  regions:
    # statusRegion: '[data-region=status]'
    keysRegion:   '[data-region=keys]'

  onRender: ->
    keySelector = new KeySelector({ collection: @model.get('keys') })
    keySelector.on 'childview:selected', (view) => @trigger('key:selected', view.model)
    @keysRegion.show(keySelector)
    # @model.get('keys').first().trigger('selected')

    # Status View
    # @statusRegion.show new DeviceStatusView({ model: @model })

# # # # #

module.exports = DeviceLayout


