class NotificationMailer < ApplicationMailer
	default from: "normsterapp@gotomyhome.com"

	def comment_added
		mail(to: "dev@gotomyhome.com", 
			subject: "A comment has been added to your place.")
	end
end
