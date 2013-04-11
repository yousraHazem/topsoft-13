class AdminController < ApplicationController
	layout "admin_master"
 def show 
  @admin = User.find(params[:id])
 end 
  #Author: Donia Amer Shaarawy 22-0270
  #it takes id from the login and redirect to the page of the admin 
	def new
		@admin = User.new
  end
end
