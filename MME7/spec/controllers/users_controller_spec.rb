require 'spec_helper'

#Authored by:Toka Abdelgabar 22-1925
describe UsersController do
def valid_attributes_toka
      {:project_id => '1', :user_id => '1',}
end
#Authored by:Toka Abdelgabar 22-1925
  describe "GET get_myprojects", scope: true do
    it "assigns all projectusers as @projectusers" do
      projectusers = ProjectUser.create! valid_attributes_toka
      get :get_myprojects
     assigns(:projectusers).should eq([projectusers])
    end
  end
end