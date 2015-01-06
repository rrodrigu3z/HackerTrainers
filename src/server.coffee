express = require "express"
env = process.env.NODE_ENV ||= 'development'
app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', "jade"

app.get "*", (req, res) ->
  res.render "index"
  
port = process.env.PORT ||= 3030
app.listen(port)

console.log "Listening on port #{port}..."