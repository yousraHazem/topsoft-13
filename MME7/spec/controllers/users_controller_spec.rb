require 'spec_helper'

#Authored by:Toka Abdelgabar 22-1925
describe UsersController do
def valid_attributes
      {:project_id => '1', :user_id => '1',}
end
#Authored by:Toka Abdelgabar 22-1925
  describe "GET get_myprojects" do
    it "assigns all projectusers as @projectusers" do
      projectusers = ProjectUser.create! valid_attributes
      get :get_myprojects
     assigns(:projectusers).should eq([projectusers])
    end
  end
end