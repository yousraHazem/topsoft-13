require 'spec_helper'

 def valid_attributes
    {:project_id => 1, :user_id => 1, :is_creator => true}
  end

  def invalid_attributes
   {:project_id => 'a', :user_id => 'a', :is_creator => 'a'}
  end



describe ProjectUsersController do
	describe "POST promoteMembers" do
		describe "with valid params" do
		    it "promotes a project user to be a project creatot" do
		      @user = ProjectUser.create!
		      u = ProjectUser.should_receive(:find).and_return(@user)
		      put :promoteMembers, {:id => u.to_param}
			  redirect_to(:controller => 'project_users', :action => 'index')
    		end
		end
		describe "with invalid params" do
		    it "promotes a project user to be a project creatot" do
		      @user = ProjectUser.create!
		      u = ProjectUser.should_receive(:find).and_return(@user)
		      put :promoteMembers, {:id => u.to_param}
			  redirect_to(:controller => 'projects', :action => 'show')
    		end
		end
  	end
end	
