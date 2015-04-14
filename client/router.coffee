{router} = require 'fission'
Application = require './views/Application'
Index = require './views/Index'

module.exports = router
  app:
    path: '/'
    view: Application
    defaultChild:
      view: Index
