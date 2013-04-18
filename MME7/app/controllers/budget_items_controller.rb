class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #Inputs:project_id and Outputs:all  budgetitems 
  #Returs: Array of Budget Items
  def viewAllBI 
      @project = Project.find(params[:id])
    	@budget_items = BudgetItem.find(:all,:conditions => {:project_id => params[:id]})
  end
end

