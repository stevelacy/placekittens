{model} = require 'fission'

module.exports = model
  props:
    src: 'string'
    _id: 'string'
  url: '/v1/kittens'
  idAttribute: '_id'
