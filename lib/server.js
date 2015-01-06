(function() {
  var app, env, express, port, _base, _base1;

  express = require("express");

  env = (_base = process.env).NODE_ENV || (_base.NODE_ENV = 'development');

  app = express();

  app.set('views', "" + __dirname + "/views");

  app.set('view engine', "jade");

  app.get("*", function(req, res) {
    return res.render("index");
  });

  port = (_base1 = process.env).PORT || (_base1.PORT = 3030);

  app.listen(port);

  console.log("Listening on port " + port + "...");

}).call(this);

//# sourceMappingURL=server.js.map
