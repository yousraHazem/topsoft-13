#encoding: UTF-8
class AdminController < ApplicationController
	layout "admin_master"
 def show 
  @admin = User.find(params[:id])
 end 
  #Author: Donia Amer Shaarawy 22-0270
  #it takes the id and it shows the user retuns the admin
	def new
		@admin = User.new
  end
 end

