KeyboardSelector = require('./keyboardSelector')
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
    keyboardView = new KeyboardSelector({ model: @model, keys: @options.keys })

    # Handles KeySelection event
    keyboardView.on 'key:selected', (key) =>

      # Clones the original object
      key = _.clone(key)

      # Adds the correct `order` attribute
      key.order = @options.macros.length + 1

      # Adds the key to the MacroCollection
      @options.macros.add(key)

    # Shows the keyboardView
    @controlsRegion.show keyboardView

# # # # #

module.exports = MacroEditor



