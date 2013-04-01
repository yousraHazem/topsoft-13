class BudgetItemsController < ApplicationController

	def new
		@project = params[:id]
		@item = BudgetItem.new
		@tasks = Task.find(:all,:conditions=>{:project_id=> @project, :assigned=>false})
	end

	def create
		@item = BudgetItem.new(params[:budget_item])
		if @item.save
			flash[:notice] = "Item successfully created"
			
			task_id = @item.task_id
			if !task_id.nil?
			task = Task.find_by_id(task_id)
			  if task.update_attributes(:assigned=>true)
				flash[:notice] = "Task successfully created"
			  else
				flash[:notice] = "Task unsuccessfully created"
				render('new')
			  end
			end

		else
			# flash[:notice] = "Item unsuccessfully created"
            # render('new')
		end

	end
end
