LayoutView  = require './views/layout'

# # # # #

class DashboardRoute extends require 'hn_routing/lib/route'

  title: 'AstroKey Web'

  breadcrumbs: [{ text: 'Device' }]

  render: ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = DashboardRoute
