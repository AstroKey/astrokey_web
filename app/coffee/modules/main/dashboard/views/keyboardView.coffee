
class KeyboardView extends require('./abstractKeyboardView')
  template: require './templates/keyboard_view'

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
