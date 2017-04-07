class Myth < ActiveRecord::Base
	has_many :mythsUsers
	has_many :users, through: :mythsUsers
	mount_uploader :myth_pic, MythpicUploader

	cattr_accessor :current_user

	def user_access
		puts "checking user access"
    	usr = MythsUser.where(user: current_user, myth: self).first
      	if usr
        	puts "myths_user found"
        	puts "user access level #{usr.access_level}"
        	return usr.access_level
      	else
      		puts "no myths_user found"
        	return 0
      	end
    end
end
