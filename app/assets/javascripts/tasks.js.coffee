# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# jQuery ->
# 	if !sessionStorage.source
# 		alert 'Event registration'
# 		sessionStorage.source = new EventSource('/tasks/events')
# 		sessionStorage.source.addEventListener 'message', (e) ->
# 			message = $.parseJSON(e.data)
# 			console.log message		
# 			$('div#result').html("<h3>#{message.date}: #{message.state}</h3>")
# 			$('div#result').slideDown(3000)
# 	
