class BudgetSourceProjectsController < ApplicationController
	
	#Author Yasmin Mahmoud 22-1787 this method gets the budget source with a given id 
	#parameters :none
	#returns : none
	def addamount 
		@id = params[:id]
		@budgets = BudgetSourceProject.where(:budget_source_id => params[:id])
	end

#Author: Yasmin Mahmoud 22-1787 this method loops on the text boxes that the user views takes the values and insert into the table 
	def create
		@id = params[:id]
		@list = params[:budget_source_project]
		if !@list.nil?
		@list.each do |key, value|
		@add = BudgetSourceProject.where(:budget_source_id => @id , :project_id  => key)
		@add.update_all(:amount => value)
		end
	redirect_to(:controller => 'budget_sources', :action => 'list')	
		else
	redirect_to(:controller => 'budget_sources', :action => 'list')
	end
		end
	
end
