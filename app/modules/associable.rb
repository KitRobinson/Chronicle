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

	#generate a report hash for THIS associable based on the provinces visibility and the deity
	def report(deity, p_visibility)
		report_hash = {}
		#get this items score for the deity - basically thie doubles the perception value of the object for reporting on itself
		score = (deity_score(deity) * deity.actor.perception) + p_visibility

		#use each classes own report_definition method to get the report def
		report_def = self.report_definition
	
		report_def.each do |k, v|
			report_hash[v[:field_name]] = fill_field(v[:difficulty] - score, v[:approximator], self.send(v[:field_name]), v[:max_datum] )
		end		

		return report_hash

	end

	#the fill field method takes the input from each element in the report def in the hash and returns a string response!
	def fill_field(difficulty_score, approximator, datum, max_datum)
		ratio = datum.to_f/max_datum.to_f if max_datum
		if difficulty_score <= 0
			if approximator == "boolean"
				datum == 1 ? "true" : "false"
			else
				return datum.to_s
			end
		elsif approximator == "none"
			return "??????"
		elsif difficulty_score < 20
			if approximator == "boolean"
				datum == 1 ? "maybe" : "perhaps"
			elsif approximator == "hi_lo"
				if ratio > 0.5
					return "High"
				else
					return "Low"
				end
			elsif approximator == "descriptive"
				if ratio > 0.8
					return "Very High"
				elsif ratio > 0.6
					return "High"
				elsif ratio > 0.4
					return "Moderate"
				elsif ratio > 0.2
					return "Low"
				else 
					return "Very Low"
				end
			elsif approximator == "pop_approx"
				if ratio > 0.8
					return "Teeming"
				elsif ratio > 0.6
					return "Populous"
				elsif ratio > 0.4
					return "Moderate"
				elsif ratio > 0.2
					return "Few"
				else 
					return "Sparse"
				end
			end
		else 
			return "?????"
		end
		# return ? if we fall through the cracks somehow
		# return "?????"
		#but for testing purposes:
		return "does not compute!"
	end

	def html_report(report)
		response = "<ul>"
		report.each do |key, value|
			if value.class == Hash 
				response += "<ul>#{html_report(value)}</ul>"
			else
				response += "<li>#{key.to_s}: #{value.to_s}</li>"
			end
		end
		response += "</ul>"
		return response
	end

	def process_report(report)
		if value.class == "hash"
			v = process_report(value)
		else
			v = value
		end


	end
end