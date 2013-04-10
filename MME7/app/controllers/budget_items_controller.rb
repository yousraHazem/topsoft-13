class BudgetItemsController < ApplicationController

# Author :Yasmin Mahmoud 22-1787 , Method list shows all the budgetitems in the table
	def list 
		@items = BudgetItem.all
		@raised = BudgetSourceProject.sum(:amount , :conditions=>{:project_id => params[:id]})
	end 
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new 
		@project = params[:id]
		#@id = params[:id]
		@budget_item = BudgetItem.new
		@tasks = Task.find(:all,:conditions=>{:project_id=> @project, :assigned=>false})
	end

# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 
	def create 
		#@id = params[:id]
		@budget_item = BudgetItem.new(params[:budget_item])
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
			redirect_to(:action => 'list')
		else
			render('new')

		end

	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 

	def edit  
		@budget_item = BudgetItem.find(params[:id])
		@task_id = params[:task_id]
		@project = params[:project_id]
		@tasks = Task.find(:all,:conditions=>{:project_id=> @project, :assigned=>false})
	end
# Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table 
	def update
		@budget_item = BudgetItem.find(params[:id])
		@task_id = params[:task_id]
		if @budget_item.update_attributes(params[:budget_item])


	       
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



			redirect_to(:action => 'list')
		else
			render('edit')

		end
	end
end
