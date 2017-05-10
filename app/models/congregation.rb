class Congregation < ActiveRecord::Base
	
	include Associable

	belongs_to :population
	belongs_to :deity
	has_many :associations, as: :associable

	def total
		t = self.clergy + self.laity
	end

	#return the race name as a string in a sendable method name
	def race_name
		population.race.name
	end
	#return the deity namme as a string in a sendable method name
	def deity_name
		deity.name
	end
	#provide definition for the report method in associable
	def report_definition
		report_def = {
			race: {difficulty: 40, approximator: "none", field_name:"race_name", max_datum:nil},
			deity: {difficulty: 40, approximator: "none", field_name:"deity_name", max_datun:nil},
			clergy: {difficulty: 50, approximator: "pop_approx", field_name:"clergy", max_datum:120.0},
			laity: {difficulty: 60, approximator: "pop_approx", field_name:"laity", max_datum:1200.0},
			loyalty: {difficulty: 80, approximator: "hi_lo", field_name:"loyalty", max_datum: 5.0},
			manpower_multiplier: {difficulty:90, approximator:"descriptive", field_name:"manpower_multiplier", max_datum: 2.0},
			piety_multiplier: {difficulty:90, approximator:"descriptive", field_name:"piety_multiplier", max_datum: 2.0}
		}
	end

	def province
		population.province
	end
end
