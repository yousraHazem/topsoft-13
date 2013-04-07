module TasksHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :project id and outputs: tasks that have the same project id entered 
	def get_tasks (p_id)
	return Task.find(:all, :conditions => {:project_id =>p_id})
    end
    #Authored by Salma El Ruby 22-4649
  	#this method takes input :project id and outputs: ids of members in this project 

	def get_projectmembers(project_id)
 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
    end
    
    def isCreator (current_user, project_id)
		ProjectUser.where(:user_id => current_user, :project_id => project_id ).exists?
  end



end
