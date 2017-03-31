# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`$(document).on('turbolinks:load', function(){

	// confirmed - this js IS active, though it may require local recompiling if not being read on remote server.
	// alert("Yes I exist")

	$('#big-map').mapster({
		mapKey: 'prov-key',
		singleSelect: true,
		onClick: function(e){

			$.ajax({
			url: $('area[prov-key=' + e.key + ']')[0].href
			})
			.done(function(data) {
			console.log(data)
			$("#geo-inf").empty()
			$("#geo-inf").append(data)

			//activate the collapsible areas once they are put on the screen?
			$('.collapsible').collapsible({
				expandable : true
				});
			})
		}
	})

	//on select of area, retrieve its info (json?)
	//on mouseover, if none selected, retrieve its info
	//on tab select, reveal info

	//some kind of control bar and masking - multiselect and cannot deselect perhaps?

});`
