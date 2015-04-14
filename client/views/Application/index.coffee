{DOM, ChildView, view} = require 'fission'
Navbar = require '../../components/Navbar'
css = require './index.styl'

{div, img} = DOM

module.exports = view
  displayName: 'Application'
  css: css
  render: ->
    div
      className: 'application view'
    ,
      Navbar()
      div className: 'main', ChildView()
