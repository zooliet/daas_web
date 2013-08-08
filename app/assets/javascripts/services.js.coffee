# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	if 'body.services'.length
		$('div#services_main').slideDown('1000')

	# if !window.event_source
	console.log 'Event registration'
	event_source = new EventSource('/services/events')
	event_source.addEventListener 'message', (e) ->
		message = $.parseJSON(e.data)
		console.log message		
		$('div#notice').show()
		$('div#notice div.message').prepend("<span>#{message.date} >> #{message.state} [#{message.id}]</span>")
		$('div#notice div.message span:first').effect('highlight', {color:"orange"}, 3000)
	console.log event_source


	# if !sessionStorage.getItem('event_source')
	# 	console.log 'Event registration'
	# 	window.source = new EventSource('/services/events')
	# 	window.source.addEventListener 'message', (e) ->
	# 		message = $.parseJSON(e.data)
	# 		console.log message		
	# 		$('div#notice div.message').append("<span>#{message.date} >> #{message.state} [#{message.id}]</span>")
	# 		$('div#notice').show()
	# 	sessionStorage.setItem('event_source', window.source)


	$('body').on 'click', 'a.notice_close', (e) ->
		e.preventDefault()
		$('div#notice div.message').html("")
		$('div#notice').hide()
		# $('div#notice').slideUp 3000 ->
		# 	$('div#notice div.message').html("")
		


	# if !sessionStorage.source
	# 	console.log 'Event registration'
	# 	sessionStorage.source = new EventSource('/services/events')
	# 	sessionStorage.source.addEventListener 'message', (e) ->
	# 		message = $.parseJSON(e.data)
	# 		console.log message		
	# 		$('div#notice').html("<span>[#{message.id}] #{message.state} @#{message.date}</span>")
	# 		$('div#notice').slideDown 3000, ->
	# 			$('div#notice').slideUp 3000			
	
		