
class KeyChild extends Mn.LayoutView
  tagName: 'li'
  className: 'list-group-item'
  template: require('./templates/key_child')

  behaviors:
    SelectableChild: {}

# # # # #

class KeySelector extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-group'
  childView: KeyChild

# # # # #

module.exports = KeySelector


