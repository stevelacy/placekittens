{component, DOM, Link} = require 'fission'
css = require './index.styl'

{div, span, button} = DOM

module.exports = component
  displayName: 'Navbar'
  css: css
  render: ->
    div className: 'component navbar',
      div className: 'logo', 'PLACEKITTENS'
