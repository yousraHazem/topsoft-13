#encoding: UTF-8
class UsersController < ApplicationController
  #Author: Donia Amer Shaarawy 22-0270
  #show is a method that takes in  the user.id and returns the groupUser record, where its user.id = current_user.id
  def show
   @user = User.find(params[:id])
   @current_user = current_user
   @groupusers = GroupUser.find(:all, 
   :conditions => {:user_id => @current_user}, 
   :order => "group_id ASC")
   @projectusers = ProjectUser.find(:all,:conditions => {:user_id => @current_user})
  end
  #Author: Donia Amer Shaarawy 22-0270
  #new just calls on a new record returns a new record 
  def new
   @user = User.new
  end
  #Author: Donia Amer Shaarawy 22-0270
  #create adds a new record in the table with all the attributes also in this create takes in the attributes of
  # the user and returns a new record for a new user 
  def create
   @user = User.new(params[:user])
     if @user.save
     flash[:success] = "مرحب بيك فى ؤمن االماء حيه"
     redirect_to :controller => 'sessions', :action => 'new'
    else
     render "new"
    end
 end 

 
 # Author: May Badr 22-0579
 # The index method is used in  the autocomplete search
 # Args: name 
 # Returns: the user typed
 def index
    @users = User.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
    format.html
    format.json { render :json => @users.map(&:attributes) }
  end
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

