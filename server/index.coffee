express = require "express"
pkg = require '../package.json'
path = require 'path'
bodyParser = require 'body-parser'
helmet = require 'helmet'
hpp = require 'hpp'
router = require './routes'

app = express()

# Set security headers with helmet
app.use helmet.hidePoweredBy()
app.use helmet.xssFilter()
app.use helmet.noSniff()
app.use helmet.csp {
  defaultSrc: ["'self'"],
  scriptSrc: ["'self'"],
  styleSrc: ["'self'"],
  imgSrc: ["'self'"],
  sandbox: ['allow-forms', 'allow-scripts'],
}

app.use bodyParser()
app.use hpp()

app.get '/version', (req, res) => res.send pkg.version
app.use(router)

app.use '*', (req, res) =>
  res.status(404).send 'Could not find endpoint'


# Error Handler
app.use (err, req, res, next) =>
  console.error err.stack || err
  res.status(500).send err

module.exports = app
