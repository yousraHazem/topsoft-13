
class BudgetSourcesController < ApplicationController

def list
    #authorized by sarah ahmed id:22-1278
    #list all the budget sources
	@sources = BudgetSource.search(params[:search])
end

def show
	@source = BudgetSource.find(params[:source_id])
end

end
