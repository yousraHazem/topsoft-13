class TasksController < ApplicationController

  #Author salma el ruby 22-4649
  # takes as parameter the task id and get the project members who are not assigned to this particular task

  def getProjectMembers
      @task_id = params[:task_id]
      #@user = params[:user_id]
      @project_id =params[:project_id]

     #@projectmembersid=ProjectUser.find(:all, :conditions => {:project_id => @project_id })
      @assignedppl  = TaskUser.find(:all, :conditions=>{:task_id=>@task_id})
      #@notassigned = ProjectUser.all
      @assigned  = TaskUser.find(:all,:select=>"user_id", :conditions=>{:task_id=>@task_id}).collect(&:user_id)
      if @assigned.empty?
      @notassigned = ProjectUser.where(:project_id=>@project_id)  
      else
      @notassigned = ProjectUser.where("project_id = ? AND user_id NOT IN (?)" , project_id , @assigned)
      end

      #@new = TaskUser.find(:all , :conditions => {:task_id => @task_id , :user_id =>@user , :assigned = false})
    end

 #Author : Nayera Mohamed 22-3789 , this method takes the project id as params and outputs the taksks for this project
	def listTasks
		@tasks = Task.where(:project_id=>params[:id])
	end

 
  #Author salma el ruby 22-4649
  # create a new task
  def new
  @task = Task.new
  end

  #Author salma el ruby 22-4649
  # create a new task takes the project id as the parameter , and creates the task with the same project_id as the taken from user

  def create
    @project_id = params[:project_id]
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
  
  # Author: Salma El -Ruby 22-4649
  # this method takes the task-id as the input parameter and deletes the record from the data base after the user confirms the delete 
  def destroy
    Task.find(params[:id]).destroy
    redirect_to(:controller => 'tasks',:action => 'listTasks', :id => params[:project_id])
  end

  


  # Author: Salma El -Ruby 22-4649
  # these two methods(edit and update) takes the task-id as the input parameter and edits the record and update the record after the user confirms the new changes
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
