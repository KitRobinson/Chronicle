class MapsController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	before_filter :authorize
	
	def main
		render 'maps/map.html.erb'
	end

	def coloration(datum, max_datum, pattern="standard")
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
		range = ((datum.to_f/max_datum.to_f)*10.0).floor
		if pattern == "inverse"
			return colors[11 - (range-1)]
		end
		return colors[range]

	end

	def shade
		puts "shade method is called \n\n\n\n"
		puts "---------------"
		puts params
		if params[:source] == "property"
			max_datum = Province.maximum(params[:criteria])
		elsif params[:source] == "virtual"
			max_datum = 0
			Province.all.each do |p|
				if p.send(params[:criteria]) && p.send(params[:criteria]) > max_datum
					max_datum = p.send(params[:criteria])
				end
			end
		end
		areaArray = []
			Province.all.each do |p|
				if p.send(params[:criteria]) && p.send(params[:criteria]) != 0
					areaArray.push({
						key: "Province#{p.id}",
						fillColor: coloration(p.send(params[:criteria]), max_datum, params[:pattern]),
						staticState: true,
						stroke: true,
						strokeColor: '000000'
						})
				end
			end
		puts max_datum
		render json: areaArray
	end

end