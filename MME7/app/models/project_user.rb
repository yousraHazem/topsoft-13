class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator
  # Author : Nayera Mohamed 22-3789 , this method takes a project id as an input and returns an array of members in this project
  def getProjectmembers(project_id)
 	   ProjectUser.find(:all, :conditions => {:project_id => project_id })
  end

  belongs_to :project
  belongs_to :user
end
