#encoding: UTF-8
class TasksController < ApplicationController
    # Author : Nayera Mohamed 22-3789 
    #Args : task params
    #returns: list of tasks
  def listTasks
    @tasks = Task.where(:project_id=>params[:id])
  end

  #Author :salma el ruby 22-4649 
  # Args : task_id 
  # edit the task
  # returns task
  def edit
     @task_id = params[:task_id]
     @task = Task.find(params[:id])
  end

  #Author :salma el ruby 22-4649
  # this method updates the task attributes
  #Arg: params[:id] 
  # returns : updated task methods 
  def update
    # Find object using form parameters
    @task = Task.find(params[:id])
    # Update the object
    if @task.update_attributes(params[:task])
      # If update succeeds, redirect to the list action

      project_name = Project.find(@task.project_id).name
      @members = ProjectUser.where(:project_id =>@task.project_id)
      notification = Notification.create(:content=>"#{current_user.name}  قام بتعديل مهمة '#{@task.description}' لمشروع '#{project_name}'." , :url =>"/tasks/listTasks/#{@task.project_id}" , :image=>"create project") 
      current_id = current_user.id
      @members.each do |member|
        if  member.user_id == current_id
         
        else
        NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
        end
      end


      redirect_to(:action => 'listTasks', :id => params[:project_id])
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end 
 
  # Author : Salma El -Ruby 22-4649
  # Args : takes task_id , user_id , project_id
  # Returns : redirects to page with all members in project 
  # Explanation : this method gets all members not assigned to this task 
  def getProjectMembers
      @user = params[:user_id]
      @task_id = params[:task_id]
      @project_id = params[:project_id]
      @assignedppl  = TaskUser.find(:all, :conditions =>{:task_id=>@task_id})
      @assigned  = TaskUser.find(:all,:select=> 'user_id', :conditions=>{:task_id=>@task_id}).collect(&:user_id)
      if @assigned.empty?
        @notassigned = ProjectUser.where(:project_id => @project_id)  
      else
        @notassigned = ProjectUser.where("project_id = ? AND user_id NOT IN (?)", @project_id , @assigned)
      end
  end

 #Author : Nayera Mohamed 22-3789 , this method takes the project id as params and outputs the taksks for this project
  def listTasks
    @tasks = Task.where(:project_id=>params[:id])
    @project_id = params[:id]
  end

  def new
  @task = Task.new
  end

  # Author : Salma El -Ruby 22-4649
  # Args : project_d , task_id
  # Returns : redirects to page with new tasks added 
  # Explanation : this method creates a new task
  def create
    @project_id = params[:project_id]
    @task=Task.new(params[:task])
    @task.project_id = params[:project_id]
     if @task.save

      project_name = Project.find(@project_id).name
      @members = ProjectUser.where(:project_id => params[:project_id])
      notification = Notification.create(:content=>"#{current_user.name}  قام بانشاء مهمة جديدة '#{@task.description}' لمشروع '#{project_name}'." , :url =>"/tasks/listTasks/#{@project_id}" , :image=>"create project") 
      current_id = current_user.id
      @members.each do |member|
        if  member.user_id == current_id
         
        else
        NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
        end
      end

   redirect_to(:controller => 'tasks',:action => 'listTasks', :id => params[:project_id])
      else
         render('create')
      end
  end


  def search
    @task = Task.search(params[:search])
    @task =Task.find
  end

  # Author : Salma El -Ruby 22-4649
  # Args : takes task_id 
  # Returns : project_id, and redirects to page with tasks available 
  # Explanation : this method deletes unwanted tasks
  def destroy
    Task.find(params[:id]).destroy
    redirect_to(:controller => 'tasks',:action => 'listTasks', :id => params[:project_id])
  end

end
