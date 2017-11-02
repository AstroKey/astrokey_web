require './factory'
HomeRoute = require './home/route'
DashboardRoute = require './dashboard/route'

# # # # #

# MainRouter class definition
class MainRouter extends require 'hn_routing/lib/router'

  routes:
    '(/)':        'home'
    # 'device(/)': 'dashboard'

  home: ->
    new DashboardRoute({ container: @container })
    # new HomeRoute({ container: @container })

  # dashboard: ->
  #   new DashboardRoute({ container: @container })

# # # # #

module.exports = MainRouter
