class Race < ActiveRecord::Base

	include Associable
	
	has_many :populations
	has_many :associations, as: :associable
	has_many :actors

	#provide definition for the report method in associable
	def report_definition
		report_def = {
			name: {difficulty: 40, approximator: "none", field_name:"name", max_datum:nil},
			description: {difficulty: 40, approximator:"none", field_name:"description", max_datum:nil},
			longevity: {difficulty: 50, approximator:"hi_lo", field_name:"longevity", max_datum: 5},
			fecundity: {difficulty: 50, approximator:"hi_lo", field_name:"fecundity", max_datum: 5},
			might: {difficulty: 50, approximator: "hi_lo", field_name:"might", max_datum:6},
			will: {difficulty: 50, approximator: "hi_lo", field_name:"will", max_datum:6},
			cunning: {difficulty: 50, approximator: "hi_lo", field_name:"cunning", max_datum:6},
			subtlety: {difficulty: 50, approximator: "hi_lo", field_name:"subtlety", max_datum:6},
			perception: {difficulty: 50, approximator: "hi_lo", field_name:"perception", max_datum:6},
			sagacity: {difficulty: 50, approximator: "hi_lo", field_name:"sagacity", max_datum:6},
			scale: {difficulty: 50, approximator: "descriptive", field_name:"scale", max_datum:5}
		}
	end

end
