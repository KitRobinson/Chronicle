class User < ActiveRecord::Base
	has_many :posts
	has_many :deities
	has_many :sent_messages, class_name: "Message"
	has_many :recipients
	has_many :received_messages, class_name: "Message", through: :recipients
	mount_uploaders :pictures, PictureUploader
	serialize :pictures, JSON
	has_secure_password
end
