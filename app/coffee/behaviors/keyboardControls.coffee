# NOTE - this behavior has not been tested with multiple views simultaneously

# Enables view callbacks to be triggered by keyboard input
class KeyboardControls extends Marionette.Behavior

  initialize: ->
    @keyEvents = @options.keyEvents

  onRender: ->
    @addEventListener()

  onBeforeDestroy: ->
    @removeEventListener()

  keyAction: (e) =>

    # console.log(e);

    # Isolates the keystroke
    # keyCode = e.keyCode

    return @view.triggerMethod('key:action', e)

    # Do nothing if there isn't an
    # event associated with the keystroke
    # return unless @keyEvents[keyCode]

    # Prevents any default action associated with the keycode
    e.preventDefault()

    # Triggers the event associated with
    # the keystroke on the view instance
    # return @view.triggerMethod(@keyEvents[keyCode])

  addEventListener: ->
    $(document).on 'keydown', @keyAction
    $(document).on 'keyup', @keyAction
    # $(document).on 'keypress', @keyAction
    # Radio.channel('flash').trigger('add', { context: 'info', timeout: 1500, message: 'Keyboard controls enabled'})

  removeEventListener: ->
    $(document).off 'keydown', @keyAction
    $(document).off 'keyup', @keyAction
    # $(document).off 'keypress', @keyAction
    # Radio.channel('flash').trigger('add', { context: 'info', timeout: 1500, message: 'Keyboard controls disabled'})

# # # # #

module.exports = KeyboardControls
