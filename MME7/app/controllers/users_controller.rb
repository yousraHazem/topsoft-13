class UsersController < ApplicationController
  #Author: Donia Amer Shaarawy 22-0270
  #show is a method that takes in  the user.id and returns the groupUser record, where its user.id = current_user.id
  def show
   @user = User.find(params[:id])
   @current_user = current_user
   @groupusers = GroupUser.find(:all, 
   :conditions => {:user_id => @current_user}, 
   :order => "group_id ASC")
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
     redirect_to :controller => 'sessions', :action => 'new' #, :notice => "Logged in!"
    else
     render "new"
    end
 end 
end