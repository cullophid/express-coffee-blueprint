merge = requrie 'ramda/src/merge'
express = require 'express'
stores = require '../collections/stores'
validate = require 'oolon-express-validator'
findSchema = require '../schemas/stores-find'

router = module.exports = express.Router()

router.get '/companies/:companyId/stores:/storeId', (req, res, next) =>
  stores.get req.params.storeId
    .then (e) => res.send e
    .catch (e) => next e

router.get '/companies/:companyId:/stores', [validate findSchema], (req, res, next) =>
  stores.find merge(req.query, req.params)
    .then (e) => res.send e
    .catch (e) => next e
