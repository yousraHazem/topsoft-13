class BudgetItemsController < ApplicationController

	def index
      list
      render('list')
	 end 


	 def list	
	 	@items = BudgetItem.all
	 end

	# def edit
	# 	@total = BudgetComponent.sum(:total, :conditions => {:budget_item_id =>params[:id]})
	# 	@item = BudgetItem.find(params[:id])
 #    end

 #    def update
	# 	@item = params[:item_id]
	# 	@item = Budget.find(params[:id])
	# 	if @component.update_attributes(params[:budget_component])
	# 		flash[:notice] = "Component successfully updated"
	# 		redirect_to(:action=>'list', :id=> @item)
	# 	else
	
 #           render('edit')
	# 	end
	# end
end

