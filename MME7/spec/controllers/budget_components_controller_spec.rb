require 'spec_helper'

describe BudgetComponentsController do

  def valid_attributes
    {:name => 'Market', :unit_price => 2 , :quantity_purchased => 10, :budget_item_id=> 1, :total_quantity => 10 , :status=>"Approved", :total=>20, :spent=>20}
  end

  def invalid_attributes
   {:name => 'Market', :unit_price => 2 , :budget_item_id=> 1, :quantity_purchased => 4, :total_quantity => 1 , :status=>"Pending", :total=>2, :spent=>8}
  end

  def update_attributes
  {:name => 'Market', :unit_price => 3 ,:total_quantity => 10 , :quantity_purchased => 10, :total_quantity => 10 , :status=>"Approved", :total=>30, :spent=>30}
   end

     describe "GET list" do
      it "assigns all components as @components" do
      item = BudgetItem.new
      BudgetItem.should_receive(:find).and_return(item)
      components = BudgetComponent.create! valid_attributes
      get :list, {:id => 1}
      puts "components"
      puts  :components
      assigns(:components).should eq([components])

      end
      end

    describe "GET edit" do
      it "assigns the requested budget_component as @component" do
      component = BudgetComponent.create! valid_attributes
      get :edit, {:id => component.to_param}
      assigns(:component).should eq(component)
      end
      end


 
     describe "POST create" do
        describe "with valid params" do
        it "creates a new BudgetComponent" do
        expect {
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        #get :find_similar, {:id => '1'}
        post :create, {:component => valid_attributes}  
        }.to change(BudgetComponent, :count).by(1)
        end

      it "assigns a newly created budgetcomponent as @budgetcomponent" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        #get :find_similar, {:id => '1'}
        post :create, {:component => valid_attributes}
        assigns(:component).should be_a(BudgetComponent)
        assigns(:component).should be_persisted
      end

      it "redirects to the created budgetcomponent" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        #get :find_similar, {:id => '1'}
        post :create, {:component => valid_attributes}
        response.should redirect_to(:action=>'list')
      end
    end


    describe "with invalid params" do
      it "assigns a newly created but unsaved budgetcomponent as @budgetcomponent" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        BudgetComponent.any_instance.stub(:save).and_return(false)
        post :create, {:component => invalid_attributes}
        assigns(:component).should be_a_new(BudgetComponent)
      end

      it "re-renders the 'new' template" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetComponent.any_instance.stub(:save).and_return(false)
        post :create, {:component => invalid_attributes}
        response.should render_template("new")
      end
    end
  end


describe "PUT update" do
    describe "with valid params" do
      it "updates the requested budget_component" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        component = BudgetComponent.create! valid_attributes
        put :update, {:id => component.to_param, :component =>update_attributes}
      end

      it "assigns the requested budget_component as @component %>" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        component = BudgetComponent.create! valid_attributes
        put :update, {:id => component.to_param, :component => valid_attributes}
        assigns(:component).should eq(component)
      end

      it "redirects to the list page" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        component = BudgetComponent.create! valid_attributes
        put :update, {:id => component.to_param, :component => valid_attributes}
        response.should redirect_to(:action=>'list')
      end
    end

    describe "with invalid params" do
      it "assigns the budget_component as @component %>" do
        item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        component = BudgetComponent.create! valid_attributes
        BudgetComponent.any_instance.stub(:save).and_return(false)
        put :update, {:id => component.to_param, :component => invalid_attributes}
        assigns(:component).should eq(component)
      end

      it "re-renders the 'edit' template" do
       item = BudgetItem.new
        BudgetItem.should_receive(:find).and_return(item)
        component = BudgetComponent.create! valid_attributes
        BudgetComponent.any_instance.stub(:save).and_return(false)
        put :update, {:id => component.to_param, :component => invalid_attributes}
        response.should render_template("edit")
      end
    end
  end


     describe "DELETE destroy" do
    it "destroys the requested budget_component" do
      item = BudgetItem.new
      BudgetItem.should_receive(:find).and_return(item)
      component = BudgetComponent.create! valid_attributes
      expect {
        delete :destroy, {:id => component.to_param}
      }.to change(BudgetComponent, :count).by(-1)
    end

    it "redirects to the budget_components list" do
      item = BudgetItem.new
      BudgetItem.should_receive(:find).and_return(item)
      component = BudgetComponent.create! valid_attributes
      delete :destroy, {:id => component.to_param}
      response.should redirect_to(:action=>'list')
    end

  end
end
