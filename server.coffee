express = require 'express'

# Make server
app = do express.createServer

# Set up static files, coffee and less
coffeeDir 	= __dirname + '/coffee'
jsDir 		= __dirname + '/js'
lessDir		= __dirname + '/less'
cssDir		= __dirname + '/css'
publicDir 	= __dirname + '/static'
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

# Start up the app
app.listen 3000

# Routes
app.get '/', (req, res) ->
	res.render 'index'
