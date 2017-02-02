class Chat < ActiveRecord::Base
	has_many :messages
	has_many :participations
	has_many :users, through: :participations
end
