#encoding: utf-8
class ReceiptsController < ApplicationController

	# Author :Yasmin Mahmoud 22-1787 , Method list shows all the budgetitems in the table with the given budget item id 
	def list
		@current_user = current_user
		@project_id = params[:project_id]
		@receipts = Receipt.where(:budget_component_id => params[:id])
	end
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new
		@current_user = current_user
		@id = params[:id]
		@project_id = params[:project_id]
		@receipt = Receipt.new
	end
# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 

	def create 
		@current_user = current_user
		@project_id = params[:project_id]
		@receipt = Receipt.new(params[:receipt])
		if @receipt.save
			redirect_to(:action => 'list' , :id => @receipt.budget_component_id , :project_id=> @project_id)
		else
			render('new')
	end
end
# Author :Yasmin Mahmoud 22-1787 , Method edit finds the receipt with the id taken from the params 

	def edit 
		@current_user = current_user 
		@project_id = params[:project_id]
		@receipt = Receipt.find(params[:id])
	end
# Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table 
	def update
		@current_user = current_user
		@project_id = params[:project_id]
		@receipt = Receipt.find(params[:id])
		if @receipt.update_attributes(params[:receipt])
			redirect_to(:action => 'list', :id => @receipt.budget_component_id , :project_id=> @project_id)
		else
			render('edit')

		end
	end


end
