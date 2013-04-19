class UsersController < ApplicationController
  #Author :salma el ruby 22-4649
  # Args : user_id, task_id, project_id
  # assigns members of this project_id to this task_id
 def assign
  @task_id = params[:task_id]
  @projectid = params[:id]
  @userid = params[:user_id]
  @taskuser =TaskUser.new(:user_id => @userid , :task_id => @task_id)
  @taskuser.save
  redirect_to(:controller => 'tasks' ,:action => 'getProjectMembers' ,:task_id => @task_id , :project_id => @projectid)

end 

def index
  @user = User.where("name like ?", "%#{params[:q]}%")

 #@user = User.where("name like ?", "%#{params[:q]}%")
  respond_to do |format|
    format.html
    format.json { render :json => @user.map(&:attributes) }
  end
end
end