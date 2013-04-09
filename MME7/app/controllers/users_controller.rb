class UsersController < ApplicationController

 def assign
  @task_id = params[:task_id]
  @projectid = params[:id]
  @userid = params[:user_id]
  @newUser=TaskUser.create(:user_id => @userid , :task_id => @task_id)


   redirect_to(:controller => 'tasks' ,:action => 'getProjectMembers' , :id => params[:task_id] , :project_id => params[:id])

   

end 
def index
	@user = User.where("name like ?", "%#{params[:q]}%")
	
 # @user = User.where("name like ?", "%#{params[:q]}%")
  respond_to do |format|
    format.html
    format.json { render :json => @user.map(&:attributes) }
  end
end
end 