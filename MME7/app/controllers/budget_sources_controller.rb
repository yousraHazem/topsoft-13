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


def show
	@source = BudgetSource.find(params[:source_id])
end

#Author :yasmin Mahmoud This method creates a new instance of budget source and it has no arguments and return nothing 
	def new
		@budget_source = BudgetSource.new
	end
#Author :yasmin Mahmoud 22-1787 This method creates a  budget source with the parametres given from the user and it has no returns
	def create 
		@budget_source = BudgetSource.new(params[:budget_source])
		if @budget_source.save
			redirect_to(:controller => 'budget_source_projects' , :action => 'addamount' , :id => @budget_source.id)
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
      redirect_to(:controller => 'budget_source_projects' , :action => 'addamount' , :id => @budget_source.id) 
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

