class Region < ActiveRecord::Base
	has_many :provinces
	has_many :associations
end
