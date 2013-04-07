class BudgetItemsController < ApplicationController

	def index
      list
       render('list')
	 end 


	def list
		#authorized by sarah ahmed id:22-1278
		#sums up the total and spent amounts and of all budget items
        @total_budget = BudgetItem.sum(:total ,:conditions=>{:project_id=>params[:id]})
        @total_spent = BudgetItem.sum(:spent ,:conditions=>{:project_id=>params[:id]})
		@items = BudgetItem.where(:project_id=>params[:id])
	 end

end

