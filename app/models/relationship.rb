class Relationship < ActiveRecord::Base
	belongs_to :organization_one, class_name: "Organization"
	belongs_to :organization_two, class_name: "Organization"
end
