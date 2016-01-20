module.exports = (req, res, next) =>
  if req.session.user.admin == true
    next()
  else
    next new Error 'You must be admin!'
