AbstractKeyboardView = require('lib/views/keyboard_abstract')

# # # #

class MediaKeyboard extends AbstractKeyboardView

  # Passes key objects to UI
  templateHelpers: ->
    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'media_r0'})
    }

# # # # #

module.exports = MediaKeyboard


