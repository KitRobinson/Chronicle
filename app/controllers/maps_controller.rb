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

	def varied_coloration(val)
		varied_colors = [
			'a6cee3',
			'1f78b4',
			'b2df8a',
			'33a02c',
			'fb9a99',
			'e31a1c',
			'fdbf6f',
			'ff7f00',
			'cab2d6',
			'6a3d9a',
			'ffff99',
			'b15928',
			'ff3333',
			'ff6633',
			'ff9933',
			'ffcc33',
			'ffff33',
			'ccff33',
			'99ff33',
			'66ff33',
			'33ff33',
			'33ff66',
			'33ff99',
			'33ffcc',
			'33ffff',
			'33ccff',
			'3399ff',
			'3366ff',
			'3333ff',
			'6633ff',
			'9933ff',
			'cc33ff',
			'ff33ff',
			'ff33cc',
			'ff3399',
			'ff3366',
			'ff3333'
		]
		return varied_colors[val%37]
	end

	def shade
		puts "shade method is called \n\n\n\n"
		puts "---------------"
		puts params
		if params[:pattern] == "varied"
			areaArray = []
			Province.all.each do |p|
				if p.send(params[:criteria])
					areaArray.push({
						key: "Province#{p.id}",
						fillColor: varied_coloration(p.send(params[:criteria])),
						staticState: true,
						stroke: true,
						strokeColor: '000000'
					})
				end
			end	
		else	
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
		end
		render json: areaArray
	end

end