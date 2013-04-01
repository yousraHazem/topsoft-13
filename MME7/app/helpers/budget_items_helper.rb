module BudgetItemsHelper
	def view_operational_BI
	return BudgetItem.find(:all, :conditions => {:operational =>true})
    end
end
