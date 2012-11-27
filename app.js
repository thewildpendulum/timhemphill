
// Dependencies

var express = require('express'),
    mongo = require('mongoskin'),
    app = module.exports = express(),
    db = mongo.db('localhost:27017/thsite', {safe: true});

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'ejs');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.static(__dirname + '/public'));
  app.use(app.router);
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

// Routes

app.get('/', function (req, res) {
    res.redirect('/blog');
});

app.get('/blog', function (req, res) {
  res.render('index');
});

app.get('/blog/:name', function (req, res) {
  db.collection('blog').findOne(req.params.name, function (err, post) {
    console.log(err);
    // res.render('post', {post: post});
  });
});

// JSON API

app.get('/api/:collection', function (req, res) {
  console.log('get ' + req.params.collection);
  db.collection(req.params.collection).find().toArray(function (err, models) {
    console.log('send models');
    console.log(models);
    res.json(models);
  });
});

app.post('/api/:collection', function (req, res) {
  console.log('create');
  console.log(req.body);
  db.collection(req.params.collection).insert(req.body, function (err, model) {
    console.log('created model');
    console.log(model);
  });
});

app.put('/api/:collection/:id', function (req, res) {
  console.log('update ' + req.params.id);
  console.log(req.body);
  db.collection(req.params.collection).save(req.body, function (err) {
    console.log(err || 'updated model');
  });
});

// Catch-all

app.get('*', function (req, res) {
  console.log('catch all');
  console.log(req.url);
  res.redirect('/blog');
});

// Start server

app.listen(3501, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});
