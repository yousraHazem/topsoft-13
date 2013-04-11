class UsersController < ApplicationController

 def assign
  @task_id = params[:task_id]
  @projectid = params[:id]
  @userid = params[:user_id]
  @taskuser =TaskUser.new(:user_id => @userid , :task_id => @task_id)
  @taskuser.save
  redirect_to(:controller => 'tasks' ,:action => 'getProjectMembers' ,:task_id => @task_id , :project_id => @projectid)
end


	def index
		 @users = User.where("name like ?", "%#{params[:q]}%")
		 respond_to do |format|
		 format.html
		 format.json { render :json => @users.map(&:attributes)}
     end		
	end

end 

