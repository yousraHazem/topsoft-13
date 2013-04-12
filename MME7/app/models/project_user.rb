# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  is_creator :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectUser < ActiveRecord::Base
   attr_accessible :project_id , :user_id , :is_creator
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
