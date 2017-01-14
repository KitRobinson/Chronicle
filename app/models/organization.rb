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
end
