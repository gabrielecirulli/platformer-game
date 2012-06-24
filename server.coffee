express = require 'express'
sock	= require 'socket.io'
helpers = require './helpers.coffee'

# Variables
gameName = "Platformer"
gamePort = 1337 # A port for testing
# TODO: development/production environments and configuration

# Express
# Make server
app = do express.createServer

# Set up static files, coffee and less
coffeeDir 	= __dirname + '/coffee'
jsDir 		= __dirname + '/js'
lessDir		= __dirname + '/less'
cssDir		= __dirname + '/css'
publicDir 	= __dirname + '/static'

# Make special static dirs if they don't exist (express won't make them by itself)
helpers.setupDirs [jsDir, cssDir]

# Enable static serving
app.use express.compiler
	src: coffeeDir,
	dest: jsDir,
	enable: ['coffeescript']
app.use express.compiler
	src: lessDir,
	dest: cssDir,
	enable: ['less']

app.use express.static jsDir
app.use express.static cssDir
app.use express.static publicDir

# Set up view engine
app.set 'view engine', 'jade'

# Start listening on the game port
app.listen gamePort

# Express Routes
app.get '/', (req, res) ->
	pageTitle = "playing"
	res.render 'play', gameName: gameName, pageTitle: pageTitle

# Socket.io
# Start socket.io listening on the next port
io = sock.listen app

# Set up socket.io
io.sockets.on 'connection', (socket) -> 
	socket.emit 'number', n: 0
	socket.on 'number', (data) ->
		socket.emit 'number', n: data.number + 1
