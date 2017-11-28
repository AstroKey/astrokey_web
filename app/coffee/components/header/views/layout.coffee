
# HeaderView class definition
# Defines a simbple view for displaying the
# header of the application. The header displays
# the authenticated user and
# manages toggling the SidebarComponent's view
class HeaderView extends Marionette.LayoutView
  template: require './templates/header'
  className: 'navbar navbar-expand-lg fixed-top navbar-dark bg-dark'
  tagName: 'nav'

# # # # #

module.exports = HeaderView
