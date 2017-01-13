class Population < ActiveRecord::Base
	has_many :congregations
	belongs_to :race
	belongs_to :province
end
