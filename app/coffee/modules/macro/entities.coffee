
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

# # # # #

module.exports =
  Model:      MacroModel
  Collection: MacroCollection
