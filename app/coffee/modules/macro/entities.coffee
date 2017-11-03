MacroExamples = require('./examples')

# # # # #

charMap = {

  # Lowercase
  'a':  4
  'b':  5
  'c':  6
  'd':  7
  'e':  8
  'f':  9
  'g': 10
  'h': 11
  'i': 12
  'j': 13
  'k': 14
  'l': 15
  'm': 16
  'n': 17
  'o': 18
  'p': 19
  'q': 20
  'r': 21
  's': 22
  't': 23
  'u': 24
  'v': 25
  'w': 26
  'x': 27
  'y': 28
  'z': 29

}

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
