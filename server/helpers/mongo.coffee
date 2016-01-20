config = require 'config'
mongo = require 'oolon-mongo'

module.exports = mongo "mongodb://#{config.mongoHost}:#{config.mongoPort}/sentia"
