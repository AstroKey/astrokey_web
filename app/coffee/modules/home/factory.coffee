Entities = require('./entities')
DeviceData = require('./data')

# # # # #

class DeviceFactory extends Marionette.Service

  radioRequests:
    'device collection': 'getCollection'

  initialize: ->
    @cachedCollection = new Entities.Collection(DeviceData, { parse: true })

  getCollection: ->
    return @cachedCollection

# # # # #

module.exports = new DeviceFactory()
