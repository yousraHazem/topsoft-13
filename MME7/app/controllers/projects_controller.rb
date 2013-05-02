#encoding: utf-8
class ProjectsController < ApplicationController

  def index
    @projects = Project.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @projects.map(&:attributes) }

    end
  end

  #Author Riham Gamal id = 22-3871
  #Arguments project.id
  # it gets also the map of that project
  #return non
  def show
  @project = Project.find(params[:id])
  @char = Character.where(:project_id => @project)
  @char.each  do |c|
    @findMap = c.id
  end
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
         @userFound = ProjectUser.where(:project_id => @project.id , :user_id => current_user.id).exists?
         if @userFound == false
         @projectuser = ProjectUser.new(:project_id => @project.id , :user_id => current_user.id , :is_creator => 'true')
         @projectuser.save
         else
         @user = ProjectUser.where(:project_id => @project.id , :user_id => current_user.id)
         @thisUser = @user.first
         @thisUser.is_creator = true
         @thisUser.save
         end 

         flash[:notice]= "project created"

         @members = User.all
         notification = Notification.create(:content=>"#{current_user.name}  قام بانشاء مشروع جديد '#{@project.name}'" , :url =>"/projects/show/#{@project.id}" , :image=>"create project") 
         current_id = current_user.id
         @members.each do |member|
            if  member.id == current_id
               
            else
            NotificationUser.create(:user_id=>member.id , :notification_id=> notification.id)
            end
          end

         flash[:notice]= "لقد تم تكوين المشروع"
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

    @old_name = @project.name
    @old_start_date = @project.start_date
    @old_end_date = @project.end_date
    @old_description = @project.description
  end

  # Author : Nayera Mohamed 22-3789 
  # Args : project id
  # returns : the project with updated attributes 
  def updateProject
      @project = Project.find(params[:id])

      @old_name = params[:old_name]
      @old_start_date = params[:old_start_date]
      @old_end_date = params[:old_end_date]
      @old_description = params[:old_description]

      if @project.update_attributes(params[:project])
        
         flash[:notice]= "project updated"

        @members = ProjectUser.where(:project_id=>@project.id)
        notification = Notification.create(:content=>"#{current_user.name}  قام بتعديل مشروع '#{@project.name}'" , :url =>"/projects/show/#{@project.id}" , :image=>"edit budget") 
        current_id = current_user.id
        @members.each do |member|
            if  member.user_id == current_id
               
            else
            NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
            end
        end

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
      if @project.budgetSourceProject(@projectid) == true && @project.budgetItems(@projectid) == true
        Project.find(params[:id]).destroy
        flash[:notice]= "project destroyed"
        redirect_to(:action => 'listProjects')
      else
        flash[:notice]= "الرجاء النظر الى الموارد المالىة"
        redirect_to(:action => 'listProjects')
      end  
  end
   


 
end
