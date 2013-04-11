﻿class BudgetItemsController< ApplicationController
	respond_to :html, :json

# Author :Yasmin Mahmoud 22-1787 , Method list shows all the budgetitems in the table
	def list 
		@items = BudgetItem.all
		@projectid =params[:id]
		#@raised = BudgetSourceProject.sum(:amount , :conditions =>{:project_id => params[:id]})
	end 
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new 
		id = params[:id]
		@budget_item  = BudgetItem.new
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 
	def create 
		#@id = params[:id]
		@budget_item  = BudgetItem.new(params[:budget_item])
		if @budget_item .save
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 

	def edit  
		@budget_item  = BudgetItem.find(params[:id])
	end
# Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table 
	def update
		@budget_item  = BudgetItem.find(params[:id])
		@budget_item .update_attributes(params[:budget_item])
		respond_with @budget_item 
	end
end