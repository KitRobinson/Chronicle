class MapsController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	before_filter :authorize
	
	def main
		render 'maps/map.html.erb'
	end

	def coloration(datum, max_datum)
		colors = [
			'FF0000', 
			'FF3300',
			'ff6600',
			'ff9900',
			'FFCC00', 
			'FFFF00',
			'ccff00',
	 		'99ff00',
	 		'66ff00',
			'33ff00',
			'00FF00'
		]
		range = ((datum.to_f/max_datum.to_f)*11.0).floor
		return colors[range -1]

	end

	def shade
		puts "shade method is called \n\n\n\n"
		puts "---------------"
		puts params
		areaArray = [
			{
				key: "Province17",
				fillColor: coloration(1,11),
				staticState: true
			},
			{
				key: "Province22",
				fillColor: coloration(11,11),
				staticState: true
			}
		]

		render json: areaArray
	end

end