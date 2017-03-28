class User < ActiveRecord::Base
	has_many :posts
	has_many :deities
	has_many :messages
	mount_uploaders :pictures, PictureUploader
	serialize :pictures, JSON
	has_secure_password
	has_many :userConversations
	has_many :conversations, through: :userConversations

	def profilepic
		pic = Deity.where(user: self).first.profilepic
		pic ? pic : "profile-placeholder.png"
	end
end
