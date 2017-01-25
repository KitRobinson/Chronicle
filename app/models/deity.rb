class Deity < ActiveRecord::Base

	include Associable
	
	has_many :congregations
	has_many :powers
	belongs_to :actor
	has_many :associations, as: :associable
	has_many :domains, through: :associations
	belongs_to :user

	def might
		self.actor.might if actor
	end

	def will
		self.actor.will if actor
	end

	def cunning
		self.actor.cunning if actor
	end

	def subtlety
		self.actor.subtlety if actor
	end

	def perception
		self.actor.perception if actor
	end

	def sagacity
		self.actor.sagacity if actor
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
		}
	end
	
end
