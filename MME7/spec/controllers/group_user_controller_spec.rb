require 'spec_helper'

describe GroupUsersController do
  def valid_attributes
   {:group_id => 1, :user_id => 1, :is_creator => false}
  end

describe "POST create" do
    describe "with valid params" do
      it "creates a new group user" do
        expect {
          post :join, {:groupuser => valid_attributes}
        }.to change(GroupUser, :count).by(1)
      end

      it "assigns a newly created groupuser as @groupuser" do
        post :join, {:groupuser => valid_attributes}
        assigns(:groupuser).should be_a(GroupUser)
        assigns(:groupuser).should be_persisted
      end

      it "redirects to the group show" do
        post :join, {:groupuser => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end

  end
end