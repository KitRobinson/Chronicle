class Attitude < ActiveRecord::Base
	belongs_to :organization
	belongs_to :target, class_name: "Organization"
end
