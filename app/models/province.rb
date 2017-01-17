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
	belongs_to :region

	def get_adjacents
		#show neighbors should return an array of neighboring provinces regardless of which is the 'province' and which the 'neighbor'
		self.neighbors + others_neighbors
	end

	def get_development
		#return a value for the provinces development based on:
		base_dev * primary_terrain.development_multiplier * ((secondary_terrain.development_multiplier + 1)/2) + pop_dev
	end

	def pop_dev
		#DEVTODO - create pop_dev function!
		return 0
	end

	def promote_secondary_terrain
		start_primary = primary_terrain
		primary_terrain = secondary_terrain
		secondary_terrain = start_primary	
	end

	def push_primary_terrain(terrain)
		secondary_terrain = primary_terrain
		primary_terrain = terrain
	end

	def to_s
		#currently for irb reporting
		descriptor = ""
		descriptor += "name: #{name}\n"
		descriptor += "region: #{region.name}\n"
		descriptor += "Primary Terrain: #{primary_terrain.name}, Secondary Terrain #{secondary_terrain.name}\n"
		descriptor += "Base Development: #{base_dev}, Population Development: #{pop_dev}, Total Development: #{get_development}\n"
		descriptor += "Borders: "
		get_adjacents.each do |adj|
			descriptor += adj.name
			descriptor += " "
		end
	end
end
