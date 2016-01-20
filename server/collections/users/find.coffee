httpError = require 'http-errors'
{omit, head, merge, curry} = require 'ramda'
db = require '../../helpers/mongo'
userProjection = require './userProjection'

users = db.collection 'users'

# String -> {k:v}
findQuery = (query) =>
  $query: query
  $projection: userProjection

# {k:v} -> Promise(User)
module.exports = (query) =>
  users.find findQuery query
