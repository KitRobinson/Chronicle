# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`$(document).on('turbolinks:load', function(){
	$(".row-link").click(function() {
		console.log($(this)[0])
        window.location = $(this)[0].getAttribute('dest');
    });
})`