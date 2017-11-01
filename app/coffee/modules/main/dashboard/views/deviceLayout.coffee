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

    # Instantiates new KeySelector View
    keySelector = new KeySelector({ collection: @model.get('keys') })
    keySelector.on 'childview:selected', (view) => @trigger('key:selected', view.model)
    keySelector.on 'childview:deselected', (view) => @trigger('key:deselected')
    @keysRegion.show(keySelector)

    # Status View
    # TODO - status & connection view
    # @statusRegion.show new DeviceStatusView({ model: @model })

# # # # #

module.exports = DeviceLayout


