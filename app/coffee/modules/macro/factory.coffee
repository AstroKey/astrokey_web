Entities = require('./entities')
DefaultMacros = require('./default_macros')

# # # # #

class MacroFactory extends Marionette.Service

  radioRequests:
    'macro collection':  'getCollection'

  initialize: ->
    @cachedCollection = new Entities.Collection(DefaultMacros, { parse: true })

  getCollection: ->
    return @cachedCollection

# # # # #

module.exports = new MacroFactory()
