
$(document).on('turbolinks:load', function(){

	console.log("loaded")
	
	m = $('#ireland-map')
	console.log("selected:")
	console.log(m)

	$('#ireland-map').mapster({
		mapKey: 'prov-key'
	})
	
	$('#iremapping').click(function(){
		alert("you clicked the map");
	});

	console.log($('map'))
/*
	$('map').imageMapResize();
*/

});
