
class KeyboardView extends Mn.LayoutView
  template: require './templates/hotkey_editor'
  className: 'row'

  ui:
    key: '[data-click=key]'

  events:
    'click @ui.key': 'onKeyClick'

  # Maintains key state
  # TODO - should be backbone models?
  keys: []

  # KeyClick callback
  onKeyClick: (e) ->

    # Caches el and key
    el  = $(e.currentTarget)
    key = el.data('key')

    # Toggle ON
    if @keys.indexOf(key) < 0
      el.addClass('active')
      @keys.push(key)

    # TOGGLE OFF
    else
      el.removeClass('active')
      @keys = _.without(@keys, key)

    # Blurs focus from clicked key
    el.blur()

    console.log @keys

    return

# # # # #

module.exports = KeyboardView


