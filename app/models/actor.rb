class Actor < ActiveRecord::Base


	include '/lib/modules/associable.rb'

	belongs_to :race
	belongs_to :province
	belongs_to :organization
	has_many :associations, as: :associable
	has_many :artifacts, foreign_key: :owner
	has_many :domains, through: :associations

	#validates :name, :race_id, :scale, :count, presence: true

	#provide race name through a sendable method
	def race_name
		race.name if race
	end

	def organization_name
		organization.name if organization
	end

	#provide definition for the report method in associable
	def report_definition
		report_def = {
			name: {difficulty: 40, approximator: "none", field_name:"name", max_datum:nil},
			description: {difficulty: 40, approximator:"none", field_name:"description", max_datum:nil},
			race: {difficulty: 40, approximator: "none", field_name:"race_name", max_datum:nil},
			might: {difficulty: 50, approximator: "hi_lo", field_name:"might", max_datum:6},
			will: {difficulty: 50, approximator: "hi_lo", field_name:"will", max_datum:6},
			cunning: {difficulty: 50, approximator: "hi_lo", field_name:"cunning", max_datum:6},
			subtlety: {difficulty: 50, approximator: "hi_lo", field_name:"subtlety", max_datum:6},
			perception: {difficulty: 50, approximator: "hi_lo", field_name:"perception", max_datum:6},
			sagacity: {difficulty: 50, approximator: "hi_lo", field_name:"sagacity", max_datum:6},
			count: {difficulty:50, approximator:"pop_approx", field_name:"count", max_datum:1000},
			scale: {difficulty:50, approximator:"none", field_name:"scale", max_datum:nil},
			personality: {difficulty:50, approximator:"none", field_name:"personality", max_datum:nil},
			mood: {difficulty:50, approximator:"none", field_name:"mood", max_datum:nil},
			organization: {difficulty:50, approximator:"none", field_name:"organization_name", max_datum:nil}
		}
	end
	
end
