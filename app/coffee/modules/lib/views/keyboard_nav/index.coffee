AbstractKeyboardView = require('lib/views/keyboard_abstract')

# # # #

class NavKeyboard extends AbstractKeyboardView
  template: require './templates/keyboard_nav'

  # Passes key objects to UI
  templateHelpers: ->
    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'nav_r0' })
      r1: _.where(keys, { row: 'nav_r1' })
      r2: _.where(keys, { row: 'nav_r2' })
      r3: _.where(keys, { row: 'nav_r3' })
    }

# # # # #

module.exports = NavKeyboard


