module BudgetItemsHelper
	#Authored by Toka Omar  id:22-1925
  	#this method has no inputs and outputs: the operational budgetitems 
  	#the method returs a list of operational budgetitems a guest could see  
	def view_operational_BI
	return BudgetItem.find(:all, :conditions => {:operational =>true})
    end
end
