class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :reference, class_name: "Chat"
end
