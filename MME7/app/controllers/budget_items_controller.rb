class BudgetItemsController < ApplicationController
	def list 
		@budget_items = BudgetItem.all
	end 
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new 
		@id = params[:id]
		@budget_item = BudgetItem.new
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 
	def create 
		#@id = params[:id]
		@budget_item = BudgetItem.new(params[:budget_item])
		if @budget_item.save
			redirect_to(:controller => 'projects',:action => 'viewAllBI',:id=> @budget_item.project_id)
		else
			render('new')
		end

	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 

	def edit  
		@budget_item = BudgetItem.find(params[:id])
	end
# Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table 
	def update
		@budget_item = BudgetItem.find(params[:id])
		if @budget_item.update_attributes(params[:budget_item])
			@budget_users = params['budget_item.users'][:id]

			@budget_users.each do |budget_user|
			@user = User.find(@budget_users)
			@budget_assign = @budget_item.users.push(@user)
			end
		redirect_to(:controller => 'projects',:action => 'viewAllBI',:id=> @budget_item.project_id)
		else
			render('edit')

		end
	end
end

