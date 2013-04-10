class TasksController < ApplicationController

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
  # create a new task
  def create
    @project_id = params[:id]
    @task=Task.new(params[:task])
    @task.project_id = params[:id]
     if @task.save
      flash[:notice]= "task created"
      redirect_to(:controller => 'tasks',:action => 'listTasks', :id => params[:id])
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
