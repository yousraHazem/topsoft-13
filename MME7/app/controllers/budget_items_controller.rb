class BudgetItemsController < ApplicationController
# Author :Yasmin Mahmoud 22-1787 , Method list shows all the budgetitems in the table
	def list 
	# if current_user
	 #    @project = params[:project_id]
		# @items = BudgetItem.where(:project_id => params[:project_id])
		# #@raised = BudgetSourceProject.sum(:amount , :conditions=>{:project_id => params[:project_id]})
		# @total_budget = BudgetItem.sum(:total , :conditions => {:project_id => params[:project_id]})
		# @total_spent = BudgetItem.sum(:spent , :conditions => {:project_id => params[:project_id]})
		# @project_name = Project.find(params[:project_id])
		 @tasks = Task.find(:all,:conditions=>{:project_id=> @project, :assigned=>false})
		 @items = BudgetItem.all
	# else
		#Authored by Toka Omar  id:22-1925
        #this method has no inputs and outputs: the operational budgetitems of 
        #the current project being viewd 
        #the method returs a list of operational budgetitems a guest could see  


	# 	  @project_id = params[:project_id]
 #        @items = BudgetItem.find(:all, :conditions => {:operational =>true,:project_id => @project_id})
 #        @project_name = Project.find(@project_id)
          #@raised = BudgetSourceProject.sum(:amount , :conditions=>{:project_id => params[:id]})
		  #@total_budget = BudgetItem.sum(:total , :conditions => {:project_id => params[:id]})
		  #@total_spent = BudgetItem.sum(:spent , :conditions => {:project_id => params[:id]})
		  #@tasks = Task.find(:all,:conditions=>{:project_id=> @project, :assigned=>false})
	# end


	end 
# Author :Yasmin Mahmoud 22-1787 , Method new takes the id of the project and generates a new instanse of the budgetitem
	def new 

		#@id = params[:id]
		@budget_item = BudgetItem.new

	end 
# Author :Yasmin Mahmoud 22-1787 , Method create takes attributes from the new form and enters it in the table 
	def create 

		@project = params[:project_id]
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
			redirect_to(:action => 'list' , :project_id => @project)
		else
			render('new')

		end

	end

	# Author :Yasmin Mahmoud 22-1787 , Method edit finds the budgetitem with the id taken from the params 

	def edit  
		@budget_item = BudgetItem.find(params[:id])
		@project = params[:project_id]
		@tasks = Task.find(:all,:conditions=>{:project_id=> @project, :assigned=>false })

		@task_id = @budget_item.task_id
		@oldtask = Task.find_by_id(@task_id)
		if !@oldtask.nil?
		@tasks << @oldtask
	    end
	end

   # Author :Yasmin Mahmoud 22-1787 , Method update takes attributes from the edit form and updates the table 
	def update
		@project = params[:project_id]
		@budget_item = BudgetItem.find(params[:id])
		@task_id = params[:task_id]

		if @budget_item.update_attributes(params[:budget_item])
			
            if !@task_id.nil?
	        @old_task = Task.find(@task_id)
	        @old_task.update_attributes(:assigned=>false)
	        end
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
			redirect_to(:action => 'list', :project_id => @project)

		else
			render('edit')
		end
	end
end