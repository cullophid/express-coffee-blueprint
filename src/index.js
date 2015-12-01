
import express from "express"
import pkg from '../package.json'
import path from 'path'
import bodyParser from 'body-parser'
import helmet from 'helmet'
import hpp from 'hpp'

const app = express()

//Set security headers with helmet
app.use(helmet.hidePoweredBy())
app.use(helmet.xssFilter())
app.use(helmet.noSniff())
app.use(helmet.csp({
  // Specify directives as normal
  defaultSrc: ["'self'"],
  scriptSrc: ["'self'"],
  styleSrc: ["'self'"],
  imgSrc: ["'self'"],
  sandbox: ['allow-forms', 'allow-scripts'],
}));

app.use(bodyParser())
app.use(hpp())

app.get('/version', (req, res) => res.send(pkg.version))

app.get('/greeting', (req, res) => res.send('Hello User'))

app.use('*', (req, res) => {
  res.status(404).send('Could not find endpoint')
})


// Error Handler
app.use((err, req, res, next) => {
  console.error(err.stack || err)
  res.status(500).send(err)
});

export default app
