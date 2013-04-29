require 'spec_helper'

describe GroupUsersController do
  def valid_attributes
   {:group_id => 4, :user_id => 4, :is_creator => false}
  end

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
