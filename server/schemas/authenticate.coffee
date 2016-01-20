module.exports =
  body:
    type: 'object'
    required: ['email', 'password']
    additionalProperties: false
    properties:
      email:
        type: 'string'
      password:
        type: 'string'
