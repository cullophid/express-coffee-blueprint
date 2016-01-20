config = require 'config'
express = require "express"
path = require 'path'
bodyParser = require 'body-parser'
helmet = require 'helmet'
hpp = require 'hpp'
session = require 'express-session'
RedisStore = require('connect-redis')(session)
router = require './routes'

app = express()

# Set security headers with helmet
app.use helmet.hidePoweredBy()
app.use helmet.xssFilter()
app.use helmet.noSniff()

app.use session
  store: new RedisStore host: config.redis_host, port: config.redis_port
  secret: config.session_secret

app.use bodyParser()
app.use hpp()

app.use router

app.use '*', (req, res) =>
  res.status(404).send 'Could not find endpoint'


# Error Handler
app.use (err, req, res, next) =>
  console.log 'Caught error'
  console.error err.stack || err
  if err.status
    res.status(err.status).send status: err.status, message: err.message
  else
    res.status(500).send('Internal Server Error')

module.exports = app
