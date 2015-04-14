{DOM, collectionView} = require 'fission'
css = require './index.styl'
ItemView = require './Kitten'
Model = require '../../models/Kitten'
{div, button} = DOM

sizes = [
  200,
  300,
  400,
  500,
  600,
  700,
  800
]

module.exports = collectionView
  displayName: 'Kittens'
  css: css
  itemView: ItemView
  collection:
    model: Model

  addKitten: ->

    x = sizes[Math.floor Math.random() * sizes.length]
    y = sizes[Math.floor Math.random() * sizes.length]

    @collection.create
      src: "http://placekitten.com/g/#{x}/#{y}"

  render: ->
    div
      className: 'kittens-view'
    ,
      button
        className: 'add'
        onClick: @addKitten
        'Add Kitten'

      div className: 'kittens', @items
