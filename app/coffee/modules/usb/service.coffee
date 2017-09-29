
# UsbService class definition
# Responsible for managing USB devices
# - fetch all devices
class UsbService extends Marionette.Service

  radioRequests:
    'usb devices': 'getDevices'

  getDevices: ->
    return navigator.usb.getDevices().then (devices) =>
      console.log(devices)

# # # # #

module.exports = new UsbService()
