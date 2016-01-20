express = require 'express'
validate = require 'oolon-express-validator'
auth_schema = require '../schemas/authenticate'
users = require '../collections/users'

router = module.exports = express.Router()

default_user =
  firstname: 'andreas'
  lastname: 'moeller'
  admin: true

auth_middleware = [validate auth_schema]
router.post '/session/authenticate', auth_middleware, (req, res, next) =>
  users.authenticate req.body
    .then (user) =>
      req.session.user = user
      res.send(user)
    .catch (err) => next err
