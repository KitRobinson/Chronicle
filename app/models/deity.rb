class Deity < ActiveRecord::Base

	include Associable
	
	has_many :congregations
	has_many :powers
	belongs_to :actor
	has_many :associations, as: :associable
	has_many :domains, through: :associations
	belongs_to :user
	
end
