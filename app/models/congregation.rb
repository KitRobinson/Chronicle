class Congregation < ActiveRecord::Bases
	belongs_to :population
	belongs_to :deity
end
