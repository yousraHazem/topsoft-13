class BudgetItemsController < ApplicationController

#first I need to create instance of user 
#then create instance of BudgetItem 
#the push (assign user to BI)


	def assign_member
	@budget_item = BudgetItem.find(params[:budget_id] )
	@user = User.find(params[:user_id])
	@budget_item_user = @budget_item.users.push(@user)
	flash[:notice]= "member assigned"
	end 
end
