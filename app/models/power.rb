class Power < ActiveRecord::Base

	include Associable
	
	belongs_to :deity
	has_many :associations, as: :associable
end
