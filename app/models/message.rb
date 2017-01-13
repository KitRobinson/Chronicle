class Message < ActiveRecord::Base
	belongs_to :user
	has_many :recipients
	has_many :addresees, class_name: "User", through: :recipients, source: :user_id
	belongs_to :reference, class_name: "Message"
	has_many :responses, class_name: "Message", foreign_key: :reference_id
end
