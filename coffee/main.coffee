socket = do io.connect

socket.on 'number', (data) ->
	socket.emit 'number', n: data.n + 1
	$('#number').text data.n

$(document).ready ->
	$('#start').click ->
		socket.emit 'start'
	
	$('#stop').click ->
		socket.emit 'stop'

	$('#reset').click ->
		socket.emit 'reset'
