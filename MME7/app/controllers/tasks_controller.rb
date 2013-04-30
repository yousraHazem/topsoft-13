	class TasksController < ApplicationController
    # Author : Nayera Mohamed 22-3789 
    #Args : task params
    #returns: list of tasks
	def listTasks
		@tasks = Task.where(:project_id=>params[:id])
	end

# Author : Salma El -Ruby 22-4649
  # Args : takes task_id 
  # Returns : redirects to page with edited task 
  # Explanation : this method edits task
  def edit
     @task_id = params[:task_id]
     @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
  end


 
  # Author : Salma El -Ruby 22-4649
  # Args : takes task_id , user_id , project_id
  # Returns : redirects to page with all members in project 
  # Explanation : this method gets all members not assigned to this task 
  def getProjectMembers
      @user = params[:user_id]
      @task_id = params[:task_id]
      @project_id = params[:project_id]
      @assignedppl  = TaskUser.find(:all, :conditions=>{:task_id=>@task_id})
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

  
  # Author : Salma El -Ruby 22-4649
  # Args : project_d , task_id
  # Returns : redirects to page with new tasks added 
  # Explanation : this method creates a new task
  def new
  @task = Task.new
  end

  def create
    @project_id = params[:project_id]
    @task=Task.new(params[:task])
    @task.project_id = params[:project_id]
     if @task.save
     
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
