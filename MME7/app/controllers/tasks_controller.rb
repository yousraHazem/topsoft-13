class TasksController < ApplicationController
 
# Author: Salma El -Ruby 22-4649
# this method takes input parameter the project_id and returns all ids of members in the project that are not assigned to the task id taken from users 
  

  def getProjectMembers
  	  @task_id = params[:id]
      @user = params[:user_id]
      project_id =params[:project_id]

      #@projectmembersid=ProjectUser.find(:all, :conditions => {:project_id => @project_id })
      @assignedppl  = TaskUser.find(:all, :conditions=>{:task_id=> params[:id]})
      @assigned  = TaskUser.find(:all,:select=>"user_id", :conditions=>{:task_id=>params[:id]}).collect(&:user_id)
      if @assigned.empty?
      @notassigned = ProjectUser.where(:project_id=> params[:project_id])  
      else
      @notassigned = ProjectUser.where("project_id = ? AND user_id NOT IN (?)" , params[:project_id] , @assigned)
      end

      #@new = TaskUser.find(:all , :conditions => {:task_id => @task_id , :user_id =>@user , :assigned = false})
    end
 

    def search
    @task = Task.search(params[:search])
    @task =Task.find
    end
  # Author: Salma El -Ruby 22-4649
  # this method takes the task-id as the input parameter and deletes the record from the data base after the user confirms the delete 
   def destroy
    Task.find(params[:id]).destroy
     redirect_to(:controller => 'tasks',:action => 'index', :id => params[:project_id])
   
  end

  # Author: Salma El -Ruby 22-4649
  # displays the available comments
      def index
    @task=Task.where(:project_id => params[:id])
      end


# Author: Salma El -Ruby 22-4649
# these two methods(edit and update) takes the task-id as the input parameter and edits the record and update the record after the user confirms the new changes

  def edit
     @project_id = params[:project_id]
     @task = Task.find(params[:id])
  end
  
  def update
    # Find object using form parameters
    @task = Task.find(params[:id])
    # Update the object
    if @task.update_attributes(params[:task])
      # If update succeeds, redirect to the list action
      redirect_to(:controller => 'tasks',:action => 'index', :id => params[:project_id])
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end 
end 