require 'spec_helper'

describe CommunitiesController do

<<<<<<< HEAD
  def valid_attributes
   {:title => "put valid attributes", :social_profile_info => "valid", :contact_info => "555"}
  end

  def invalid_attributes
   {:title => "", :social_profile_info => "", :contact_info => "jjjj"}
  end
 #describe "GET edit" do
 #   it "assigns the requested community as @community" do
  #    community = Community.create! valid_attributes
   #   get :edit, {:id => community.to_param}
    #  assigns(:community).should eq(community)
    #end
  #end

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

end
=======

  def valid_attributes
      {:title => 'comOne', :social_profile_info => 'spinfoOne', :contact_info => '12345'}
  end




  describe "GET list" do
    it "assigns all communities as @communities" do
      community  = Community.create! valid_attributes
      puts community
      get :list, {}
      #assigns(Community).should eq([community])
    end
  end

end 

  
>>>>>>> da2c61293000cd85631205090632da6204bb4223
