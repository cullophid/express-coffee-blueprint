pkg = require '../../package.json'
express = require 'express'
router = module.exports = express.Router()

router.get '/version', (req, res, next) =>
  res.send pkg.version
