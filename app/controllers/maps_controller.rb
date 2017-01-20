class MapsController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	def main
		render 'maps/map.html.erb'
	end

end