require 'spec_helper'

describe CommunitiesController do

  def valid_attributes
   {:title => "put valid attributes", :social_profile_info => "valid", :contact_info => "user@example.com"}
  end
  
  def invalid_attributes
   {:title => "", :social_profile_info => "", :contact_info => "jjj"}
  end

   describe "GET list" do
    it "assigns all communities as @communities" do
      community  = Community.create! valid_attributes
      puts community
      get :list, {}
    end
  end

  describe "GET show" do
it "assigns the requested community as @communities " do
community = Community.create! valid_attributes
get :show, {:id => community.to_param}
assigns(:community ).should eq(community)
end
end

 
 describe "GET new" do
    it "assigns a new community as @community" do
      get :new
      assigns(:community).should be_a_new(Community)
    end
  end
describe "POST create" do
    describe "with valid params" do
      it "creates a new Commuity" do
        expect {
          post :createCommunity, {:community => valid_attributes}
        }.to change(Community, :count).by(1)
      end

      it "assigns a newly created community as @community" do
        post :createCommunity, {:community => valid_attributes}
        assigns(:community).should be_a(Community)
        assigns(:community).should be_persisted
      end

      it "redirects to the community list" do
        post :createCommunity, {:community => valid_attributes}
        response.should redirect_to("http://test.host/communities/list")
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
  describe "GET edit" do
    it "assigns the requested community as @community" do
      community = Community.create! valid_attributes
      get :edit, {:id => community.to_param}
      assigns(:community).should eq(community)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested community" do
        community = Community.create! valid_attributes
        # Assuming there are no other <%= table_name %> in the database, this
        # specifies that the <%= class_name %> created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        put :update, {:id => community.to_param, :community => valid_attributes}
      end

      it "assigns the requested community as @community" do
        community = Community.create! valid_attributes
        put :update, {:id => community.to_param, :community => valid_attributes}
        assigns(:community).should eq(community)
      end

      it "redirects to the community" do
        community = Community.create! valid_attributes
        put :update, {:id => community.to_param, :community => valid_attributes}
        response.should redirect_to("http://test.host/communities/list")
      end
    end

    describe "with invalid params" do
      it "assigns the community as @community" do
        community = Community.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Community.any_instance.stub(:save).and_return(false)
        put :update, {:id => community.to_param, :community => valid_attributes}
        assigns(:community).should eq(community)
      end

      it "re-renders the 'edit' template" do
        community = Community.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Community.any_instance.stub(:save).and_return(false)
        put :update, {:id =>community.to_param, :community => invalid_attributes}
        response.should render_template("edit")
    end
    end
  end

  describe "DELETE LIST" do
    
    
    it "dismiss community" do

      community = Community.create! valid_attributes
      delete :destroy, :id => community.id
      response.should redirect_to("http://test.host/communities/show/1")
   
    end
  end

end