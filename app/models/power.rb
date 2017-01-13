class Power < ActiveRecord::Base
	belongs_to :deity
	has_many :associations, as: :associable
end
