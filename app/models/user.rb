class User < ActiveRecord::Base
	has_many :posts
	has_many :deities
	has_many :sent_messages, class_name: "Message"
	has_many :recipients
	has_many :received_messages, class_name: "Message", through: :recipients
	has_many :participations
	has_many :chats, through: :participations

	has_secure_password
end
