require './factory'
DashboardRoute = require './dashboard/route'

# # # # #

# MainRouter class definition
class MainRouter extends require 'hn_routing/lib/router'

  routes:
    '(/)': 'dashboard'

  dashboard: ->
    new DashboardRoute({ container: @container })

# # # # #

module.exports = MainRouter
