MacroEntities = require('../macro/entities')
MacroKeys = require('../key/keys')

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

  # TODO - this should be moved elsewhere (not a Device-level concern)
  buildSnippet: (snippet) ->
    data = []

    # Iterates over each character in the snippet
    for index in [0..snippet.length - 1]

      # Isolaets the character
      char = snippet[index]

      # Finds the macro
      macro = _.findWhere(MacroKeys, { key: char })
      macro ||= _.findWhere(MacroKeys, { key: 'SPACE' })

      # Clones the macro object
      macro = _.clone(macro)

      # Assignss the proper order/index and position attributes
      macro.order = index
      macro.position = 0

      # Appends macro to data array
      data.push(macro)

    # Returns the formatted data array
    return data

  # readMacro
  # Reads and parses the macro from the device
  # TODO - most of this should be moved elsewhere (not a Device-level concern)
  readMacro: ->

    # Returns a Promise to handle asynchronous behavior
    return new Promise (resolve, reject) =>

      # Issues 'read:macro' request to the USB service
      Radio.channel('usb').request('read:macro', @get('order')).then((macroArray) =>

        # Stores the keys used to populate the macro collection
        macros = []
        parsedMacros = []

        # TODO - remove
        console.log 'Parsed Macro from key: ', @get('order')
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

          # Finds the macro object
          macro = _.findWhere(MacroKeys, { dec: pair[1] })

          # Clones the macro object
          macro = _.clone(macro)

          # Assignss the proper order/index and position attributes
          macro.position = position

          # Appends the macro the the `macros` array
          macros.push(macro)

        # Iterates over the macros _again_ - this time to merge keyup/keydown actions
        parsedIndex = 0
        iterateIndex = 0
        while iterateIndex < macros.length

          # Isolates the current and next macros in the array
          macro = macros[iterateIndex]
          nextMacro = macros[iterateIndex + 1]

          # Returns if nextMacro is undefined
          if !nextMacro
            macro.order = parsedIndex
            parsedIndex++
            parsedMacros.push(macro)
            iterateIndex++
            continue

          # # Continues check if the macro is a corresponding KEY_UP
          # if macro.position == 1 && nextMacro.position == 2 && macro.key == nextMacro.key

          #   # KEY_PRESS
          #   macro.position = 3

          #   # Appends the macro to the parsedMacros array
          #   macro.order = parsedIndex
          #   parsedIndex++
          #   parsedMacros.push(macro)

          #   # Iterates, skipping the matched macro
          #   iterateIndex = iterateIndex + 2
          #   continue

          # Non-Repeated - standard procedure
          macro.order = parsedIndex
          parsedIndex++
          parsedMacros.push(macro)
          iterateIndex++
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
