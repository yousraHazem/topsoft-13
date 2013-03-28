class ProjectsController < ApplicationController
	
# Author: Nayera Mohamed 22-3789 , this method lists the projects  occuring
def list
	@projects = Project.all
end

# Author: Nayera Mohamed 22-3789 , this method shows the projects  occuring
def show
	@project = Project.find(params[:id])
end

# Author: Nayera Mohamed 22-3789 , this method puts a new project
def new
	@project = Project.new
end

# Author: Nayera Mohamed 22-3789 , this method creates a project
def create
  @project=Project.new(params[:project])
  @project.save
  flash[:notice]= "project created"
end

	
end
