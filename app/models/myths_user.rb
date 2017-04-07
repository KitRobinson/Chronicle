class MythsUser < ActiveRecord::Base
	belongs_to :myth
	belongs_to :user
end
