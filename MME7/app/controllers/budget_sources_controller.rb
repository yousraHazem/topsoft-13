class BudgetSourcesController < ApplicationController

def index
	@sources = BudgetSource.all
end


end
