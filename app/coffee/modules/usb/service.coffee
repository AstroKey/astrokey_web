
# NOTE: MUST CALL usb.requestDevice before usb.getDevices
# navigator.usb.requestDevice({ filters: [{ vendorId: 0x03eb, }]}).then(function(device){
#    console.log(device);
# });

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
