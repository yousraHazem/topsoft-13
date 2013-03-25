class ProjectUsersController < ApplicationController
	
	#this method checks if the current user is a creator of the project he is trying to access 
	def isCreator 
		@creator = project_users.find(:all, :conditions=> {:user_id => current_user.id, :project_id => params[:id]})
		if @creator => nil
			return false
		else
			return true
			
		end

	end 

	#This 
	def addMember

	end
end
