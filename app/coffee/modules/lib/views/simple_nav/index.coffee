class SimpleNav extends Mn.LayoutView

  events:
    'click [data-trigger]:not(.disabled)': 'onNavItemClick'

  navItems: []

  regions:
    contentRegion: '[data-region=content]'

  onRender: ->
    def = _.where(_.result(@, 'navItems'), { default: true })[0]
    return unless def
    @triggerMethod("navigate:#{def.trigger}")
    @$("[data-trigger=#{def.trigger}]").addClass('active')

  serializeData: ->
    data = super
    _.extend(data, { navItems: _.result(@, 'navItems') })
    return data

  onNavItemClick: (e) =>
    el = $(e.currentTarget)
    el.addClass('active').siblings().removeClass('active')
    @triggerMethod("navigate:#{el.data('trigger')}")
    el.blur()

# # # # #

module.exports = SimpleNav
