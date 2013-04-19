class BudgetComponentsController < ApplicationController

  
	def index
     list
     render('list')
	end 

	def list
		#authorized by: sarah ahmed id=22-1278 
		#Description: calculates progress bar percentage and gets all the budget components of a certain budget item 
		#returns: a list of budget components
		#Arguments: none
		@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
		@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})
		@item = params[:id]
		@name = BudgetItem.find(@item).name
		@project_id = params[:project_id]
		@components = BudgetComponent.where(:budget_item_id=> params[:id])
		counts = BudgetComponent.where(:budget_item_id=>params[:id], :status=>"اكتمل")
		all = BudgetComponent.where(:budget_item_id=>params[:id])
		count_size = counts.size
		all_size = all.size
		if all_size == 0
			@percent = 0
		else
			@percent = 100*count_size / all_size
	    end
	end

	def create
		#authorized by: sarah ahmed id=22-1278
		#Description: instantiate a new budget component and then updates the spent and total attributes of its budget item
		#returns: none
		#Arguments: none
		@project_id = params[:project_id]
	    @item = params[:id]
	    @budget_item= BudgetItem.find(@item)
		@component = BudgetComponent.new(params[:component])


		if @component.save
			@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
			@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

			@budget_item.update_attributes(:total=>@total,:spent=>@spent)
			redirect_to(:action=>'list',:id=> @item , :project_id=>@project_id )
		else
           render('new')
		end

	end

	def edit
		#authorized by: sarah ahmed id=22-1278
		#Description: gets the budget component of the passed id and view its details in the edit form
		#returns: none
		#Arguments: none
		@item = params[:item_id]
		@project_id = params[:project_id]
		@component = BudgetComponent.find(params[:id])
		#@component = BudgetComponent.find(:all, :conditions=>{:id=>params[:id], :budget_item_id=>@item})
	end

	def update
		#authorized by: sarah ahmed id=22-1278
		#Description: updates the budget component with the new submitted values and then updates the spent and total attributes of the associated budget
		#returns: none
		#Arguments: none
		@item = params[:item_id]
		@project_id = params[:project_id]
		@budget_item= BudgetItem.find(@item)
		@component = BudgetComponent.find(params[:id])

		if @component.update_attributes(params[:component])
			@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
			@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

            @budget_item.update_attributes(:total=>@total, :spent=>@spent)

			redirect_to(:action=>'list', :id=> @item , :project_id=>@project_id )
		else
           render('edit')
		end

    end

	def destroy
		#authorized by: sarah ahmed id=22-1278
		# Description :deletes the component with the passed id and then updates the spent and total attributes of the associated budget
	    #Arguments: none
	    #returns: none
	    @item = params[:item_id]
       
	    BudgetComponent.find(params[:id]).destroy
        
	    @budget_item= BudgetItem.find(@item)
	    @total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
		@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

		@budget_item.update_attributes(:total=>@total, :spent=>@spent)
		
        redirect_to(:action=>'list',:id=> @item , :project_id=>params[:project_id])
	end

end
