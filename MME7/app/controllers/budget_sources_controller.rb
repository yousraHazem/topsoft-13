class BudgetSourcesController < ApplicationController


def list 
		@budget_sources = BudgetSource.all
    
	end 

#Author :yasmin Mahmoud This method creates a new instance of budget source and it has no arguments and return nothing 
	def new
		@budget_source = BudgetSource.new
	end
#Author :yasmin Mahmoud 22-1787 This method creates a  budget source with the parametres given from the user and it has no returns
	def create 
		@budget_source = BudgetSource.new(params[:budget_source])
		if @budget_source.save
			redirect_to(:action => 'list')
		else
			render('new')

		end
	end
#Author :yasmin Mahmoud 22-1787 This method finds budget source with a given id and it has no arguments and return nothing 
	def edit
    @budget_source = BudgetSource.find(params[:id])
  	end
#Author :yasmin Mahmoud This method updates a budget source with the parametres given from the user and it has no returns
  	def update
      @budget_source = BudgetSource.find(params[:id])
    if @budget_source.update_attributes(params[:budget_source])
      flash[:notice] = "Project successfully updated"
      redirect_to(:action => 'list') 
    else
       render('edit')
        
    end
  end
#Author :yasmin Mahmoud 22-1787 This method finds budget source with a given id and it has no arguments and return nothing 
  	def delete
      @budget_source = BudgetSource.find(params[:id])
    end
    #Author :yasmin Mahmoud  22-1787 This method deletes a budget source it has no returns

    def destroy
      BudgetSource.find(params[:id]).destroy
      redirect_to(:action => 'list')
    end

end