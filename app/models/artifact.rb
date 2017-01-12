class Artifact < ActiveRecord::Base
	belongs_to :province
	belongs_to :owner, class_name: "Actor"
	has_many :associations, as: :associable
end
