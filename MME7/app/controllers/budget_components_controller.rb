 class BudgetComponentsController < ApplicationController
  	

	def index
     list
     render('list')
	end 

	def list

		#authorized by: sarah ahmed id=22-1278
		#calculates the total amount of the passed budget item
		@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
		#calculated the total spent amount of the passed budget item
		@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})
		#gets the passed id of the budget item
		@item = params[:id]
		@name = BudgetItem.find(@item).name
		@project_id = params[:project_id]
		#gets all the components of the passed budget item
		#@components = BudgetComponent.search(params[:search], @item)
		@components = BudgetComponent.where(:budget_item_id=> params[:id])

		#calculating the progress bar percentage
		counts = BudgetComponent.where(:budget_item_id=>params[:id], :status=>"Approved")
		all = BudgetComponent.where(:budget_item_id=>params[:id])
		count_size = counts.size
		all_size = all.size
		if all_size==0
		@percent = 0
		else
		@percent = 100*count_size / all_size
	    end
	end

	def new
		#authorized by: sarah ahmed id=22-1278
        #gets the passed id of the budget item 
        @project_id = params[:project_id]
		@item = params[:id]
		#initializes a new component
		@component = BudgetComponent.new

	end

	def create
		#authorized by: sarah ahmed id=22-1278
		# get the passed id of the budget item
		@project_id = params[:project_id]
	    @item = params[:id]
	    # finds this budget item
	    @budget_item= BudgetItem.find(@item)
	    # takes the submitted values from the form and creates a new component
		@component = BudgetComponent.new(params[:component])


		if @component.save
            #if the component was successfully saved,it calculates the new total and spent amounts of all the budget components,and update the attributes of the associated budget item with these values
			@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
			@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

			@budget_item.update_attributes(:total=>@total,:spent=>@spent)
			
            #redirect to the list view after saving
			redirect_to(:action=>'list',:id=> @item , :project_id => @project_id)

		else
		   #if the component was not saved, render the "new" page
           render('new')
		end

	end

	def edit
		#authorized by: sarah ahmed id=22-1278
		#gets the passed id of the budget item
		@item = params[:item_id]
		@project_id = params[:project_id]
		#gets the component values
		@component = BudgetComponent.find(params[:id])
		#@component = BudgetComponent.find(:all, :conditions=>{:id=>params[:id], :budget_item_id=>@item})
	end

	def update
		#authorized by: sarah ahmed id=22-1278
		#gets the budget item of the passed id
		@item = params[:item_id]
		@project_id = params[:project_id]
		@budget_item= BudgetItem.find(@item)
		# takes the submitted values from the form and creates a new component
		@component = BudgetComponent.find(params[:id])

		if @component.update_attributes(params[:component])
        #if updating the component attributes was successful,it recalculates the new total and spent amounts of all the budget components,and update the attributes of the associated budget item with these values
			@total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
			@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

            @budget_item.update_attributes(:total=>@total, :spent=>@spent)
			
			redirect_to(:action=>'list', :id=> @item , :project_id=>@project_id )
		else

           render('edit')
		end

    end

	def delete
		#authorized by: sarah ahmed id=22-1278
		#finds the component with the passed id
		@item = params[:item_id]
		@component = BudgetComponent.find(params[:id])
	end

	def destroy
		#authorized by: sarah ahmed id=22-1278
	    @item = params[:item_id]
        #deletes the component with the passed id
	    BudgetComponent.find(params[:id]).destroy
        #gets the budget item of this component, and recalculates the new total and spent amounts of all the budget components,and update the attributes of the associated budget item with these values
	    @budget_item= BudgetItem.find(@item)
	    @total = BudgetComponent.sum(:total, :conditions=>{:budget_item_id=>params[:id]})
		@spent = BudgetComponent.sum(:spent, :conditions=>{:budget_item_id=>params[:id]})

		if @budget_item.update_attributes(:total=>@total, :spent=>@spent)
			flash[:notice] = "Item successfully updated"
		else
		  flash[:notice] = "Item unsuccessfully updated"	
	    end

	    flash[:notice] = "Component successfully destroyed"
        redirect_to(:action=>'list',:id=> @item , :project_id=>@project_id)
	    end

    end

