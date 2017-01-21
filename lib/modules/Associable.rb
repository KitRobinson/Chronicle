module Associable
	
	#this module covers basic methods for adding and checking domain associations
	
	#add/update one or more associations with strength
	def associate(assoc_hash)

		assoc_hash.each do |dom, str|
			assoc = Association.where(domain_id: Domain.where(name:dom).first.id, associable_id: self.id, associable_type: self.class.name).first_or_initialize
			assoc.strength = str
			assoc.save
		end

	end

	#get an integer association score for this associable based on an array of domains
	def doms_score(doms)

		score = 0
		self.associations.each do |assoc|
			if doms.include?(assoc.domain)
				score += assoc.strength
			end
		end
		return score

	end

	#get an integer association score for this assocaible based on a deity, slower and for convenience only
	def deity_score(deity)
		
		doms_score(deity.domains)
	
	end

end
