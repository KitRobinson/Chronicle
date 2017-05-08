class Population < ActiveRecord::Base

	include Associable

	has_many :congregations
	belongs_to :race
	belongs_to :province
	has_many :associations, as: :associable

	def calc_new_devotion
		devoted_total = 0
		congregations.each { |c| devoted_total += c.total }
		devoted_total/self.count
	end

	def new_devotion
		calc_devotion
	end

	def race_name
		self.race.name
	end

	def report_definition
		report_def = {
			race: {difficulty: 40, approximator: "none", field_name:"race_name", max_datum:nil},
			count: {difficulty: 50, approximator: "pop_approx", field_name:"count", max_datum:400000},
			loyalty: {difficulty: 70, approximator: "hi_lo", field_name:"loyalty", max_datum: 5},
			piety: {difficulty: 80, approximator: "hi_lo", field_name:"piety", max_datum: 1.0},
			devotion: {difficulty: 90, approximator: "descriptive", field_name: "devotion", max_datum: 1.0}
		}
	end
end
