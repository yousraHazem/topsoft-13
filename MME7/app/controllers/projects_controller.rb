class ProjectsController < ApplicationController
  
	

    #gets the project that need to be edited
	def edit
		@project = Project.find(params[:id])
	end

    #update the selected project with the new submitted values
	def update
			@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			flash[:notice] = "Project successfully updated"
			#redirect_to(:action=>'ed', :id=>)
			render('edit')
		else
		   flash[:notice] = "Project could not be updated"
          # render('edit')
		end
	end
end