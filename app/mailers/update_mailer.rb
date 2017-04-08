class UpdateMailer < ApplicationMailer
	default from: "ChroniclesUpdates@gmail.com"

	def test_email(user)
		@user = user
		mail(to: @user.email, subject: "Test Email")
	end

	def message_email(user, message)
		@user = user
		@message = message
		mail(to: @user.email, subject: "New Message from #{@message.user.username}")
	end
end
