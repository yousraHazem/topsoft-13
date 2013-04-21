#encoding: UTF-8
class GroupUsersController < ApplicationController
#Author Mariam Ismail, 22-3456
#This method adds the user to a group
# it takes the user ID and returns nothing it only adds a record it the groupusers table
  def join
    @group_id = params[:id]
    @user_id = current_user.id
    @newuser= GroupUser.new(:group_id => @group_id, :user_id => @user_id)
    if @newuser.save
    	flash[:notice] = "أنت الآن عدو في هذه المجموعة "
    end
    redirect_to(:controller => 'groups', :action => 'show', :id => @group_id)
  end
end