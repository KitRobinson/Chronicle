class Myth < ActiveRecord::Base
	has_many :mythsUsers
	has_many :users, through: :mythsUsers
end
