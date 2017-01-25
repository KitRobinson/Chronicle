class MapsController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	before_filter :authorize
	
	def main
		render 'maps/map.html.erb'
	end

end