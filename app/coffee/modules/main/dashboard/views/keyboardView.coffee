
class KeyboardView extends Mn.LayoutView
  template: require './templates/hotkey_editor'
  className: 'row d-flex justify-content-center'

  # TODO - activate this behavior conditionally
  # behaviors:
  #   KeyboardControls: {}

  ui:
    key: '[data-click=key]'

  events:
    'click @ui.key': 'onKeyClick'

  # Passes key objects to UI
  templateHelpers: ->
    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'r0'})
      r1: _.where(keys, { row: 'r1'})
      r2: _.where(keys, { row: 'r2'})
      r3: _.where(keys, { row: 'r3'})
      r4: _.where(keys, { row: 'r4'})
    }

  # KeyboardControls behavior callback
  onKeyAction: (e) ->
    # console.log e

    e.preventDefault()

    key = @options.keys.findWhere({ keycode: e.keyCode })

    # console.log key

    if e.type == 'keydown'
      @trigger 'key:selected', key.toJSON()

    if e.type == 'keyup'
      @$("[data-keycode=#{e.keyCode}]").removeClass('active')
    else
      @$("[data-keycode=#{e.keyCode}]").addClass('active')

  # KeyClick callback
  onKeyClick: (e) ->

    # Caches el and keycode
    el  = $(e.currentTarget)
    keycode = el.data('keycode')

    # Finds the model of the key that was selected
    key = @options.keys.findWhere({ keycode: keycode })

    # Triggers 'key:selected' event
    @trigger 'key:selected', key.toJSON()

    # Blurs focus from clicked key
    el.blur()

    return

# # # # #

module.exports = KeyboardView


