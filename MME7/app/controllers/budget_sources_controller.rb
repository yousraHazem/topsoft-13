class BudgetSourcesController < ApplicationController

def index

	@sources = BudgetSource.search(params[:search])
end


end
