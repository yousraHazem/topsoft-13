class BudgetSourcesController < ApplicationController


def index

	@sources = BudgetSource.search(params[:search])
end

def list 
		@budget_sources = BudgetSource.all
    
	end 

	def new
		@budget_source = BudgetSource.new
	end

	def create 
		@budget_source = BudgetSource.new(params[:budget_source])
		if @budget_source.save
			redirect_to(:action => 'list')
		else
			render('new')

		end
	end

	def edit
    @budget_source = BudgetSource.find(params[:id])
  end

  def update
      @budget_source = BudgetSource.find(params[:id])
    if @budget_source.update_attributes(params[:budget_source])
      flash[:notice] = "Project successfully updated"
      redirect_to(:action => 'list') 
    else
       flash[:notice] = "Project could not be updated"
        
    end
  end

  def delete
      @budget_source = BudgetSource.find(params[:id])
    end
    
    def destroy
      BudgetSource.find(params[:id]).destroy
      redirect_to(:action => 'list')
    end

end
