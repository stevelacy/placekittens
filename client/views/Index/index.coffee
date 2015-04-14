{DOM, view} = require 'fission'
Kittens = require '../Kittens'
css = require './index.styl'

{div} = DOM

module.exports = view
  displayName: 'Index'
  css: css
  render: ->
    div
      className: 'index view'
    ,
      Kittens()
