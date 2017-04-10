# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`$(document).on('turbolinks:load', function(){

	// confirmed - this js IS active, though it may require local recompiling if not being read on remote server.
	// alert("Yes I exist")

	var coloration = {};
	coloration[0] = 'ff0000';
	coloration[1] = '00ff00';
	coloration[2] = '0000ff';
	var score = 2;

	function randomizer(province){
		return 1;
	}

	$('#big-map').mapster({
		areas: (function(){
			var provArray = [];
			for(var i=1;1<126;i++)
			{
				provArray.push({
					key: ("Province" + i),
					fillColor: coloration[i % 2],
					staticState: true,
					stroke: true
				});
			}
			return provArray;
		})(),
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

	//these methods resise the map and image mage
	$('#make-small').bind('click',function() {
        $('#big-map').mapster('resize', 600, 0, 1000);
    });
    $('#make-big').bind('click',function() {
        $('#big-map').mapster('resize', 4000, 0, 1000);
    });
	$('#make-medium').bind('click',function() {
        $('#big-map').mapster('resize', 1600, 0, 1000);
    });


	//on tab select, reveal info

	//some kind of control bar and masking - multiselect and cannot deselect perhaps?

});`
