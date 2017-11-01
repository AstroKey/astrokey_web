KeyboardView = require('./keyboardView')
NumpadView = require('./numpadView')

# # # # #

# TODO - abstract
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

class KeyboardSelector extends SimpleNav
  className: 'row h-100'
  template: require('./templates/keyboard_selector')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Keyboard',  trigger: 'keyboard', default: true }
    { icon: 'fa-file-text-o', text: 'Numpad',   trigger: 'numpad' }
    { icon: 'fa-asterisk',    text: 'Media',    trigger: 'media' }
  ]

  onNavigateKeyboard: ->
    @contentRegion.show new KeyboardView({ model: @model, keys: @options.keys })

  onNavigateNumpad: ->
    @contentRegion.show new NumpadView({ model: @model, keys: @options.keys })

  onNavigateMedia: ->
    @contentRegion.show new KeyboardView({ model: @model, keys: @options.keys })

# # # # #

module.exports = KeyboardSelector
