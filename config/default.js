module.exports = {
  nodeEnv: process.env.NODE_ENV,
  port: process.env.PORT || 3111,
  session_secret: process.env.SESSION_SECRET || 'kitten',
  mongoHost: process.env.MONGO_PORT_27017_TCP_ADDR,
  mongoPort: process.env.MONGO_PORT_27017_TCP_PORT,
  redis_host: process.env.REDIS_PORT_6379_TCP_ADDR,
  redis_port: process.env.REDIS_PORT_6379_TCP_PORT
}
