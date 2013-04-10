# spec/controllers/groups_controller_spec.rb
require 'spec_helper'

describe GroupsController do
  describe "GET #index" do
    it "populates an array of groups"
    it "renders the :index view"
  end
  
  describe "GET #show" do
    it "assigns the requested group to @group"
    it "renders the :show template"
  end
  
  describe "GET #new" do
    it "assigns a new Group to @group"
    it "renders the :new template"
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new group in the database"
      it "redirects to the :index view"
    end
    
    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end

  # ... other describe blocks omitted omitted
describe "GET #index" do
  it "populates an array of groups" do
    group = Factory(:group)
    get :index
    assigns(:groups).should eq([group])
  end
  
  it "renders the :index view" do
    get :index
    response.should render_template :index
  end
end

describe "GET #show" do
  it "assigns the requested group to @group" do
    group = Factory(:group)
    get :show, id: group
    assigns(:group).should eq(group)
  end
  
  it "renders the #show view" do
    get :show, id: Factory(:group)
    response.should render_template :show
  end
end

describe 'DELETE destroy' do
  before :each do
    @group = Factory(:group)
  end
  
  it "deletes the group" do
    expect{
      delete :destroy, id: @group        
    }.to change(Group,:group).by(-1)
  end
    
  it "redirects to groupss#index" do
    delete :destroy, id: @group
    response.should redirect_to groups_url
  end
end

