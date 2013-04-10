class ProjectsController < ApplicationController


  # Author : Nayera Mohamed 22-3789 , this method lists the projects occuring
  def listProjects
    @projects = Project.all
  end

  # Author : Nayera Mohamed 22-3789 , this method shows a project occuring
  def showProject
      @project = Project.find(params[:id])
  end

  # Author : Nayera Mohamed 22-3789 , this method puts a new project
  def newProject
      @project = Project.new
  end

  # Author : Nayera Mohamed 22-3789 , this method takes its' input from the params and creates a new project
  def createProject
      @project=Project.new(params[:project])
      if @project.save
         flash[:notice]= "project created"
         redirect_to(:action => 'listProject')
      else
         render('newProject')
      end
  end

  # Author : Nayera Mohamed 22-3789 , this method takes a project id in order to edit its attributes 
  def editProject
      @project = Project.find(params[:id])
      @project_count = Project.count 
  end

  # Author : Nayera Mohamed 22-3789 , this method takes aproject id and takes the updated attributes in order to change them
  def updateProject
      @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
       flash[:notice]= "project updated"
         redirect_to(:action => 'showProject', :id => @project.id)
      else
         @project_count = Project.count 
         render('editProject')
      end
  end

end