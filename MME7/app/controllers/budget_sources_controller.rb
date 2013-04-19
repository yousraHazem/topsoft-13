class BudgetSourcesController < ApplicationController

def list
    #authorized by sarah ahmed id:22-1278
    #description : searches for all the budget sources , or specific ones if specified in the serach textbox
    #returns: list of budget sources 
    #arguments: none
	@sources = BudgetSource.search(params[:search])
end

def show
	@source = BudgetSource.find(params[:source_id])
end
end
