class ProjectsController < ApplicationController

#Author Riham Gamal id = 22-3871
#Arguments project.id
#return non
def show
  @project = Project.find(params[:id])
end
end