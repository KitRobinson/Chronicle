class Relationship < ActiveRecord::Base
	belongs_to :organization_one, class_name: "Organization"
	belongs_to :organization_two, class_name: "Organization"
	after_create :set_neutral

	def set_neutral
		current_relationship = 3
	end

	def set_expected
		expected_relationship = find_expected
		save
	end

	def adj_current
		2.times do
			if current_relationship > expected_relationship
				current_relationship -= 1
			elsif current_relationship < expected_relationship
				current_relationship += 1
			end
		end	
		save
	end

	def find_expected
		a = Attitude.where(organization_id: self.organization_one_id, target_id: self.organization_two_id).first.desired_status
		b = Attitude.where(organization_id: self.organization_two_id, target_id: self.organization_one_id).first.desired_status
		s = a > b ? a : b
	end

end
