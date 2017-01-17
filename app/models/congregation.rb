class Congregation < ActiveRecord::Base
	belongs_to :population
	belongs_to :deity
end
