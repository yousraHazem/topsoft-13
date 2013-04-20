#encoding: UTF-8
class GroupUsersController < ApplicationController










	# Author: Sama Akram 22-555
    # ARGS: group.id & current_user.id and returns GroupUser Array to destroy
	def leave
	    @newuser= GroupUser.where(:group_id => params[:id], :user_id => current_user.id)
        redirect_to(:controller => 'groups', :action => 'show', :id => params[:id])
    end
end
