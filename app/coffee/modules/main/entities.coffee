
# AstrokeyModel class definition
class AstrokeyModel extends Backbone.RelationalModel

  # Default attributes
  defaults:
    order: null

# # # # #

class AstrokeyCollection extends Backbone.Collection
  model: AstrokeyModel
  comparator: 'order'

# # # # #

# DeviceModel definition
class DeviceModel extends Backbone.RelationalModel

  # Backbone.Relational - @relations definition
  relations: [
      type:           Backbone.HasMany
      key:            'keys'
      relatedModel:   AstrokeyModel
      collectionType: AstrokeyCollection
  ]

# # # # #

# DeviceCollection definition
class DeviceCollection extends Backbone.Collection
  model: DeviceModel

# # # # #

module.exports =
  Model:      DeviceModel
  Collection: DeviceCollection
