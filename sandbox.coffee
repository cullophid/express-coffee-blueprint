{compose} = require 'ramda'


add = (a) => (b) => a + b

math = compose (add 1), (add 1), (add 1)


console.log math 1
