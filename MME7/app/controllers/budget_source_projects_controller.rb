class BudgetSourceProjectsController < ApplicationController
	def addamount 
		@id = params[:id]
		@budgets = BudgetSourceProject.where(:budget_source_id => params[:id])
	end

	def create
		@id = params[:id]
		@list = params[:budget_source_project]
		@list.each do |key, value|
			@add = BudgetSourceProject.where(:budget_source_id => @id , :project_id  => key)
			@add.update_all(:amount => value)

	end
	redirect_to(:controller => 'budget_sources', :action => 'list')
end
end
