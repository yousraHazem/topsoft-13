class BudgetItemsController < ApplicationController
	def list 
		@budget_items = BudgetItem.all
	end 
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new 
		@id = params[:id]
		@budget_item = BudgetItem.new
		@project = params[:id]
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 
	def create 
		#@id = params[:id]
		@budget_item = BudgetItem.new(params[:budget_item])
		if @budget_item.save
	    end
			redirect_to(:controller => 'budget_items',:action => 'viewAllBI',:id=> @budget_item.project_id)
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
		else
			render('edit')
		end

#Authored by Toka Omar  id:22-1925
#this method has no inputs and outputs: the operational budgetitems of 
#the current project being viewd 
#the method returs a list of operational budgetitems a guest could see  
    def viewoperationalBI
    	#@id = params[:id]
    	@budget_items = BudgetItem.find(:all, :conditions => {:operational =>true,
    		:project_id => params[:id]}) #@id
  		#@project_name = Project.find(params[:id]) #@id
    end

#Authored by Toka Omar  id:22-1925
#this method has no inputs and outputs: the all  budgetitems 
#the method returs a list of operational budgetitems the admin or user can view 
    def viewAllBI 
    	#@id = params[:id]
    	@budget_items = BudgetItem.find(:all, 
    		:conditions => {:project_id => 1})
    	#@project_name = Project.find(params[:id])
    end
end

