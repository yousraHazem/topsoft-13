module ApplicationHelper
    #Author : Nayera Mohamed 22-3789 , this method takes an object(project) as an input and returns error messages if there is any 
	def error_messages_for(object)
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end

end
