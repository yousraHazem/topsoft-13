  class GroupUsersController < ApplicationController


def show
	
   @groupuser_id = params[:id]
	@groupusers = GroupUser.find(params[:id])


 end
	
   
  end

