class BudgetItemsController < ApplicationController

	def new
		@item = BudgetItem.new
		@tasks = Task.find(:all,:conditions=>{:project_id=>params[:id]})
		"NOT EXISTS (SELECT * FROM budget_items WHERE cities_stores.store_type = stores.store_type)"
		#@tasks = 
		#@tasks = Task.where(:project_id=> params[:id])
		#@tasks = Task.all
	end

	def create
		
		@item = BudgetItem.new(params[:budget_item])
		if @item.save
			flash[:notice] = "Item successfully created"
			#redirect_to(:action=>'list')
		else
			flash[:notice] = "Item unsuccessfully created"
           render('new')
		end

	end
end
