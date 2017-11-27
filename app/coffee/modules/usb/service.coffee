
# Filters used to query WebUSB devices
# TODO - update filters to query devices by AstroKey VendorID
requestDeviceFilters = [
  { vendorId: 0x10c4 }
]

# # # #

# ChromeWebUsbService class definition
# Responsible for managing USB devices
# - fetch all devices
# - writing data to a device
# - reading data from a device
# - write firmware to a device
class ChromeWebUsbService extends Marionette.Service

  radioRequests:
    'usb devices':      'getDevices'
    'usb read:macro':   'readMacro'
    'usb write:macro':  'writeMacro'

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
        return navigator.usb.getDevices()
        .then((d) =>

          console.log(d)

          d = d[0]

          # STEP 3 - open device
          d.open().then =>

            console.log 'open'

            # Step 4 - select configuration
            d.selectConfiguration(1).then =>

              # console.log 'selectConfiguration'

              # TODO - remove
              window.d = d

              # Resolves with device
              return resolve(d)

              # wIndex - Request type (0x01 for set macro)
              # wValue - Macro index (0 - 4 inclusive)
              # bRequest - 3 (hardcoded)
              # wLength - number of bytes (should be macro length * 2)

              # d.controlTransferOut(
              #   {
              #     'requestType': 'vendor',
              #     'recipient': 'device',
              #     'request': 0x03,
              #     'value': 0x0000,
              #     'index': 0x01
              #   }, new Uint8Array([1,4,2,4]).buffer
              # ).then( (response) => { console.log(response) })

              # STEP 5 - controlTransferIn
              # window.d.controlTransferIn({'requestType': 'standard', 'recipient': 'device', 'request': 0x06, 'value': 0x0F00, 'index': 0x00}, 5).then( (r) => { console.log(r) })


        )
        # getDevices Error handling
        .catch((err) =>
          console.log 'ERR - navigator.usb.getDevices()'
        )

      )

  # readMacro
  readMacro: (macroIndex = 0x0000) ->
    # Returns a Promise to manage asynchonous behavior
    return new Promise (resolve, reject) =>

      # device.controlTransferIn (READS DATA FROM DEVICE)
      # TODO - abstract the controlTransferIn request object into a constant (cloned each time)
      d.controlTransferIn(
        {
          'requestType':  'vendor',
          'recipient':    'device',
          'request':      0x03,
          'value':        macroIndex,
          'index':        0x02
        }, 128 # QUESTION - why "128"?
      )
      .then( (response) =>
        return resolve(new Int8Array(response.data.buffer))
      )
      .catch( (err) =>
        console.log 'ERROR READING MACRO'
        return reject(err)
      )


  # sendMacro
  sendMacro: (data) ->

    # Returns a Promise to manage asynchonous behavior
    return new Promise (resolve, reject) =>

      d.controlTransferOut(
        {
          requestType:  'vendor',
          recipient:    'device',
          request:      0x03,
          value:        0x0013, # Whatever we want (to some extent)
          index:        0x0001  # TODO - We can use index for the key the macro corresponds to (low-byte = key, high-byte = number of actions in the macro)
        }, new Uint8Array(data).buffer
      )
      .then( (response) =>
        return resolve(response)
      )
      .catch( (err) =>
        console.log 'ERROR SENDING MACRO'
        return reject(err)
      )


# # # #

module.exports = new ChromeWebUsbService()
