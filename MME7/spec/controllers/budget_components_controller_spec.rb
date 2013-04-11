require 'spec_helper'

describe BudgetComponentsController do

  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => 'Market', :unit_price => 2 , :quantity_purchased => 10, :budget_item_id=> 1, :total_quantity => 10 , :status=>"Approved", :total=>20, :spent=>20}
  end

  def invalid_attributes
   {:name => 'Market', :unit_price => 2 , :budget_item_id=> 1, :quantity_purchased => 4, :total_quantity => 1 , :status=>"Pending", :total=>2, :spent=>8}
  end

  def update_attributes
  {:name => 'Market', :unit_price => 3 ,:total_quantity => 10 , :quantity_purchased => 10, :total_quantity => 10 , :status=>"Approved", :total=>30, :spent=>30}
   end



 describe "POST create" do
    describe "with valid params" do
      it "creates a new BudgetComponent" do
        expect {
          post :create, {:budgetcomponent => valid_attributes}
          put :create, {:id => budgetitem.to_param, :budgetitem => {:name => "kkk"}}
        }.to change(BudgetComponent, :count).by(1)
      end

      it "assigns a newly created budgetcomponent as @budgetcomponent" do
        post :create, {:budgetcomponent => valid_attributes}
        assigns(:budgetcomponent).should be_a(BudgetComponent)
        assigns(:budgetcomponent).should be_persisted
      end

      it "redirects to the created budgetcomponent" do
        post :create, {:budgetcomponent => valid_attributes}
        response.should redirect_to(:action=>'list')
      end
    end


    describe "with invalid params" do
      it "assigns a newly created but unsaved budgetcomponent as @budgetcomponent" do
        BudgetComponent.any_instance.stub(:save).and_return(false)
        post :create, {:budgetcomponent => invalid_attributes}
        assigns(:budgetcomponent).should be_a_new(Budgetcomponent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Budgetcomponent.any_instance.stub(:save).and_return(false)
        post :create, {:budgetcomponent => invalid_attributes}
        response.should render_template("new")
      end
    end
  end
  end

