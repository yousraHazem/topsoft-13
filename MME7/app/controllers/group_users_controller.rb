#encoding: UTF-8
class GroupUsersController < ApplicationController
# Author Mariam Ismail
# This method adds the user to a group
# it takes the user ID and returns nothing it only adds a record it the groupusers table
    def join
        @group_id = params[:id]
        @user_id = current_user.id
        @newuser= GroupUser.new(:group_id => @group_id, :user_id => @user_id)
        @newuser.save
        redirect_to(:controller => 'groups', :action => 'show', :id => @group_id)
    end


# Author: Sama Akram
# this method allows a group member to leave the group
# ARGS: group.id & current_user.id and returns GroupUser Array to destroy
  def leave
      @guser= GroupUser.where(:group_id => params[:id], :user_id => current_user.id)
      @guser.destroy_all
        redirect_to(:controller => 'groups', :action => 'show', :id => params[:id])
    end

  #Author Riham Gamal 22-3871
  #Arguments group_id
  #return all GroupUsers in @members array
  def index
    @group = Group.find(params[:id])
    @members = GroupUser.where(:group_id => params[:id])
  end

  #Author Riham Gamal 22-3871
  #Arguments group_id, user_id
  #return GroupUser
  def promoteMembers
    @groupuser = GroupUser.where(:group_id => params[:group_id], :user_id => params[:user_id])
    @user = GroupUser.find(@groupuser)
    if @user.isCreator == true
      @user.isCreator = false
    else 
      @user.isCreator = true
    end
    if @user.save
      redirect_to(:controller => 'group_users', :action => 'index', :id => params[:group_id])
    else
      redirect_to(:controller => 'groups', :action => 'show', :id => params[:group_id])
    end           
  end
  
end