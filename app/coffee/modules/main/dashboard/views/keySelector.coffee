
class KeyChild extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-light key--child d-flex justify-content-center align-items-center mx-2'
  template: require('./templates/key_child')

  behaviors:
    SelectableChild: { deselect: true }

  templateHelpers: ->

    # Isolates AstroKeyConfig model
    config = @model.get('config')

    # Macro
    if config.get('type') == 'macro'
      return { label: 'Macro' }

    # Text
    if config.get('type') == 'text'
      return { label: 'Text' }

    # Key
    # TODO - DISPLAY KEY IN VIEW
    if config.get('type') == 'key'
      return { label: 'Key' }

# # # # #

class KeySelector extends Mn.CollectionView
  tagName: 'ul'
  className: 'list-unstyled key--list px-4 py-3 my-2 d-flex justify-content-between align-items-center flex-row'
  childView: KeyChild

# # # # #

module.exports = KeySelector


