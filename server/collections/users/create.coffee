db = require '../../helpers/mongo'
httpError = require 'http-errors'
{composeP, merge, pick} = require 'ramda'
{hash} = require '../../helpers/bcrypt'
users = db.collection 'users'

log = (key) => (value) => (console.log key, value) || value

hashPassword = (user) =>
  hash user.password
    .then (pass) => merge user, password: pass

buildQuery = (user) => $doc: user

checkUniqueness = (user) =>
  users.find $query: (pick ['email'], user), $projection: {_id: 1}
    .then (users) =>
      if users.length > 0
        Promise.reject httpError 400, 'User already exists'
      else
        user

insertUser = composeP users.insertOne, buildQuery, hashPassword
module.exports = composeP insertUser, checkUniqueness
