express = require 'express'
users = require '../collections/users'

console.log 'users collection', users
router = module.exports = express.Router()

router.post '/users', (req, res, next) =>
  users.create req.body
    .then (user) => res.send user
    .catch (err) => next err
