
class MacroChild extends Mn.LayoutView
  tagName: 'li'
  className: 'macro--child d-flex justify-content-center align-items-center my-2'
  template: require('./templates/macro_child')

  behaviors:
    SortableChild: {}

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
      handle:       '.macro--child'
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


