Entities = require('./entities')
KeyData = require('./keys')

# # # # #

class DeviceFactory extends Marionette.Service

  radioRequests:
    'key model':       'getModel'
    'key collection':  'getCollection'

  initialize: ->
    @cachedCollection = new Entities.Collection(KeyData, { parse: true })

  getModel: (id) ->
    return @cachedCollection.get(id)

  getCollection: ->
    return @cachedCollection

# # # # #

module.exports = new DeviceFactory()
