module ProjectUsersHelper

    #getting the project members
	def get_projectmembers(project_id)
 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
    end
end
