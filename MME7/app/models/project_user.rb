class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator
  belongs_to :project
  belongs_to :user

    # Author :Yasmin Mahmoud 22-1787 This method checks if the current user is a creator of the project he is trying to access 
  def isProjectCreator(current_user, project_id)
  ProjectUser.where(:user_id => current_user, :project_id => project_id, :is_creator => true).exists?  
 end 

end
