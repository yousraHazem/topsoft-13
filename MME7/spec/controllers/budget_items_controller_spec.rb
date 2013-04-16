require 'spec_helper'


describe BudgetItemsController do
	def valid_attributes
        {:name => "Pipe" , :status => 1 , :operational => true , :task_id => 1 , :budget_id =>1, :total => 10 , :spent => 10 ,:project_id => 1}
	end

	def invalid_attributes
        {:name => "" , :status => 1 , :operational => true , :task_id => 1 ,:budget_id =>1, :total => 10 , :spent => 10 ,:project_id => 1}
	end

	def update_attributes
         {:name => "Pipe" , :status => 1 , :operational => false , :task_id => 1 ,:budget_id =>1, :total => 10 , :spent => 10 ,:project_id => 1}
	end
	describe "GET new" do
		it "assigns a new budgetitem as @budgetitem" do
			get :new
			assigns(:budget_item).should be_a_new(BudgetItem)
		end
	end
	describe "GET edit" do
			it "assigns the requested budget_item as @budget_item" do
				budget_item = BudgetItem.create! valid_attributes
				get :edit, {:id => budget_item.to_param}
				assigns(:budget_item).should eq(budget_item)
			end
	end
	describe "POST create" do
		describe "with valid params" do
			it "creates a new BudgetItem" do
				expect {
				post :create, {:budget_item => valid_attributes}
				}.to change(BudgetItem , :count).by (1)
			end

			it "redirects to the list" do
				post :create, {:budget_item => valid_attributes}
				response.should redirect_to( 'http://test.host/budget_items/list')
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved budget_item as @budget_item" do
				BudgetItem.any_instance.stub(:save).and_return(false)
				post :create, {:budget_item => invalid_attributes}
				assigns(:budget_item).should be_a_new(BudgetItem)
		    end


			it "renders the 'new' template" do
				BudgetItem.any_instance.stub(:save).and_return(false)
				post :create, {:budget_item => invalid_attributes}
				response.should render_template("new")
			end
		end
	end

	

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested budget_item" do
				budget_item = BudgetItem.create! valid_attributes
				put :update, {:id => budget_item.to_param, :budget_item => update_attributes }
			end
			it "assigns the requested budget_item as @budget_item" do
				budget_item = BudgetItem.create! valid_attributes
				put :update, {:id => budget_item.to_param, :budget_item => valid_attributes}
				assigns(:budget_item).should eq(budget_item)
			end

			it "redirects to the list" do
				post :create, {:budget_item => valid_attributes}
				subject { response }
			end
	    end
    end
end