require 'spec_helper'
# Author : Nayera Mohamed 22-3789
describe ProjectUsersController do

describe "POST promoteMembers" do
    it "should promote a member to be a creator" do
      get :promoteMembers
      @user = ProjectUser.create!
      put :update, {:id => projectuser.to_param}
      if @user.save
			redirect_to(:controller => 'project_users', :action => 'index')
		else
			redirect_to(:controller => 'projects', :action => 'show')
	  end		
    end
end   

end