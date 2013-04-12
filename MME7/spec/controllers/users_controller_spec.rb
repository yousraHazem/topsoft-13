require 'spec_helper'

describe UsersController do
def valid_attributes
      {:project_id => '1', :user_id => '1',}
  end
  describe "GET get_myprojects" do
    it "assigns all project_users as @projectusers" do
      projectuser = ProjectUser.create! valid_attributes
      get :get_myprojects
    # assigns(:project_users).should eq([projectuser])
    end
  end
end