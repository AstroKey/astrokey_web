SimpleNav = require 'lib/views/simple_nav'

# # # # #

class KeyEditor extends SimpleNav
  className: 'row h-100'
  template: require('./templates/key_editor')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Macro',  trigger: 'macro' }
    { icon: 'fa-file-text-o', text: 'Text',   trigger: 'text' }
    { icon: 'fa-asterisk',    text: 'Key',    trigger: 'key' }
  ]

  onNavigateMacro: ->
    @trigger 'show:macro:editor'

  onNavigateText: ->
    @trigger 'show:text:editor'

  onNavigateKey: ->
    @trigger 'show:key:editor'

# # # # #

module.exports = KeyEditor
