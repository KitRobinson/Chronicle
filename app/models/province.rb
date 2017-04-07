class Province < ActiveRecord::Base
	has_many :borders
	has_many :others_borders, class_name: "Border", foreign_key: :neighbor_id
	has_many :neighbors, class_name: "Province", through: :borders
	has_many :others_neighbors, class_name: "Province", through: :others_borders, source: :province
	has_and_belongs_to_many :organizations
	belongs_to :suzerain, class_name: "Organization"
	has_many :actors
	has_many :artifacts
	belongs_to :primary_terrain, class_name: "Terrain"
	belongs_to :secondary_terrain, class_name: "Terrain"
	belongs_to :region
	has_many :populations
	has_many :congregations, through: :populations

	def get_adjacents
		#show neighbors should return an array of neighboring provinces regardless of which is the 'province' and which the 'neighbor'
		self.neighbors + others_neighbors
	end

	def get_development
		#return a value for the provinces development based on:
		base_dev * primary_terrain.development_multiplier * ((secondary_terrain.development_multiplier + 1)/2) + pop_dev
	end

	def pop_dev
		#DEVTODO - create pop_dev function!
		return 0
	end

	def promote_secondary_terrain
		start_primary = primary_terrain
		primary_terrain = secondary_terrain
		secondary_terrain = start_primary	
	end

	def push_primary_terrain(terrain)
		secondary_terrain = primary_terrain
		primary_terrain = terrain
	end

	def to_s
		#currently for irb reporting
		descriptor = ""
		descriptor += "name: #{name}\n"
		descriptor += "region: #{region.name}\n"
		descriptor += "Primary Terrain: #{primary_terrain.name}, Secondary Terrain #{secondary_terrain.name}\n"
		descriptor += "Base Development: #{base_dev}, Population Development: #{pop_dev}, Total Development: #{get_development}\n"
		descriptor += "Borders: "
		get_adjacents.each do |adj|
			descriptor += adj.name
			descriptor += " "
		end
	end

	def visibility(deity)
		#return the general province visibility score

		#go through associated things... like terrains and churches, and get a total association score
		doms = deity.domains
		puts doms
		score = 0

		#test each Associable, including self if necessary
		score += self.primary_terrain.doms_score(doms)
		# puts "primary terrain = #{self.primary_terrain.name}, for #{score}"
		score += self.secondary_terrain.doms_score(doms)
		# puts "secondary terrain = #{self.secondary_terrain.name}, for #{score}"
		self.organizations.each {|org| score += org.doms_score(doms)}
		self.actors.each {|org| score += org.doms_score(doms)}
		# puts "after orgs and actors: #{score}"
		#then do something with the association score and perception...
		perception_score = score * deity.actor.perception
		# puts "perception score = score: #{score} * dper: #{deity.actor.perception}"
		#and then add a flat sagacity bonus
		visibility = perception_score + (deity.actor.sagacity * 10)
		# puts "sagacity = #{deity.actor.sagacity} * 10"
		# puts "total = #{visibility}"
		return visibility
		#principles for deciding the sagacity/perception ratio?
		#  -  perception applies to much less, so should give about double the bonus.
		#  -  a perfect domain correlation is 10, so if they are equal, sagacity 3 gives 30, and therefor per 3 should give 60?
	end

	def full_report(deity)
		vis = visibility(deity)
		report_data = {}
		if vis > 0 
			report_data[:visibility] = vis.to_s
			report_data[:name] = name
			report_data[:volcanism] = volcanism
			report_data[:leyline_strength] = leyline_strength
			report_data["Primary Terrain"] = primary_terrain.report(deity, vis) if primary_terrain
			report_data[:secondary_terrain] = secondary_terrain.report(deity, vis) if secondary_terrain
			report_data[:suzerain] = suzerain.report(deity, vis) if suzerain
			organizations.each_with_index { |org, i| report_data["org#{i}"] = org.report(deity, vis) }
			populations.each_with_index { |pop, i| report_data["pop#{i}"] = pop.report(deity, vis) }
			congregations.each_with_index { |con, i| report_data["cong#{i}"] = con.report(deity, vis) }
			artifacts.each_with_index { |art, i| report_data["art#{i}"] = art.report(deity, vis) }
		else
			report_data[:visisiblity] = "Unknown"
		end

		return report_data
	end

	# while it is amusing to recursively produce this report based on the nested hashes... its also ugly as sin
	def html_report(report_hash)
		response = '<ul class="browser-default">'
		report_hash.each do |key, value|
			if value.class.to_s == "Hash" 
				response += "<li>#{key.to_s}</li><li>#{html_report(value)}</li>"
			else
				response += "<li>#{key.to_s}: #{value.to_s}</li>"
			end
		end
		response += "</ul>"
		return response
	end

	def pretty_html_report(data_hash, section_title, field_name="")
		# this provides the most basic tree beginning
		response = '<ul class="collapsible" data-collapsible="expandable">'
		response += '<li>'
		response +="<div class='collapsible-header'>#{section_title} #{field_name}</div>"
		data_hash.each do |item, value|
			if value.class.to_s == "Hash"
				#if its a hash, recurse...
				#first we set up the body
				response += "<div class='collapsible-body'>"
				#then we fill it recursively
				if value["name"]
					value_name = ": #{value['name']}"
				else
					value_name = ""
				end
				response += pretty_html_report(value, item.to_s, value_name)
				#we will close the newly created elements after the iterator
			else
				#if its data, add a complete body element
				response += "<div class='collapsible-body'><span>#{item.to_s}: #{value.to_s}</span></div>"
			end
		end
		response += "</li></ul></div>"
		#when we have finished the FINAL iteration in THIS recursion, we close again
	end

	def fill_pretty_html_report
	end


	def coastal?
		if self.primary_terrain.name == "Coast" || self.secondary_terrain.name == "Coast"
			return true
		else
			get_adjacents.each do |neighbor|
				if neighbor.water_level > 3
					return true
				end
			end
		end
		return false
	end

	def water_level
		self.primary_terrain.water + self.secondary_terrain.water
	end

end
