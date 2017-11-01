# TODO - abstract, with template
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
