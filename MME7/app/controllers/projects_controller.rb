class ProjectsController < ApplicationController
  layout "project"
  # Author : Nayera Mohamed 22-3789 
  # Args : no args
  # retuns : list of projects
  def listProjects
      @projects = Project.all
  end


  # Author : Nayera Mohamed 22-3789 
  # Args: no args
  # returns : a new project 
  def newProject
      @project = Project.new
  end

  # Author : Nayera Mohamed 22-3789 
  # Args : project params
  # returns :creates a new project 
  def createProject
      @project=Project.new(params[:project])
      if @project.save
         @projectuser = ProjectUser.new(:project_id => @project.id , :user_id => current_user.id , :is_creator => 'true')
         @projectuser.save
         flash[:notice]= "project created"
         redirect_to(:action => 'show')
      else
         render('newProject')
      end
  end

  # Author : Nayera Mohamed 22-3789 
  # Args : project id
  # returns : doesnot return anything  
  def editProject
      @project = Project.find(params[:id])
      @project_count = Project.count 
  end

  # Author : Nayera Mohamed 22-3789 
  # Args : project id
  # returns : the project with updated attributes 
  def updateProject
      @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
         flash[:notice]= "project updated"
         redirect_to(:action => 'show', :id => @project.id)
      else
         @project_count = Project.count 
         render('editProject')
      end
  end
  
end


