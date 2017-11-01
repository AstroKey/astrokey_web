
class MacroChild extends Mn.LayoutView
  tagName: 'li'
  className: 'macro--child flex-column justify-content-center align-items-center my-2'
  template: require('./templates/macro_child')

  behaviors:
    SortableChild: {}

  modelEvents:
    'change:position': 'render'

  events:
    # 'dragstart': 'onDragStart'
    'mouseover .key': 'onMouseOver'
    'mouseout .key': 'onMouseOut'
    'click .key': 'removeMacro'
    'click [data-position]:not(.active)': 'onPositionClick'

  onMouseOver: ->
    @$el.addClass('hovered')
    # console.log 'onMouseOver'

  onMouseOut: ->
    @$el.removeClass('hovered')
    # console.log 'onMouseOut'

  # onDragStart: ->
  #   @$el.removeClass('hovered')
  #   setTimeout( =>
  #     @$el.siblings('.macro--child').removeClass('hovered')
  #   , 1000)

  #   console.log 'onDragStart'

  removeMacro: ->
    @model.collection.remove(@model)

  onPositionClick: (e) ->

    # Caches clicked el
    el = $(e.currentTarget)

    # Isolates position data from element
    position = el.data('position')

    console.log position

    if position == -1
      new_position = 0
    if position == 0
      new_position = 1
    if position == 1
      new_position = -1

    # Sets the position attribute on the model
    @model.set('position', new_position)

  templateHelpers: ->
    positions = [
      { position: -1, css: 'fa-long-arrow-down' }
      { position: 0, css: 'fa-arrows-v' }
      { position: 1, css: 'fa-long-arrow-up' }
    ]

    position = @model.get('position')
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
  className: 'list-unstyled macro--list px-4 py-3 my-2 d-flex justify-content-center align-items-center flex-row'
  childView: MacroChild
  emptyView: MacroEmpty

  onRender: ->

    # Sorts the collection
    @collection.sort()

    # Initializes Sortable container
    Sortable.create @el,
      animation:    100
      handle:       '.key'
      ghostClass:   'ghost'  # Class name for the drop placeholder
      chosenClass:  'chosen'  # Class name for the chosen item
      dragClass:    'drag'  # Class name for the dragging item
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


