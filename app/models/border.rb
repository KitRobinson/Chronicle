class Border < ActiveRecord::Base
	belongs_to :province
	belongs_to :neighbor, class_name: "Province"

	validates :neighbor_id, presence: true
	validates_uniqueness_of :province_id, :scope => :neighbor_id
	validate :province_is_primary

	def province_is_primary
		errors.add(:neighbor_id, "neighbor_id higher than province_id") if neighbor_id > province_id
	end

end
