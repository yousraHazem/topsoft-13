
class BudgetSourcesController < ApplicationController

def list

	@sources = BudgetSource.search(params[:search])
end

def show
	@source = BudgetSource.find(params[:source_id])
end

end
