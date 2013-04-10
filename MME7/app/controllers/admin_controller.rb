class AdminController < ApplicationController
	layout "admin_master"
	def new
		@admin = User.new
  end

   def create
    @admin = User.find_by_username(params[:username])
    if @admin && @admin.authenticate(params[:password]) 
      session[:user_id] = @admin.id
    
      flash[:success] = "Welcome to MME7!"
      redirect_to :back , :notice => "Logged in!"
    else
      flash[:error] = 'Invalid usern بلانلييتنومملابؤsword combination'
      redirect_to :back  
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
