require 'spec_helper'

describe PostsController do

  def valid_attributes
   {:content => "put valid attributes"}
  end

  def invalid_attributes
   {:content => ""}
  end

 describe "GET new" do
    it "assigns a new community as @community" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end
describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes}
        response.should redirect_to("http://test.host/groups/show/1")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => valid_attributes}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => valid_attributes}
        response.should render_template("new")
      end
    end
  end

  
end
























