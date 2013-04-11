<<<<<<< HEAD
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

=======
require 'spec_helper'

<<<<<<< HEAD
describe GroupsController  do

	def valid_attributes
   		 {:group_name => "groupOne", :description => "blaaaah blaah", :levels => "parent"}
 	end

 	def invalid_attributes
 		{:group_name => "",:description => "", :levels => ""}
 	end

  def update_attributes
    {:group_name => "groupOneOne", :description => "blaaaah blaah haaa", :levels => "child"}
  end


	describe "GET edit" do
   		 it "assigns the requested group as @group" do
  			 group  = Group.create! valid_attributes
       		 get :edit, {:id => group.to_param}
       		 assigns(:group).should eq(group)
   		 end
  end

    describe "PUT update" do
            describe "with valid params" do
                it "updates the requested group" do
                    group = Group.create! valid_attributes
                    put :update, {:id => group.to_param, :group => update_attributes }
                end

                it "assigns the requested group as @group" do
                    group = Group.create! valid_attributes
                    put :update, {:id => group.to_param, :group => valid_attributes}
                    assigns(:group).should eq(group)
                end

                it "redirects to the group" do
                    group = Group.create! valid_attributes
                    put :update, {:id => group.to_param, :@group => valid_attributes}
                    response.should redirect_to( 'http://test.host/groups')
                end

            end

            describe "with invalid params" do
                it "assigns the group as @group" do
                    group = Group.create! valid_attributes
                    # Trigger the behavior that occurs when invalid params are submitted
                    Group.any_instance.stub(:save).and_return(false)
                    put :update, {:id => group.to_param, :group => invalid_attributes}
                    assigns(:group).should eq(group)
                end
                it "re-renders the 'edit' template" do
                    group = Group.create! valid_attributes
                    # Trigger the behavior that occurs when invalid params are submitted
                    Group.any_instance.stub(:save).and_return(false)
                    put :update, {:id => group.to_param, :group => invalid_attributes}
                    response.should render_template(:action => "edit")
                end
            end
    end



end
=======
describe GroupsController do

  def valid_attributes
      {:group_name => 'groupOne', :description => 'descTwo', :levels => 'parent'}
  end

  describe "GET index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
     
      get :index, {}
      #assigns(Community).should eq([community])
    end
  end
end
>>>>>>> c1_may_guest_view_groups_sprintOne
>>>>>>> da2c61293000cd85631205090632da6204bb4223
