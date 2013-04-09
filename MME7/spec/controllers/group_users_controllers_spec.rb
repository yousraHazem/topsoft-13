require 'spec_helper'

describe GroupUsersController do

  def valid_attributes
   {:content=> "put valid attributes"}
  end

  def invalid_attributes
   {:content => "", :social_profile_info => "", :contact_info => "jjjj"}
  end
 #describe "GET edit" do
 #   it "assigns the requested community as @community" do
  #    community = Community.create! valid_attributes
   #   get :edit, {:id => community.to_param}
    #  assigns(:community).should eq(community)
    #end
  #end

 describe "GET new" do
    it "assigns a new groupuser as @groupuser" do
      get :join
      assigns(:community).should be_a_new(Community)
    end
  end
describe "join" do
    describe "with valid params" do
      it "creates a new Commuity" do
        expect {
          post :join, {:groupuser => valid_attributes}
        }.to change(GroupUser, :count).by(1)
      end

      it "assigns a newly created community as @community" do
        post :join, {:groupuser => valid_attributes}
        assigns(:groupuser).should be_a(Community)
        assigns(:groupuser).should be_persisted
      end

      it "redirects to the group show" do
        post :join, {:groupuser => valid_attributes}
        response.should redirect_to(:controller => "groups", :action => 'show')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved community as @community" do
        # Trigger the behavior that occurs when invalid params are submitted
        Community.any_instance.stub(:save).and_return(false)
        post :createCommunity, {:community => valid_attributes}
        assigns(:community).should be_a_new(Community)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Community.any_instance.stub(:save).and_return(false)
        post :createCommunity, {:community => valid_attributes}
        response.should render_template("new")
      end
    end
  end

end