
# KeyModel class definition
class KeyModel extends Backbone.RelationalModel

  # Default attributes
  defaults:
    order: null

# # # # #

class KeyCollection extends Backbone.Collection
  model: KeyModel
  comparator: 'order'

# # # # #

# DeviceModel definition
class DeviceModel extends Backbone.RelationalModel

  # Backbone.Relational - @relations definition
  relations: [
      type:           Backbone.HasMany
      key:            'keys'
      relatedModel:   KeyModel
      collectionType: KeyCollection
  ]

# # # # #

# DeviceCollection definition
class DeviceCollection extends Backbone.Collection
  model: DeviceModel

# # # # #

module.exports =
  Model:      DeviceModel
  Collection: DeviceCollection
