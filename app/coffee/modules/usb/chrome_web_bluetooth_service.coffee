
# Filters used to query WebUSB devices
# TODO - update filters to query devices by AstroKey VendorID
REQUEST_DEVICE_FILTERS = [
  { name: 'Lyrebird' }
]

# # # #

# ChromeWebBluetoothService class definition
# Responsible for managing USB devices
# - fetch all devices
# - writing data to a device
# - reading data from a device
# - write firmware to a device
class ChromeWebBluetoothService extends Marionette.Service

  radioRequests:
    'bluetooth devices': 'getDevices'

  # getDevices
  getDevices: ->

    # Returns a Promise to manage asynchonous behavior
    return new Promise (resolve, reject) =>

      # Step 1 - Request device
      navigator.bluetooth.requestDevice({ filters: REQUEST_DEVICE_FILTERS })
      .then( (device) =>

        console.log 'DEVICES'
        console.log device

        # Short-circuits device open
        return unless device

        # TODO - remove - for debugging purposes only
        window.bd = device

        # Connects to device
        device.gatt.connect().then (response) =>
          console.log 'CONNECTED'
          console.log response

      )

# # # #

module.exports = new ChromeWebBluetoothService()
