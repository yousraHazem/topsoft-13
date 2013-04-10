module ProjectUsersHelper
    #Author: Nayera Mohamed 22-3789 , this method takes project id as an input and outputs an array of members

	def getProjectmembers(project_id)
 	     @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
    end
end
