class Organization < ActiveRecord::Base
	has_many :actors
	belongs_to :leader, class_name: "Actor"
	has_many :attitudes
	has_many :others_attitudes, class_name: "Attitude", foreign_key: :target_id
	has_many :relationships, foreign_key: :organization_one_id
	has_many :others_relationships, class_name: "Relationship", foreign_key: :organization_two_id
end
