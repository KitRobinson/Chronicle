class Province < ActiveRecord::Base
	has_many :borders
	has_many :others_borders, class_name: "Border", foreign_key: :neighbor_id
	has_many :neighbors, class_name: "Province", through: :borders
	has_many :others_neighbors, class_name: "Province", through: :others_borders, source: :province
	has_and_belongs_to_many :organizations
	belongs_to :suzerain, class_name: "Organization"
	has_many :actors
	belongs_to :primary_terrain, class_name: "Terrain"
	belongs_to :secondary_terrain, class_name: "Terrain"
end
