
class UsersController < ApplicationController

	# May Atef Badr 22-0579
	# 
	def index
	 @users = User.where("name like ?", "%#{params[:q]}%")
	 	respond_to do |format|
    		format.html
    		format.json { render :json => @users.map(&:attributes) }
  		end
	end


end 
