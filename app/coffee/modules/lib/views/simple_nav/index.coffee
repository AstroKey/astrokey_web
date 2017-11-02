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
    el = $(e.currentTarget)
    el.addClass('active').siblings().removeClass('active')
    @triggerMethod("navigate:#{el.data('trigger')}")

# # # # #

module.exports = SimpleNav
