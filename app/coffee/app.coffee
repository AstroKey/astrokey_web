
# Application class definition
# Manages lifecycle and bootstraps application
class Application extends Marionette.Service

  radioEvents:
    'app redirect': 'redirectTo'

  # Invoked after constructor
  initialize: ->

    # Starts Header Component
    Backbone.Radio.channel('header').trigger('reset')

    # Starts Henson.js Components
    Backbone.Radio.channel('breadcrumb').trigger('ready')
    Backbone.Radio.channel('overlay').trigger('ready')
    @onReady()
    return true

  # Starts the application
  # Starts Backbone.history (enables routing)
  # And initializes sidebar module
  onReady: ->
    Backbone.history.start()

    # TODO - this is a hack to auto-connect to a device IF it's already been connected to
    navigator.usb.getDevices()
    .then( (d) =>
      d[0].open()
      window.d = d[0]
    )

  # Redirection interface
  # Used accross the application to redirect
  # to specific views after specific actions
  redirectTo: (route) ->
    window.location = route
    return true

# # # # #

module.exports = Application
