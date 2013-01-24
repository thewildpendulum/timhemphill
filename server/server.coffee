# Dependencies

express = require 'express'
mongo = require 'mongo'
app = module.exports = express()
db = mongo.db 'localhost:27017/thsite', safe: true

# Configuration

app.configure ->
    app.set 'views', __dirname + '/views'
    app.set 'view engine', 'ejs'
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.static __dirname + '/public'
    app.use app.router

app.configure 'development', ->
    app.use express.errorHandler dumpExceptions: true, showStack: true

app.configure 'production', ->
    app.use express.errorHandler()

# Routes

app.get '/', (req, res) ->
    res.redirect '/blog'

app.get '/blog', (req, res) ->
    res.render 'index'

app.get '/blog:name', (req, res) ->
    db.collection 'blog' .findOne req.params.name, (err, post) ->
        console.log err
        # res.render 'post', post: post

# JSON API

app.get '/api/:collection', (req, res) ->
    console.log 'get colllection'
    console.log req.params.collection
    db.collection req.params.collection .find().toArray (err, models) ->
        console.log 'send models'
        console.log err || models
        res.json models

app.post '/api/:collection', (req, res) ->
    console.log 'create'
    console.log req.body
    db.collection req.params.collection .insert req.body, (err, model) ->
        console.log 'created model'
        console.log err || model

app.put '/api/:collection/:id', (req, res) ->
    console.log "update #{ req.params.id }"
    console.log req.body
    db.collection req.params.collection .save req.body, (err) ->
        console.log err || 'updated model'

# Catch-all

app.get '*', (req, res) ->
    conole.log 'catch all'
    console.log req.url
    res.redirect '/blog'

# Start server

app.listen 3501, ->     console.log "Running on port #{ @address().port } in #{
app.settings.env } mode"
