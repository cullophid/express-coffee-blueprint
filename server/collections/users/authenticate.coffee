httpError = require 'http-errors'
{composeP, omit, head, merge, curry} = require 'ramda'
db = require '../../helpers/mongo'
bcrypt = require '../../helpers/bcrypt'
userProjection = require './userProjection'

users = db.collection 'users'

# String -> {k:v}
authenticateQuery = (email) =>
  $query:
    email: email
  $projection: merge password:1, userProjection

# String -> User -> Promise(User)
verifyPassword = curry (password, user) =>
  bcrypt.compare password, user.password
    .then () => omit ['password'], user
    .catch (err) =>
      console.error err
      Promise.reject()

# User -> Promise(User)
userExists = (user) =>
  if user
    Promise.resolve(user)
  else
    Promise.reject()

# {k:v} -> Promise(User)
findUser = composeP userExists, head, users.find

# {email: String, password: String} -> Promise(User)
module.exports = ({email, password}) =>
  findUser authenticateQuery email
    .then verifyPassword password
    .catch () => Promise.reject httpError 401, 'invalid email or password'
