require 'spec_helper'

describe GroupsController do

  def valid_attributes
   {:group_name => "put valid attributes", :description => "valid", :levels => "valid"}
  end
  
  def invalid_attributes
   {:group_name => "", :description => "", :levels => ""}
  end

describe "GET new" do
    it "assigns a new group as @group" do
      get :new
      assigns(:group).should be_a_new(Group)
    end
  end
describe "POST create" do
    describe "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, {:group => valid_attributes}
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, {:group => valid_attributes}
        assigns(:group).should be_a(Group)
        assigns(:group).should be_persisted
      end

      it "redirects to the group index" do
        post :create, {:group => valid_attributes}
        response.should redirect_to("http://test.host/groups")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => valid_attributes}
        assigns(:group).should be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Group.any_instance.stub(:save).and_return(false)
        post :create, {:group => valid_attributes}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested group" do
      newgroup = Group.new
      Group.should_receive(:find).and_return(newgroup)
      group = Group.create! valid_attributes
      expect {
        delete :destroy, {:id => group.to_param}
      }.to change(Group, :count).by(0)
    end

    it "redirects to the budget_components list" do
      newgroup = Group.new
      Group.should_receive(:find).and_return(newgroup)
      group = Group.create! valid_attributes
      delete :destroy, {:id => group.to_param}
      response.should redirect_to("http://test.host/groups")
    end

  end
end