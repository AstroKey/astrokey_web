TextEditor = require('./textEditor')
MacroEditor = require('./macroEditor')

# # # # #

class EditorWrapper extends Marionette.LayoutView
  template: require './templates/editor_wrapper'
  className: 'row'

  regions:
    contentRegion: '[data-region=content]'

  ui:
    recordBtn: '[data-click=record]'

  events:
    'click [data-click=save]':    'onSave'
    'click [data-click=clear]':   'onClear'
    'click [data-click=cancel]':  'onCancel'
    'click @ui.recordBtn':        'toggleRecord'

  editors:
    macro:  MacroEditor
    text:   TextEditor
    key:    MacroEditor

  onRender: ->

    # Fetches the EditorView prototype
    EditorView = @editors[@options.editor]

    # Isolates Config
    config = @model.get('config')

    # Caches the current configuration to be restored when this view is cancelled out
    @cachedConfig = config.toJSON()

    # Isolates MacroCollection
    @macros = config.get('macros')

    # Requests KeyCollection from the KeyFactory
    keys = Radio.channel('key').request('collection')

    # Instantiates new EditorView instance
    @editorView = new EditorView({ model: config, keys: keys, macros: @macros })

    # Shows the view in @contentRegion
    @contentRegion.show @editorView

  # onClear
  # Empties the MacroCollection
  # TODO - undo button?
  onClear: ->

    # Empties the MacroCollection
    @macros.reset()
    return

  # onSave
  onSave: ->

    # Serializes data from any form elements in this view
    data = Backbone.Syphon.serialize(@)

    # Clear unused type-specific attributes
    data.macros = [] if data.type != 'macro'
    data.text_value = '' if data.type != 'text'

    # Applies the attributes to the config model
    @model.get('config').set(data)

    # Triggers change event on @model to re-render the currently hidden AstroKey element
    @model.trigger('config:updated')

    # Triggers 'save' event, closing this view
    return @trigger 'save'

  # onCancel
  onCancel: ->

    # Resets config attributes
    @model.get('config').set(@cachedConfig)

    # Triggers 'cancel' event, closing this view
    return @trigger 'cancel'

  # toggleRecord
  # Toggles wether or not the user's keyboard is recording keystrokes
  toggleRecord: (e) ->

    # Stop Recording
    if @isRecording

      # Sets @isRecording flag
      @isRecording = false

      # Updates the EditorView instance to ignore keyboard input
      @editorView.keyboardSelector.current.stopRecording()

      # Updates the @ui.recordBtn element
      @ui.recordBtn.removeClass('active').find('i').removeClass('fa-spin fa-circle-o-notch').addClass('fa-circle')

    # Start Recording
    else

      # Sets @isRecording flag
      @isRecording = true

      # Updates the EditorView instance to allow keyboard input
      @editorView.keyboardSelector.current.startRecording()

      # Listens for 'stop:recording' event
      # TODO - manage recording state in a central location!
      @editorView.keyboardSelector.current.on 'stop:recording', => @toggleRecord()

      # Updates the @ui.recordBtn element
      @ui.recordBtn.addClass('active').find('i').addClass('fa-spin fa-circle-o-notch').removeClass('fa-circle')

# # # # #

module.exports = EditorWrapper



