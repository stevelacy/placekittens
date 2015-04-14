var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
app.disable('x-powered-by');
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public/')));

var root = path.join(__dirname, 'public/index.html');
var port = 3000;

var kittens = [];

app.get('/v1/kittens', function(req, res) {
  res.json(kittens);
});

app.post('/v1/kittens', function(req, res) {
  req.body._id = String(Date.now());
  kittens.push(req.body);
  res.json(req.body);
});

app.delete('/v1/kittens/:id', function(req, res) {

  kittens = kittens.filter(function(i) {
    return i._id !== req.params.id;
  });

  res.end();
});

app.get('/*', function(req, res) {
  res.sendFile(root);
});

app.listen(port);
console.log('starting server on port: ' + port);
