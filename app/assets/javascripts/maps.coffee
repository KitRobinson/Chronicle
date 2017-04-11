# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
` // settings that do not require bindings

	//declare area array for later filling by shader ajax calls
	areaArray = []

	//declare method for binding map with contents of area array
	function drawMap(areaData){
		$('#small-map').mapster({
			areas: areaData,
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
	}
`

`$(document).on('turbolinks:load', function(){

	// confirmed - this js IS active, though it may require local recompiling if not being read on remote server.
	// alert("Yes I exist")

	var coloration = {};
	coloration[0] = 'ff0000';
	coloration[1] = '00ff00';
	coloration[2] = '0000ff';

	//use the previously decaled drawMap function
	drawMap(areaArray);

	//these methods resise the map and image mage
	$('#make-small').bind('click',function() {
		event.preventDefault()
        $('#small-map').mapster('resize', 600, 0, 1000);
    });
    $('#make-big').bind('click',function() {
    	event.preventDefault()
        $('#small-map').mapster('resize', 4000, 0, 1000);
    });
	$('#make-medium').bind('click',function() {
		event.preventDefault()
        $('#small-map').mapster('resize', 1600, 0, 1000);
    });

	//these methods run the various requester buttons

	//each button must send an ajax request and get back a JSON of the areas
	// in the format [{key: 'province1', fillColor: coloration[x], staticState: true},{etc}]
	// then unbind and rebind mapster using that as the areas.

	$('#shader-volc').bind('click',function() {
        event.preventDefault()
        $.ajax({
        	url: "/maps/shade",
        	data: {criteria: "volcanism", source: "property", pattern:"standard"},
        	})
		.done(function(data) {
			areaArray = data;
			$('#small-map').mapster('unbind');
			drawMap(areaArray);
		})
    });

	$('#shader-leyline').bind('click',function() {
        event.preventDefault()
        $.ajax({
        	url: "/maps/shade",
        	data: {criteria: "leyline_strength", source: "property", pattern: "standard"},
        	})
		.done(function(data) {
			areaArray = data;
			$('#small-map').mapster('unbind');
			drawMap(areaArray);
		})
    });

	$('#shader-difficulty').bind('click',function() {
        event.preventDefault()
        $.ajax({
        	url: "/maps/shade",
        	data: {criteria: "ter_difficulty", source: "virtual", pattern: "inverse"},
        	})
		.done(function(data) {
			areaArray = data;
			$('#small-map').mapster('unbind');
			drawMap(areaArray);
		})
    });

	$('#shader-dev-multiplier').bind('click',function() {
        event.preventDefault()
        $.ajax({
        	url: "/maps/shade",
        	data: {criteria: "dev_multiplier", source: "virtual", pattern: "standard"},
        	})
		.done(function(data) {
			areaArray = data;
			$('#small-map').mapster('unbind');
			drawMap(areaArray);
		})
    });

	//on tab select, reveal info

	//some kind of control bar and masking - multiselect and cannot deselect perhaps?

});`
