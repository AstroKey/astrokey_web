KeyboardSelector = require('lib/views/keyboard_selector')
MacroList = require('./macroList')

# # # # #

class MacroEditor extends Marionette.LayoutView
  template: require './templates/macro_editor'
  className: 'row h-100'

  regions:
    macroRegion:    '[data-region=macro]'
    controlsRegion: '[data-region=controls]'

  onRender: ->

    # Gets the current macro assigned to the keyModel
    # macroCollection = keyModel.getMacroCollection()
    @macroRegion.show new MacroList({ collection: @options.macros })

    # Instantaiates new KeyboardSelector
    # TODO - this will *eventually* display a selector between different types of keyboards / sets of keys
    @keyboardSelector = new KeyboardSelector({ model: @model, keys: @options.keys })

    # Bubbles up stop:recording event
    @keyboardSelector.on 'stop:recording', => @trigger 'stop:recording'

    # Handles KeySelection event
    @keyboardSelector.on 'key:selected', (key) =>

      # Clones the original object
      key = _.clone(key)

      # Adds the correct `order` attribute
      key.order = @options.macros.length

      # Adds the key to the MacroCollection
      @options.macros.add(key)
      @options.macros.sort()

    # Shows the keyboardView
    @controlsRegion.show @keyboardSelector

  # startRecording
  startRecording: ->
    @keyboardView.startRecording()

  # stopRecording
  stopRecording: ->
    @keyboardView.stopRecording()

# # # # #

module.exports = MacroEditor



