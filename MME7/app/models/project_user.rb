class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator

  def getProjectmembers(project_id)
 	   ProjectUser.find(:all, :conditions => {:project_id => project_id })
  end

  belongs_to :project
  belongs_to :user
end
