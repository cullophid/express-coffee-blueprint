head = require 'ramda/src/head'
db = require '../helpers/mongo'
objectId = require('mongodb').ObjectId
companies = db.collection 'companies'

# String -> {k:v}
getQuery = (id) =>
  $query:
    _id: objectId id
  $projection:
    name: 1

# String -> Promise(Company)
get = exports.get = (id) =>
  companies.find getQuery id
    .then head

# String -> {k:v}
findManyQuery = (query) =>
  $query: query
  $projection:
    name: 1
  $limit: 100

# String -> Promise([Company])
find = exports.find = (query) =>
  companies.find findManyQuery query

# Company -> Promise(Company)
create = exports.create = (company) =>
  console.log 'create', company
  companies.insertOne {$doc: company}
