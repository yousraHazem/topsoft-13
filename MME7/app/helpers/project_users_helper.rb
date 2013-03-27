module ProjectUsersHelper

		# Author :Yasmin Mahmoud 22-1787 This method checks if the current user is a creator of the project he is trying to access 
	def isCreator(current_user, project_id)
		ProjectUser.where(:user_id => current_user, :project_id => project_id, :is_creator => true).exists?	
	end 
end
