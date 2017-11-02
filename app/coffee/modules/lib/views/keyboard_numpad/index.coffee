AbstractKeyboardView = require('lib/views/keyboard_abstract')

# # # #

class NumpadView extends AbstractKeyboardView
  template: require './templates/keyboard_numpad'

  # Passes key objects to UI
  templateHelpers: ->
    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'num_r0'})
      r1: _.where(keys, { row: 'num_r1'})
      r2: _.where(keys, { row: 'num_r2'})
      r3: _.where(keys, { row: 'num_r3'})
      r4: _.where(keys, { row: 'num_r4'})
      col: _.where(keys, { row: 'num_col'})
    }

# # # # #

module.exports = NumpadView


