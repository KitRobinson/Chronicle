# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`$(document).on('turbolinks:load', function(){

	$('#ireland-map').mapster({
		mapKey: 'prov-key'
	})

	//on select of area, retrieve its info (json?)
	//on mouseover, if none selected, retrieve its info
	//on tab select, reveal info

	//some kind of control bar and masking - multiselect and cannot deselect perhaps?

});`