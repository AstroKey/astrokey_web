MacroEntities = require('../macro/entities')
MacroKeys = require('../key/keys')
CharacterMap = require('lib/character_map')
InvertedCharacterMap = _.invert(CharacterMap)

# # # # #

# Accepts an array and splits it
# into pairs of [position, character_id]
pairArray = (a) =>
  temp = a.slice()
  arr = []

  while (temp.length)
    arr.push(temp.splice(0,2))

  return arr

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

  # readMacro
  # Reads and parses the macro from the device
  readMacro: ->

    # Returns a Promise to handle asynchronous behavior
    return new Promise (resolve, reject) =>

      # Issues 'read:macro' request to the USB service
      Radio.channel('usb').request('read:macro', @get('order')).then((macroArray) =>

        # Stores the keys used to populate the macro collection
        macros = []
        parsedMacros = []

        # TODO - remove
        console.log 'Parsed Macro from device:'
        console.log macroArray

        # Compacts the macroArray
        # QUESTION - will we ever have zeros between each key stroke?
        macroArray = _.compact(macroArray)

        # Splits the array into pairs of [position, character_id]
        pairs = pairArray(macroArray)

        # Iterates over each pair in the macroArray
        for pair, index in pairs

          # Captures and formats the position
          position = pair[0]
          position = if position == 2 then 1 else -1

          # Finds the macro object
          macro = _.findWhere(MacroKeys, { key: InvertedCharacterMap[pair[1]] })

          # Clones the macro object
          macro = _.clone(macro)

          # Assignss the proper order/index and position attributes
          macro.order = index
          macro.position = position

          # Appends the macro the the `macros` array
          macros.push(macro)

        # Iterates over the macros _again_ - this time to merge keyup/keydown actions
        macroIndex = 0
        while macroIndex <= macros.length

          # Isolates the current and next macros in the array
          macro = macros[macroIndex]
          nextMacro = macros[macroIndex + 1]

          # Returns if nextMacro is undefined
          if !nextMacro
            parsedMacros.push(macro)
            macroIndex++
            continue

          # Continues check if the macro is a KEY_DOWN
          if macro.position == -1 && nextMacro.position == 1 && macro.key == nextMacro.key

            # KEY_PRESS
            macro.position = 0

            # Appends the macro to the parsedMacros array
            parsedMacros.push(macro)

            # Iterates, skipping the matched macro
            macroIndex = macroIndex + 2
            continue

          # Non-Repeated - standard procedure
          parsedMacros.push(macro)
          macroIndex++
          continue

        # Sets the Macros on the AstrokeyConfig model
        config = @get('config')
        config.get('macros').reset(parsedMacros)

        # Resolves the Promise with the parsed macros
        return resolve(macros)
      )

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
