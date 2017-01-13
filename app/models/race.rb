class Race < ActiveRecord::Base
	has_many :populations
	has_many :associations
	has_many :actors
end
