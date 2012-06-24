fs = require 'fs'

# Defining methods
makeDir = (dir) ->
	try
		fs.mkdirSync dir
		true
	catch error
		false

setupDirs = (dirs) ->
	for dir in dirs
		makeDir dir

# Exporting methods
exports.makeDir = makeDir
exports.setupDirs = setupDirs
