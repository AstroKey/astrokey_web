
class KeyChild extends Mn.LayoutView
  tagName: 'li'
  className: 'btn btn-outline-light key--child d-flex justify-content-center align-items-center mx-2 my-2'
  template: require('./templates/key_child')

  behaviors:
    SelectableChild: { deselect: true }

  modelEvents:
    'config:updated': 'onModelChange'

  onModelChange: ->
    return @render()

  templateHelpers: ->

    # Isolates AstroKeyConfig model
    config = @model.get('config')

    # Macro
    if config.get('type') == 'macro'
      return { label: 'M' }

    # Text
    if config.get('type') == 'text'
      return { label: 'T' }

    # Key
    # TODO - DISPLAY KEY IN VIEW
    if config.get('type') == 'key'
      return { label: 'K' }

# # # # #

# class KeySelector extends Mn.CollectionView
#   tagName: 'ul'
#   className: 'list-unstyled key--list px-3 py-3 my-2 d-flex justify-content-between align-items-center flex-row'
#   childView: KeyChild

class KeySelector extends Mn.CompositeView
  className: 'key--list--wrapper px-3 py-3 d-flex align-items-center'
  childView: KeyChild
  template: require('./templates/key_selector')
  childViewContainer: 'ul'

# # # # #

module.exports = KeySelector


