module ApplicationHelper
	# Author : Nayera Mohamed 22-3789 , this method takes any object and returns errors if there are any
	def error_messages_for(object)
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end
end
