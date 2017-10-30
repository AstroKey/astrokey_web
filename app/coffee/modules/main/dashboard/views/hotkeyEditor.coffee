
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
  # TODO - should be backbone collection, passed in as option
  keys: []

  # onKeyAction: (e) ->
  #   # console.log(e.keyCode)

  #   if e.type == 'keyup'
  #     @$("[data-keycode=#{e.keyCode}]").removeClass('active')

  #   else
  #     @$("[data-keycode=#{e.keyCode}]").addClass('active')

  # Passes key objects to UI
  templateHelpers: ->
    console.log @options.keys

    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'r0'})
      r1: _.where(keys, { row: 'r1'})
      r2: _.where(keys, { row: 'r2'})
      r3: _.where(keys, { row: 'r3'})
      r4: _.where(keys, { row: 'r4'})
    }

  # KeyClick callback
  onKeyClick: (e) ->

    # Caches el and key
    el  = $(e.currentTarget)
    key = el.data('key')

    # Toggle ON
    if @keys.indexOf(key) < 0
      # el.addClass('active')
      @keys.push(key)

    # TOGGLE OFF
    else
      # el.removeClass('active')
      @keys = _.without(@keys, key)

    # Blurs focus from clicked key
    el.blur()

    console.log @keys

    return

# # # # #

module.exports = KeyboardView


