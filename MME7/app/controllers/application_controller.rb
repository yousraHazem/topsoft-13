
class ApplicationController < ActionController::Base
   #ProjectsHelper :getMembersNotInProject
   #ProjectUsersHelper :get_projectmembers

   # def getMembersNotInProject (project_id)
   #   b = Project.get_projectmembers(project_id)
   #   notProjectUser = User.find(:all, :conditions => :user_id != b)
   #  end

   #  def get_projectmembers(project_id)
 	 #     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
   #  end 

   
    protect_from_forgery

end
