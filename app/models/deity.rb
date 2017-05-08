class Deity < ActiveRecord::Base

	include Associable
	
	has_many :congregations
	has_many :powers
	belongs_to :actor
	has_many :associations, as: :associable
	has_many :domains, through: :associations
	belongs_to :user
	mount_uploader :profilepic, ProfilePicUploader

	def might
		self.actor.might if actor
	end

	def will
		self.actor.will if actor
	end

	def cunning
		self.actor.cunning if actor
	end

	def subtlety
		self.actor.subtlety if actor
	end

	def perception
		self.actor.perception if actor
	end

	def sagacity
		self.actor.sagacity if actor
	end 

	#provide definition for the report method in associable
	def report_definition
		report_def = {
			name: {difficulty: 40, approximator: "none", field_name:"name", max_datum:nil},
			description: {difficulty: 40, approximator:"none", field_name:"description", max_datum:nil},
			race: {difficulty: 40, approximator: "none", field_name:"race_name", max_datum:nil},
			might: {difficulty: 50, approximator: "hi_lo", field_name:"might", max_datum:6},
			will: {difficulty: 50, approximator: "hi_lo", field_name:"will", max_datum:6},
			cunning: {difficulty: 50, approximator: "hi_lo", field_name:"cunning", max_datum:6},
			subtlety: {difficulty: 50, approximator: "hi_lo", field_name:"subtlety", max_datum:6},
			perception: {difficulty: 50, approximator: "hi_lo", field_name:"perception", max_datum:6},
			sagacity: {difficulty: 50, approximator: "hi_lo", field_name:"sagacity", max_datum:6},
		}
	end
	
	#return information on this deity when examined by another
	def profile_examine(examiner) #class=Deity
		
		#determine infolevel
		infolevel = profile_examine_info_level(examiner)
		#determine output information
		
		#profile views of gawp should instead reveal FAKE data exept to gawp
		if self.name == "Gawp" && examiner.name != "Gawp"
			return fake_profile_examine(infolevel)
		else
			infotable = "<table>"
			if infolevel < 0
				infotable += "<th>no information avaliable</th>"
			elsif infolevel == 0
				infotable += "<th>Domains</th>"
				associations.each do |a|
					infotable += "<tr><td>#{a.domain.name}</td></tr>"
				end
			elsif infolevel == 1
				infotable += "<tr><th>Domain</th><th>Score</th><tr>"
				
				associations.each do |a|
					infotable += "<tr><td>#{a.strength}</td><td>#{a.domain.name}</td></tr>"
				end
				
				infotable += "</table><table>"
				infotable += "<tr><th>Attribute</th><th>Score</th><tr>"
				if might < 3
					infotable += "<tr><td>Might</td><td>Low</td></tr>"
				elsif might < 5
					infotable += "<tr><td>Might</td><td>Moderate</td></tr>"
				else
					infotable += "<tr><td>Might</td><td>High</td></tr>"
				end
				if will < 3
					infotable += "<tr><td>Will</td><td>Low</td></tr>"
				elsif will < 5
					infotable += "<tr><td>Will</td><td>Moderate</td></tr>"
				else
					infotable += "<tr><td>Will</td><td>High</td></tr>"
				end
				if cunning < 3
					infotable += "<tr><td>Cunning</td><td>Low</td></tr>"
				elsif cunning < 5
					infotable += "<tr><td>Cunning</td><td>Moderate</td></tr>"
				else
					infotable += "<tr><td>Cunning</td><td>High</td></tr>"
				end
				if subtlety < 3
					infotable += "<tr><td>Subtlety</td><td>Low</td></tr>"
				elsif subtlety < 5
					infotable += "<tr><td>Subtlety</td><td>Moderate</td></tr>"
				else
					infotable += "<tr><td>Subtlety</td><td>High</td></tr>"
				end
				if perception < 3
					infotable += "<tr><td>Perception</td><td>Low</td></tr>"
				elsif perception < 5
					infotable += "<tr><td>Perception</td><td>Moderate</td></tr>"
				else
					infotable += "<tr><td>Perception</td><td>High</td></tr>"
				end
				if sagacity < 3
					infotable += "<tr><td>Sagacity</td><td>Low</td></tr>"
				elsif sagacity < 5
					infotable += "<tr><td>Sagacity</td><td>Moderate</td></tr>"
				else
					infotable += "<tr><td>Sagacity</td><td>High</td></tr>"
				end
			elsif infolevel > 1
				infotable += "<tr><th>Domain</th><th>Score</th><tr>"
				
				associations.each do |a|
					infotable += "<tr><td>#{a.domain.name}</td><td>#{a.strength}</td></tr>"
				end
				
				infotable += "</table><table>"
				infotable += "<tr><th>Attribute</th><th>Score</th><tr>"
				infotable += "<tr><td>Might</td><td>#{might}</td></tr>"
				infotable += "<tr><td>Will</td><td>#{will}</td></tr>"
				infotable += "<tr><td>Cunning</td><td>#{cunning}</td></tr>"
				infotable += "<tr><td>Subtlety</td><td>#{subtlety}</td></tr>"
				infotable += "<tr><td>Perception</td><td>#{perception}</td></tr>"
				infotable += "<tr><td>Sagacity</td><td>#{sagacity}</td></tr>"
			end
			infotable += "</table>"
			return infotable
			#turn directly into html
		end
	end

	def fake_profile_examine(infolevel)
		infotable = "<table>"
		if infolevel < 0
			infotable += "<th>no information avaliable</th>"
		elsif infolevel == 0
			infotable += "<th>Domains</th>"
			associations.each do |a|
				infotable += "<tr><td>#{a.domain.name}</td></tr>"
			end
		elsif infolevel == 1
			infotable += "<tr><th>Domain</th><th>Score</th><tr>"
			
			infotable += "<tr><td>Land</td><td>35</td></tr>"
			infotable += "<tr><td>Fungus</td><td>25</td></tr>"
			infotable += "<tr><td>Poverty</td><td>30</td></tr>"
			
			infotable += "</table><table>"
			infotable += "<tr><th>Attribute</th><th>Score</th><tr>"
			infotable += "<tr><td>Might</td><td>Low</td></tr>"
			infotable += "<tr><td>Will</td><td>Moderate</td></tr>"
			infotable += "<tr><td>Cunning</td><td>Moderate</td></tr>"
			infotable += "<tr><td>Subtlety</td><td>Moderate</td></tr>"
			infotable += "<tr><td>Perception</td><td>High</td></tr>"
			infotable += "<tr><td>Sagacity</td><td>Moderate</td></tr>"

			
		elsif infolevel > 1
			infotable += "<tr><th>Domain</th><th>Score</th><tr>"
			
			
			infotable += "<tr><td>Land</td><td>35</td></tr>"
			infotable += "<tr><td>Fungus</td><td>25</td></tr>"
			infotable += "<tr><td>Poverty</td><td>30</td></tr>"

			
			infotable += "</table><table>"
			infotable += "<tr><th>Attribute</th><th>Score</th><tr>"
			infotable += "<tr><td>Might</td><td>2</td></tr>"
			infotable += "<tr><td>Will</td><td>4</td></tr>"
			infotable += "<tr><td>Cunning</td><td>3</td></tr>"
			infotable += "<tr><td>Subtlety</td><td>3</td></tr>"
			infotable += "<tr><td>Perception</td><td>5</td></tr>"
			infotable += "<tr><td>Sagacity</td><td>4</td></tr>"
		end
		infotable += "</table>"
		return infotable
		#turn directly into html
	end

	#determine information level (with exceptions)
	def profile_examine_info_level(examiner) #class=Deity

		if examiner == self
			infolevel = 100
		else 
			infolevel = examiner.perception - self.subtlety
		end
		return infolevel

	end

	def total_laity
		tf = 0
		congregations.each do |c|
			tf += c.laity
		end
		tf
	end

	def total_clergy
		tc = 0
		congregations.each do |c|
			tc += c.clergy
		end
		tc
	end

	def total_followers
		self.total_laity + self.total_clergy
	end

end
