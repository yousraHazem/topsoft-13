class ProjectsController < ApplicationController

#listing the projects 
def list
	@projects = Project.all
end

def show
	@project = Project.find(params[:id])
end

#a new project is created
def new
	@project = Project.new
end

def create
  @project=Project.new(params[:project])
  @project.save
  flash[:notice]= "project created"
end

	
end
