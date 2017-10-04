
class KeyboardView extends Mn.LayoutView
  template: require './templates/hotkey_editor'
  className: 'row d-flex justify-content-center'

  # TODO - is this in-spec?
  # behaviors:
  #   KeyboardControls: {}

  ui:
    key: '[data-click=key]'

  events:
    'click @ui.key': 'onKeyClick'

  # Maintains key state
  # TODO - should be backbone models?
  keys: []

  onKeyAction: (e) ->
    # console.log(e.keyCode)

    if e.type == 'keyup'
      @$("[data-keycode=#{e.keyCode}]").removeClass('active')

    else
      @$("[data-keycode=#{e.keyCode}]").addClass('active')

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


