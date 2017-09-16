
class KeyChild extends Mn.LayoutView
  tagName: 'li'
  # className: 'key--child d-flex justify-content-center align-items-center'
  className: 'btn btn-outline-dark key--child d-flex justify-content-center align-items-center'
  template: require('./templates/key_child')

  behaviors:
    SelectableChild: {}

# # # # #

class KeySelector extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled key--list px-3 py-3 my-2 d-flex justify-content-between align-items-center'
  childView: KeyChild

# # # # #

module.exports = KeySelector


