class ProjectUsersController < ApplicationController

	def index
  @users = ProjectUser.where("name like ?", "%#{params[:q]}%")
  respond_to do |format|
    format.html
    format.json { render :json => @users.map(&:attributes) }
  end
end
	
end
