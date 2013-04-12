class UsersController < ApplicationController
	# Riham Gamal 22-3871
	def index
		 @users = User.where("name like ?", "%#{params[:q]}%")
		 respond_to do |format|
		 format.html
		 format.json { render :json => @users.map(&:attributes)}
         end		
	end
 #Author: Donia Amer Shaarawy 22-0270
 #show is a method that when you recive the userid  and find the user with this id and display his work
 #and the list of groups he is in 
	def show
   @user = User.find(params[:id])
   @current_user = current_user
   @groupusers = GroupUser.find(:all, 
   :conditions => {:user_id => @current_user}, 
   :order => "group_id ASC")
  end
 #Author: Donia Amer Shaarawy 22-0270
 #new just calls on a new record
  def new
   @user = User.new
  end
 #Author: Donia Amer Shaarawy 22-0270
 #create adds a new record in the table with all the attributes also in this create 
 #we make the user sign up so we go to the log in page and like that we created a new user in the database
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