class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #this method has no inputs and outputs: the all  budgetitems 
  #the method returs a list of operational budgetitems the admin or user can view 
  def viewAllBI 
    	@budget_items = BudgetItem.find(:all,:conditions => {:project_id => 1})
    	#@project_name = Project.find(params[:id])
  end

    #Authored by Toka Omar  id:22-1925
    #this method has no inputs and outputs: the operational budgetitems of 
    #the current project being viewd 
    #the method returs a list of operational budgetitems a guest could see  
    def viewoperationalBI
    	@budget_items = BudgetItem.find(:all,:conditions => {:operational =>true,:project_id => params[:id]})
  		#@project_name = Project.find(params[:id]) #@id
    end
end
