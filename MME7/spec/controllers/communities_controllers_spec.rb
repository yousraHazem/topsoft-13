require 'spec_helper'

describe CommunitiesController do

  def valid_attributes
   {:title => "put valid attributes", :social_profile_info => "valid", :contact_info => "555"}
  end



  def invalid_attributes
   {:title => "", :social_profile_info => "knnn", :contact_info => "jjjj"}
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
          post :create, {:community => valid_attributes}
        }.to change(Community, :count).by(1)
      end

      it "assigns a newly created community as @community" do
        post :create, {:community => valid_attributes}
        assigns(:community).should be_a(Community)
        assigns(:community).should be_persisted
      end

      it "redirects to the created community" do
        post :create, {:community => valid_attributes}
        response.should redirect_to(Community.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved community as @community" do
        # Trigger the behavior that occurs when invalid params are submitted
        Community.any_instance.stub(:save).and_return(false)
        post :create, {:community => valid_attributes}
        assigns(:community).should be_a_new(Community)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Community.any_instance.stub(:save).and_return(false)
        post :create, {:community => valid_attributes}
        response.should render_template("new")
      end
    end
  end
end
























