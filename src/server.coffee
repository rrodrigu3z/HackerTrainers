env = process.env.NODE_ENV ||= 'development'

express = require "express"
logger = require "morgan"
bodyParser = require "body-parser"
multer = require "multer"

app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', "jade"

app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
app.use multer()
app.use express.static("#{__dirname}/public")

app.get "/*", (req, res) ->
  res.render "index"
  
port = process.env.PORT ||= 3030
app.listen(port)

console.log "Listening on port #{port}..."