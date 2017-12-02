
class AbstractKeyboardView extends Mn.LayoutView
  className: 'row d-flex justify-content-center'
  template: require './templates/keyboard_abstract'

  # TODO - activate this behavior conditionally
  # behaviors:
  #   KeyboardControls: {}

  ui:
    key: '[data-click=key]'

  events:
    'click @ui.key': 'onKeyClick'

  isRecording: false

  # initialize
  initialize: ->

    # Defines @debounceStopRecording
    @debounceStopRecording = _.debounce( () =>
      @trigger 'stop:recording'
    , 1500);

  # startRecording
  # TODO - move recording OUT of this view and into a globalized service
  startRecording: ->
    @isRecording = true

  # stopRecording
  stopRecording: ->
    @isRecording = false

  # onRender: ->
  #   setTimeout( @initSortable, 300 )

  # # initSortable
  # initSortable: ->

  #   console.log 'ON ATTACH'

  #   console.log $('ul.keyboard--row')

  #   _.each $('ul.keyboard--row'), (el) =>

  #     # Initializes Sortable container
  #     Sortable.create el,
  #       animation:    150
  #       handle:       '.handle'
  #       # ghostClass:   'ghost'  # Class name for the drop placeholder
  #       # chosenClass:  'chosen'  # Class name for the chosen item
  #       # dragClass:    'drag'  # Class name for the dragging item

  #       group:
  #         name: 'macro'
  #         pull: 'clone'
  #         put:  false

  #       fallbackTolerance: 100

  # KeyboardControls behavior callback
  # TODO - annoate and clean up this method
  onKeyAction: (e) ->

    # Short-circuits unless
    return unless @isRecording

    # Prevents default hotkeys while recording
    e.preventDefault()

    # TODO - ignore keyup on alphanumeric, listen for special keys?
    # return if e.key in ["Control", "Meta", "Alt"]
    key = @options.keys.findWhere({ keycode: e.keyCode })

    # # # #

    # TODO - document this block of code

    if e.type == 'keydown'

      if e.key in ["Control", "Meta", "Alt", "Shift"]
        json = key.toJSON()
        json.position = 1 # KEY_DN - TODO - constantize
        @trigger 'key:selected', json
      else
        @trigger 'key:selected', key.toJSON()

    if e.type == 'keyup'

      if e.key in ["Control", "Meta", "Alt", "Shift"]
        json = key.toJSON()
        json.position = 2 # KEY_UP - TODO - constantize
        @trigger 'key:selected', json


    # # # #

    if e.type == 'keyup'
      @$("[data-keycode=#{e.keyCode}]").removeClass('active')
    else
      @$("[data-keycode=#{e.keyCode}]").addClass('active')

    # TODO - annotae
    setTimeout( =>
      @$("[data-keycode=#{e.keyCode}]").removeClass('active')
    , 1000)

    # Stops recording 2 seconds after last keystroke
    @debounceStopRecording()

    # # # #


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

module.exports = AbstractKeyboardView
