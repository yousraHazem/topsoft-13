require 'spec_helper'

describe CommunitiesController do
	  #describe "GET list" do
    #it "assigns all <%= table_name.pluralize %> as @<%= table_name.pluralize %>" do
      #<%= file_name %> = <%= class_name %>.create! valid_attributes
      #get :list, {}
      #assigns(:<%= communities %>).should eq([<%= file_name %>])
    #end
 #end

  def valid_attributes
   {:title => "dfv", :social_profile_info => "edfs", :contact_info => "555"}
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
        post :create, {:community => <%= formatted_hash(example_invalid_attributes) %>}
        assigns(:community).should be_a_new(Community)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        post :create, {:community => <%= formatted_hash(example_invalid_attributes) %>}
        response.should render_template("new")
      end
    end
  end
end




































