class Race < ActiveRecord::Base

	include Associable
	
	has_many :populations
	has_many :associations, as: :associable
	has_many :actors
end
