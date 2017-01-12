class Deity < ActiveRecord::Base
	has_many :congregations
	belongs_to :actor
	has_many :associations, as: :associable
end
