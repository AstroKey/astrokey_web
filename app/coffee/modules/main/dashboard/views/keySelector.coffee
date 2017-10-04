
class KeyChild extends Mn.LayoutView
  tagName: 'li'
  # className: 'key--child d-flex justify-content-center align-items-center'
  className: 'btn btn-outline-dark key--child d-flex justify-content-center align-items-center sortable'
  template: require('./templates/key_child')

  behaviors:
    SelectableChild: {}
    SortableChild: {}

# # # # #

class KeySelector extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled key--list px-3 py-3 my-2 d-flex justify-content-between align-items-center'
  childView: KeyChild

  behaviors:
    SortableList: {}

# # # # #

module.exports = KeySelector


