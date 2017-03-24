class MapsController < ApplicationController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	before_filter :authorizeAdmin
	
	def main
		render 'maps/map.html.erb'
	end

end