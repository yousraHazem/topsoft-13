module ProjectUsersHelper


    #Author: Nayera Mohamed 22-3789 , this method returns the project members in a cretain project

    #Author: Nayera Mohamed 22-3789 , this method returns the project members in a cretain project

def get_projectmembers(project_id)
 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
    end



def isProjectCreator(current_user, project_id)
  ProjectUser.where(:user_id => current_user, :project_id => project_id, :is_creator => true).exists?  
 end 

end