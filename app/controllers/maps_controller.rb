class MapsController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	before_filter :authorize
	
	def main
		render 'maps/map.html.erb'
	end

	def shade
		puts "shade method is called \n\n\n\n"
		puts "---------------"
		puts params
		areaArray = [
			{
				key: "Province17",
				fillColor: "0000ff",
				staticState: true
			},
			{
				key: "Province22",
				fillColor: "00ff00",
				staticState: true
			}
		]

		render json: areaArray
	end

end