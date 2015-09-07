class StatusbarDatetimeView extends HTMLElement
  init: ->
    @classList.add("statusbar-datetime", "inline-block", "icon-clock")
    @activate()

  activate: ->
    @moment = require "moment"
    key = "statusbar-datetime"

    @format = atom.config.get("#{key}.format")
    atom.config.onDidChange("#{key}.format", ({newValue}) =>
      @format = newValue
      @action()
    )

    @language = atom.config.get("#{key}.language")
    atom.config.onDidChange("#{key}.language", ({newValue}) =>
      @language = newValue
      @moment = null
      @moment = require "moment"
      @action()
    )

    @interval = atom.config.get("#{key}.interval")
    atom.config.onDidChange("#{key}.interval", ({newValue}) =>
      @interval = newValue
      @action()
    )

    @action()

  action: ->
    @print()
    clearInterval(@timer)
    @timer = setInterval (=> @print()), @interval


  print: ->
    @moment.locale(@language)
    @textContent = @moment().format(@format)

module.exports = document.registerElement("statusbar-datetime", prototype: StatusbarDatetimeView.prototype, extends: "div")
