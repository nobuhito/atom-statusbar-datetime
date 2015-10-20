StatusbarDatetimeView = require './statusbar-datetime-view'

module.exports = statusbarDatetime =
  statusbarDatetimeView: null
  statusBarTile: null

  config:
    interval:
      type: "integer"
      default: 1000
    format:
      type: "string"
      description: "Please see [moment.js](http://momentjs.com/docs/#/parsing/string-format/) about the form of the date."
      default: "MM/DD(ddd) HH:mm"
    language:
      type: "string"
      default: 'en'

  activate: ->

  deactivate: ->
    @statusBarTile?.destroy()

  consumeStatusBar: (statusbar)->
    @statusbarDatetimeView = new StatusbarDatetimeView()
    @statusbarDatetimeView.init()
    @statusBarTile = statusbar.addRightTile
      item: atom.views.getView(@statusbarDatetimeView), priority: -1
