#encoding: UTF-8
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
         @projectuser = ProjectUser.new(:project_id => @project.id , :user_id => current_user.id , :is_creator => 'true')
         @projectuser.save
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

end
