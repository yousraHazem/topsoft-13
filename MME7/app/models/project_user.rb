class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator
  # Author : Nayera Mohamed 22-3789 
  # Args : project id
  # returns : array of members in a project
  def getProjectmembers(project_id)
 	   ProjectUser.find(:all, :conditions => {:project_id => project_id })
  end

  belongs_to :project
  belongs_to :user

 

  # def get_projectmembers(project_id)
 	#  @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
  # end

  # def saveUser (project_id, user_id)
  # 	ProjcetUser
  # end

    def getMembersNotInProject (project_id)
     b = get_projectmembers(project_id)
     return notProjectUser = User.where("id NOT IN (?)" , b)
    end 

end
