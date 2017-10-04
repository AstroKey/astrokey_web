
# Filters used to query WebUSB devices
# TODO - update filters to query devices by AstroKey VendorID
requestDeviceFilters = [
  { vendorId: 0x03eb }
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
        console.log device

        # Step 2 - Get Devices
        # TODO - verify this workflow
        return navigator.usb.getDevices().then((d) =>
          console.log(d)
        )

      )


# # # #

module.exports = new UsbService()
