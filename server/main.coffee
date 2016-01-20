config = require 'config'
require './globals'
server = require './'

server.listen config.port, () =>
  console.log "Server listening on port: #{config.port}"
