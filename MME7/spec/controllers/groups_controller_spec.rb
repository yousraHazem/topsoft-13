require 'spec_helper'

describe GroupsController do

  def valid_attributes
   {:group_name => "put valid attributes", :description => "valid", :levels => "valid"}
  end
  
  def invalid_attributes
   {:group_name => "", :description => "", :levels => ""}
  end

  def update_attributes
    {:group_name => "groupOneOne", :description => "blaaaah blaah haaa", :levels => "child"}
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
        response.should redirect_to("http://test.host/groups/show/1")
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

    it "redirects to the group show" do
      newgroup = Group.new
      Group.should_receive(:find).and_return(newgroup)
      group = Group.create! valid_attributes
      delete :destroy, {:id => group.to_param}
      response.should redirect_to("http://test.host/groups")
    end
  end

  describe "GET edit" do
       it "assigns the requested group as @group" do
         group  = Group.create! valid_attributes
           get :edit, {:id => group.to_param}
           assigns(:group).should eq(group)
       end
  end

  describe "PUT update" do
    describe "with valid params" do
        it "updates the requested group" do
              group = Group.create! valid_attributes
              put :update, {:id => group.to_param, :group => update_attributes }
        end

        it "assigns the requested group as @group" do
              group = Group.create! valid_attributes
              put :update, {:id => group.to_param, :group => valid_attributes}
              assigns(:group).should eq(group)
        end

        it "redirects to the group" do
              group = Group.create! valid_attributes
              put :update, {:id => group.to_param, :@group => valid_attributes}
              response.should redirect_to( 'http://test.host/groups/show/1')
        end

    end

    describe "with invalid params" do
        it "assigns the group as @group" do
                    group = Group.create! valid_attributes
                    # Trigger the behavior that occurs when invalid params are submitted
                    Group.any_instance.stub(:save).and_return(false)
                    put :update, {:id => group.to_param, :group => invalid_attributes}
                    assigns(:group).should eq(group)
        end
        it "re-renders the 'edit' template" do
                    group = Group.create! valid_attributes
                    # Trigger the behavior that occurs when invalid params are submitted
                    Group.any_instance.stub(:save).and_return(false)
                    put :update, {:id => group.to_param, :group => invalid_attributes}
                    response.should render_template(:action => "edit")
        end
    end

  end


end