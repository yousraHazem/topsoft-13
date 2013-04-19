require 'spec_helper'

describe UsersController do

def valid_attributes
 { name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
  address: "nr st distric city", username: "username", password: "password", password_confirmation: "password" }
end
#Authored by:Toka Abdelgabar 22-1925
  describe "GET get_myprojects", scope: true do
    it "assigns all projectusers as @projectusers" do
      projectusers = ProjectUser.create! valid_attributes_toka
      get :get_myprojects
     assigns(:projectusers).should eq([projectusers])
    end
  end
describe "GET show" do
it "assigns the requested user as @user " do
user = User.create! valid_attributes
get :show, {:id => user.to_param}
assigns(:user ).should eq(user)
end
end
describe "GET new" do
it "assigns a new user as @new" do
get :new
assigns(:user).should be_a_new(User)
end
end
describe "POST create" do
describe "with valid params" do
it "creates a new user" do
expect {
post :create, {:user => valid_attributes}
}.to change(User, :count).by(1)
end
it "assigns a newly created user as @user" do
post :create, {:user => valid_attributes}
assigns(:user).should be_a(User)
assigns(:user).should be_persisted
end
it "redirects to the created user" do
post :create, {:user => valid_attributes}
response.should redirect_to(:controller => 'sessions', :action => 'new')
end
end
end
end
