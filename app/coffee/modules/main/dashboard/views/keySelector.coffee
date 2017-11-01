
class KeyChild extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-secondary key--child d-flex justify-content-center align-items-center my-2'
  template: require('./templates/key_child')

  behaviors:
    SelectableChild: {}
  #   SortableChild: {}

# # # # #

class KeySelector extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled key--list px-4 py-3 my-2 d-flex justify-content-between align-items-center flex-column'
  childView: KeyChild

  behaviors:
    SortableList: {}

# # # # #

module.exports = KeySelector


