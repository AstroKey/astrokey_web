AbstractKeyboardView = require('lib/views/keyboard_abstract')

# # # # #

class KeyboardView extends AbstractKeyboardView
  template: require './templates/keyboard_full'

  # Passes key objects to UI
  templateHelpers: ->
    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'r0'})
      r1: _.where(keys, { row: 'r1'})
      r2: _.where(keys, { row: 'r2'})
      r3: _.where(keys, { row: 'r3'})
      r4: _.where(keys, { row: 'r4'})
    }

# # # # #

module.exports = KeyboardView
