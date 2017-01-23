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
		doms.each {|dom| score += domain_score(dom)}
		return score
	end

	#get an integer association score for this assocaible based on a deity, slower and for convenience only
	def deity_score(deity)
		score = doms_score(deity.domains)
	end

	#get an integer association score for this associable based on a single domain... and then record it in the @dom_scores hash!
	def domain_score(dom)
		@dom_scores ||= {}
		# puts "domain scores ="
		# puts @dom_scores
		# puts "now computing for #{dom.name}..."
		s = @dom_scores[dom.name]
		if s
			# puts "found without db query"
			return s
		else
			# puts "querying db"
			a = Association.where(domain:dom, associable:self).first
		end 
		@dom_scores[dom.name] = (a ? a.strength : 0)
	end

	#return the dom_scores hash
	def get_dom_scores
		@dom_scores
	end


end