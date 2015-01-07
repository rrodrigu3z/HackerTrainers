(function() {
  var app, bodyParser, env, express, logger, multer, port, _base, _base1;

  env = (_base = process.env).NODE_ENV || (_base.NODE_ENV = 'development');

  express = require("express");

  logger = require("morgan");

  bodyParser = require("body-parser");

  multer = require("multer");

  app = express();

  app.set('views', "" + __dirname + "/views");

  app.set('view engine', "jade");

  app.use(logger('dev'));

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded({
    extended: true
  }));

  app.use(multer());

  app.use(express["static"]("" + __dirname + "/public"));

  app.get("/*", function(req, res) {
    return res.render("index");
  });

  port = (_base1 = process.env).PORT || (_base1.PORT = 3030);

  app.listen(port);

  console.log("Listening on port " + port + "...");

}).call(this);

//# sourceMappingURL=server.js.map
