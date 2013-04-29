class BudgetItemsController < ApplicationController
  #Authored by Toka Omar  id:22-1925
  #Author :Yasmin Mahmoud 22-1787
  #Inputs:project_id and Outputs:all  budgetitems 
  #Returs: Array of Budget Items
	def list 
		@project =Project.find(params[:id])
		if loged_in?
		@current_user = current_user.id
		@items = BudgetItem.find(:all,:conditions => {:project_id => params[:id]})
	    else 
	    @items = BudgetItem.find(:all,:conditions => {:operational =>true,:project_id => params[:id]})
	    end 
		# @total_budget = BudgetItem.sum(:total , :conditions => {:project_id => params[:id]})
		# @total_spent = BudgetItem.sum(:spent , :conditions => {:project_id => params[:id]})
		#@project_name = Project.find(params[:id])
		 @tasks = Task.find(:all,:conditions=>{:project_id=> 1, :assigned=>false})
		#@raised = BudgetSourceProject.sum(:amount , :conditions =>{:project_id => params[:id]})
	end 

# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem no returns or arguments 
	def new 
		@project = params[:id]
		@budget_item  = BudgetItem.new
		@tasks = Task.find(:all,:conditions=>{:project_id=> 1, :assigned=>false})
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table no returns or arguments 
 # Author: Sarah Ahmed 22-1278 , enter the selected task from the drop down table and assign it to true 
 #parameters: none , returns :none
	def create 
		@project = params[:id]
		@budget_item  = BudgetItem.new(params[:budget_item])
		if @budget_item.save
            
            taskid = @budget_item.task_id
			if !taskid.nil?
			task = Task.find_by_id(taskid)
			  if task.update_attributes(:assigned=>true)
				flash[:notice] = "Task successfully created"
			  else
				flash[:notice] = "Task unsuccessfully created"
				render('new')
			  end
			end

			redirect_to(:action => 'list' , :id => @project)
		else
			render ('new')
		end
	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 
    # Author: Sarah Ahmed 22-1278 , gets the tasks that aren't assigned to any item and adds to it the previously selected one
	def edit
		@item = params[:item]
		@project = params[:id]  
		@budget_item  = BudgetItem.find(params[:item])

		@tasks = Task.find(:all,:conditions=>{:project_id=> 1 , :assigned=>false })
		@task_id = @budget_item.task_id
		@oldtask = Task.find_by_id(@task_id)
		if !@oldtask.nil?
		@tasks << @oldtask
	    end
	end


   # Author: Sarah Ahmed 22-1278 , updates the selected task from the dropdown 
   # parameters: none , returns :none 
   # Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table no returns or arguments 
	def update
		@item = params[:item]
		@project = params[:id]
		@budget_item  = BudgetItem.find(params[:item])
		@task_id = params[:task_id]

		if @budget_item.update_attributes(params[:budget_item])

			if !@task_id.nil?
	        @old_task = Task.find(@task_id)
	        @old_task.update_attributes(:assigned=>false)
	        end

            taskid = @budget_item.task_id
			if !taskid.nil?
			task = Task.find_by_id(taskid)
			task.update_attributes(:assigned=>true)
			end

			redirect_to(:action => 'list', :id => @project)

		else
			render('edit')
		end
	end
end

