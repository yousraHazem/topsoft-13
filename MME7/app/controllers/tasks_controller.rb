class TasksController < ApplicationController
 
  #Author :salma el ruby 22-4649
  # Args : user_id, task_id, project_id
  # gets the poject members who are not assigned to this task

  def getProjectMembers
      @user = params[:user_id]
      @task_id = params[:task_id]
      @project_id =params[:project_id]
      @assignedppl  = TaskUser.find(:all,:select=> @user, :conditions=>{:task_id=>@task_id})
      @assigned  = TaskUser.find(:all,:select=> @user, :conditions=>{:task_id=>@task_id}).collect(&:user_id)
        if @assigned.empty?
            @notassigned = ProjectUser.where(:project_id=>@project_id)  
         else
            @notassigned = ProjectUser.where("project_id = ? AND user_id NOT IN (?)" , @project_id , @assigned)
         end
  end

 #Author : Nayera Mohamed 22-3789 , this method takes the project id as params and outputs the taksks for this project
  def listTasks
    @task = Task.where(:project_id=>params[:id])
  end

  #Author :salma el ruby 22-4649
  # Args : --
  # creates a new task
  def new
  @task = Task.new
  end

  def create
    @project_id = params[:id]
    @task=Task.new(params[:task])
    @task.project_id = params[:project_id]
     if @task.save
     
   redirect_to(:controller => 'tasks',:action => 'listTasks', :id => params[:project_id])
      else
         render('new')
      end
  end


  def search
    @task = Task.search(params[:search])
    @task =Task.find
  end

  #Author :salma el ruby 22-4649
  # Args : task_id
  # deletes the task
  def destroy
    Task.find(params[:id]).destroy
    redirect_to(:controller => 'tasks',:action => 'listTasks', :id => params[:project_id])
  end

  

  #Author :salma el ruby 22-4649
  # Args : task_id 
  # edit the task
    def edit
     @task_id = params[:task_id]
     @task = Task.find(params[:id])
  end
  
  def update
    # Find object using form parameters
    @task = Task.find(params[:id])
    # Update the object
    if @task.update_attributes(params[:task])
      # If update succeeds, redirect to the list action
      redirect_to(:action => 'listTasks', :id => params[:project_id])
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end 
end 