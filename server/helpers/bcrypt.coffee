curry = require 'ramda/src/curry'
bcrypt = require 'bcrypt-nodejs'
promisify = require 'simple-promisify'
hash = promisify bcrypt, bcrypt.hash
compare = promisify bcrypt, bcrypt.compare

log = (key) => (value) => (console.log key, value) || value

# String -> Promise(String)
exports.hash = (value) =>
  hash value, null, null

# String -> String -> Promise(Boolean)
exports.compare = curry (password, hash) =>
  console.log 'compare', password, hash
  compare password, hash
    .then (res) => if res then Promise.resolve() else Promise.reject()
