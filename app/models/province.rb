class Province < ActiveRecord::Base
	has_many :borders
	has_many :others_borders, class_name: "Border", foreign_key: :neighbor_id
	has_many :neighbors, class_name: "Province", through: :borders
	has_many :others_neighbors, class_name: "Province", through: :others_borders, source: :province
	has_and_belongs_to_many :organizations
	belongs_to :suzerain, class_name: "Organization"
	has_many :actors
	belongs_to :primary_terrain, class_name: "Terrain"
	belongs_to :secondary_terrain, class_name: "Terrain"
	belongs_to :region

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
		puts "primary terrain = #{self.primary_terrain.name}, for #{score}"
		score += self.secondary_terrain.doms_score(doms)
		puts "secondary terrain = #{self.secondary_terrain.name}, for #{score}"
		self.organizations.each {|org| score += org.doms_score(doms)}
		self.actors.each {|org| score += org.doms_score(doms)}
		puts "after orgs and actors: #{score}"
		#then do something with the association score and perception...
		perception_score = score * deity.actor.perception * 20
		puts "perception score = score: #{score} * dper: #{deity.actor.perception}"
		#and then add a flat sagacity bonus
		visibility = perception_score + (deity.actor.sagacity * 10)
		puts "sagacity = #{deity.actor.sagacity} * 10"
		puts "total = #{visibility}"

		#principles for deciding the sagacity/perception ratio?
		#  -  perception applies to much less, so should give about double the bonus.
		#  -  a perfect domain correlation is 10, so if they are equal, sagacity 3 gives 150, and therefor per 3 should give 300.
	end

	# def report(vis_score)
	# 	#depending on the visibility, we pass along a lot or a little information.  At the very least, we pass along a visibility report!
	# 	case vis_score
	# 		when > 0
	# 			#add primary terrain
	# 		when > 10
	# 			#add province name
	# 		when > 20
	# 			#add secondary terrain
	# 		when > 30
	# 			#add base dev
	# 		when > 40
	# 			#add suzerain
	# 		when > 50
	# 			#add populations presence
	# 		when > 60
	# 			#add congregations presence
	# 		when > 70
	# 			#add organizations presence, population details
	# 		when > 80
	# 			#add infrastructure, congregations details
	# 		when > 90
	# 			#add actors, congregation details
	# 		when > 100 
	# 			#add artifacts, organization details,
	# 		when > 110
	# 			#etc as worked out later
	# 		when > 120
	# 			#and more... possibly a bonus on neighbor stuff
	# 		else
	# 			#just return that the visibility is 0
	# 	end
	# 	#datahash will presumably be a json object that we push directly through to the controller?
	# 	return datahash
	
	# end		

end
