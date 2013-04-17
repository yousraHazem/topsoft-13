module ApplicationHelper

	# Author : Nayera Mohamed 22-3789 , this method takes any object and returns errors if there are any
	def error_messages_for(object)
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end


	# def getMembersNotInProject (project_id)
 #     b = Project.get_projectmembers(project_id)
 #     notProjectUser = User.find(:all, :conditions => :user_id != b)
 #    end

 #    def get_projectmembers(project_id)
 # 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
 #    end 


  

end



