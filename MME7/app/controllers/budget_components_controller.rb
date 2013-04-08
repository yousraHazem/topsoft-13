class BudgetComponentsController < ApplicationController
    	

	def index
     list
      render('list')
	end 

	def list
		@total = BudgetComponent.sum(:total)
		@spent = BudgetComponent.sum(:spent)
		@item = params[:id]
		@components = BudgetComponent.where(:budget_item_id=> params[:id])
	
	end

	def show
	@component = BudgetComponent.find(params[:id])	
	end

	def new
		@item = params[:id]
		@component = BudgetComponent.new #(:name=>'default')
		
	end

	def create
	    @item = params[:id]
	    @budget_item= BudgetItem.find(@item)
		@component = BudgetComponent.new(params[:budget_component])

		if @component.save

			@total = BudgetComponent.sum(:total)
			@spent = BudgetComponent.sum(:spent)

			if @budget_item.update_attributes(:total=>@total,:spent=>@spent)
			  flash[:notice] = "Item successfully updated"
		    else
		       flash[:notice] = "Item unsuccessfully updated"	
	        end



			flash[:notice] = "Component successfully created"
			redirect_to(:action=>'list',:id=> @item)
		else
           render('new')
		end

	end

	def edit
		@item = params[:item_id]
		@component = BudgetComponent.find(params[:id])	
	end

	def update
		@item = params[:item_id]
		@budget_item= BudgetItem.find(@item)
		@component = BudgetComponent.find(params[:id])

		if @component.update_attributes(params[:budget_component])

			flash[:notice] = "Component successfully updated"
			@total = BudgetComponent.sum(:total)
			@spent = BudgetComponent.sum(:spent)

            if @budget_item.update_attributes(:total=>@total, :spent=>@spent)
			   flash[:notice] = "Item successfully updated"
		    else
		       flash[:notice] = "Item unsuccessfully updated"	
	        end

			redirect_to(:action=>'list', :id=> @item)
		else
	
           render('edit')
		end
		
    end

	def delete
		@item = params[:item_id]
		@component = BudgetComponent.find(params[:id])
	end

	def destroy
	@item = params[:item_id]

	BudgetComponent.find(params[:id]).destroy

	 @budget_item= BudgetItem.find(@item)
	 @total = BudgetComponent.sum(:total)
	 @spent = BudgetComponent.sum(:spent)

		if @budget_item.update_attributes(:total=>@total, :spent=>@spent)
			flash[:notice] = "Item successfully updated"
		else
		  flash[:notice] = "Item unsuccessfully updated"	
	    end

	flash[:notice] = "Component successfully destroyed"
    redirect_to(:action=>'list',:id=> @item)
	end



end


