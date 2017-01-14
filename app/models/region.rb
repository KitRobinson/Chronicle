class Region < ActiveRecord::Base

	include Associable

	has_many :provinces
	has_many :associations, as: :associable
end
