class GroupUsersController < ApplicationController
	def addMember
		@group_id = params[:id]
		@users= User.find(:all)
	end
end 
