require 'spec_helper'

 def valid_attributes
    {:group_id => 1, :user_id => 1, :isCreator => true}
  end

  def invalid_attributes
   {:group_id => 'a', :user_id => 'a', :isCreator => 'a'}
  end



describe GroupUsersController do
  describe "POST promoteMembers" do
    describe "with valid params" do
        it "promotes a group user to be a group creatot" do
          @user = GroupUser.create!
          u = GroupUser.should_receive(:find).and_return(@user)
          put :promoteMembers, {:id => u.to_param}
        redirect_to(:controller => 'group_users', :action => 'index')
        end
    end
    describe "with invalid params" do
        it "promotes a group user to be a group creatot" do
          @user = GroupUser.create!
          u = GroupUser.should_receive(:find).and_return(@user)
          put :promoteMembers, {:id => u.to_param}
        redirect_to(:controller => 'groups', :action => 'show')
        end
    end
    end
end 
