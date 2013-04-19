class SessionsController < ApplicationController
  #Author: Donia Amer Shaarwy
  #takes in the username and password to do the login method 
  #return a session with the user id and redirect it to the user page
  def new
  end
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     flash[:success] = "welcome"
      if @user.isAdmin?
       redirect_to(:controller=>'admin',:action=>'show' ,:id=> @user.id)
      else
       redirect_to @user, :notice => "logged in"
      end 
    else
     flash[:error] = 'wrong username or password'
     render 'new'
    end
  end
 #Author: Donia Amer Shaarwy
 #takes in the session id and trunes it in nil and redirect to the home page 
 def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "logged out"
  end

end


