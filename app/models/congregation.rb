class Congregation < ActiveRecord::Base
	
	include Associable

	belongs_to :population
	belongs_to :deity
	has_many :associations, as: :associable

	def total
		t = self.clergy + self.laity
	end

end
