
class MacroChild extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-dark macro--child d-flex justify-content-center align-items-center my-2'
  template: require('./templates/macro_child')

  behaviors:
    SortableChild: {}

# # # # #

class MacroEmpty extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-dark macro--child d-flex justify-content-center align-items-center my-2'
  template: require('./templates/macro_empty')

  behaviors:
    SortableChild: {}

# # # # #

class MacroList extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled macro--list px-4 py-3 my-2 d-flex justify-content-center align-items-center flex-row'
  childView: MacroChild
  emptyView: MacroEmpty

  behaviors:
    SortableList: {}

# # # # #

module.exports = MacroList


