class SessionsController < ApplicationController
  def new
  end
  #Author: Donia Amer Shaarawy 22-0270
  #this is a create to the login part which is it takes in the username 
  #and the password only and saves the id in to a session and commits log in
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    
      flash[:success] = "نرحب في MEM7"
      redirect_to @user, :notice => "دخول"
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end


