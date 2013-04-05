 class GroupUsersController < ApplicationController

#Author Mariam Ismail, 22-3456
#This method adds the user to the group and checks if he's an already exisiting member or not
  def join
        @group_id = params[:id]
       @user_id = params[:user_id]
       @newuser= GroupUser.new(:group_id => @group_id, :user_id => @user_id)
       @newuser.save
     redirect_to(:controller => 'groups', :action => 'show', :id => params[:id])
     
    end

    
  end

