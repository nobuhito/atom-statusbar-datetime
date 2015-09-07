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
      default: "MM/DD(ddd) HH:mm"
    language:
      type: "string"
      default: 'en'

  activate: ->

  deactivate: ->
    @statusbarDatetimeView.destroy()
    @statusBarTile.destroy()

  consumeStatusBar: (statusbar)->
    @statusbarDatetimeView = new StatusbarDatetimeView()
    @statusbarDatetimeView.init()
    @statusBarTile = statusbar.addRightTile
      item: atom.views.getView(@statusbarDatetimeView), priority: -1
