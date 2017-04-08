class UpdateMailer < ApplicationMailer
	default from: "ChroniclesUpdates@gmail.com"

	def test_email(user)
		@user = user
		mail(to: @user.email, subject: "Test Email")
	end
	
end
