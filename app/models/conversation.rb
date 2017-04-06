class Conversation < ActiveRecord::Base
	has_many :messages
	has_many :userConversations
	has_many :users, through: :userConversations

	cattr_accessor :current_user
	# get timestamp from most recent message
	def last_message_time
		self.messages.last.created_at
	end

	# get the number of messages since a specified time
	def messages_since(t)
		missed_messages = 0
		self.messages.each do |m|
			missed_messages += 1 if m.created_at > t 
		end	
		return missed_messages	
	end

	# get the number of messags since a specified time for the current user
	def others_messages_since(t)
		missed_messages = 0
		self.messages.each do |m|
			if m.created_at > t && m.user != Conversation.current_user
				missed_messages += 1
			end
		end
		return missed_messages 
	end

	# get the number of messages missed by the current user
	def check_status
		puts "starting check status method"
		puts "----------------------------"

		curr = Conversation.current_user
		puts "curr = #{curr}"
		j = UserConversation.where(user: curr, conversation: self).first
		puts "j =  #{j}"
		if j != nil && j.last_visit != nil
			#set to the users last visit
			t = j.last_visit	
		else
			#set to before the beginning of the game
			t = DateTime.now - 1000.days
		end
		puts "t #{t}"
		others_messages_since(t)
	end

	def is_empty?

		if self.messages == []
			puts "---------------------------"
			puts "is empty!"
			puts "---------------------------"
			return true
		else
			puts "---------------------------"
			puts "is not empty"
			puts "--------------------------"
			puts "and messages is "
			puts self.messages
			return false
		end
	end

end
