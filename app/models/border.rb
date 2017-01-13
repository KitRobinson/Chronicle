class Border < ActiveRecord::Base
	belongs_to :province
	belongs_to :neighbor, class_name: "Province"
end
