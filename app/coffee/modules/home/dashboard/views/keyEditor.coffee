TextEditor = require('./textEditor')
HotkeyEditor = require('./hotkeyEditor')
LedEditor = require('./ledEditor')

# # # # #

class KeyEditor extends require 'hn_views/lib/nav'
  className: 'row h-100'
  template: require('./templates/key_editor')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Hotkey',  trigger: 'hotkey', default: true }
    { icon: 'fa-file-text-o', text: 'Text',    trigger: 'text' }
    { icon: 'fa-eyedropper',  text: 'Color',   trigger: 'led' }
  ]

  navEvents:
    'hotkey': 'hotkeyEditor'
    'text':   'textEditor'
    'led':    'ledEditor'

  hotkeyEditor: ->
    @contentRegion.show new HotkeyEditor({ model: @model })

  textEditor: ->
    @contentRegion.show new TextEditor({ model: @model })

  ledEditor: ->
    @contentRegion.show new LedEditor({ model: @model })

# # # # #

module.exports = KeyEditor
