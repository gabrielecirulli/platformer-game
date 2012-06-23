express = require 'express'

# Make server
app = do express.createServer

# Set up static files and coffee
coffeeDir = __dirname + '/coffeescripts'
publicDir = __dirname + '/public'
app.use express.compiler
	src: coffeeDir,
	dest: publicDir,
	enable: ['coffeescript']
app.use express.static publicDir

# Start up the app
app.listen 3000

# Routes
app.get '/', (req, res) ->
	res.sendfile __dirname + '/index.html'
