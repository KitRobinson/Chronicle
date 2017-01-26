class User < ActiveRecord::Base
	has_many :posts
	has_many :dieties
	has_many :sent_messages, class_name: "Message"
	has_many :recipients
	has_many :received_messages, class_name: "Message", through: :recipients

	has_secure_password
end
