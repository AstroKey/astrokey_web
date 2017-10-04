Entities = require('./entities')
DeviceData = require('./data')

# # # # #

class DeviceFactory extends Marionette.Service

  radioRequests:
    'device model':       'getModel'
    'device collection':  'getCollection'

  initialize: ->
    @cachedCollection = new Entities.Collection(DeviceData, { parse: true })

  getModel: (id) ->
    return @cachedCollection.get(id)

  getCollection: ->
    return @cachedCollection

# # # # #

module.exports = new DeviceFactory()
