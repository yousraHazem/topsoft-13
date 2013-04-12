class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id , :user_id , :is_creator
  belongs_to :project
  belongs_to :user
  validates :user_id, :uniqueness => true

 

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
