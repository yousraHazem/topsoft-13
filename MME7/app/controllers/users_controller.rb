class UsersController < ApplicationController
	 def show
    @user = User.find(params[:id])
  end
 def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  if @user.save
   
      flash[:success] = "Welcome to MME7!"
      redirect_to :controller => 'sessions', :action => 'new' #, :notice => "Logged in!"
  else
    render "new"
  end
end
end 