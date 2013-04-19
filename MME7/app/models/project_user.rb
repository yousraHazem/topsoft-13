class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator
 

  belongs_to :project
  belongs_to :user

  def isProjectCreator(current_user, project_id)
  ProjectUser.where(:user_id => current_user, :project_id => project_id, :is_creator => true).exists?  
 end 

    #Author: Nayera Mohamed 22-3789 
    # Args : project id
    # returns : an array of memebers in a project
	def get_projectmembers(project_id)
 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
    end
    
end
