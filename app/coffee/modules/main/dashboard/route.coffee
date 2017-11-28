LayoutView  = require './views/layout'

# # # # #

class DashboardRoute extends require 'hn_routing/lib/route'

  title: 'AstroKey'

  breadcrumbs: [{ text: 'Device' }]

  fetch: ->
    @device = Radio.channel('device').request('model', 'device_1')

  render: ->
    @container.show new LayoutView({ model: @device })

# # # # #

module.exports = DashboardRoute
