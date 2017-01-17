module Associable
	
	#this module covers basic methods for adding and checking domain associations
	def associate(assoc_hash)

		assoc_hash.each do |dom, str|
			assoc = Association.where(domain_id: Domain.where(name:dom).first.id, associable_id: self.id, associable_type: self.class.name).first_or_initialize
			assoc.strength = str
			assoc.save
		end

	end

end
