class Conversation < ActiveRecord::Base
	has_many :messages
	has_many :userConversations
	has_many :users, through: :userConversations
end
