class Relationship < ActiveRecord::Base
	belongs_to :organization_one, class_name: "Organization"
	belongs_to :organization_two, class_name: "Organization"
	after_create :set_neutral

	def set_neutral
		self.current_relationship = 3
	end

	def set_expected
		e = find_expected
		puts "setting relationship expectation to #{e}"
		self.expected_relationship = e
		puts "now my expected relationship = #{self.expected_relationship}"
		self.save
		puts "after saving my expected relationship = #{self.expected_relationship}"
	end

	def adj_current
		puts "starting relationship = #{self.current_relationship}"
		2.times do
			if self.current_relationship > self.expected_relationship
				self.current_relationship -= 1
			elsif self.current_relationship < self.expected_relationship
				self.current_relationship += 1
			end
			puts "now my current_relationship is #{self.current_relationship}"
		end	
		self.save
		puts "final relationship = #{self.current_relationship}"
	end

	def find_expected
		a = Attitude.where(organization_id: self.organization_one_id, target_id: self.organization_two_id).first.desired_status
		b = Attitude.where(organization_id: self.organization_two_id, target_id: self.organization_one_id).first.desired_status
		puts "attitude a = #{a}"
		puts "attitude b = #{b}"
		puts "a new output line!"
		s = a > b ? a : b
	end

end
