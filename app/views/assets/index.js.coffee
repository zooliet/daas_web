
$('div.modal_container').show()
$('div.modal_container div.modal').html("<%= j(render 'assets_picker', asset_dir: @asset_dir)  %>")

$('div.modal_container div.modal div#selectable').selectable
	filter: 'div.entry'
	cancel: 'a.dir'
	start: ->
		$('a.modal_select').addClass('disabled')
	stop: ->
		$('a.modal_select').removeClass('disabled')
		
		
$('a.modal_select').on 'click', (e) ->
	e.preventDefault()
	results = $("#selectable .ui-selected a")
	list = $.map results, (result, index) ->
		$(result).attr('href')
	console.log list
	$('div.modal_container div.modal').html("")
	$('div.modal_container').hide()
	$('input#infile').val("#{list[0]}")
	$('input#infile').trigger('change')


$('div.modal').on 'click', 'a.modal_close', (e) ->
	e.preventDefault()
	$('div.modal_container div.modal').html("")
	$('div.modal_container').hide()
