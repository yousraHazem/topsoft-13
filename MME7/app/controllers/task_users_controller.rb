#encoding: UTF-8
class TaskUsersController < ApplicationController
  # Author : Salma El -Ruby 22-4649
  # Args : takes task_id, project_id,user_id
  # Returns : task_id, project_id 
  # Explanation : this method assigns members to task , create a new task user 

 def unassign 
  @task_id = params[:task_id]
  @userid = params[:user_id]
  @projectid = params[:id]
  TaskUser.where(:user_id => @userid ,:task_id => @task_id ).destroy_all
  redirect_to(:controller => 'tasks' ,:action => 'getProjectMembers' ,:task_id => @task_id , :project_id => @projectid)
 end 

  # Author : Salma El -Ruby 22-4649
  # Args : takes task_id, project_id,user_id
  # Returns : task_id, project_id 
  # Explanation : this method assigns members to task , create a new task user 
  def assign
  @task_id = params[:task_id]
  @projectid = params[:id]
  @userid = params[:user_id]
  @taskuser =TaskUser.new(:user_id => @userid , :task_id => @task_id)
  @taskuser.save
  redirect_to(:controller => 'tasks' ,:action => 'getProjectMembers' ,:task_id => @task_id , :project_id => @projectid)
  end 
  
end

