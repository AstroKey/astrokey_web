SimpleNav = require('./simpleNav')
TextEditor = require('./textEditor')
MacroEditor = require('./macroEditor')

# # # # #

class KeyEditor extends SimpleNav
  className: 'row h-100'
  template: require('./templates/key_editor')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Macro',  trigger: 'macro' }
    { icon: 'fa-file-text-o', text: 'Text',   trigger: 'text' }
    { icon: 'fa-asterisk',    text: 'Key',    trigger: 'key' }
  ]

  onRender: ->
    astrokey = @model.get('config')
    return @onNavigateText() if astrokey.type == 'text'
    return @onNavigateKey() if astrokey.type == 'key'
    return @onNavigateMacro()

  onNavigateMacro: ->
    @contentRegion.show new MacroEditor({ model: @model, keys: @options.keys, macros: @options.macros })

  onNavigateText: ->
    @contentRegion.show new TextEditor({ model: @model })

  onNavigateKey: ->
    @contentRegion.show new MacroEditor({ model: @model, keys: @options.keys, macros: @options.macros })


# # # # #

module.exports = KeyEditor
