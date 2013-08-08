# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

if $('div#transcodings_main').length
	$('div#transcodings_main').on 'click', 'div.section h5.title', (e) ->
		console.log $(@)
		$(@).parent('div.section').toggleClass('active')
		false

	$('div#transcodings_main').on 'click', 'form input#infile', (e) ->
		e.preventDefault()
		console.log "clicked"
		$.ajax
			type: "GET"
			dataType: 'script'
			url: '/user_assets'

	$('body.transcodings').on 'click', 'a.dir, a.file', (e) ->
		e.preventDefault()
		if $(@).attr('class') is 'dir'
			$.ajax
				type: 'GET'
				dataType: 'script'
				url: $(@).attr('href')
		else
			console.log('file clicked')
			
	$('div#transcodings_main').on 'change', 'form input#infile', (e) ->
		input  = $(@).val()
		output = $(@).val().split('.')[0].concat("_out")
		$('input#outfile').val(output) 
		$('div.section.details').show()
		$.ajax
			type: "GET"
			dataType: 'script'
			url: "/user_asset#{input}"
			
			