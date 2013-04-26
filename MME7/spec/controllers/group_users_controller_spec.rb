require 'spec_helper'
# Author : Nayera Mohamed 22-3789
describe ProjectUsersController do

describe "POST promoteMembers" do
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
end    
   

end