LayoutView  = require './views/layout'

# # # # #

class HomeRoute extends require 'hn_routing/lib/route'

  title: 'AstroKey Home'

  breadcrumbs: [{ text: 'Device' }]

  fetch: ->
    @deviceModel = Radio.channel('device').request('model', 'device_1')

  render: ->
    console.log(@deviceModel); # Debug
    @container.show new LayoutView({ model: @deviceModel })

# # # # #

module.exports = HomeRoute
