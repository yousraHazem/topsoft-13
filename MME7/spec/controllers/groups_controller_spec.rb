require 'spec_helper'

describe GroupsController  do

	def valid_attributes
   		 {:group_name => "may", :description => "blaaaah blaah", :levels => "parent"}
 	end

 	def invalid_attributes
 		{:group_name => "", :description => "", :levels => ""}
 	end

	describe "GET edit" do
   		 it "assigns the requested group as @group" do
			 @group  = Group.create! valid_attributes
     		 get :edit, {:id => group.to_param}
     		 assigns(:group).should eq(group)
   		 end
 	 end

 	 describe "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => invalid_attributes}
        assigns(:group).should be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => invalid_attributes}
        response.should render_template("new")
      end
    end
  end

 	 describe "PUT update" do
   		 describe "with valid params" do
      it "updates the requested group" do
        group = Group.create! valid_attributes
        # Assuming there are no other <%= table_name %> in the database, this
        # specifies that the <%= class_name %> created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :update, {:id => group.to_param, :group => invalid_attributes}
      end

      it "assigns the requested group  as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group  => valid_attributes}
        assigns(:group).should eq(group)
      end

      it "redirects to the group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}
        response.should redirect_to(group)
      end
    end

	end