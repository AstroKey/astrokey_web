
# ApplicationLayout class definition
# Defines a Marionette.LayoutView to manage
# top-level application regions
class ApplicationLayout extends Marionette.LayoutView
  el: 'body'

  template: false

  regions:
    header:     '[app-region=header]'
    overlay:    '[app-region=overlay]'
    flash:      '[app-region=flash]'
    modal:      '[app-region=modal]'
    main:       '[app-region=main]'

# # # # #

# Exports instance
module.exports = new ApplicationLayout().render()
