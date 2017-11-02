
# Filters used to query WebUSB devices
# TODO - update filters to query devices by AstroKey VendorID
requestDeviceFilters = [
  { vendorId: 0x10c4 }
]

# # # #

# UsbService class definition
# Responsible for managing USB devices
# - fetch all devices
class UsbService extends Marionette.Service

  radioRequests:
    'usb devices': 'getDevices'

  # getDevices
  getDevices: ->

    # Returns a Promise to manage asynchonous behavior
    return new Promise (resolve, reject) =>

      # Step 1 - Request device
      navigator.usb.requestDevice({ filters: requestDeviceFilters })
      .then( (device) =>

        # TODO - remove
        # console.log device

        # Step 2 - Get Devices
        # TODO - verify this workflow
        return navigator.usb.getDevices().then((d) =>

          console.log(d)

          d = d[0]

          # STEP 3 - open device
          d.open().then =>

            console.log 'open'

            # Step 4 - select configuration
            d.selectConfiguration(1).then =>

              console.log 'selectConfiguration'

              window.d = d

              # STEP 5 - controlTransferIn
              # window.d.controlTransferIn({'requestType': 'standard', 'recipient': 'device', 'request': 0x06, 'value': 0x0F00, 'index': 0x00}, 5).then( (r) => { console.log(r) })


        )

      )

  # send
  send: ->

    window.d.controlTransferOut({
        requestType:  'vendor',
        recipient:    'device',
        request:      0x03,
        value:        0x0013, # Whatever we want (to some extent)
        index:        0x0001  # TODO - We can use index for the key the macro corresponds to (low-byte = key, high-byte = number of actions in the macro)
    }, data);


# # # #

module.exports = new UsbService()
