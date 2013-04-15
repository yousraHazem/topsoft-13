class UsersController < ApplicationController

	# Riham Gamal 22-3871
	def index
		 @users = User.where("name like ?", "%#{params[:q]}%")
		 respond_to do |format|
		 format.html
		 format.json { render :json => @users.map(&:attributes)}
         end		
	end
end

