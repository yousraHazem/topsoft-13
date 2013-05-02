require 'spec_helper'


describe BudgetSourcesController do
	def valid_attributes
        {:name => "Pepsi" , :amount => 1000}
	end

	def invalid_attributes
        {:name => "" , :amount => 1000}
	end

	def update_attributes
         {:name => "Pepsi" , :amount => 100}
	end
	describe "GET new" do
		it "assigns a new BudgetSource as @budgetsource" do
			get :new
			assigns(:budget_source).should be_a_new(BudgetSource)
		end
	end
	describe "GET edit" do
			it "assigns the requested budget_source as @budget_source" do
				budget_source = BudgetSource.create! valid_attributes
				get :edit, {:id => budget_source.to_param}
				assigns(:budget_source).should eq(budget_source)
			end
	end
	describe "POST create" do
		describe "with valid params" do
			it "creates a new budget_source" do
				expect {
				post :create, {:budget_source => valid_attributes}
				}.to change(BudgetSource , :count).by (1)
			end

			it "redirects to the list" do
				post :create, {:budget_source => valid_attributes}
				response.should redirect_to( 'http://test.host/budget_source_projects/addamount/1')

			end
		end
<<<<<<< HEAD

		describe "with invalid params" do
			it "assigns a newly created but unsaved budget_source as @budget_source" do
				BudgetSource.any_instance.stub(:save).and_return(false)
				post :create, {:budget_source => invalid_attributes}
				assigns(:budget_source).should be_a_new(BudgetSource)
		    end


			it "renders the 'new' template" do
				BudgetSource.any_instance.stub(:save).and_return(false)
				post :create, {:budget_source => invalid_attributes}
				response.should render_template("new")
			end
		end
	end


=======

		describe "with invalid params" do
			it "assigns a newly created but unsaved budget_source as @budget_source" do
				BudgetSource.any_instance.stub(:save).and_return(false)
				post :create, {:budget_source => invalid_attributes}
				assigns(:budget_source).should be_a_new(BudgetSource)
		    end


			it "renders the 'new' template" do
				BudgetSource.any_instance.stub(:save).and_return(false)
				post :create, {:budget_source => invalid_attributes}
				response.should render_template("new")
			end
		end
	end


>>>>>>> master
	describe "GET list" do
      it "assigns all sources as @sources" do
      	sources = BudgetSource.create! valid_attributes
      	get :list
      	assigns(:sources).should eq([sources])
      end
<<<<<<< HEAD
     end
=======

    end  


>>>>>>> master

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested budget_source" do
				budget_source = BudgetSource.create! valid_attributes
				put :update, {:id => budget_source.to_param, :budget_source => update_attributes }
			end
			it "assigns the requested budget_source as @budget_source" do
				budget_source = BudgetSource.create! valid_attributes
				put :update, {:id => budget_source.to_param, :budget_source => valid_attributes}
				assigns(:budget_source).should eq(budget_source)
			end

			it "redirects to the list" do
				post :create, {:budget_source => valid_attributes}
				response.should redirect_to( 'http://test.host/budget_source_projects/addamount/1')
			end
	    end
    end
end