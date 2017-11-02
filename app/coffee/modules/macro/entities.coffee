MacroExamples = require('./examples')

# # # # #

# MacroModel class definition
class MacroModel extends Backbone.RelationalModel

  # Default attributes
  defaults:
    order: 0
    position: 0

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
