class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #Inputs:project_id and Outputs:all  budgetitems 
  #Returs: Array of Budget Items
  def viewAllBI 
      @project = Project.find(1)
    	@budget_items = BudgetItem.find(:all,:conditions => {:project_id => 1})
      @projectuser = ProjectUser.find(1)
  end

end

