MacroExamples = require('./examples')

# # # # #

# MacroModel class definition
class MacroModel extends Backbone.RelationalModel

  # Default attributes
  defaults:
    order: 0
    position: 3 # TODO - rename 'position' to 'action_type'
    shifted: false

  getKeyData: ->

    data = []

    attrs = _.clone(@attributes)

    # console.log attrs

    # ActionType
    # KEY_DN = 1, KEY VALUE
    # KEY_UP = 2, KEY VALUE
    # KEY_PR = 3, KEY VALUE

    # KEY_DELAY
    if attrs.delay
      data.push(16) # DELAY indicator
      data.push(1) # 1 - 255 (i.e. 5 = 5 x 100ms = 500ms)
      return data

    # KEY_DN
    if attrs.position == 1 # TODO - constantize
      data.push(1)
      data.push(attrs.dec || 4)
      return data

    # KEY_UP
    if attrs.position == 2 # TODO - constantize
      data.push(2)
      data.push(attrs.dec || 4)
      return data

    # KEY_PR
    if attrs.position == 3 # TODO - constantize
      data.push(3)
      data.push(attrs.dec || 4)
      return data

    return data

# # # # #

class MacroCollection extends Backbone.Collection
  model: MacroModel
  comparator: 'order'

  # loadExample
  # Resets the collection to one of the examples
  loadExample: (example_id) ->

    # Resets the collection with the data defined in the Examples object
    @reset(MacroExamples[example_id])

  # build
  # Compiles the complete macro from each macro model
  build: ->
    data = []
    _.each(@models, (macro) =>
      # console.log 'EACH MACRO'
      # console.log macro.getKeyData()
      data = data.concat(macro.getKeyData())
    )

    return data

# # # # #

module.exports =
  Model:      MacroModel
  Collection: MacroCollection
