class ProjectUsersController < ApplicationController

	 def index
      @project = Project.find(params[:id])
      @members = ProjectUser.where(:project_id => params[:id])
  	end



	# Author Riham Gamal 22-3871
	# Arguments project_id, user_id
	# return ProjectUser
	def promoteMembers
		@projectuser = ProjectUser.where(:project_id => params[:project_id], :user_id => params[:user_id])
		@user = ProjectUser.find(@projectuser)

		if @user.is_creator == true
			@user.is_creator = false
		else 
			@user.is_creator = true
		end

		if @user.save
			redirect_to(:controller => 'project_users', :action => 'index', :id => params[:project_id])
		else
			redirect_to(:controller => 'projects', :action => 'show', :id => params[:project_id])
		end				
					
	end
end	
