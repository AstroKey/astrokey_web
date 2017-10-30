LayoutView  = require './views/layout'

# # # # #

class DashboardRoute extends require 'hn_routing/lib/route'

  title: 'AstroKey Web'

  breadcrumbs: [{ text: 'Device' }]

  fetch: ->
  	@keys = Radio.channel('device').request('collection')
    @deviceModel = Radio.channel('device').request('model', 'device_1')

  render: ->
    console.log(@deviceModel); # Debug
    @container.show new LayoutView({ model: @deviceModel, keys: @keys })

# # # # #

module.exports = DashboardRoute
