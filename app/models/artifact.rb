class Artifact < ActiveRecord::Base

	include Associable
	
	belongs_to :province
	belongs_to :owner, class_name: "Actor"
	has_many :associations, as: :associable

	#validates :name, presence: true
end
