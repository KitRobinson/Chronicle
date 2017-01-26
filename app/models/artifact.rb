class Artifact < ActiveRecord::Base

	include Associable
	
	belongs_to :province
	belongs_to :owner, class_name: "Actor"
	has_many :associations, as: :associable

	#validates :name, presence: true

	def owner_name
		owner.name if owner
	end
	#provide definition for the report method in associable
	def report_definition
		report_def = {
			name: {difficulty: 40, approximator: "none", field_name:"name", max_datum:nil},
			description: {difficulty: 40, approximator:"none", field_name:"description", max_datum:nil},
			owner: {difficulty: 40, approximator: "none", field_name:"owner_name", max_datum:nil} 
		}
	end

end
