
class MacroChild extends Mn.LayoutView
  tagName: 'li'
  className: 'macro--child flex-column justify-content-center align-items-center my-2'
  template: require('./templates/macro_child')

  behaviors:
    SortableChild: {}
    # Tooltips: {}

  modelEvents:
    'change:position':  'render'
    'change:shifted':   'render'

  # ui:
  #   tooltip: '[data-toggle=tooltip]'

  events:
    'drag': 'onDrag'
    'dragstart': 'onDragStart'
    'mouseover .key': 'onMouseOver'
    'mouseout .key': 'onMouseOut'
    'click .key': 'removeMacro'
    'click [data-position]:not(.active)': 'onPositionClick'

  # state: {
  #   tooltipOnRender: false
  # }

  # onRender: ->
  #   return unless @state.tooltipOnRender

  #   # Unsets tooltip flag
  #   @state.tooltipOnRender = false

  #   # Shows the tooltip
  #   @ui.tooltip.tooltip('show')

  onMouseOver: ->
    @$el.addClass('hovered')

  onMouseOut: ->
    @$el.removeClass('hovered')

  onDragStart: ->
    @$el.addClass('drag-start')

  onDrag: ->
    @$el.removeClass('drag-start hovered')
    @$el.siblings('.macro--child').removeClass('drag-start hovered')

  removeMacro: ->
    # console.log @model
    # @model.set('shifted', !@model.get('shifted'))
    @model.collection.remove(@model)

  onPositionClick: (e) ->

    # Displays the tooltip after the view re-renders
    # @state.tooltipOnRender = true

    # Clears active tooltips
    # @clearTooltips()

    # Caches clicked el
    el = $(e.currentTarget)

    # Isolates position data from element
    position = el.data('position')

    # Determines next position

    # KEY_DN -> KEY_UP
    if position == 1
      new_position = 2

    # KEY_UP -> KEY_PR
    if position == 2
      new_position = 3

    # KEY_PR -> KEY_DN
    if position == 3
      new_position = 1

    # Sets the position attribute on the model
    @model.set('position', new_position)

  templateHelpers: ->
    positions = [
      { position: 3, css: 'fa-arrows-v', tooltip: 'Key Down | Up' }
      { position: 1, css: 'fa-long-arrow-down', tooltip: 'Key Down' }
      { position: 2, css: 'fa-long-arrow-up', tooltip: 'Key Up' }
    ]

    position = @model.get('position')
    console.log 'position: ', position
    active_position = _.findWhere(positions, { position: position })
    return { active_position }

# # # # #

class MacroEmpty extends Mn.LayoutView
  tagName: 'li'
  className: 'macro--child empty flex-column justify-content-center align-items-center my-2'
  template: require('./templates/macro_empty')

# # # # #

class MacroList extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled macro--list px-4 my-2 d-flex justify-content-center align-items-center flex-row flex-wrap'
  childView: MacroChild
  emptyView: MacroEmpty

  onRender: ->

    # Sorts the collection
    @collection.sort()

    # Initializes Sortable container
    Sortable.create @el,
      animation:    150
      handle:       '.key'
      ghostClass:   'ghost'  # Class name for the drop placeholder
      chosenClass:  'chosen'  # Class name for the chosen item
      dragClass:    'drag'  # Class name for the dragging item
      # group:
      #   name: 'macro'
      #   pull: false
      #   put:  true
      fallbackTolerance: 100
      onEnd: (e) => @reorderCollection()

  # reorderCollection
  # Invoked after sorting has completed
  reorderCollection: =>

    # Triggers order events on CollectionView childView $els
    order = 1
    for el in @el.children
      $(el).trigger('sorted',order)
      order++

    # @collection.sort()
    @render()

# # # # #

module.exports = MacroList


