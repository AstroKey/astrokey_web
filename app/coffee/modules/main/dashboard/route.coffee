LayoutView  = require './views/layout'

# # # # #

class DashboardRoute extends require 'hn_routing/lib/route'

  title: 'AstroKey Web'

  breadcrumbs: [{ text: 'Device' }]

  fetch: ->
    @keys = Radio.channel('key').request('collection')
    @macros = Radio.channel('macro').request('collection')
    @deviceModel = Radio.channel('device').request('model', 'device_1')

  render: ->
    console.log(@deviceModel); # Debug
    @container.show new LayoutView({ model: @deviceModel, keys: @keys, macros: @macros })

# # # # #

module.exports = DashboardRoute
