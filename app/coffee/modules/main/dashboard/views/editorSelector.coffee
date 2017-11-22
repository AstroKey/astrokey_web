SimpleNav = require 'lib/views/simple_nav'

# # # # #

class EditorSelector extends SimpleNav
  className: 'row h-100'
  template: require('./templates/editor_selector')

  behaviors:
    Tooltips: {}

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Macro',  trigger: 'macro' }
    { icon: 'fa-file-text-o', text: 'Text',   trigger: 'text', disabled: true, css: 'disabled', title: 'Coming Soon' }
    { icon: 'fa-asterisk',    text: 'Key',    trigger: 'key', disabled: true, css: 'disabled', title: 'Coming Soon' }
  ]

  onRender: ->
    configModel = @model.get('config')
    trigger = configModel.get('type')
    return @$("[data-trigger=#{trigger}]").addClass('active')

  onNavigateMacro: ->
    @trigger 'show:macro:editor'

  onNavigateText: ->
    @trigger 'show:text:editor'

  onNavigateKey: ->
    @trigger 'show:key:editor'

# # # # #

module.exports = EditorSelector
