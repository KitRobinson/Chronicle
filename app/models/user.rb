class User < ActiveRecord::Base
	has_many :posts
	has_many :deities
	has_many :messages
	mount_uploaders :pictures, PictureUploader
	serialize :pictures, JSON
	has_secure_password
	has_many :userConversations
	has_many :conversations, through: :userConversations
	has_many :mythsUsers
	has_many :myths, through: :mythsUsers
	
	#give access to the current user method sent by the application controller set_current_user class
	cattr_accessor :current_user

	def profilepic
		if Deity.where(user: self) != []
			pic = Deity.where(user: self).first.profilepic
		else
			pic = "https://chronicles-of-alohmar.s3.amazonaws.com/uploads/1490658660-4-0001-4936/profile-placeholder.png"
		end

	end

end
