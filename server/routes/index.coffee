pkg = require '../../package.json'
express = require 'express'
router = module.exports = express.Router()

router.get '/version', (req, res, next) =>
  res.send pkg.version

router.use require './companies'
router.use require './session'
router.use require './users'
