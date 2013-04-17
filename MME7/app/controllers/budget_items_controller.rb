class BudgetItemsController< ApplicationController
	respond_to :html, :json

	def list 
		@items = BudgetItem.all
		@projectid =params[:id]
		#@raised = BudgetSourceProject.sum(:amount , :conditions =>{:project_id => params[:id]})
	end 
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new 
		@project = params[:id]
		@budget_item  = BudgetItem.new
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 
	def create 
		@project = params[:id]
		@budget_item  = BudgetItem.new(params[:budget_item])
		if @budget_item.save
			redirect_to(:action => 'list' , :id => @project)
		else
			redirect_to(:action => 'new' , :item => @budget_item.id ,:id => @project)
		end
	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 

	def edit
		@item = params[:item]
		@project = params[:id]  
		@budget_item  = BudgetItem.find(params[:item])
	end
# Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table 
	def update
		@item = params[:item]
		@project = params[:id]
		@budget_item  = BudgetItem.find(params[:item])
		if @budget_item.update_attributes(params[:budget_item])
			redirect_to(:action => 'list', :id => @project)
		else
			redirect_to(:action => 'edit' , :id => @project)
		end
	end
end