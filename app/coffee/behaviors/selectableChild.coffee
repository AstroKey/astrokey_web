
class SelectableChild extends Marionette.Behavior

  css:
    active: 'active'

  events:
    'click':  'onClick'

  modelEvents:
    'selected': 'onClick'

  # Selects activeModel on render
  onRender: ->
    return unless @options.setActive

  # Invoked when clicked
  onClick: (e) ->
    # Bypass behavior with custom onClick callback
    return @view.onClick(e) if @view.onClick

    # Prevent double-click unless specificed
    e?.preventDefault() unless @options.doubleClick

    # Handles de-selection
    if @options.deselect && @$el.hasClass(@css.active)
      @$el.removeClass(@css.active)
      return @view.triggerMethod 'deselected'

    # Return if element is currently selected
    return if @$el.hasClass(@css.active)

    # Prevent deafult and trigger selected
    e?.preventDefault()
    @view.triggerMethod 'selected'
    @$el.addClass(@css.active).siblings().removeClass(@css.active)

# # # # #

module.exports = SelectableChild
