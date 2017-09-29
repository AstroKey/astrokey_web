# webusb.getDevices = function() {
#   return navigator.usb.getDevices().then(devices => {
#     return devices.map(device => findOrCreateDevice(device));
#   });
# };

# webusb.requestDevice = function() {
#   var filters = [
#     { vendorId: 0x1209, productId: 0xa800 }
#   ];
#   return navigator.usb.requestDevice({filters: filters}).then(device => {
#     return findOrCreateDevice(device);
#   });
# };



# UsbService class definition
# Responsible for managing USB devices
# - fetch all devices
class UsbService extends Marionette.Service

  radioRequests:
    'usb devices': 'getDevices'

  getDevices: ->
    return navigator.usb.getDevices().then (devices) =>
      console.log('GOT DEVICES')
      console.log(devices)

# # # # #

module.exports = new UsbService()
