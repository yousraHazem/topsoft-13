class UsersController < ApplicationController

 
def index
  @users = ProjectUser.where("name like ?", "%#{params[:q]}%")
  respond_to do |format|
    format.html
    format.json { render :json => @users.map(&:attributes) }
  end
end



 def assign
  @task_id = params[:task_id]
  @projectid = params[:id]
  @userid = params[:user_id]
  @newUser=TaskUser.create(:user_id => @userid , :task_id => @task_id)


  redirect_to(:controller => 'tasks' ,:action => 'getProjectMembers' , :id => params[:task_id] , :project_id => params[:id])
end 

end 