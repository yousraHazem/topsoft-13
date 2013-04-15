class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #Inputs:project_id and Outputs:all  budgetitems 
  #Returs: Array of Budget Items
  def viewAllBI 
    	@budget_items = BudgetItem.find(:all,:conditions => {:project_id => 1})
  end

end

