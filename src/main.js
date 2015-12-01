#!/usr/bin/env node
import config from 'config'
import server from './'

server.listen(config.port, () => {
  console.log(`Server listening on port: ${config.port}`)
})
