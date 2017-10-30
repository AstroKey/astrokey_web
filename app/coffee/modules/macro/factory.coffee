Entities = require('./entities')

# # # # #

class MacroFactory extends Marionette.Service

  radioRequests:
    'macro collection':  'getCollection'

  initialize: ->
    @cachedCollection = new Entities.Collection()

  getCollection: ->
    return @cachedCollection

# # # # #

module.exports = new MacroFactory()
