class BudgetItemsController < ApplicationController

	def index
      list
       render('list')
	 end 


	def list
        @total_budget = BudgetItem.sum(:total)
        @total_spent = BudgetItem.sum(:spent)
		#@items = BudgetItem.where(:project_id=>params[:id])
	 end

end

