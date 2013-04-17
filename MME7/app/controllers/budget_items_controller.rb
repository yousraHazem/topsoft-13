class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #Inputs:no input and Outputs:all  budgetitems 
  #Returs: Array of Budget Items
  def viewAllBI 
    	@budget_items = BudgetItem.find(:all,:conditions => {:project_id => 1})
  end
   #Authored by Toka Omar  id:22-1925
   #Inputs:no input and Outputs:operational budgetitems 
   #Returs: Array of Budget Items
    def viewoperationalBI
      @project = Project.find(1)
    	@budget_items = BudgetItem.find(:all,:conditions => {:operational =>true,:project_id => 1})
    end
end

