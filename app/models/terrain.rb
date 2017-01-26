class Terrain < ActiveRecord::Base

	include Associable
	
	has_many :primary_provinces, class_name: "Province", source: :primary_terrain_id
	has_many :secondary_provinces, class_name: "Province", source: :secondary_terrain_id
	has_many :associations, as: :associable

	#provide definition for the report method in associable
	def report_definition
		report_def = {
			name: {difficulty: 40, approximator: "none", field_name:"name", max_datum:nil},
			development_multiplier: {difficulty: 50, approximator: "descriptive", field_name:"development_multiplier", max_datum:2},		
			difficulty: {difficulty: 50, approximator: "hi_lo", field_name:"difficulty", max_datum:5},
			water: {difficulty: 50, approximator: "hi_lo", field_name:"water", max_datum:5}
		}
	end

end
