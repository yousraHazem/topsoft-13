#encoding: UTF-8
class GroupUsersController < ApplicationController

#Author Mariam Ismail, 22-3456
#This method adds the user to the group and checks if he's an already exisiting member or not
  def join

    @group_id = params[:id]
    @user_id = current_user.id
    @newuser= GroupUser.new(:group_id => @group_id, :user_id => @user_id)
    @newuser.save
    redirect_to(:controller => 'groups', :action => 'show', :id => @group_id)
  end

	# Author: Sama Akram 22-555
	# this method allows a group member to leave the group
  # ARGS: group.id & current_user.id and returns GroupUser Array to destroy
	def leave
	    @guser= GroupUser.where(:group_id => params[:id], :user_id => current_user.id)
	    @guser.destroy_all
        redirect_to(:controller => 'groups', :action => 'show', :id => params[:id])
    end
end
