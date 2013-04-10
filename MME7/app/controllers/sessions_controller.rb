class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    
      flash[:success] = "Welcome to MME7!"
      redirect_to @user, :notice => "Logged in!"
    else
      flash[:error] = 'Invalid usern بلانلييتنومملابؤsword combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end


