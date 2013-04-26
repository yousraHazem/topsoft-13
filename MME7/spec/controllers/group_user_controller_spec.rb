require 'spec_helper'

describe GroupUsersController do
  def valid_attributes
   {:group_id => 4, :user_id => 4, :is_creator => false}
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
        assigns(:newuser).should be_a(GroupUser)
        assigns(:newuser).should be_persisted
      end

      it "redirects to the group show" do
        post :join, {:groupuser => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
  end

    describe "DELETE leave" do
      it "should destroy groupuser as member " do
        user = User.new(:name => "name 1", :email => "name@hotmail" , :phone_Nr =>"123456" , :address => "aaaaa" , :username => "yasmin1" , :isAdmin => false)
        user.save
        userid= user.id
        group = Group.new
        group.save
        groupid = group.id
        member = GroupUser.new(:user_id => userid, :group_id =>groupid,  :isCreator => true )
        member.save
        expect {
        delete :leave, {:id => member.to_param}
      }.to change(GroupUser, :count).by(0)
      end

      it "redirects to the group show" do
        post :leave, {:groupuser => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end

 
  end
end
