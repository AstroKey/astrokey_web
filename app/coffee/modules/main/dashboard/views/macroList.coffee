
class MacroChild extends Mn.LayoutView
  tagName: 'li'
  className: 'macro--child d-flex flex-column justify-content-center align-items-center my-2'
  template: require('./templates/macro_child')

  behaviors:
    SortableChild: {}

  ui:
    positionBtn: '[data-position]'

  modelEvents:
    'change:position': 'render'

  events:
    'click @ui.positionBtn:not(.active)': 'onPositionClick'

  onPositionClick: (e) ->
    console.log 'CLICKED POSITION'

    # Caches clicked el
    el = $(e.currentTarget)

    # Isolates position data from element
    position = el.data('position')

    console.log position

    # Sets the position attribute on the model
    @model.set('position', position)


  templateHelpers: ->
    positions = [
      { position: -1, css: 'fa-long-arrow-up' }
      { position: 0, css: 'fa-arrows-v' }
      { position: 1, css: 'fa-long-arrow-down' }
    ]

    position = @model.get('position')
    activePosition = _.findWhere(positions, { position: position })
    activePosition.css += ' active'

    return { positions }

# # # # #

class MacroEmpty extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-dark macro--child d-flex justify-content-center align-items-center my-2'
  template: require('./templates/macro_empty')

# # # # #

class MacroList extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled macro--list px-4 py-3 my-2 d-flex justify-content-center align-items-center flex-row'
  childView: MacroChild
  emptyView: MacroEmpty

  # behaviors:
  #   SortableList: {}

  onRender: ->

    # Sorts the collection
    @collection.sort()

    # Initializes Sortable container
    Sortable.create @el,
      animation:    0
      handle:       '.handle'
      ghostClass:   'ghost'  # Class name for the drop placeholder
      chosenClass:  'chosen'  # Class name for the chosen item
      dragClass:    'drag'  # Class name for the dragging item
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


