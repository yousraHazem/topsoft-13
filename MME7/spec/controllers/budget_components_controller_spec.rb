require 'spec_helper'

# describe BudgetComponentsController do


# 	 # describe "GET #index" do
#   #   it "responds successfully with an HTTP 200 status code" do
#   #     get :index
#   #     expect(response).to be_success
#   #     expect(response.code).to eq(200)
#   #   end

#   #   it "renders the index template" do
#   #     get :index
#   #     expect(response).to render_template("index")
#   #   end

#   #   it "loads all of the budget components of a certain budget item into @components" do
#   #     component1, component2 = BudgetComponent.create!, BudgetComponent.create!
#   #     get :index

#   #     expect(assigns(:components)).to match_array([component1, component2])
#   #   end
#   # end

#   # UPDATE
#     describe "PUT birds/:id" do
#     describe "with valid params" do

#       before(:each) do
#       @budget_component = mock_model(BudgetComponent, :update_attributes => true)
#       BudgetComponent.stub!(:find).with("49").and_return(@budget_component)
#         # @budget_item = mock_model(BudgetItem, :update_attributes => true)
#         # BudgetItem.stub!(:find).with("1").and_return(@budget_item)
#       end
#       it "should find budget component and return object" do
#       BudgetComponent.should_receive(:find).with("49").and_return(@budget_component)
#       put :update, :id => "49", :budget_component => {}
#       end
#         # it "should find budget item and return object" do
#         # BudgetItem.should_receive(:find).with("1").and_return(@budget_item)
#         # put :update, :id => "1", :budget_item => {}
#         # end
#       it "should update the component object's attributes" do
#       @budget_component.should_receive(:update_attributes).and_return(true)
#       put :update, :id => "49", :budget_component  => {}
#       end
#         # it "should update the item object's attributes" do
#         # @budget_item.should_receive(:update_attributes).and_return(true)
#         # put :update, :id => "1", :budget_item  => {}
#         # end
#       it "should have a flash notice" do
#       put :update, :id => "49", :budget_component  => {}
#       flash[:notice].should eql 'Component was successfully updated.'
#       end
#       it "should redirect to the component's list page" do
#       put :update, :id => "49", :budget_component => {}
#       response.should redirect_to(budget_component_url(@budget_componet))
#       end

    
#     end
    
#     describe "with invalid params" do

#       before(:each) do
#       @budget_component = mock_model(BudgetComponent, :update_attributes => false)
#       BudgetComponent.stub!(:find).with("49").and_return(@budget_component)
#       end

#       it "should find budget component and return object" do
#       BudgetComponent.should_receive(:find).with("49").and_return(@budget_component)
#       put :update, :id => "49", :budget_component => {}
#       end

#       it "should update the component object's attributes" do
#       @budget_component.should_receive(:update_attributes).and_return(false)
#       put :update, :id => "49", :budget_component => {}
#       end

#       it "should render the edit form" do
#       put :update, :id => "49", :budget_component => {}
#       response.should render_template('edit')
#       end

#       it "should have a flash notice" do
#       flash[:notice].should_not be_blank
#       end
    
#     end
#   end

# end
# <% module_namespacing do -%>
describe BudgetComponentsController do

  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => 'Market', :unit_price => 2 , :quantity_purchased => 10,:budget_item_id=>1, :total_quantity => 10 , :status=>"Approved", :total=>20, :spent=>20}
  end

  def invalid_attributes
   {:name => 'Market', :unit_price => 2 , :budget_item_id=>1, :quantity_purchased => 4, :total_quantity => 1 , :status=>"Pending", :total=>2, :spent=>8}
  end

  def update_attributes
  {:name => 'Market', :unit_price => 3 ,:total_quantity => 10 , :quantity_purchased => 10, :total_quantity => 10 , :status=>"Approved", :total=>30, :spent=>30}
   end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller. Be sure to keep this updated too.
#   def valid_session
#     {}
#   end

# <% unless options[:singleton] -%>
  # describe "GET index" do
  #   it "assigns all budget_components as @components" do
  #     budget_component = BudgetComponent.create! valid_attributes
  #     get :index
  #     assigns(:budget_components).should eq([budget_component])
  #   end
  # end


  # describe "GET show" do
  #   it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
  #     <%= file_name %> = <%= class_name %>.create! valid_attributes
  #     get :show, {:id => <%= file_name %>.to_param}, valid_session
  #     assigns(:<%= ns_file_name %>).should eq(<%= file_name %>)
  #   end
  # end

  describe "GET new" do
    it "assigns a new budget_component as @component" do
      get :new
      assigns(:component).should be_a_new(BudgetComponent)
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
          post :create, {:component => valid_attributes}
        }.to change(BudgetComponent, :count).by(1)
      end

      it "assigns a newly created budget_component  as @component %>" do
        post :create, {:component => valid_attributes}
        assigns(:component).should be_a(BudgetComponent)
        assigns(:component).should be_persisted
      end

      it "redirects to the created budget_component" do

        post :create, {:component => valid_attributes}
        response.should redirect_to(:action=>'list')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved budget_component as @component" do
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetComponent.any_instance.stub(:save).and_return(false)
        post :create, {:component => invalid_attributes}
        assigns(:component).should be_a_new(BudgetComponent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetComponent.any_instance.stub(:save).and_return(false)
        post :create, {:component =>invalid_attributes}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested budget_component" do
        component = BudgetComponent.create! valid_attributes
        # Assuming there are no other <%= table_name %> in the database, this
        # specifies that the <%= class_name %> created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :update, {:id => component.id, :component =>update_attributes}
      end

      it "assigns the requested budget_component as @component %>" do
        component = BudgetComponent.create! valid_attributes
        put :update, {:id => component.id, :component => valid_attributes}
        assigns(:component).should eq(component)
      end

      it "redirects to the list page" do
        component = BudgetComponent.create! valid_attributes
        put :update, {:id => component.id, :component => valid_attributes}
        response.should redirect_to(:action=>'list')
      end
    end

    describe "with invalid params" do
      it "assigns the budget_component as @component %>" do
        component = BudgetComponent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetComponent.any_instance.stub(:save).and_return(false)
        put :update, {:id => component.id, :component => invalid_attributes}
        assigns(:component).should eq(component)
      end

      it "re-renders the 'edit' template" do
        component = BudgetComponent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BudgetComponent.any_instance.stub(:save).and_return(false)
        put :update, {:id => component.id, :component => invalid_attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested budget_component" do
      component = BudgetComponent.create! valid_attributes
      expect {
        delete :destroy, {:id => component.id}
      }.to change(BudgetComponent, :count).by(-1)
    end

    it "redirects to the budget_components list" do
      component = BudgetComponent.create! valid_attributes
      delete :destroy, {:id => component.to_param}
      response.should redirect_to(componets_url)
    end
  end

end










