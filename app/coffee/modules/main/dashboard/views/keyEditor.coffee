TextEditor = require('./textEditor')
HotkeyEditor = require('./hotkeyEditor')

# # # # #

class SimpleNav extends Mn.LayoutView

  events:
    'click [data-trigger]': 'onNavItemClick'

  navItems: []

  regions:
    contentRegion: '[data-region=content]'

  onRender: ->
    def = _.where(_.result(@, 'navItems'), { default: true })[0]
    return unless def
    @triggerMethod("navigate:#{def.trigger}")

  serializeData: ->
    data = super
    _.extend(data, { navItems: _.result(@, 'navItems') })
    return data

  onNavItemClick: (e) =>
    console.log @
    el = $(e.currentTarget)
    el.addClass('active').siblings().removeClass('active')
    @triggerMethod("navigate:#{el.data('trigger')}")

# # # # #

class KeyEditor extends SimpleNav
  className: 'row h-100'
  template: require('./templates/key_editor')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Hotkey',  trigger: 'hotkey' }
    { icon: 'fa-file-text-o', text: 'Text',    trigger: 'text' }
  ]

  onRender: ->
    astrokey = @model.get('config')
    return @onNavigateText() if astrokey.type == 'text'
    return @onNavigateHotkey()

  onNavigateHotkey: ->
    @contentRegion.show new HotkeyEditor({ model: @model })

  onNavigateText: ->
    @contentRegion.show new TextEditor({ model: @model })

# # # # #

module.exports = KeyEditor
