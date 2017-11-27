MacroExamples = require('./examples')
charMap = require('lib/character_map')

# # # # #

# MacroModel class definition
class MacroModel extends Backbone.RelationalModel

  # Default attributes
  defaults:
    order: 0
    position: 0
    shifted: false

  getKeyData: ->

    data = []

    attrs = _.clone(@attributes)

    # console.log attrs

    # ActionType
    # Press   = 1, KEY VALUE
    # Release = 2, KEY VALUE

    # KEY DOWN & KEY UP
    if attrs.position == 0
      data.push(1)
      data.push(charMap[attrs.key] || 4)

      data.push(2)
      data.push(charMap[attrs.key] || 4)

    # KEY DOWN
    if attrs.position == -1
      data.push(1)
      data.push(charMap[attrs.key] || 4)

    # KEY UP
    if attrs.position == 1
      data.push(2)
      data.push(charMap[attrs.key] || 4)

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

# # # # #

module.exports =
  Model:      MacroModel
  Collection: MacroCollection
