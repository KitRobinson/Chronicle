class Terrain < ActiveRecord::Base
	has_many :primary_provinces, class_name: "Province", source: :primary_terrain_id
	has_many :secondary_provinces, class_name: "Province", source: :secondary_terrain_id
	has_many :associations
end
