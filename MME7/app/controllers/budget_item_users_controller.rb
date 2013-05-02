#encoding: UTF-8
class BudgetItemUsersController < ApplicationController
  # Author : Toka Abdelgabar 22-1925
  # Args : takes budget_item_id, project_id,user_id
  # Returns : budget_item_id, project_id 
  # Explanation : this method assigns members to task , create a new budget item user
  def assign
  @budget_item_id = params[:budget_item_id]
  @projectid = params[:id]
  @userid = params[:user_id]
  @BIuser =BudgetItemUser.new(:user_id => @userid , :budget_item_id => @budget_item_id)
  @BIuser.save
  redirect_to(:controller => 'budget_items' ,:action => 'getProjectMembers' ,:budget_item_id => @budget_item_id , :project_id => @projectid)
  end

  #Author : Salma El -Ruby 22-4649
  # Args : takes task_id, project_id,user_id
  # Returns : task_id, project_id 
  # Explanation : this method assigns members to task , create a new task user 
  def unassign
  @budget_item_id = params[:budget_item_id]
  @userid = params[:user_id]
  @projectid = params[:id]
  BudgetItemUser.where(:user_id => @userid ,:budget_item_id => @budget_item_id ).destroy_all
  redirect_to(:controller => 'budget_items' ,:action => 'getProjectMembers' ,:budget_item_id => @budget_item_id , :project_id => @projectid)
 end

end
