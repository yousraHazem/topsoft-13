module ApplicationHelper

	# Author : Nayera Mohamed 22-3789 
	# Args : an object
	# retunrs : error messages if there was any 
	def error_messages_for(object)
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end

end



