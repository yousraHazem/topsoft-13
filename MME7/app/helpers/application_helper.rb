module ApplicationHelper

	#Author: Nayera Mohamed 22-3789 , this method take an object (project) and output error messages if there was any in the creation
	def error_messages_for(object)
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end
	
end
