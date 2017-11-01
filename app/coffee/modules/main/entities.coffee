MacroEntities = require('../macro/entities')

# # # # #

# AstroKeyConfig class definition
class AstrokeyConfig extends Backbone.RelationalModel

  # Default attributes
  defaults: {
    type: 'macro'
    macros: []
    text_value: ''
    key_value: ''
  }

  # Backbone.Relational - @relations definition
  relations: [
      type:           Backbone.HasMany
      key:            'macros'
      relatedModel:   MacroEntities.Model
      collectionType: MacroEntities.Collection
  ]

# # # # #

# AstrokeyModel class definition
class AstrokeyModel extends Backbone.RelationalModel

  # Default attributes
  defaults:
    order: null
    config: {}

  # Backbone.Relational - @relations definition
  relations: [
      type:           Backbone.HasOne
      key:            'config'
      relatedModel:   AstrokeyConfig
  ]

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
