TextEditor = require('./textEditor')
HotkeyEditor = require('./hotkeyEditor')

# # # # #

class KeyEditor extends require 'hn_views/lib/nav'
  className: 'row'
  template: require('./templates/key_editor')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Hotkey',  trigger: 'hotkey', default: true }
    { icon: 'fa-file-text-o', text: 'Text',    trigger: 'text' }
  ]

  navEvents:
    'hotkey':   'hotkeyEditor'
    'text':     'textEditor'

  hotkeyEditor: ->
    @contentRegion.show new HotkeyEditor({ model: @model })

  textEditor: ->
    @contentRegion.show new TextEditor({ model: @model })

# # # # #

module.exports = KeyEditor
