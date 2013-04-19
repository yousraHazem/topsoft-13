module ProjectUsersHelper

	

# Author :Yasmin Mahmoud 22-1787 This method add the member to the user_project table with the id of the project opened in the view and the selected user id and if this member is a creator
	def addMember(project_id, user_id,creator)
		member = ProjectUser.new(:project_id => project_id , :user_id => user_id , :is_creator => creator)
		member.save
	end

    #Author: Nayera Mohamed 22-3789 
    # Args : project id
    # returns : an array of memebers in a project
	def get_projectmembers(project_id)

 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
  end

 

# Author :Yasmin Mahmoud 22-1787 This method checks if the current user is a creator of the project he is trying to access 	
def isProjectCreator(current_user, project_id)
  ProjectUser.where(:user_id => current_user, :project_id => project_id, :is_creator => true).exists?  
 end 

end


