class Organization < ActiveRecord::Base

	include Associable
	
	has_many :actors
	belongs_to :leader, class_name: "Actor"
	has_many :attitudes
	has_many :others_attitudes, class_name: "Attitude", foreign_key: :target_id
	has_many :relationships, foreign_key: :organization_one_id
	has_many :others_relationships, class_name: "Relationship", foreign_key: :organization_two_id
	has_and_belongs_to_many :provinces
	belongs_to :suzerain, class_name: "Organization"
	has_many :associations, as: :associable

	after_create :introduce

	def introduce
		#this is meant to be run between .new and .save, so that each organization ALREADY in the database developes a relation to the new org
		
		#creates attitudes to and from all organizations
		#creates relationship from but not to all organziations
		puts "getting list of orgs"
		orgs = Organization.all
		orgs = orgs - [self]
		if orgs.length == 0
		#	puts "no orgs to introduce #{self.name} to"
		else
		#	puts "starting introduce on #{self.name}"
		end
		orgs.each do |org|
		#	puts "creating relations between #{org.name} and #{self.name}"
			a = Attitude.where(organization:org, target:self).first_or_initialize
			a.update(desired_status:rand(6))
			b = Attitude.where(organization:self, target:org).first_or_initialize
			b.update(desired_status:rand(6))
			r = Relationship.where(organization_one:org, organization_two:self).first_or_initialize
			r.set_expected
		end

	end

	def spread(prov)
		#spread the organization to a province
		OrganizationsProvince.create(province:prov, organization:self)
	end

	def conquer(prov)
		OrganizationsProvince.create(province:prov, organization:self)
		prov.update(suzerain: self)
		puts "#{self.name} has conquered #{prov.name}"
	end

	def spread_region(reg)
		#spread the organization to an entire region
		reg.provinces.each {|prov| self.spread(prov)}
	end

	def leader_name
		leader.name if leader
	end

	def suzerain_name
		suzerain.name if suzerain
	end

	#provide definition for the report method in associable
	def report_definition
		report_def = {
			name: {difficulty: 40, approximator: "none", field_name:"name", max_datum:nil},
			description: {difficulty: 40, approximator:"none", field_name:"description", max_datum:nil},
			is_church: {difficulty: 40, approximiator:"none", field_name:"is_church", max_datum:nil},
			is_kingdom: {difficulty: 40, approximiator:"none", field_name:"is_kingdom", max_datum:nil},
			leader: {difficulty: 60, approximator:"none", field_name:"leader_name", max_datum:nil},
			suzerain: {difficulty: 60, approximator:"none", field_name:"suzerain_name", max_datum:nil}
		}			
	end

end
