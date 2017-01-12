class Organization < ActiveRecord::Base
	has_many :actors
	belongs_to :leader, class_name: "Actor"
end
