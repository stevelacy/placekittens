{modelView, DOM} = require 'fission'
Kitten = require '../../models/Kitten'
{div, img} = DOM

module.exports = modelView
  displayName: 'Kitten'
  model: Kitten
  remove: ->
    @model.destroy()
  render: ->
    div className: 'kitten',
      img
        className: 'img'
        src: @model.src
      div
        onClick: @remove
        className: 'close', '×'
