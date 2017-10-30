
class MacroChild extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-dark key--child d-flex justify-content-center align-items-center my-2'
  template: require('./templates/macro_child')

  behaviors:
    SelectableChild: {}
    SortableChild: {}

# # # # #

class MacroList extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled key--list px-4 py-3 my-2 d-flex justify-content-between align-items-center flex-column'
  childView: MacroChild

  behaviors:
    SortableList: {}

# # # # #

module.exports = MacroList


