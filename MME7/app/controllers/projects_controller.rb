class ProjectsController < ApplicationController

# Author : Nayera Mohamed 22-3789 , this method lists the projects  occuring
def list
	@projects = Project.all
end
# Author : Nayera Mohamed 22-3789 , this method shows the projects  occuring
def show
	@project = Project.find(params[:id])
end

## Author : Nayera Mohamed 22-3789 , this method puts a new project
def new
	@project = Project.new
end
# Author : Nayera Mohamed 22-3789 , this method creates a project
def create
 @project=Project.new(params[:project])
 	 if @project.save
 	 	flash[:notice]= "project created"
  		redirect_to(:action => 'list')

  	else
   		 render('new')
    end

end

# authorized by sarah ahmed id:22-1278
#gets the project that need to be edited
 def edit
    @project = Project.find(params[:id])
  end


    # authorized by sarah ahmed id:22-1278
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
