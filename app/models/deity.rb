class Deity < ActiveRecord::Base

	include Associable
	
	has_many :congregations
	belongs_to :actor
	has_many :associations, as: :associable
	belongs_to :user
	
end
