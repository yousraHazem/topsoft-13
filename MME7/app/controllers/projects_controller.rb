#encoding: utf-8
class ProjectsController < ApplicationController
  layout "project"

  def index
    @projects = Project.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @projects.map(&:attributes) }

    end
  end

#Author Riham Gamal id = 22-3871
#Arguments project.id
#return non
def show
  @project = Project.find(params[:id])
end
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
         redirect_to(:action => 'show')
         @projectuser = ProjectUser.new(:project_id => @project.id , :user_id => current_user.id , :is_creator => 'true')
         @projectuser.save
         flash[:notice]= "project created"
         redirect_to(:action => 'show', :id => @project.id)
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
         redirect_to(:action => 'show', :id => @project.id)
      else
         @project_count = Project.count 
         render('editProject')
      end
  end
 

  # Author : Nayera Mohamed 22-3789 
  # Args : project id
  # returns : no return
  #this method deletes projects
  def destroy
      @project = Project.find(params[:id])
      @projectid = Project.find(params[:id]).id
      if @project.budgetItems(@projectid) == false
        Project.find(params[:id]).destroy
        flash[:notice]= "تم حذف المشروع"
        redirect_to(:action => 'listProjects')
      else
        flash[:notice]= "الرجاء النظر الى الموارد المالىة"
        redirect_to(:action => 'listProjects')
      end  
  end
   

end
