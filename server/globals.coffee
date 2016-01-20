{curry} = require 'ramda'
global.log = curry (key, value) => (console.log key, value) || value
