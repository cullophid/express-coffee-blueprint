express = require 'express'
companies = require '../collections/companies'
validate = require 'oolon-express-validator'
findSchema = require '../schemas/companies-find'
admin = require '../middleware/admin'

router = module.exports = express.Router()

router.get '/companies/:id', (req, res, next) =>
  companies.get req.params.id
    .then (e) => res.send e
    .catch (e) => next e

router.get '/companies', [admin, validate findSchema],  (req, res, next) =>
  companies.find req.query
    .then (e) => res.send e
    .catch (e) => next e

router.post '/companies/', [admin], (req, res, next) =>
  companies.create req.body
    .then (e) => res.send e
    .catch (e) => next e
