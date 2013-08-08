# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	if 'div#assets_main'.length
		console.log 'assets_main'
		
		$.contextMenu
			selector: 'div#assets_main .file, div#assets_main .dir'
			callback: (key, options) ->
				# console.log "clicked: #{key}"
				if key is 'delete'
					# console.log $(@)
					# alert $(@).attr('href')
					$.ajax
						type: 'DELETE'
						dataType: 'json'
						contentType: 'application/json'
						url: "/user_assets?path=#{$(@).attr('href')}&kind=#{$(@).attr('class')}"
						success: (result) =>
							$(@).closest('.entry').remove()			
			items: 
				"delete": 
					name: "Delete"
					icon: "delete"
				"sep1": "---------"
				"quit": 
					name: "Quit", 
					icon: "quit"
		
