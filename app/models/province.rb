class Province < ActiveRecord::Base
	has_many :borders
	has_many :others_borders, class_name: "Border", foreign_key: :neighbor_id
	has_many :neighbors, class_name: "Province", through: :borders
	has_many :others_neighbors, class_name: "Province", through: :others_borders, source: :province
end
